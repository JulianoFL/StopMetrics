using Google.Apis.Auth.OAuth2;
using Google.Apis.Auth.OAuth2.Flows;
using Google.Apis.Auth.OAuth2.Responses;
using Google.Apis.Services;
using Google.Apis.YouTube.v3;
using Google.Apis.YouTube.v3.Data;
using Newtonsoft.Json.Linq;
using StopMetrics.Models.Internal;
using System.Threading;

namespace StopMetrics.Services.Google.APIs
{
    public class GoogleAuthorization
    {
        private static GoogleAuthorizationCodeFlow GAuthFlow = new GoogleAuthorizationCodeFlow(new GoogleAuthorizationCodeFlow.Initializer
        {
            ClientSecrets = new ClientSecrets
            {
                ClientId = "3843429017-7i6fhvi409jo91e76csogjvh7uv7jk6p.apps.googleusercontent.com",//"3843429017 -7i6fhvi409jo91e76csogjvh7uv7jk6p.apps.googleusercontent.com";// clientSecrets.ClientId;
                ClientSecret = "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" //"GOCSPX -IqlVYa_geJLgpbejLhSL_5yCs7F4";// clientSecrets.ClientSecret;
            },
            Scopes = new[] { YouTubeService.Scope.YoutubeReadonly },
        });


        public static async Task<TokenResponse> GetTokensFromCode(string Code, string HostURL)
        {
            return await GAuthFlow.ExchangeCodeForTokenAsync(null, Code, HostURL, CancellationToken.None);
        }

        public static async Task<string> GetTokensFromToken(string RefreshToken)
        {
            TokenResponse TResponse = new TokenResponse();
            TResponse.RefreshToken = RefreshToken;

            UserCredential UCredential = new UserCredential(GAuthFlow, null, TResponse);
            return await UCredential.GetAccessTokenForRequestAsync();
        }
    }

    public class YouTubeSearcher
    {
        public static async Task<List<OperationProviderVideo>> ListPrivateChannelVideos(string Token)
        {
            List<OperationProviderVideo> VideosList = new List<OperationProviderVideo>();

            try
            {                
                GoogleCredential GCredential = GoogleCredential.FromAccessToken(await GoogleAuthorization.GetTokensFromToken(Token));

                YouTubeService YTService = new YouTubeService(new BaseClientService.Initializer { HttpClientInitializer = GCredential });

                ChannelsResource.ListRequest ChannelList = YTService.Channels.List("contentDetails");
                ChannelList.Mine = true;

                ChannelListResponse ChResponse = await ChannelList.ExecuteAsync();

                foreach(var Channel in ChResponse.Items)
                {
                    // From the API response, extract the playlist ID that identifies the list
                    // of videos uploaded to the authenticated user's channel.
                    var Videos = Channel.ContentDetails.RelatedPlaylists.Uploads;

                    var NextPage = "";
                    while(NextPage != null)
                    {
                        var PlaylistItemsListRequest = YTService.PlaylistItems.List("snippet");
                        PlaylistItemsListRequest.PlaylistId = Videos;
                        PlaylistItemsListRequest.MaxResults = 50;
                        PlaylistItemsListRequest.PageToken = NextPage;

                        // Retrieve the list of videos uploaded to the authenticated user's channel.
                        PlaylistItemListResponse PlaylistItemsListResponse = await PlaylistItemsListRequest.ExecuteAsync();

                        foreach(var PlaylistItem in PlaylistItemsListResponse.Items)
                        {
                            OperationProviderVideo Video = new OperationProviderVideo();

                            Video.Id = PlaylistItem.Snippet.ResourceId.VideoId;
                            Video.Name = PlaylistItem.Snippet.Title;
                            Video.Provider = GwOperation.OperationVideoProvider.YouTube;
                            Video.URL = "https://www.youtube.com/watch?v=" + Video.Id;

                            VideosList.Add(Video);
                        }

                        NextPage = PlaylistItemsListResponse.NextPageToken;
                    }
                }
            }
            catch(Exception E)
            {
                throw;
            }



            return VideosList;
        }
    }    
}
