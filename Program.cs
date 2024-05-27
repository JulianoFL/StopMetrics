using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using StopMetrics.Services;
using Microsoft.AspNetCore.Hosting.WindowsServices;
using NLog.Web;
using NLog;

namespace StopMetrics
{
    public class Program
    {
        static string[] Urls = ["https://10.0.0.10:3000", "https://*:3000"];

        public static async Task Main(string[] args)
        {
            LogManager.Setup().LoadConfigurationFromFile("Nlogs/nlog.config").GetCurrentClassLogger();

            //var logger = NLog.LogManager.Setup().LoadConfigurationFromAppSettings().GetCurrentClassLogger();
            //logger.Debug("init main");

            var Env = Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT");
            var IsDevelopment = Env == Environments.Development;

            //if (!IsDevelopment)            
            //    Urls = new string[] { "http://*:5000" };


            //if(IsDevelopment)
            //    await CreateHostBuilder(args).ConfigureAppConfiguration(options => options.SetBasePath("I:\\Programas\\MeusServiços\\StopMetrics\\").AddJsonFile("appsettings.json")).UseWindowsService().Build().RunAsync();
            //else
            //    await CreateHostBuilder(args).ConfigureAppConfiguration(options => options.AddJsonFile("appsettings.json")).UseWindowsService().Build().RunAsync();


            await CreateHostBuilder(args).UseWindowsService().Build().RunAsync();

            LogManager.Shutdown();
        }

        public static IHostBuilder CreateHostBuilder(string[] args) => Host.CreateDefaultBuilder(args).ConfigureWebHostDefaults(webBuilder =>
        {
            webBuilder.UseUrls(Urls).UseStartup<Startup>().UseNLog();
        }).ConfigureServices(services => services.AddHostedService<BackgroundSuportServices>());
    }
}
