using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using StopMetrics.Models;
using StopMetrics.Utils;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Identity;
using StopMetrics.Models.Parameters;
using StopMetrics.Models.DBModels;
using System.Security.Cryptography.X509Certificates;
using StopMetrics.Models.Responses;
using StopMetrics.Services;
using Google.Apis.Auth.OAuth2;
using System.Security.AccessControl;
using Google.Apis.Auth.OAuth2.Requests;
using Google.Apis.Services;
using Google.Apis.YouTube.v3;
using Google.Apis.YouTube.v3.Data;
using Microsoft.AspNetCore.Cors;
using Google.Apis.Drive.v3;
using Google.Apis.Auth.OAuth2.Flows;
using Google.Apis.Auth.OAuth2.Mvc;
using Google.Apis.Util.Store;
using Google.Apis.Auth.AspNetCore3;

namespace StopMetrics.Controllers
{
    [Route("api/settings")]
    public class SettingsController : BaseController
    {
        public SettingsController(StopMetricsDBContext DBContext, BackgroundSuportServices BackServices) : base(DBContext, BackServices) { }


        [HttpGet("get_tags")]
        public async Task<IActionResult> GetTags()
        {
            DbM_User User = await GetUser();

            List<DbM_OperationTag> Tags = User.OperationsTags.ToList();

            if (Tags != null)
                return Ok(SupportMethods.Cast<List<GwOperationTag>>(Tags));
            else
                return Ok();
        }

        //[HttpGet("[action]"), ActionName("get_cme_strategies")]
        //public async Task<IActionResult> GetCMEStrategies()
        //{
        //    List<DbM_CMEStrategy> Strategies = (await GetUser()).CMEStrategies.ToList();

        //    if (Strategies != null)
        //        return Ok(SupportMethods.Cast<GwOperationStrategy>(Strategies));
        //    else
        //        return Ok();
        //}

        [HttpPost("create_tag")]
        public async Task<IActionResult> CreateStrategy([FromBody] JOperationTag NewTag)
        {
            DbM_User User = await GetUser();

            DbM_OperationTag Tag = SupportMethods.Cast<DbM_OperationTag>(NewTag);


            if(User.OperationsTags.Any(x => x.Name.ToLower() == NewTag.Name.ToLower()))
                return ShowWarning("Já existe uma tag com esse nome");

            try
            {
                User.OperationsTags.Add(Tag);

                await DBContext.SaveChangesAsync();

                return ShowSuccess("Tag criada com sucesso");
            }
            catch (Exception e)
            {
                return ShowError(e, "Ocorreu um erro ao criar a tag: ");
            }
        }

        //[HttpPost("[action]"), ActionName("create_cme_strategy")]
        //public async Task<IActionResult> CreateCMEStrategy([FromBody] JCMEStrategy NewStrategy)
        //{
        //    DbM_User User = await GetUser();

        //    DbM_CMEStrategy Strategy = SupportMethods.Cast<DbM_CMEStrategy>(NewStrategy);


        //    if (User.CMEStrategies.Any(x => x.Name.ToLower() == NewStrategy.Name.ToLower()))
        //        return ShowWarning("Já existe uma estratégia com esse nome");

        //    try
        //    {
        //        User.CMEStrategies.Add(Strategy);

        //        await DBContext.SaveChangesAsync();

        //        return ShowSuccess("Estratégia criada com sucesso");
        //    }
        //    catch (Exception e)
        //    {
        //        return ShowError(e, "Ocorreu um erro ao criar a estratégia: ");
        //    }
        //}


        [HttpPost("delete_tag")]
        public async Task<IActionResult> DeleteStrategy([FromBody] JOperationTag TagToDel)
        {
            DbM_User User = await GetUser();

            DbM_OperationTag Tag = User.OperationsTags.FirstOrDefault(x => x.Id == TagToDel.Id);


            if (Tag == null)
                return ShowWarning("Tag não encontrada");

            try
            {
                DBContext.DbPool_Strategies.Remove(Tag);

                await DBContext.SaveChangesAsync();

                return ShowSuccess("Tag removida com sucesso");
            }
            catch (Exception e)
            {
                return ShowError(e, "Ocorreu um erro ao remover a tag: ");
            }
        }

        //[HttpPost("[action]"), ActionName("delete_cme_strategy")]
        //public async Task<IActionResult> DeleteCMEStrategy([FromBody] JCMEStrategy StrategyToDel)
        //{
        //    DbM_User User = await GetUser();

        //    DbM_CMEStrategy Strategy = User.CMEStrategies.FirstOrDefault(x => x.Id == StrategyToDel.Id);


        //    if (Strategy == null)
        //        return ShowWarning("Estratégia não encontrada");

        //    try
        //    {
        //        DBContext.DbPool_CMEStrategies.Remove(Strategy);

        //        await DBContext.SaveChangesAsync();

        //        return ShowSuccess("Estratégia removida com sucesso");
        //    }
        //    catch (Exception e)
        //    {
        //        return ShowError(e, "Ocorreu um erro ao remover a estratégia: ");
        //    }
        //}

        [HttpGet("get_brokers_acc")]
        public async Task<IActionResult> GetBrokersAccounts()
        {
            return Ok((await GetUser()).Accounts);
        }

        //[HttpGet("[action]"), ActionName("get_cme_brokers_acc")]
        //public async Task<IActionResult> GetCMEBrokersAccounts()
        //{
        //    return Ok((await GetUser()).CMEAccs);
        //}


        [HttpPost("create_acc")]
        public async Task<IActionResult> CreateB3Acc([FromBody] JBrokerAccount Account)
        {
            if (DBContext.DbPool_Accounts.Any(e => e.Id.ToString() == Account.Id))
                return ShowWarning("Já existe uma conta com esse Id");
            

            try
            {
                DbM_User User = await GetUser();

                DbM_BrokerAcc Acc = SupportMethods.Cast<DbM_BrokerAcc>(Account);
                Acc.UserId = User.Id;

                DBContext.Add(Acc);

                await DBContext.SaveChangesAsync();

                return ShowSuccess("Conta adicionada com sucesso");

            }
            catch (Exception e)
            {
                return ShowError(e, "Ocorreu um erro ao adicionar a conta: ");
            }
        }
        
        //[HttpPost("[action]"), ActionName("create_cme_acc")]
        //public async Task<IActionResult> CreateCMEAcc([FromBody] JCMEBrokerAccount Account)
        //{
        //    if (DBContext.DbPool_CMEAccs.Any(e => e.Id == Account.Id))
        //        return ShowWarning("Já existe uma conta com esse Id");
            

        //    try
        //    {
        //        DbM_User User = await GetUser();

        //        DbM_CMEBrokerAcc Acc = SupportMethods.Cast<DbM_CMEBrokerAcc>(Account);
        //        Acc.UserId = User.Id;

        //        DBContext.Add(Acc);

        //        await DBContext.SaveChangesAsync();

        //        return ShowSuccess("Conta adicionada com sucesso");

        //    }
        //    catch (Exception e)
        //    {
        //        return ShowError(e, "Ocorreu um erro ao adicionar a conta: ");
        //    }
        //}




        [HttpGet("youtube_login")]
        public async Task<IActionResult> DriveFileList([FromQuery] string Token)
        {
            try
            {
                string AA = "ya29.a0AWY7Ckl-mnOYi9_4wPT52OoF2s4rmK5aaDJD1TIbhIkQyo55su3jsSHJJf_cHXWzDwKF5XO2jm8mVzg2ha6tXBwvm9iM30oDgwbq2odi5TLQyJlDhnAOzxYA0zvqY4tQ4A8dAx0Bvqpv7J1DXNuOnC-btNn4aCgYKAbESARESFQG1tDrpkjJB1AohdwNAeuYmWZu3pQ0163";

                //ServiceAccountCredential CPC = new ServiceAccountCredential(new ServiceAccountCredential.Initializer(AA));


                GoogleCredential cred = GoogleCredential.FromAccessToken(Token);
                
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
            }
            catch(Exception E)
            {

                throw;
            }

            

            return Ok();
        }





    }
}
