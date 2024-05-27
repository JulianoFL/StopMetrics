using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using StopMetrics.Models;
using Microsoft.Extensions.Logging;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using StopMetrics.Utils;
using Newtonsoft.Json.Linq;
using System.Security.Claims;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using StopMetrics.Models.Parameters;
using FirebaseAdmin.Auth;
using StopMetrics.Models.DBModels;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using StopMetrics.Services;
using Google.Apis.Auth.OAuth2;
using Google.Apis.Services;
using Google.Apis.YouTube.v3;
using Google.Apis.Auth;
using System.Threading;
using Google.Apis.Auth.AspNetCore3;
using Google.Apis.Auth.OAuth2.Flows;
using Google.Apis.Auth.OAuth2.Responses;
using Google.Apis.Drive.v3;
using Google.Apis.Util.Store;
using System.IO;
using StopMetrics.Services.Google.APIs;
using Google.Apis.Util;
using FluentDateTime;

namespace StopMetrics.Controllers
{
    [Route("api/authentication")]
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    public class AuthenticationController : BaseController
    {
        public enum AuthenticationProvider { Email, Google, Facebook }

        private class GoogleClock : IClock
        {
            DateTime ServerTime { get; set; }

            public DateTime Now => ServerTime;

            public DateTime UtcNow => ServerTime;

            public GoogleClock(DateTime CorrectDateTime) 
            {
                ServerTime = CorrectDateTime;
            }
        }


        public AuthenticationController(StopMetricsDBContext DBContext, BackgroundSuportServices BackServices) : base(DBContext, BackServices) { }


        [AllowAnonymous]
        [HttpPost("register")]
        public async Task<IActionResult> Register([FromBody] JNewAccount NewAccount)
        {
            try
            {
                UserRecordArgs NUser = new UserRecordArgs()
                {
                    Email = NewAccount.Email,
                    EmailVerified = true,
                    Password = NewAccount.Password,
                    DisplayName = NewAccount.Name,
                    Disabled = false
                };
                UserRecord URecord = await FirebaseAuth.DefaultInstance.CreateUserAsync(NUser);


                if (!DBContext.DbPool_Users.Any(x => x.Email == NewAccount.Email))
                {
                    DbM_User User = SupportMethods.Cast<DbM_User>(NewAccount);
                    User.FirebaseId = URecord.Uid;
                    User.RegisterDate = DateTime.Now;

                    DBContext.DbPool_Users.Add(User);
                }
                else
                {
                    DbM_User User = DBContext.DbPool_Users.FirstOrDefault(x => x.Email == NewAccount.Email);
                    User.FirebaseId = URecord.Uid;
                }

                await DBContext.SaveChangesAsync();
                return ShowSuccess("Cadastro criado com sucesso !");
            }
            catch(FirebaseAuthException E)
            {
                return ShowError("Ocorreu um erro ao concluir o registro");
            }
            catch (Exception e)
            {
                return ShowError(e, "Ocorreu um erro ao concluir o registro");
            }
        }

        [HttpGet("auto_login")]
        public async Task<IActionResult> AutoLogin()
        {
            DbM_User User = await GetUser();


            if(User == null || !User.GToken.IsNotNullOrEmpty())
                return Unauthorized();

            try
            {
                await GoogleAuthorization.GetTokensFromToken(User.GToken);
            }
            catch(Exception E)
            {
                return Unauthorized();
            }

            return Ok();
        }


        [AllowAnonymous]
        [HttpGet("[action]"), ActionName("login")]
        public async Task<IActionResult> Login([FromQuery] string Code, [FromQuery] string BaseUrl)
        {
            try
            {
                TokenResponse TResponse = await GoogleAuthorization.GetTokensFromCode(Code, BaseUrl);

                GoogleCredential GCred = GoogleCredential.FromAccessToken(TResponse.AccessToken);


                GoogleClock GClock = new GoogleClock(BackServices.ServerTime.AddMinutes(1));


                GoogleJsonWebSignature.Payload TPayload = await GoogleJsonWebSignature.ValidateAsync(TResponse.IdToken, GClock);


                DbM_User User = await GetUser(TPayload.Email);

                if(User == null)
                    return Unauthorized();
                

                User.GToken = TResponse.RefreshToken;
                await DBContext.SaveChangesAsync();


                return Ok(TResponse.IdToken);
            }
            catch(Exception E)
            {
                return Unauthorized();
            }
        }


        // This is a method we'll use to obtain the authorization code flow
        private AuthorizationCodeFlow GetGoogleAuthorizationCodeFlow()
        {
            var clientIdPath = @"E:\Projetos\StopMetrics\StopMetrics\client_secret.json";
            using(var fileStream = new FileStream(clientIdPath, FileMode.Open, FileAccess.Read))
            {
                var clientSecrets = GoogleClientSecrets.Load(fileStream).Secrets;
                var initializer = new GoogleAuthorizationCodeFlow.Initializer { ClientSecrets = clientSecrets, Scopes = new[] { YouTubeService.Scope.YoutubeReadonly } };
                var googleAuthorizationCodeFlow = new GoogleAuthorizationCodeFlow(initializer);

                return googleAuthorizationCodeFlow;
            }
        }


        /// <summary>
        /// Lists the authenticated user's Google Drive files.
        /// Specifying the <see cref="GoogleScopedAuthorizeAttribute"> will guarantee that the code
        /// executes only if the user is authenticated and has granted the scope specified in the attribute
        /// to this application.
        /// </summary>
        /// <param name="auth">The Google authorization provider.
        /// This can also be injected on the controller constructor.</param>
        [GoogleScopedAuthorize(DriveService.ScopeConstants.DriveReadonly)]
        [HttpGet("youtube_login2")]
        public async Task<IActionResult> DriveFileList1([FromServices] IGoogleAuthProvider auth)
        {
            GoogleCredential cred = await auth.GetCredentialAsync();
            var service = new YouTubeService(new BaseClientService.Initializer
            {
                HttpClientInitializer = cred
            });
            var files = service.Channels.List("contentDetails");
            files.Mine = true;

            var As = await files.ExecuteAsync();

            foreach(var channel in As.Items)
            {
                // From the API response, extract the playlist ID that identifies the list
                // of videos uploaded to the authenticated user's channel.
                var uploadsListId = channel.ContentDetails.RelatedPlaylists.Uploads;

                Console.WriteLine("Videos in list {0}", uploadsListId);

                var nextPageToken = "";
                while(nextPageToken != null)
                {
                    var playlistItemsListRequest = service.PlaylistItems.List("snippet");
                    playlistItemsListRequest.PlaylistId = uploadsListId;
                    playlistItemsListRequest.MaxResults = 50;
                    playlistItemsListRequest.PageToken = nextPageToken;

                    // Retrieve the list of videos uploaded to the authenticated user's channel.
                    var playlistItemsListResponse = await playlistItemsListRequest.ExecuteAsync();

                    foreach(var playlistItem in playlistItemsListResponse.Items)
                    {
                        // Print information about each video.
                        Console.WriteLine("{0} ({1})", playlistItem.Snippet.Title, playlistItem.Snippet.ResourceId.VideoId);
                    }

                    nextPageToken = playlistItemsListResponse.NextPageToken;
                }
            }

            return Ok();
        }



    }
}