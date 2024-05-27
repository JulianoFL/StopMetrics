using Microsoft.AspNetCore.SignalR;
using Microsoft.Identity.Client;

namespace StopMetrics.Services
{
    public class SignalHubMethods
    {
        public static readonly string CalendarEventUpdate = nameof(CalendarEventUpdate);
    }

    public class SHubClient
    {
        public string Id { get; set;}

        public string AccessToken { get; set;}
        public DateTime ATokenExpiration { get; set; }
    }

    public class SignalHubService : Hub
    {
        public static Dictionary<long, SHubClient> ConnectedClients { get; private set; } = new Dictionary<long, SHubClient>();

        private IServiceProvider SProvider;


        public SignalHubService(IServiceProvider SProvider)
        {
            this.SProvider = SProvider;
        }


        //public async Task<bool> RegisterClient(string AccessToken, string ConnectionId, int LoginId)
        //{




        //    //return false;
        //}

        //public override Task OnDisconnectedAsync(Exception exception)
        //{
        //    if(ConnectedClients.ContainsValue(Context.ConnectionId))
        //        ConnectedClients.Remove(ConnectedClients.First(x => x.Value == Context.ConnectionId).Key);


        //    return base.OnDisconnectedAsync(exception);
        //}
    }
}
