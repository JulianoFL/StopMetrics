using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Hosting;
using StopMetrics.Models.DBModels;
using StopMetrics.Models.Parameters;
using StopMetrics.Models.Responses;
using StopMetrics.Services;
using StopMetrics.Utils;
using StopMetrics.Utils.Extensions;

namespace StopMetrics.Controllers
{
    [Route("api/market_data")]
    public class MarketDataController : BaseController
    {
        public MarketDataController(StopMetricsDBContext DBContext, BackgroundSuportServices BackServices) : base(DBContext, BackServices) { }

        [HttpGet("[action]"), ActionName("get_b3_significant_data")]
        public async Task<IActionResult> GetB3SignificantData([FromQuery] JSignificantData SData)
        {
            DbM_User User = await GetUser();

            List<DbM_B3ClosingData> B3CPoints = DBContext.DbPool_B3ClosingData
                .Where(x => x.Symbol.Contains(DBContext.DbPool_Props.Symbols.Dolar.Name.ToString()) && x.Date <= SData.Date)
                .OrderByDescending(x => x.Date)                                
                .Take(SData.Quantity)
                .ToList();

            B3CPoints.Reverse();

            List<int> Years = B3CPoints.Select(x => x.Date.Year).ToList();
            Years = Years.Distinct().ToList();

            for (int y = 0; y < Years.Count; y++)
            {
                List<int> Months = B3CPoints.Where(x => x.Date.Year == Years[y]).Select(x => x.Date.Month).ToList();
                Months = Months.Distinct().ToList();

                for (int m = 0; m < Months.Count; m++)
                {
                    if(Months[m] != SData.Date.Month || Years[y] != SData.Date.Year)
                    {
                        foreach (var Point in B3CPoints.Where(x => x.Date.Month <= Months[m] && x.Date.Year <= Years[y]))
                        {
                            decimal FRPOpenning = DBContext.DbPool_B3ClosingData.OrderByDescending(x => x.Date)
                                .Where(x => x.Symbol.Contains(DbE_Symbols.FRP.ToString()) && x.Date.Month <= Months[m] && x.Date.Year <= Years[y]).FirstOrDefault().Openning;

                            Point.Maximum = Math.Round((Point.Maximum + FRPOpenning) * 2, MidpointRounding.AwayFromZero) / 2;
                            Point.Minimum = Math.Round((Point.Minimum + FRPOpenning) * 2, MidpointRounding.AwayFromZero) / 2;
                            Point.Closing = Math.Round((Point.Closing + FRPOpenning) * 2, MidpointRounding.AwayFromZero) / 2;
                        }
                    }                    
                }
            }




            List<B3SignificantPoint> B3SPoints = DBContext.DbPool_B3SignificantPoints
                .OrderBy(x => x.StartDate)
                .Where(x => x.Symbol.Contains(DBContext.DbPool_Props.Symbols.Dolar.Name.ToString()) && x.StartDate <= SData.Date).ToList();

            Years = B3SPoints.Select(x => x.StartDate.Year).ToList();
            Years = Years.Distinct().ToList();

            for (int y = 0; y < Years.Count; y++)
            {
                List<int> Months = B3SPoints.Where(x => x.StartDate.Year == Years[y]).Select(x => x.StartDate.Month).ToList();
                Months = Months.Distinct().ToList();

                for (int m = 0; m < Months.Count; m++)
                {
                    foreach (var Point in B3SPoints.Where(x => x.StartDate.Month <= Months[m] && x.StartDate.Year <= Years[y]))
                    {
                        decimal FRPOpenning = DBContext.DbPool_B3ClosingData.OrderByDescending(x => x.Date)
                            .Where(x => x.Symbol.Contains(DbE_Symbols.FRP.ToString()) && x.Date.Month <= Months[m] && x.Date.Year <= Years[y]).FirstOrDefault().Openning;

                        Point.Price = Math.Round((Point.Price + FRPOpenning) * 2, 2, MidpointRounding.AwayFromZero) / 2;
                    }
                }
            }



            List<DateTime> DateRange = DBContext.DbPool_B3ClosingData
                .OrderByDescending(x => x.Date)
                .Where(x => x.Symbol.Contains(DBContext.DbPool_Props.Symbols.Dolar.Name.ToString()) && x.Date <= SData.Date)
                .Select(x => x.Date)
                .Take(SData.Quantity)
                .ToList();


            DateTime StartDate = DateRange.Max();
            DateTime EndDate = DateRange.Min();




            B3SPoints = B3SPoints.Where(x => 
                x.UserId == User.Id &&
                (StartDate < x.EndDate || x.EndDate == null) &&
                StartDate >= x.StartDate)

                .ToList();

           B3CPoints = B3CPoints.OrderByDescending(x => x.Date).Where(x => 
                x.Date <= StartDate && 
                x.Date >= EndDate)
                
                .ToList();



            decimal MaxSPrice = B3SPoints.Count > 0 ? B3SPoints.Max(x => x.Price) : 0;
            decimal MinSPrice = B3SPoints.Count > 0 ? B3SPoints.Min(x => x.Price) : 10000000;


            decimal MaxCPrice = 0, MinCPrice = 1000000;

            if(B3CPoints != null && B3CPoints.Count > 0)
                MaxCPrice = (decimal)B3CPoints.SelectMany(x => new[] { x.Ajuste, x.AveragePrice, x.Closing, x.Maximum, x.Minimum, x.Openning }).Max();

            if (B3CPoints != null && B3CPoints.Count > 0)
                MinCPrice = (decimal)B3CPoints.SelectMany(x => new[] { x.Ajuste, x.AveragePrice, x.Closing, x.Maximum, x.Minimum, x.Openning }).Min();



            decimal MaxPrice = MaxSPrice >= MaxCPrice ? MaxSPrice : MaxCPrice;
            decimal MinPrice = MinSPrice <= MinCPrice ? MinSPrice : MinCPrice;

            MaxPrice = Math.Round(MaxPrice * 2, MidpointRounding.AwayFromZero) / 2;
            MinPrice = Math.Round(MinPrice * 2, MidpointRounding.AwayFromZero) / 2;

            GwSignificantData SignificantData = new GwSignificantData();

            //Dictionary<decimal, List<GwSignificantPoints>> GwSPoints = new Dictionary<decimal, List<GwSignificantPoints>> ();

            while (MaxPrice >= MinPrice)
            {
                List<GwSignificantPoints> PricePoints = new List<GwSignificantPoints>();

                List<B3SignificantPoint> PriceSPoints = B3SPoints.Where(x => x.Price == MaxPrice).ToList();
                foreach (var item in PriceSPoints)
                {
                    GwSignificantPoints SPoint = new GwSignificantPoints();

                    switch (item.Strength)
                    {
                        case DbE_PointStrength.Weak:
                            SPoint.Type = GwPointType.Weak;
                            break;
                        case DbE_PointStrength.Medium:
                            SPoint.Type = GwPointType.Medium;
                            break;
                        case DbE_PointStrength.Strong:
                            SPoint.Type = GwPointType.Strong;
                            break;
                    }

                    SPoint.Annotation = item.Annotation;
                    SPoint.DateDiff = DateRange.Where(x => x <= StartDate && x >= item.StartDate).Count() - 1;
                    
                    PricePoints.Add(SPoint);
                }


                if (B3CPoints.SelectMany(x => new[] { (Math.Round((decimal)x.Ajuste * 2, MidpointRounding.AwayFromZero) / 2), x.AveragePrice, x.Closing, x.Maximum, x.Minimum, x.Openning })
                    .Any(x => x == MaxPrice))
                {
                    if (B3CPoints.Any(x => (Math.Round((decimal)x.Ajuste * 2, MidpointRounding.AwayFromZero) / 2) == MaxPrice))
                    {
                        GwSignificantPoints SPoint = new GwSignificantPoints();
                        SPoint.Type = GwPointType.Ajuste;

                        DateTime PointDate = B3CPoints.First(x => (Math.Round((decimal)x.Ajuste * 2, MidpointRounding.AwayFromZero) / 2) == MaxPrice).Date;

                        int DateDiff = DateRange.Where(x => x <= StartDate && x >= PointDate).Count();
                        SPoint.DateDiff = DateDiff - 1;

                        PricePoints.Add(SPoint);


                        if (!SignificantData.PointsTypesValues.ContainsKey(GwPointType.Ajuste.ToSnakeCase()))
                            SignificantData.PointsTypesValues.Add(GwPointType.Ajuste.ToSnakeCase(), new SortedDictionary<DateTime, decimal>());

                        SignificantData.PointsTypesValues[GwPointType.Ajuste.ToSnakeCase()].Add(PointDate, MaxPrice);
                    }

                    if (B3CPoints.Any(x => x.AveragePrice == MaxPrice))
                    {
                        GwSignificantPoints SPoint = new GwSignificantPoints();
                        SPoint.Type = GwPointType.Medium;

                        DateTime PointDate = B3CPoints.First(x => x.AveragePrice == MaxPrice).Date;

                        int DateDiff = DateRange.Where(x => x <= StartDate && x >= PointDate).Count();
                        SPoint.DateDiff = DateDiff - 1;

                        PricePoints.Add(SPoint);


                        //if (!SignificantData.PointsTypesValues.ContainsKey(GwPointType.Medium))
                        //    SignificantData.PointsTypesValues.Add(GwPointType.Medium, new SortedDictionary<DateTime, decimal>());

                        //SignificantData.PointsTypesValues[GwPointType.Medium].Add(PointDate, MaxPrice);
                    }

                    if (B3CPoints.Any(x => x.Closing == MaxPrice))
                    {
                        GwSignificantPoints SPoint = new GwSignificantPoints();
                        SPoint.Type = GwPointType.Closing;

                        DateTime PointDate = B3CPoints.First(x => x.Closing == MaxPrice).Date;

                        int DateDiff = DateRange.Where(x => x <= StartDate && x >= PointDate).Count();
                        SPoint.DateDiff = DateDiff - 1;

                        PricePoints.Add(SPoint);


                        if (!SignificantData.PointsTypesValues.ContainsKey(GwPointType.Closing.ToSnakeCase()))
                            SignificantData.PointsTypesValues.Add(GwPointType.Closing.ToSnakeCase(), new SortedDictionary<DateTime, decimal>());

                        SignificantData.PointsTypesValues[GwPointType.Closing.ToSnakeCase()].Add(PointDate, MaxPrice);
                    }

                    if (B3CPoints.Any(x => x.Maximum == MaxPrice))
                    {
                        GwSignificantPoints SPoint = new GwSignificantPoints();
                        SPoint.Type = GwPointType.Maximum;

                        DateTime PointDate = B3CPoints.First(x => x.Maximum == MaxPrice).Date;

                        int DateDiff = DateRange.Where(x => x <= StartDate && x >= PointDate).Count();
                        SPoint.DateDiff = DateDiff - 1;

                        PricePoints.Add(SPoint);


                        //if (!SignificantData.PointsTypesValues.ContainsKey(GwPointType.Maximum))
                        //    SignificantData.PointsTypesValues.Add(GwPointType.Maximum, new SortedDictionary<DateTime, decimal>());

                        //SignificantData.PointsTypesValues[GwPointType.Maximum].Add(PointDate, MaxPrice);
                    }

                    if (B3CPoints.Any(x => x.Minimum == MaxPrice))
                    {
                        GwSignificantPoints SPoint = new GwSignificantPoints();
                        SPoint.Type = GwPointType.Minimum;
                        
                        DateTime PointDate = B3CPoints.First(x => x.Minimum == MaxPrice).Date;

                        int DateDiff = DateRange.Where(x => x <= StartDate && x >= PointDate).Count();
                        SPoint.DateDiff = DateDiff - 1;

                        PricePoints.Add(SPoint);


                        //if (!SignificantData.PointsTypesValues.ContainsKey(GwPointType.Minimum))
                        //    SignificantData.PointsTypesValues.Add(GwPointType.Minimum, new SortedDictionary<DateTime, decimal>());

                        //SignificantData.PointsTypesValues[GwPointType.Minimum].Add(PointDate, MaxPrice);
                    }

                    if (B3CPoints.Any(x => x.Openning == MaxPrice))
                    {
                        GwSignificantPoints SPoint = new GwSignificantPoints();
                        SPoint.Type = GwPointType.Openning;
                        
                        DateTime PointDate = B3CPoints.First(x => x.Openning == MaxPrice).Date;

                        int DateDiff = DateRange.Where(x => x <= StartDate && x >= PointDate).Count();
                        SPoint.DateDiff = DateDiff - 1;
                        
                        PricePoints.Add(SPoint);


                        if (!SignificantData.PointsTypesValues.ContainsKey(GwPointType.Openning.ToSnakeCase()))
                            SignificantData.PointsTypesValues.Add(GwPointType.Openning.ToSnakeCase(), new SortedDictionary<DateTime, decimal>());

                        SignificantData.PointsTypesValues[GwPointType.Openning.ToSnakeCase()].Add(PointDate, MaxPrice);
                    }
                }

                if (SignificantData.PointsDOM.ContainsKey(MaxPrice))
                    SignificantData.PointsDOM[MaxPrice].AddRange(PricePoints);
                else
                {
                    SignificantData.PointsDOM.Add(MaxPrice, PricePoints);
                }
                    //SignificantData.PointsDOM.Add(MaxPrice, PricePoints);

                MaxPrice -= (decimal)DBContext.DbPool_Props.Symbols.Dolar.TickStep;
            }

            
            return Ok(SignificantData);
        }

        [HttpPost("[action]"), ActionName("set_b3_significant_point")]
        public async Task<IActionResult> SetB3SignificantPoint([FromBody] JSignificantPoint SPoint)
        {
            DbM_User User = await GetUser();

            if (DBContext.DbPool_B3SignificantPoints.Any(x => x.Price == SPoint.Price && (x.StartDate <= SPoint.StartDate && x.EndDate != null)))
                return ShowWarning("Já existe um ponto importante aberto nesse preço");

            B3SignificantPoint NewPoint = SupportMethods.Cast<B3SignificantPoint>(SPoint);
            NewPoint.Symbol = "DOLFUT";
            NewPoint.UserId = User.Id;
            SPoint.EndDate = null;


            DBContext.DbPool_B3SignificantPoints.Add(NewPoint);
            await DBContext.SaveChangesAsync();

            return ShowSuccess("Ponto adicionado com sucesso !");
        }

        [HttpPost("[action]"), ActionName("del_b3_significant_point")]
        public async Task<IActionResult> DeleteB3SignificantPoint([FromBody] JSignificantPoint SPoint)
        {
            DbM_User User = await GetUser();

            B3SignificantPoint B3SPoint = DBContext.DbPool_B3SignificantPoints.FirstOrDefault(x => x.Price == SPoint.Price);

            if (B3SPoint == null)
                return ShowWarning("Não existe nenhum ponto nesse preço");

            List<DateTime> BusinessDays = DBContext.DbPool_B3ClosingData
                .OrderByDescending(x => x.Date)
                .Where(x => x.Symbol.Contains(DBContext.DbPool_Props.Symbols.Dolar.Name.ToString()) && x.Date <= DateTime.Now)
                .Select(x => x.Date)
                .ToList();

            DateTime RealEndDate = BusinessDays.FirstOrDefault(x => x <= SPoint.EndDate);
            
            B3SPoint.EndDate = RealEndDate;

            await DBContext.SaveChangesAsync();

            return ShowSuccess("Ponto removido com sucesso !");
        }

        [HttpGet("[action]"), ActionName("get_b3_non_business_days")]
        public IActionResult GetB3NonBusinessDays()
        {
            List<DateTime> BusinessDays = DBContext.DbPool_B3ClosingData
                .OrderByDescending(x => x.Date)
                .Where(x => x.Symbol.Contains(DBContext.DbPool_Props.Symbols.Dolar.Name.ToString()) && x.Date <= DateTime.Now)
                .Select(x => x.Date)
                .ToList();

            List<DateTime> Alldays = Enumerable.Range(0, (DateTime.Now - BusinessDays.Last()).Days + 1).Select(d => BusinessDays.Last().AddDays(d)).OrderByDescending(x => x.Date).ToList();

            List<DateTime> NonBusiness = Alldays.Except(BusinessDays).ToList();
            
            return Ok(NonBusiness);
        }
    }
}