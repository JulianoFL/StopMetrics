using StopMetrics.Models.External;
using StopMetrics.Utils.Http;
using System;
using System.Dynamic;
using System.Net.Http;
using System.Net.Http.Headers;
using FluentDateTime;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace StopMetrics.Services
{
    public class ExternalCallsService : HttpCalls
    {
        private static readonly HttpClient Client = new HttpClient() { Timeout = TimeSpan.FromSeconds(120000) };


        public ExternalCallsService() : base(Client) { }


        /// <summary>
        /// Retorna calendário economico
        /// </summary>
        public async Task<Dictionary<DateOnly, List<GwEconomicEvent>>> GetEconomicCallendar(string User, string Password, DateTime? InitialTime, DateTime? FinalTime)
        {
            string Query = "https://tc.tradersclub.com.br/bff/v1/auth/login";
            string Token = null;

            if (InitialTime == null)
            {
                if (DateTime.Now.DayOfWeek == DayOfWeek.Monday)
                    InitialTime = DateTime.Now.SetTime(0, 0, 0);
                else
                    InitialTime = DateTime.Now.Previous(DayOfWeek.Monday).SetTime(0, 0, 0);


                if (DateTime.Now.DayOfWeek == DayOfWeek.Friday)
                    FinalTime = DateTime.Now.SetTime(23, 59, 59);
                else
                    FinalTime = DateTime.Now.Next(DayOfWeek.Friday).SetTime(23, 59, 59);
            }


            try
            {
                dynamic Body = new ExpandoObject();
                Body.login_id = User;
                Body.password = Password;

                JObject Auth = await PostAsync<JObject>(Query, Body);

                if (Auth.ContainsKey("data"))
                    Token = Auth["data"]["token"].ToString();
            }
            catch (Exception E)
            {
                return null;
            }


            Client.DefaultRequestHeaders.Clear();

            Client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", Token);



            Query = "https://tc.tradersclub.com.br/bff/v2/calendar?";

            Query += "init_time=" + ((DateTimeOffset)InitialTime).ToUnixTimeSeconds() + "000";
            Query += "&end_time=" + ((DateTimeOffset)FinalTime).ToUnixTimeSeconds() + "000";

            try
            {
                TcEconomicEventData Response = await GetAsync<TcEconomicEventData>(Query);


                Dictionary<DateOnly, List<GwEconomicEvent>> Events = new Dictionary<DateOnly, List<GwEconomicEvent>>();

                foreach (var Event in Response.Data)
                {
                    if (!Event.Name.ToLower().Contains("tc radio") && !Event.Name.ToLower().Contains("tc rádio"))
                    {
                        DateOnly EventDate = DateOnly.FromDateTime(DateTimeOffset.FromUnixTimeMilliseconds(Event.Date).Date);
                        GwEconomicEvent GwEvent = Event.CreateGwModel(EventDate);

                        if (!Events.ContainsKey(EventDate))
                            Events.Add(EventDate, new List<GwEconomicEvent>());

                        Events[EventDate].Add(GwEvent);
                    }
                }

                if (Events.IsNotNullOrEmpty())
                    return Events.OrderBy(x => x.Key).ToDictionary(x => x.Key, s => s.Value);
                else
                    return null;
            }
            catch (Exception E)
            {
                return null;
            }
        }


        public async Task<DateTime> GetWorldClock ()
        {
            string Query = "https://timeapi.io/api/Time/current/zone?timeZone=Europe/London";


            JObject Clock = await GetAsync<JObject>(Query);

            Client.DefaultRequestHeaders.Clear();

            if(Clock != null && Clock.ContainsKey("dateTime") && Clock.ContainsKey("dstActive"))
            {
                DateTime TimeNow = Clock["dateTime"].Value<DateTime>();

                if(Clock["dstActive"].Value<bool>())
                    TimeNow = TimeNow.AddHours(-1);

                return DateTime.SpecifyKind(TimeNow, DateTimeKind.Utc);
            }   
            else
                return DateTime.Now;
        }
    }
}
