using FluentDateTime;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using StopMetrics.Models.DBModels;
using StopMetrics.Utils;
using System.Globalization;
using System.Threading;

namespace StopMetrics.Services
{
    public interface ISupportServices
    {
        void StartDXQuotesUpdate();

        void StartEcoCallendar();
    }

    public class BackgroundSuportServices : BackgroundService
    {
        //Por modelo, quando registrado como singleton, o serviço é chamado duas vezes, nisso as propriedades são estaticas para garantiar igualdade de dados
        public Dictionary<DateOnly, List<GwEconomicEvent>> EconomicCallendar { get
            {
                return economicCallendar;
            }
            private set
            {
                economicCallendar = value;
            }
        }
        private static Dictionary<DateOnly, List<GwEconomicEvent>> economicCallendar;

        public DateTime ServerTime { get { return serverTime; } }
        private static DateTime serverTime;
        private System.Timers.Timer ClockTimeUpdater = new System.Timers.Timer(1000);


        private ExternalCallsService ExtService { get; set; } = new ExternalCallsService();
        private string EcoPlataformUser { get; set; }
        private string EcoPlataformPassword { get; set; }


        static long QuoteTimeout = new TimeSpan(0, 0, 30).Ticks;
        static List<KeyValuePair<string, string>> Symbols = new List<KeyValuePair<string, string>> ()
        {
            new KeyValuePair<string, string>("6e", "https://br.investing.com/currencies/eur-usd"),
            new KeyValuePair<string, string>("cl", "https://br.investing.com/commodities/crude-oil"),
            new KeyValuePair<string, string>("dx", "https://br.investing.com/quotes/us-dollar-index"),
            new KeyValuePair<string, string>("es", "https://br.investing.com/indices/us-spx-500-futures"),
            new KeyValuePair<string, string>("nq", "https://br.investing.com/indices/nq-100-futures"),
            new KeyValuePair<string, string>("ym", "https://br.investing.com/indices/us-30-futures")
        };

        static bool IsDisposing = false;
        static Task DXLoop = null;


        static DbContextOptions DBOptions = null;

        public IHubContext<SignalHubService> SignalService { get; set; }




        public BackgroundSuportServices(IServiceScopeFactory ServiceScope, IHubContext<SignalHubService> SignalService)
        {
            using (var scope = ServiceScope.CreateScope())
            {
                StopMetricsDBContext DBContext = scope.ServiceProvider.GetRequiredService<StopMetricsDBContext>();

                EcoPlataformUser = DBContext.DbPool_SysConfigs.EcoPlataformUser;
                EcoPlataformPassword = DBContext.DbPool_SysConfigs.EcoPlataformPassword;
            }

            this.SignalService = SignalService;
        }



        public void StartDXQuotesUpdate(DbContextOptions DBOptions)
        {
            BackgroundSuportServices.DBOptions = DBOptions;

            if (DXLoop == null)
            {
                DXLoop = new Task(() =>
                {
                    int SymbolCounter = 0;

                    while(!IsDisposing)
                    {
                        try
                        {
                            StopMetricsDBContext DB = new StopMetricsDBContext(DBOptions);

                            DbM_Quote Quote = DB.DbPool_MarketQuotes.Where(x => x.HistoricalName == Symbols[SymbolCounter].Key).FirstOrDefault();
                            if(Quote != null && (Quote.Timestamp < DateTime.Now.AddTicks(-QuoteTimeout)))
                            {
                                //GetQuote(Symbols[SymbolCounter].Key, Symbols[SymbolCounter].Value);
                            }
                        }
                        catch (Exception e)
                        {
                            Console.WriteLine(e.ToString());
                        }
                        finally
                        {
                            SymbolCounter++;

                            if (SymbolCounter >= Symbols.Count)
                                SymbolCounter = 0;

                            Thread.Sleep(10000);
                        }
                    }
                });
            }

            DXLoop.Start();
        }

        private async Task StartEcoCallendar()
        {
            while (!IsDisposing)
            {
                DateTime Today = DateTime.Now.SetTime(0, 0, 0);
                DateTime OneMonth = DateTime.Now.AddMonths(1).SetTime(0, 0, 0);


                EconomicCallendar = await ExtService.GetEconomicCallendar(EcoPlataformUser, EcoPlataformPassword, Today, OneMonth);

                if (EconomicCallendar.IsNotNullOrEmpty())
                {
                    var NextEventDay = EconomicCallendar.FirstOrDefault(x => x.Key >= DateOnly.FromDateTime(ServerTime.Date));

                    if (NextEventDay.Value.IsNotNullOrEmpty())
                    {
                        var NextEvent = NextEventDay.Value.FirstOrDefault(x => x.Date > ServerTime);

                        if(NextEvent != null)
                        {
                            TimeOnly NextEventTime = TimeOnly.FromDateTime(NextEvent.Date);

                            double NextEventDiff = (NextEventTime - TimeOnly.FromDateTime(ServerTime)).TotalSeconds;

                            await Task.Delay(TimeSpan.FromSeconds(NextEventDiff));

                            bool KeepUpdating = true;
                            int MaxCount = 64;
                            int Count = 0;
                            List<int> EventsUpdated = new List<int>();


                            while(KeepUpdating && Count < MaxCount)
                            {
                                Dictionary<DateOnly, List<GwEconomicEvent>> TempEconomicCallendar = await ExtService.GetEconomicCallendar(EcoPlataformUser, EcoPlataformPassword, Today, OneMonth);

                                if(TempEconomicCallendar.IsNotNullOrEmpty() && TempEconomicCallendar.Any(x => x.Key == NextEventDay.Key))
                                {
                                    var a = TempEconomicCallendar[NextEventDay.Key];
                                    IEnumerable <GwEconomicEvent> UpdatedNextEvents = TempEconomicCallendar[NextEventDay.Key].Where(x => x.Date.TimeOfDay == NextEventTime.ToTimeSpan() && x.Values.Count > 0);

                                    if(UpdatedNextEvents.IsNotNullOrEmpty())
                                    {
                                        int EventsCount = UpdatedNextEvents.Count();                                        

                                        foreach(var UpdatedEvent in UpdatedNextEvents)
                                        {
                                            if(!EventsUpdated.Any(x => x == UpdatedEvent.Id))
                                            {
                                                string UpdatedValue = UpdatedEvent.Values.FirstOrDefault(x => x.Name == GwEconomicEventValues.GwEconomicEventValuesNames.Atual)?.Value;

                                                if(!string.IsNullOrEmpty(UpdatedValue))
                                                {
                                                    EconomicCallendar[NextEventDay.Key].Find(x => x.Id == UpdatedEvent.Id).Values = UpdatedEvent.Values;

                                                    await SignalService.Clients.All.SendAsync(SignalHubMethods.CalendarEventUpdate, UpdatedEvent);

                                                    EventsUpdated.Add(UpdatedEvent.Id);
                                                }
                                                else
                                                    Count++;
                                            }
                                            else
                                            {
                                                Count++;
                                            }
                                        }

                                        if(EventsUpdated.Count == EventsCount)
                                            KeepUpdating = false;
                                    }
                                }

                                await Task.Delay(TimeSpan.FromSeconds(5));
                            }
                        }
                    }
                }
                else
                {
                    await Task.Delay(TimeSpan.FromSeconds(5));
                }
            }
        }


        private static void SaveQuote(string SymbolName, double? SymbClose, double? SymbOpen, double? SymbLast)
        {
            if (SymbOpen != null && SymbClose != null && SymbLast != null)
            {
                StopMetricsDBContext DB = new StopMetricsDBContext(DBOptions);

                //DB.Database.ExecuteSqlRawAsync("AtualizaCotacao @Ativo, @Fechamento, @Abertura, @Ultimo",
                //    new SqlParameter("Ativo", SymbolName),
                //    new SqlParameter("Fechamento", SymbClose),
                //    new SqlParameter("Abertura", SymbOpen),
                //    new SqlParameter("Ultimo", SymbLast));
            }
        }

        //public static async void UpdateB3ClosingValues(DbContextOptions DBOptions)
        //{
        //    WebScrapper SDriver = new WebScrapper();
        //    StopMetricsDBContext DBContext = new StopMetricsDBContext(DBOptions);
        //    BackgroundSuportServices.DBOptions = DBOptions;

        //    await Task.Run(async () =>
        //    {


        //        while (!IsDisposing)
        //        {
        //            DbM_B3ClosingData LastUpdatedDay = DBContext.DbPool_B3ClosingData.OrderByDescending(x => x.Date).FirstOrDefault(x => x.MasterSymbol == DbE_B3Symbols.DOL);

        //            DateTime FirstDate = new DateTime(2000, 1, 1);
        //            DateTime LastDay = DateTime.Now.AddDays(-1);


        //            if (LastUpdatedDay != null)
        //                FirstDate = LastUpdatedDay.Date.AddDays(1);


        //            if (FirstDate < DateTime.Now.AddDays(-1))
        //            {
        //                List<DbM_B3ClosingData> DOLValues = await SDriver.ScrapDOLValues(FirstDate, LastDay);
        //                DBContext.DbPool_B3ClosingData.AddRange(DOLValues);

        //                await DBContext.SaveChangesAsync();

        //                SDriver.CloseScrapper();
        //            }

        //            double NextDay = (DateTime.Now.AddDays(1) - DateTime.Now).TotalSeconds;
        //            Thread.Sleep((int)(NextDay * 1000));
        //        }
        //    });

        //    await Task.Run(async () =>
        //    {
        //        while (!IsDisposing)
        //        {
        //            DbM_B3ClosingData LastUpdatedDay = DBContext.DbPool_B3ClosingData.OrderByDescending(x => x.Date).FirstOrDefault(x => x.MasterSymbol == DbE_B3Symbols.FRP);

        //            DateTime FirstDate = new DateTime(2000, 1, 1);
        //            DateTime LastDay = DateTime.Now.AddDays(-1);


        //            if (LastUpdatedDay != null)
        //                FirstDate = LastUpdatedDay.Date.AddDays(1);


        //            if (FirstDate < DateTime.Now.AddDays(-1))
        //            {
        //                List<DbM_B3ClosingData> FRPValues = await SDriver.ScrapFRPValues(FirstDate, LastDay);
        //                DBContext.DbPool_B3ClosingData.AddRange(FRPValues);

        //                await DBContext.SaveChangesAsync();

        //                SDriver.CloseScrapper();
        //            }

        //            double NextDay = (DateTime.Now.AddDays(1) - DateTime.Now).TotalSeconds;
        //            Thread.Sleep((int)(NextDay * 1000));
        //        }

        //    });
        //}


        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            serverTime = await ExtService.GetWorldClock();
            ClockTimeUpdater.Elapsed += delegate {
                serverTime = ServerTime.AddSeconds(1);
            };
            ClockTimeUpdater.Start();



            await StartEcoCallendar(); //Looping. Deve ser a ultima linha          

            await Task.CompletedTask;
        }


        public override void Dispose()
        {
            ClockTimeUpdater.Elapsed -= null;
            ClockTimeUpdater.Dispose();

            base.Dispose();
        }
    }
}
