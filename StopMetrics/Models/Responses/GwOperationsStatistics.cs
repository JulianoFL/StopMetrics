using Microsoft.Identity.Client;
using StopMetrics.Models.DBModels;
using StopMetrics.Utils;
using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Globalization;
using System.Linq;
using System.Threading;

namespace StopMetrics.Models.Responses
{
    public class GwOperationsStatistics
    {
        /// <summary>
        /// Valor em líquido para considerar uma operação como vencedora
        /// </summary>
        const int GainResult = 5;


        public List<GwOperation> Operations { get; set; } = new List<GwOperation>();

        public int OperationsCount { get; private set; }

        public double TotalCost { get; private set; }

        public double GrossIncome { get; private set; }

        public double NetIncome { get; private set; }


        public int WinnerCount { get; private set; }

        public double AverageWinnerAmount { get; private set; }

        public double WinnerPercentage { get; private set; }


        public int LoserCount { get; private set; }

        public double AverageLoserAmount { get; private set; }

        public double LoserPercentage { get; private set; }


        public double OverallAverageAmount { get; private set; }


        public double Sharpe { get; private set; }


        /// <summary>
        ///Número do sistema de qualidade
        ///Ajuda a definir o nível de risco que podemos aplicar no operacional
        ///< 1 = Muito díficil
        ///1.01 - 2 = Mediano (1.7 é o significante)
        ///2.01 - 3 = Bom
        ///3.01 - 5 = Excelente
        ///5.01 - 7 = Incrível
        ///> 7 = Mina de ouro
        /// </summary>
        public double SQN { get; private set; }

        public double MathExpectation { get; private set; }

        public double ExpectedProfit { get; private set; }

        public double Edge { get; private set; }

        public double KellyCriterion { get; private set; }


        public double StopedSmalerPlanned { get; private set; }

        public double StopedBiggerPlanned { get; private set; }

        /// <summary>
        /// Drawndown médio em relação ao STOP planejado, em quantidade (ex: 1,8x do STOP planejado)
        /// </summary>
        public double AvgDrawdownFromPStop { get; private set; }

        public double AvgWinnerOperationDuration { get; private set; }

        public double AvgLoserOperationDuration { get; private set; }


        public decimal BiggestLoser { get; private set; }

        public decimal BiggestWinner { get; private set; }


        public int Zeroeds { get; private set; }

        public double ProfitLoss { get; private set; }

        public Dictionary<string, float> UsedSymbols { get; private set; } = new Dictionary<string, float>();

        public Dictionary<string, Dictionary<string, int>> OperationsByDay { get; set; } = new Dictionary<string, Dictionary<string, int>>();
                
        public Dictionary<string, Dictionary<int, int>> OperationsByHour { get; set; } = new Dictionary<string, Dictionary<int, int>>();

        public Dictionary<string, double> TagsPercentage { get; set; } = new Dictionary<string, double>();

        public Dictionary<string, double> TagsPoints { get; set; } = new Dictionary<string, double>();

        public int MaxConsecutiveLoss { get; private set; }

        public int MaxConsecutiveGain { get; private set; }

        public float AverageLossBetweenGains { get; private set; }


        public List<DateTime> AccumulatedDateSeries { get; private set; } = new List<DateTime>();
        public List<decimal> AccumulatedNetIncome { get; private set; } = new List<decimal>();
        public List<decimal> AccumulatedGrossIncome { get; private set; } = new List<decimal>();
        public List<decimal> AccumulatedCost { get; private set; } = new List<decimal>();




        public GwOperationsStatistics(List<DbM_Operation> Operations)
        {
            if(Operations.Count == 0)
                return;


            Operations = Operations.OrderByDescending(x => x.Openning).ToList();

            List<DbM_Operation> WinnerTrades = Operations.Where(x => x.NetResult >= GainResult).ToList();
            List<DbM_Operation> LoserTrades = Operations.Where(x => x.NetResult < 0).ToList();

            CountdownEvent TPoolController = new CountdownEvent(4);

            

            ThreadPool.QueueUserWorkItem(new WaitCallback(delegate
            {
                if(Operations.Count > 0)
                {
                    OperationsCount = Operations.Count;

                    TotalCost = (double)Operations.Sum(x => x.Cost);


                    double NetCostSum = (double)Operations.Sum(x => x.NetResult);
                    double CostSum = (double)Operations.Sum(x => x.Cost);

                    GrossIncome = NetCostSum >= 0 ? NetCostSum - CostSum : NetCostSum + CostSum;


                    NetIncome = (double)Operations.Sum(x => x.NetResult);

                    WinnerCount = WinnerTrades.Count();
                    if(WinnerCount > 0)
                    {
                        BiggestWinner = (decimal)WinnerTrades.Max(x => x.NetResult);

                        WinnerPercentage = WinnerCount / (double)OperationsCount * 100;
                        WinnerPercentage /= 100;

                        AverageWinnerAmount = (double)WinnerTrades.Sum(x => x.NetResult) / WinnerCount;
                    }

                    LoserCount = LoserTrades.Count();
                    if(LoserCount > 0)
                    {
                        BiggestLoser = (decimal)LoserTrades.Min(x => x.NetResult);
                                
                        LoserPercentage = LoserCount / (double)OperationsCount * 100;
                        LoserPercentage /= 100;

                        AverageLoserAmount = (double)LoserTrades.Sum(x => x.NetResult) / LoserCount;
                    }


                    Zeroeds = Operations.Where(x => x.NetResult >= 0 && x.PointsResult < GainResult).Count();

                    if(AverageWinnerAmount != 0 && AverageLoserAmount != 0)
                        ProfitLoss = Math.Abs(AverageWinnerAmount / AverageLoserAmount);

                    #region Sharpe

                    OverallAverageAmount = (AverageWinnerAmount + AverageLoserAmount) / 2;

                    double SquareRootSum = 0;

                    foreach(var Trade in Operations)
                        SquareRootSum += Math.Pow((double)Trade.NetResult - OverallAverageAmount, 2);

                    double AverageSquareRoot = SquareRootSum / Operations.Count;

                    double StandardDeviation = Math.Sqrt(AverageSquareRoot);

                    Sharpe = OverallAverageAmount / StandardDeviation;

                    #endregion

                    SQN = Math.Sqrt(Operations.Count) * Sharpe;

                    MathExpectation = WinnerPercentage * AverageWinnerAmount - LoserPercentage * AverageLoserAmount;

                    ExpectedProfit = MathExpectation / AverageLoserAmount;

                    Edge = WinnerPercentage - 1 / (1 + ProfitLoss);

                    if(ProfitLoss != 0)
                        KellyCriterion = WinnerPercentage - (1 - WinnerPercentage) / ProfitLoss;


                    WinnerPercentage *= 100;
                    LoserPercentage *= 100;
                }

                TPoolController.Signal();
            }));

            ThreadPool.QueueUserWorkItem(new WaitCallback(delegate
            {
                int MaxLoss = 0, LastMaxLoss = 0, MaxGain = 0, LastMaxGain = 0, LossGain = 0, TotalLossGain = 0, LossGainCount = 0;
                decimal AccIncome = 0, AccCost = 0, AccGrossIncome = 0;

                for(int i = 0;i < Operations.Count;i++)
                {
                    if(i < Operations.Count - 1)
                    {
                        if(Operations[i].NetResult < 0 && Operations[i + 1].NetResult < 0)
                        {
                            MaxLoss++;
                            LossGain++;
                        }
                        else
                        {
                            if(MaxLoss > LastMaxLoss)
                                LastMaxLoss = MaxLoss;

                            MaxLoss = 0;
                            TotalLossGain += LossGain;
                            LossGainCount++;

                        }

                        if(Operations[i].NetResult > GainResult && Operations[i + 1].NetResult > GainResult)
                            MaxGain++;
                        else
                        {
                            if(MaxGain > LastMaxGain)
                                LastMaxGain = MaxGain;

                            MaxGain = 0;
                        }
                    }
                    else
                    {
                        if(MaxLoss > LastMaxLoss)
                        {
                            LastMaxLoss = MaxLoss;

                            if(Operations[i].NetResult < 0)
                                LastMaxLoss++;
                        }


                        if(MaxGain > LastMaxGain)
                        { 
                            LastMaxGain = MaxGain;

                            if(Operations[i].NetResult > GainResult)
                                LastMaxGain++;
                        }
                    }

                    AccGrossIncome += (decimal)(Operations[i].NetResult + Operations[i].Cost);
                    AccIncome += (decimal)Operations[i].NetResult;
                    AccCost += (decimal)Operations[i].Cost;


                    AccumulatedDateSeries.Add(Operations[i].Openning);
                    AccumulatedNetIncome.Add(AccIncome);
                    AccumulatedGrossIncome.Add(AccGrossIncome);
                    AccumulatedCost.Add(AccCost);
                }

                AccumulatedDateSeries.Reverse();

                MaxConsecutiveLoss = LastMaxLoss;
                MaxConsecutiveGain = LastMaxGain;
                AverageLossBetweenGains = LossGainCount > 0 ? TotalLossGain / LossGainCount : TotalLossGain;


                TPoolController.Signal();
            }));

            ThreadPool.QueueUserWorkItem(new WaitCallback(delegate
            {
                CultureInfo BrCulture = new CultureInfo("pt-BR");

                Dictionary<string, int> WTByDay = WinnerTrades.GroupBy(x => x.Openning.DayOfWeek).Select(grp => new { Day = grp.Key, Count = grp.Count() }).OrderBy(x => x.Day).ToDictionary(x => BrCulture.DateTimeFormat.GetDayName(x.Day), x => x.Count);
                Dictionary<string, int> LTByDay = LoserTrades.GroupBy(x => x.Openning.DayOfWeek).Select(grp => new { Day = grp.Key, Count = grp.Count() }).OrderBy(x => x.Day).ToDictionary(x => BrCulture.DateTimeFormat.GetDayName(x.Day), x => x.Count);

                OperationsByDay.Add("winners", WTByDay);
                OperationsByDay.Add("losers", LTByDay);


                Dictionary<int, int> WTByHour = WinnerTrades.GroupBy(x => x.Openning.Hour).Select(grp => new { Hour = grp.Key, Count = grp.Count() }).OrderBy(x => x.Hour).ToDictionary(x => x.Hour, x => x.Count);
                Dictionary<int, int> LTByHour = LoserTrades.GroupBy(x => x.Openning.Hour).Select(grp => new { Hour = grp.Key, Count = grp.Count() }).OrderBy(x => x.Hour).ToDictionary(x => x.Hour, x => x.Count);

                OperationsByHour.Add("winners", WTByHour);
                OperationsByHour.Add("losers", LTByHour);


                List<string> OperationsStrageties = Operations.Where(x => x.Tags.IsNotNullOrEmpty()).SelectMany(x => x.Tags).Distinct().Select(x => x.Name).ToList();
                
                foreach (var Strategy in OperationsStrageties)
                {
                    List<DbM_Operation> StOperations = Operations.Where(x => x.Tags.IsNotNullOrEmpty() && x.Tags.Any(a => a.Name == Strategy) && (x.NetResult > GainResult || x.NetResult < 0)).ToList();


                    double StWinners = StOperations.Where(x => x.NetResult > GainResult).Count();

                    TagsPercentage.Add(Strategy, StWinners / StOperations.Count * 100);


                    double StPoints = StOperations.Sum(x => x.PointsResult);

                    TagsPoints.Add(Strategy, StPoints);
                }

                AvgWinnerOperationDuration = WinnerTrades.Sum(x => (x.Closing - x.Openning).TotalSeconds) / WinnerTrades.Count;
                AvgLoserOperationDuration = LoserTrades.Sum(x => (x.Closing - x.Openning).TotalSeconds) / LoserTrades.Count;

                TPoolController.Signal();
            }));

            ThreadPool.QueueUserWorkItem(new WaitCallback(delegate
            {
                if(Operations.Count > 0)
                {
                    List<DbM_Operation> WithStop = Operations.Where(x => x.Stop != null && x.Stop > 0).ToList();


                    if(WithStop.IsNotNullOrEmpty())
                    {
                        StopedSmalerPlanned = (double)WithStop.Where(x => (x.Stop > x.ExitPrice && x.Position == DbE_PositionSide.Sell) || (x.Stop < x.ExitPrice && x.Position == DbE_PositionSide.Buy)).Count() / WithStop.Count();
                        StopedSmalerPlanned *= 100;

                        StopedBiggerPlanned = (double)WithStop.Where(x => (x.Stop < x.ExitPrice && x.Position == DbE_PositionSide.Sell) || (x.Stop > x.ExitPrice && x.Position == DbE_PositionSide.Buy)).Count() / WithStop.Count();
                        StopedBiggerPlanned *= 100;


                        List<DbM_Operation> WithStopDrawdown = WithStop.Where(x => x.DrawdownFromPStop != null).ToList();

                        if(WithStopDrawdown.IsNotNullOrEmpty())
                            AvgDrawdownFromPStop = (double)WithStopDrawdown.Sum(x => x.DrawdownFromPStop) / WithStopDrawdown.Count();
                    }
                }

                TPoolController.Signal();
            }));


            TPoolController.Wait();


            foreach(var Op in Operations)
                this.Operations.Add(Op.CreateGwModel());

            this.Operations = this.Operations.OrderByDescending(x => x.Openning).ToList();
        }
    }


    public class SymbolMetrics 
    {
        public decimal PointsPerContract { get; private set; }
        public int OperationsCount { get; private set; }
    }
}
