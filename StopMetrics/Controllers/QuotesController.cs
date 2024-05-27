using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using StopMetrics.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Newtonsoft.Json.Linq;
using System;
using Microsoft.EntityFrameworkCore;
using System.Data.SqlClient;
using StopMetrics.Utils;
using System.Threading.Tasks;
using StopMetrics.Models.DBModels;
using StopMetrics.Services;
using FluentDateTime;

namespace StopMetrics.Controllers
{
    [Route("api/market_quotes")]
    public class QuotesController : BaseController
    {
        public QuotesController(StopMetricsDBContext DBContext, BackgroundSuportServices BackServices) : base(DBContext, BackServices) { }

        [HttpGet("get_quotes")]
        [AllowAnonymous]
        public IEnumerable<DbM_Quote> GetQuotes()
        {
            return DBContext.DbPool_MarketQuotes.ToList();
        }

        [HttpPost("update_quote")]
        [AllowAnonymous]
        public ActionResult UpdateQuote([FromBody] JObject Data)
        {
            //if (!Request.IsLocal())
            //    return BadRequest();

            try
            {
                switch (Data["market"].Value<string>())
                {
                    case "bmf":
                        if (Data["symbol"].Value<string>().Contains("dol"))
                            SaveB3Symbols(Data["values"]);
                        break;
                    case "ma":
                        SaveMASymbols(Data["symbol"].Value<string>(), Data["values"]);
                        break;
                    default:
                        return BadRequest();
                }
            }
            catch (Exception)
            {
                return BadRequest();
            }
            

            return Ok();
        }

        [AllowAnonymous]
        [HttpGet("get_economic_callendar")]
        public IActionResult GetEconomicCallendar([FromQuery] DateOnly? init_date = null, [FromQuery] DateOnly? final_date = null)
        {
            if (init_date == null || final_date == null)
            {
                if (DateTime.Now.DayOfWeek == DayOfWeek.Monday)
                    init_date = DateOnly.FromDateTime(DateTime.Now); //Por algum motivo não está retornando o dia atual quando é o mesmo dia
                else
                    init_date = DateOnly.FromDateTime(DateTime.Now.Previous(DayOfWeek.Monday));


                if (DateTime.Now.DayOfWeek == DayOfWeek.Friday)
                    final_date = DateOnly.FromDateTime(DateTime.Now);
                else
                    final_date = DateOnly.FromDateTime(DateTime.Now.Next(DayOfWeek.Friday));
            }


            var EconomicCallendar = BackServices.EconomicCallendar.Where(x => x.Key >= init_date && x.Key <= final_date).ToDictionary(x => x.Key, x => x.Value);

            return Ok(EconomicCallendar);
        }


        private void SaveMASymbols(string SymbolName, JToken Data)
        {
            double? SymbOpen = Data["open"].Value<double?>();
            double? SymbClose = Data["close"].Value<double?>();
            double? SymbLast = Data["last"].Value<double?>();

            SaveQuote(SymbolName, SymbClose, SymbOpen, SymbLast);
        }

        private void SaveB3Symbols(JToken Data)
        {
            double? DolOpen = Data["open"].Value<double?>();
            double? DolClose = Data["close"].Value<double?>();
            double? DolLast = Data["last"].Value<double?>();
            double? DolClose16 = Data["close_16"].Value<double?>();

            double? Frp0Open = Data["frp0"]["open"].Value<double?>();
            double? Frp0Close = Data["frp0"]["close"].Value<double?>();
            double? Frp0Last = Data["frp0"]["last"].Value<double?>();
            double? Frp0Close16 = Data["frp0"]["close_16"].Value<double?>();

            if (DolOpen != null && DolClose != null && DolLast != null && DolClose16 != null && Frp0Open != null && Frp0Close != null && Frp0Last != null && Frp0Close16 != null)
            {
                double DolComercialOpen = Math.Round((double)(DolOpen - Frp0Open) / 1000, 4);
                double DolComercialClose = Math.Round((double)(DolClose16 - Frp0Close16) / 1000, 4);
                double DolComercialLast = Math.Round((double)(DolLast - Frp0Last) / 1000, 4);

                SaveQuote("frp", Math.Round((double)Frp0Close, 4), Math.Round((double)Frp0Open, 4), Math.Round((double)Frp0Last, 4));
                SaveQuote("usd_brl", DolComercialClose, DolComercialOpen, DolComercialLast);
            }
        }

        private void SaveQuote(string SymbolName, double? SymbClose, double? SymbOpen, double? SymbLast)
        {
            if (SymbOpen != null && SymbClose != null && SymbLast != null)
            {
                //DBContext.Database.ExecuteSqlRawAsync("AtualizaCotacao @Ativo, @Fechamento, @Abertura, @Ultimo",
                //    new SqlParameter("Ativo", SymbolName),
                //    new SqlParameter("Fechamento", SymbClose),
                //    new SqlParameter("Abertura", SymbOpen),
                //    new SqlParameter("Ultimo", SymbLast));
            }
        }
    }
}