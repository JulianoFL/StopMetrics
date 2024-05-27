using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using StopMetrics.Models;
using Microsoft.AspNetCore.Http;
using System.IO;
using System.Text;
using StopMetrics.Utils;
using Newtonsoft.Json.Linq;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Identity;
using System.Reflection;
using System.Dynamic;
using StopMetrics.Models.Parameters;
using StopMetrics.Models.DBModels;
using System.Globalization;
using StopMetrics.Models.Responses;
using System.Runtime.InteropServices;
using StopMetrics.Models.Internal;
using System.Net.Http;
using StopMetrics.Services;
using System.Diagnostics.Eventing.Reader;
using StopMetrics.Services.Google.APIs;

namespace StopMetrics.Controllers
{
    [Route("api/operations")]
    public class OperationsController : BaseController
    {
        public OperationsController(StopMetricsDBContext DBContext, BackgroundSuportServices BackServices) : base(DBContext, BackServices) { }


        #region Dados 

        [HttpGet("get_operations")]
        public async Task<IActionResult> GetOperations([FromQuery] JOperationFilter Filter)
        {
            DbM_User User = await GetUser();
            if (User == null)
                return Unauthorized();

            //Filter.InitialDate = new DateTime(2022, 01, 09);
            //Filter.FinalDate = new DateTime(2023, 10, 10);

            List<DbM_Operation> B3Trades = GetUserB3Trades(User);

            //B3Trades = B3Trades.Where(x => x.Strategies.IsNotNullOrEmpty()).ToList();

            List<DbM_Operation> FilteredTrades = FilterOperations(User, B3Trades, Filter).ToList();

            FilteredTrades = FilterByTags(User, FilteredTrades, Filter);

            return Ok(new GwOperationsStatistics(FilteredTrades));
        }
                
        private List<DbM_Operation> FilterOperations(DbM_User User, List<DbM_Operation> Operations, JOperationFilter Filter)
        {
            var FOperations = Operations.Where(x => x.UserId == User.Id);

            if (Filter.InitialDate != null)
                FOperations = FOperations.Where(x => x.Openning >= Filter.InitialDate);

            if (Filter.FinalDate != null)
                FOperations = FOperations.Where(x => x.Openning <= Filter.FinalDate);

            if (Filter.Symbols != null)
            {
                List<string> Symbols = Filter.Symbols.ToLower().Split(';').ToList();
                var Temp = new List<DbM_Operation>();

                foreach (var item in Symbols)
                    Temp = Temp.Concat(FOperations.Where(x => x.CurrentSymbolName.ToLower().Contains(item.ToLower()))).ToList();


                FOperations = Temp;
            }

            if (Filter.BrokerageFilter?.Count > 0)
                FOperations = FOperations.Where(x => Filter.BrokerageFilter.Contains(x.BrokerageAccountId.ToString()));
 
            return FOperations.ToList();

        }
        
        private List<DbM_Operation> FilterByTags(DbM_User User, List<DbM_Operation> Operations, JOperationFilter Filter) 
        {
            if (User.OperationsTags != null && Filter.TagFilter != null && User.OperationsTags.Count != Filter.TagFilter.Count)
                Operations = Operations.Where(x => x.Tags != null && x.Tags.Count > 0 && x.Tags.Select(z => z.Id).Any(p => Filter.TagFilter.Contains(p.ToString()))).ToList();

            return Operations;
        }



        #endregion


        #region Importações
        /// <summary>
        /// Faz a conversão da lista de operações do profir
        /// </summary>
        [HttpPost("convert_report")]
        public async Task<IActionResult> ConvertReport([FromBody] string OrdersAsString)
        {
            DbM_User User = await GetUser();
            if (User == null)
                return Unauthorized();

            if (string.IsNullOrEmpty(OrdersAsString))
                return ShowError("O arquivo enviado está vázio !");

            try
            {
                List<GwOperation> AllOperations = await ConvertOrdersFileToOperations(OrdersAsString);

                return Ok(AllOperations);
            }
            catch(GwGatewayException E)
            {
                return BadRequest(E.Error);
            }
            catch (Exception e)
            {
                return ShowError(e, "Ocorreu um erro ao importar as operações: ");
            }
        }
        
        private async Task<List<GwOperation>> ConvertOrdersFileToOperations(string File)
        {
            StringReader FStream = new StringReader(File);

            List<string> FileLines = new List<string>();


            int NullLines = 0;
            int MaxNullLines = 3;

            while (NullLines < MaxNullLines)
            {
                string Line = FStream.ReadLine();

                if (!string.IsNullOrEmpty(Line))
                    FileLines.Add(Line);
                else
                    NullLines++;
            }


            List<B3CSVOrder> Orders = new List<B3CSVOrder>();

            char CSVDelimiter = ';';
            //bool HeaderReady = false;
            int SymbolColumn = 0, SideColumn = 0, StatusColumn = 0, BrokerageId = 0, OrderIdColumn = 0, CreationColumn = 0, UpdateColumn = 0, PriceColumn = 0, QuantityColumn = 0;

            foreach (var Line in FileLines)
            {
                if (Line != "")
                {
                    string[] Cells = Line.Split(CSVDelimiter);

                    if (Cells[0] == "Corretora")
                    {
                        for (int k = 0; k < Cells.Length; k++)
                        {
                            switch (Cells[k])
                            {
                                case "Ativo":
                                    SymbolColumn = k;
                                    break;
                                case "Lado":
                                    SideColumn = k;
                                    break;
                                case "Status":
                                    StatusColumn = k;
                                    break;
                                case "Última Atualização":
                                    UpdateColumn = k;
                                    break;
                                case "Criação":
                                    CreationColumn = k;
                                    break;
                                case "ClOrdID":
                                    OrderIdColumn = k;
                                    break;
                                case "Conta":
                                    BrokerageId = k;
                                    break;
                                case "Preço Médio":
                                    PriceColumn = k;
                                    break;
                                case "Qtd":
                                    QuantityColumn = k;
                                    break;
                                default:
                                    break;
                            }
                        }

                        break;
                    }
                }
            }

            for (int i = 0; i < FileLines.Count; i++)
            {
                string MainLine = FileLines[i];
                //string PrevLine = FileLines[i + 1];

                if (MainLine != "")
                {
                    string[] MainCells = MainLine.Split(CSVDelimiter);
                    //string[] PrevCells = PrevLine.Split(CSVDelimiter);

                    if (MainCells.Count() > 12 && MainCells[SymbolColumn] != "" && MainCells[StatusColumn] != "" && MainCells[CreationColumn] != "" && MainCells[PriceColumn] != "" && MainCells[SideColumn] != "" && MainCells[QuantityColumn] != "")
                    {
                        if (MainCells[StatusColumn] == "Executada")
                        {
                            try
                            {
                                string FormatedSymbol = MainCells[SymbolColumn].Replace("[R] ", "").Substring(0, 3);

                                if (Enum.TryParse(FormatedSymbol, true, out DbE_Symbols Symbol))
                                {
                                    B3CSVOrder Order = new B3CSVOrder();

                                    CultureInfo PtBr = new CultureInfo("pt-br");

                                    Order.Symbol = Symbol;
                                    Order.CurrentSymbol = MainCells[SymbolColumn];
                                    Order.Position = MainCells[SideColumn] == "C" ? DbE_PositionSide.Buy : DbE_PositionSide.Sell;
                                    Order.Price = Convert.ToDecimal(MainCells[PriceColumn], PtBr);
                                    Order.Quantity = Convert.ToInt16(MainCells[QuantityColumn], PtBr);
                                    Order.OrderId = MainCells[OrderIdColumn];
                                    Order.Execution = Convert.ToDateTime(MainCells[UpdateColumn], PtBr);
                                    Order.Updated = Convert.ToDateTime(MainCells[UpdateColumn], PtBr);
                                    Order.BrokerageAccountId = MainCells[BrokerageId];


                                    Orders.Add(Order);
                                }
                            }
                            catch
                            { //somente para bypassar erros da planilha 
                                string A = "";
                            }
                        }
                    }
                }
            }

            Orders = Orders.OrderBy(x => x.Execution).ToList();



            List<GwOperation> Operations = new List<GwOperation>();

            Dictionary<string, int> QuantityDict = new Dictionary<string, int>();
            Dictionary<string, List<GwOperationOrder>> OrdersDict = new Dictionary<string, List<GwOperationOrder>>();


            foreach(var Order in Orders)
            {
                string AccountSymbol = Order.BrokerageAccountId + Order.Symbol;

                if(!QuantityDict.ContainsKey(AccountSymbol))
                    QuantityDict.Add(AccountSymbol, 0);

                //TODO - Virada de mão vai quebrar a logica porque seria necessário criar uma nova operação ao zerar e abrir com a quantidade de contrato restante
                DbE_PositionSide CurrentSide = QuantityDict[AccountSymbol] > 0 ? DbE_PositionSide.Buy : DbE_PositionSide.Sell;

                if(Order.Position == DbE_PositionSide.Buy)
                    QuantityDict[AccountSymbol] += Order.Quantity;
                else
                    QuantityDict[AccountSymbol] -= Order.Quantity;


                GwOperationOrder OOrder = new GwOperationOrder();

                OOrder.Id = new Random().Next(); //Id aleatório e temporário, somente para compatibilidade de tabela
                OOrder.Symbol = Order.CurrentSymbol;
                OOrder.Position = Order.Position;
                OOrder.Price = Order.Price;
                OOrder.Quantity = Order.Quantity;
                OOrder.OrderId = Order.OrderId;
                OOrder.Execution = Order.Execution;


                //Adiciona orders ao dicionario de operacoes abertas
                if(OrdersDict.ContainsKey(AccountSymbol))
                    OrdersDict[AccountSymbol].Add(OOrder);
                else
                    OrdersDict[AccountSymbol] = new List<GwOperationOrder>() { OOrder };

                //TODO: Virada de mão
                DbE_PositionSide NewSide = QuantityDict[AccountSymbol] > 0 ? DbE_PositionSide.Buy : DbE_PositionSide.Sell;
                 
                //Operação fechou
                if(QuantityDict[AccountSymbol] == 0 || (CurrentSide != NewSide && QuantityDict[AccountSymbol] != Order.Quantity))
                {
                    int HandInverter = 0;

                    if(NewSide != CurrentSide)
                    {
                        HandInverter = QuantityDict[AccountSymbol];

                        OrdersDict[AccountSymbol].Last().Quantity = (QuantityDict[AccountSymbol] - (-1 * OrdersDict[AccountSymbol].Last().Quantity));

                        QuantityDict[AccountSymbol] = 0;
                    }


                    List<GwOperationOrder> OpOrders = OrdersDict[AccountSymbol].OrderBy(x => x.Execution).ToList();

                    DbM_Symbol Symbol = await DBContext.DbPool_Symbols.FirstOrDefaultAsync(x => x.Name == Order.Symbol);


                    GwOperation NewOperation = new GwOperation();
                    NewOperation.Symbol = Order.Symbol.ToString();
                    NewOperation.CurrentSymbolName = Order.CurrentSymbol;
                    NewOperation.Openning = OpOrders.First().Execution;
                    NewOperation.Closing = OpOrders.Last().Execution;
                    NewOperation.Quantity = OpOrders.First().Quantity;
                    NewOperation.Position = OpOrders.First().Position;
                    NewOperation.EntryPrice = OpOrders.First().Price;
                    NewOperation.ExitPrice = OpOrders.Last().Price;
                    NewOperation.Orders = OpOrders.Select(x => x.CopyValues<GwOperationOrder>()).ToList();
                    NewOperation.BrokerageAccountId = Order.BrokerageAccountId;


                    decimal MPrice = 0;
                    int OpQuantity = 0;
                    foreach(var NOpOrder in NewOperation.Orders)
                    {
                        NOpOrder.Quantity = Math.Abs(NOpOrder.Quantity);

                        if(MPrice == 0)
                        {
                            MPrice = NOpOrder.Price;
                            OpQuantity = NOpOrder.Quantity;

                            if(NewOperation.Position == DbE_PositionSide.Sell)
                                NewOperation.Quantity *= -1;
                        }
                        else
                        {
                            if(NOpOrder.Position == NewOperation.Position)
                            {
                                MPrice = (MPrice * OpQuantity + NOpOrder.Price * NOpOrder.Quantity) / (NOpOrder.Quantity + OpQuantity);
                                OpQuantity += NOpOrder.Quantity;

                                NewOperation.Quantity = OpQuantity;

                                if(NewOperation.Position == DbE_PositionSide.Sell)
                                    NewOperation.Quantity *= -1;
                            }                                
                            else
                            {
                                //OpQuantity -= NOpOrder.Quantity;

                                if(OpQuantity - NOpOrder.Quantity == 0)
                                {
                                    if(NewOperation.Position == DbE_PositionSide.Buy)
                                        MPrice = NewOperation.EntryPrice + (MPrice * OpQuantity - NOpOrder.Price * NOpOrder.Quantity);
                                    else
                                        MPrice = NewOperation.EntryPrice - (MPrice * OpQuantity - NOpOrder.Price * NOpOrder.Quantity);
                                }
                                else
                                {
                                    MPrice = (MPrice * OpQuantity - NOpOrder.Price * NOpOrder.Quantity) / (OpQuantity - NOpOrder.Quantity);
                                    OpQuantity -= NOpOrder.Quantity;
                                }                                    
                            }
                        }


                        NOpOrder.OpAveragePrice = MPrice;
                    }

                    NewOperation.PointsResult = Convert.ToDouble(NewOperation.EntryPrice - NewOperation.Orders.Last().OpAveragePrice, new CultureInfo("pt-br")) / Symbol.LotSize;

                    //if(NewOperation.Position == DbE_PositionSide.Buy)
                    //    NewOperation.PointsResult = Convert.ToDouble(NewOperation.EntryPrice - NewOperation.Orders.Last().OpAveragePrice, new CultureInfo("pt-br")) / Symbol.LotSize;
                    //else
                    //    NewOperation.PointsResult = Convert.ToDouble(NewOperation.Orders.Last().OpAveragePrice - NewOperation.EntryPrice, new CultureInfo("pt-br")) / Symbol.LotSize;

                    NewOperation.GrossResult = (decimal)NewOperation.PointsResult * (decimal)Symbol.TickValue * (decimal)Symbol.TickForAPoint;

                    

                    Operations.Add(NewOperation);

                    if(HandInverter != 0)
                    {
                        OrdersDict[AccountSymbol].Last().Quantity = HandInverter;


                        string LastId = OrdersDict[AccountSymbol].Last().OrderId;

                        OrdersDict[AccountSymbol].RemoveAll(x => x.OrderId != LastId);

                        QuantityDict[AccountSymbol] = OrdersDict[AccountSymbol].First().Quantity;
                    }
                        
                    else
                        OrdersDict.Remove(AccountSymbol);
                }
            }


            if(Operations.IsNotNullOrEmpty())
            {
                Operations = await UpdateOperationsDetails(Operations);
            }


            return Operations;
        }

        private async Task<List<GwOperation>> UpdateOperationsDetails(List<GwOperation> Operations)
        {
            DbM_User User = await GetUser();

            List<GwOperation> FinalOperationsList = Operations.ToList();

            int Duplicates = 0;
            bool SymbolNotExistent = false;
            bool AccountNonExistent = false;

            List<OperationProviderVideo> Videos = await YouTubeSearcher.ListPrivateChannelVideos(User.GToken);

            foreach (var Op in Operations)
            {
                bool Exist = await DBContext.DbPool_Operations.AnyAsync(x => (x.Openning == Op.Openning) && (x.Openning == Op.Openning) && (x.Openning == Op.Openning) && x.CurrentSymbolName == Op.CurrentSymbolName);

                DbM_Symbol Symbol = await DBContext.DbPool_Symbols.FirstOrDefaultAsync(x => x.Name == Enum.Parse<DbE_Symbols>(Op.Symbol));
                DbM_BrokerAcc BrokAccount = await DBContext.DbPool_Accounts.Include(T => T.Brokerages).FirstOrDefaultAsync(Ac => Ac.Id == Op.BrokerageAccountId);

                if (BrokAccount == null)  
                    AccountNonExistent = true;

                if (Symbol == null)
                    SymbolNotExistent = true;

                if(!Exist && !SymbolNotExistent && !AccountNonExistent)
                {
                    if(Op.Openning < new DateTime(2019, 03, 01))
                    {
                        DBContext.Add(await CalculateOldB3Taxes(Symbol, Op));
                    }
                    else
                    {
                        decimal Brokerage = (decimal)BrokAccount.Brokerages.Where(a => a.SymbolTypeId == Symbol.SymbolTypeId).First().Brokerage * Op.Quantity * 2;
                        decimal ISS = 0;

                        DbM_B3RegistryTax Taxes = DBContext.DbPool_B3RegistryTaxes.OrderBy(x => x.MaxQuantity).FirstOrDefault(x => x.Symbol == Symbol.Name && x.MaxQuantity >= Op.Quantity);
                        DbM_B3StimulusPolicy StimulusPolicy = DBContext.DbPool_B3StimulusPolicies.OrderBy(x => x.MaxQuantity).FirstOrDefault(x => x.Symbol == Symbol.Name && x.MaxQuantity >= Op.Quantity);


                        decimal DolarValue = 1; //No caso de dólar, calcula as taxas em dólar

                        //Calculos do dólar e mini dólar
                        if(Symbol.Name == DbE_Symbols.DOL || Symbol.Name == DbE_Symbols.WDO)
                            DolarValue = Op.EntryPrice / 1000;


                        decimal RegisterTax = Taxes.Emoluments * DolarValue * StimulusPolicy.Deduction + Taxes.VariableTax * DolarValue * StimulusPolicy.Deduction + Taxes.FixedTax;

                        decimal TickValue = (decimal)Symbol.TickValue;
                        decimal TickStep = (decimal)Symbol.TickStep;

                        Op.Cost = Brokerage + ISS + RegisterTax;
                        //Op.NetCost = (Trade.GrossResult / TickStep) * TickValue * Trade.Quantity / Symbol.LotSize - Trade.Cost;

                        Op.SymbolId = Symbol.Id;
                        Op.Orders = Op.Orders.OrderBy(x => x.Execution).ToList();

                        Op.Id = new Random().Next(); //Id aleatório e temporário, somente para compatibilidade de tabela
                    }

                    var a = Op.Openning.ToString("yyyy-MM-dd");
                    OperationProviderVideo OpVideo = Videos.FirstOrDefault(x => x.Name.Contains(Op.Openning.ToString("yyyy-MM-dd")) || x.Name.Contains(Op.Openning.ToString("yyyy MM dd")));
                    if(OpVideo != null)
                    {
                        Op.VideoProvider = GwOperation.OperationVideoProvider.YouTube;
                        Op.VideoURL = OpVideo.URL;
                    }
                }
                else
                {
                    Duplicates++;
                    FinalOperationsList.Remove(Op);
                }   
            }


            if(Duplicates == Operations.Count)
                throw new GwGatewayException(ErrorTypes.InvalidData, "Operações já foram importadas");
            else if(SymbolNotExistent)
                throw new GwGatewayException(ErrorTypes.InvalidData, "Existe simbolos que não existem");
            else if(AccountNonExistent)
                throw new GwGatewayException(ErrorTypes.InvalidData, "Conta não existe");

            return FinalOperationsList.OrderBy(x => x.Openning).ToList();
        }
        
        private async Task<GwOperation> CalculateOldB3Taxes(DbM_Symbol Symbol, GwOperation Operation)
        {
            DbM_User User = await GetUser();

            DbM_BrokerAcc Acc = await DBContext.DbPool_Accounts.Include(T => T.Brokerages).FirstOrDefaultAsync(Ac => Ac.Id.ToString() == Operation.BrokerageAccountId);

            decimal TickValue = (decimal)Symbol.TickValue;
            decimal TickStep = (decimal)Symbol.TickStep;

            decimal Brokerage = (decimal)Acc.Brokerages.Where(a => a.SymbolTypeId == Symbol.SymbolTypeId).First().Brokerage * Operation.Quantity * 2;
            decimal ISS = 0;
            decimal Register = 0;


            //Ids dos contrataos cheios e mini. São setados no banco. 2 para mini, 1 para cheio
            int FullId = 1, MiniId = 2;

            if (Symbol.SymbolTypeId == MiniId || Symbol.SymbolTypeId == FullId)
            {
                decimal[,] VarTax = { { 0.59M, 0.57M, 0.51M, 0.47M, 0.45M, 0.39M }, { 1, 0.9M, 0.85M, 0.80M, 0.75M, 0.69M } }; //Taxas variáveis para contratos e dolar (arr1) e indice (arr2)
                decimal[,] FeesTax = { { 0.53M, 0.50M, 0.45M, 0.42M, 0.39M, 0.34M }, { 0.91M, 0.81M, 0.78M, 0.73M, 0.68M, 0.64M } }; //Taxas de emolumentos para contratos e dolar (arr1) e indice (arr2)

                decimal FixedTax = Symbol.SymbolTypeId == MiniId ? 0.1166181M : 0;

                int[,] QuantityRanges = { { 10, 150, 360, 1500, 12500 }, { 10, 50, 100, 190, 2000 } };

                //Caso seja dolar, as taxas são calculadas em dolar
                decimal DolarValue = 1;

                int DolarId = DBContext.DbPool_Props.Symbols.Dolar.Id;
                int IndiceId = DBContext.DbPool_Props.Symbols.Indice.Id;
                int MiniDolarId = DBContext.DbPool_Props.Symbols.MiniDolar.Id;
                int MiniIndiceId = DBContext.DbPool_Props.Symbols.MiniIndice.Id;

                //0 para contrato de dólar, 1 para indice
                int SymbolType = 0;
                if (Symbol.Id == MiniDolarId || Symbol.Id == DolarId)
                    DolarValue = Operation.EntryPrice / 1000;
                else
                    SymbolType = 1;


                decimal IncentiveFee = 0.5M; //Dolar tem um incentivo de 50% para daytrade

                //Caso seja indice troca as taxas de incentivo. 30% para cheio, 34% para mini
                if (SymbolType == MiniDolarId)
                    IncentiveFee = Symbol.SymbolTypeId == MiniId ? 0.34M : 0.30M;



                if (Operation.Quantity < QuantityRanges[SymbolType, 0])
                    Register = VarTax[SymbolType, 0] * DolarValue * IncentiveFee + FeesTax[SymbolType, 0] * IncentiveFee + FixedTax;

                else if (Operation.Quantity < QuantityRanges[SymbolType, 1])
                    Register = VarTax[SymbolType, 1] * DolarValue * IncentiveFee + FeesTax[SymbolType, 1] * IncentiveFee + FixedTax;

                else if (Operation.Quantity < QuantityRanges[SymbolType, 2])
                    Register = VarTax[SymbolType, 2] * DolarValue * IncentiveFee + FeesTax[SymbolType, 2] * IncentiveFee + FixedTax;

                else if (Operation.Quantity < QuantityRanges[SymbolType, 4])
                    Register = VarTax[SymbolType, 3] * DolarValue * IncentiveFee + FeesTax[SymbolType, 3] * IncentiveFee + FixedTax;

                else
                    Register = VarTax[SymbolType, 4] * DolarValue * IncentiveFee + FeesTax[SymbolType, 4] * IncentiveFee + FixedTax;


            }
            else
                Register = 0.031302M * Operation.EntryPrice * Operation.Quantity + 0.031302M * Operation.ExitPrice * Operation.Quantity;


            Operation.Cost = Brokerage + ISS + Register;
            //Item.NetCost = (Item.Result / TickStep) * TickValue * Item.Quantity / Symbol.LotSize - Item.Cost;


            Operation.SymbolId = Symbol.Id;


            return Operation;
        }


        [HttpPost("import_operations")]
        public async Task<IActionResult> ImportOperations([FromBody] List<GwOperation> Operations)
        {
            DbM_User User = await GetUser();


            foreach(var Op in Operations)
            {
                DbM_Operation Operation = DbM_Operation.CreateFromGwModel(Op, User.Id);
                DBContext.DbPool_Operations.Add(Operation);
            }
                
                
            try
            {
                await DBContext.SaveChangesAsync();
            }
            catch(Exception E)
            {
                Console.Write(E);

                return Ok();
            }


            return Ok();
        }


        ///// <summary>
        ///// Faz a conversão da lista de operações do ninja
        ///// </summary>
        //[HttpPost("import_cme_data")]
        //public async Task<IActionResult> CMEImport(IFormFile[] Files)
        //{
        //    DbM_User User = await GetUser();
        //    if (User == null)
        //        return Unauthorized();


        //    if (Files[0] == null || Files[0].Length == 0 || Files[1] == null || Files[1].Length == 0)
        //        return ShowError("O arquivo enviado está vázio !");


        //    List<GwOperationOrder> Orders = NinjaCSVOrders(Files[1]);

        //    if(Orders == null || Orders.Count == 0)
        //        return ShowError("A lista de ordens está vazia");



        //    List<GwOperation> Trades = NinjaCSVTrades(Files[0]);

        //    if (Trades == null || Trades.Count == 0)
        //        return ShowError("O relatório de trades está vazio");



        //    List<GwOperation> Positions = new List<GwOperation>();

        //    foreach (var Symbol in Orders.GroupBy(x => x.Symbol))
        //    {
        //        List<GwOperationOrder> OrdersCopy = SupportMethods.Cast <List<GwOperationOrder>>(Orders.Where(x => x.Symbol == Symbol.Key).OrderBy(x => x.Execution));

        //        while (OrdersCopy.Count > 0)
        //        {
        //            GwOperation NewPosition = new GwOperation();
        //            NewPosition.SymbolName = OrdersCopy.FirstOrDefault().Symbol;
        //            NewPosition.Quantity = OrdersCopy.FirstOrDefault().Quantity;
        //            NewPosition.Position = OrdersCopy.FirstOrDefault().Position;
        //            NewPosition.Openning = OrdersCopy.FirstOrDefault().Execution;
        //            NewPosition.Orders.Add(OrdersCopy.FirstOrDefault());

        //            int MaxQuantity = NewPosition.Quantity;

        //            while (true)
        //            {
        //                OrdersCopy.RemoveAt(0);

        //                if(NewPosition.Position == OrdersCopy.FirstOrDefault().Position)
        //                {
        //                    NewPosition.Quantity += OrdersCopy.FirstOrDefault().Quantity;
        //                    NewPosition.Orders.Add(OrdersCopy.FirstOrDefault());

        //                    if (NewPosition.Quantity > MaxQuantity)
        //                        MaxQuantity = NewPosition.Quantity;
        //                }
        //                else if(NewPosition.Quantity - OrdersCopy.FirstOrDefault().Quantity == 0)
        //                {
        //                    NewPosition.Closing = OrdersCopy.FirstOrDefault().Execution;
        //                    NewPosition.Orders.Add(OrdersCopy.FirstOrDefault());

        //                    OrdersCopy.RemoveAt(0);

        //                    break;
        //                }
        //                else
        //                {
        //                    NewPosition.Quantity -= OrdersCopy.FirstOrDefault().Quantity;
        //                    NewPosition.Orders.Add(OrdersCopy.FirstOrDefault());
        //                }
        //            }


        //            NewPosition.Quantity  = MaxQuantity;
        //            NewPosition.Orders = NewPosition.Orders.OrderBy(x => x.Execution).ToList();

        //            Positions.Add(NewPosition);
        //        }
        //    }


        //    foreach (var Pos in Positions)
        //    {
        //        decimal GrossResult = Trades.Where(x => x.SymbolName == Pos.SymbolName && x.Openning >= Pos.Openning && x.Closing <= Pos.Closing).Sum(x => x.GrossResult);

        //        decimal MAE = Trades.Where(x => x.SymbolName == Pos.SymbolName && x.Openning >= Pos.Openning && x.Closing <= Pos.Closing).Min(x => x.MAE);
        //        decimal MFE = Trades.Where(x => x.SymbolName == Pos.SymbolName && x.Openning >= Pos.Openning && x.Closing <= Pos.Closing).Max(x => x.MFE);


        //        DbM_CMESymbol Symbol = DBContext.DbPool_CMESymbols.FirstOrDefault(x => x.Name == Enum.Parse<DbE_CMESymbols>(Pos.SymbolName));


        //        Pos.GrossResult = GrossResult;
        //        Pos.MAE = MAE / Symbol.TickForAPoint; 
        //        Pos.MFE = MFE / Symbol.TickForAPoint;

        //        Pos.CurrentSymbolName = Trades.FirstOrDefault(x => x.SymbolName == Pos.SymbolName && x.Openning >= Pos.Openning && x.Closing <= Pos.Closing).CurrentSymbolName;

        //        if (Symbol == null)
        //            Positions.Remove(Pos);

        //        Pos.PointsResult = GrossResult / (decimal)Symbol.TickValue / Symbol.TickForAPoint;
        //    }




        //    try
        //    {
        //        return Ok(Positions);
        //    }
        //    catch (Exception e)
        //    {
        //        return ShowError(e, "Ocorreu um erro ao importar as operações: ");
        //    }
        //}

        //private List<GwOperation> NinjaCSVTrades(IFormFile File)
        //{
        //    StreamReader FStream = new StreamReader(File.OpenReadStream(), Encoding.GetEncoding("iso-8859-1"));

        //    char CSVDelimiter = ';';
        //    char DecimalPoint = ',';

        //    string FirstAccount = null;
        //    bool HeaderReady = false;
        //    int SymbolColumn = 0, AccountColumn = 0, OpeningColumn = 0, ClosingColumn = 0, QtColumn = 0, SideColumn = 0, EntryPriceColumn = 0, ExitPriceColumn = 0, ResultColumn = 0, CommiColumn = 0, MFE = 0, MAE = 0;

        //    List<GwOperation> Trades = new List<GwOperation>();

        //    while (!FStream.EndOfStream)
        //    {
        //        string Line = FStream.ReadLine();
        //        if (Line != "")
        //        {
        //            if (Line.Contains(",") && !Line.Contains(";"))                    
        //                CSVDelimiter = ',';



        //            string[] Cells = Line.Split(CSVDelimiter);
        //            if (Cells[0].ToLower() == "trade number")
        //            {
        //                for (int k = 0; k < Cells.Length; k++)
        //                {
        //                    switch (Cells[k].ToLower())
        //                    {
        //                        case "instrument":
        //                            SymbolColumn = k;
        //                            break;
        //                        case "account":
        //                            AccountColumn = k;
        //                            break;
        //                        case "entry time":
        //                            OpeningColumn = k;
        //                            break;
        //                        case "exit time":
        //                            ClosingColumn = k;
        //                            break;
        //                        case "qty":
        //                            QtColumn = k;
        //                            break;
        //                        case "market pos.":
        //                            SideColumn = k;
        //                            break;
        //                        case "entry price":
        //                            EntryPriceColumn = k;
        //                            break;
        //                        case "exit price":
        //                            ExitPriceColumn = k;
        //                            break;
        //                        case "profit":
        //                            ResultColumn = k;
        //                            break;
        //                        case "commission":
        //                            CommiColumn = k;
        //                            break;
        //                        case "mae":
        //                            MAE = k;
        //                            break;
        //                        case "mfe":
        //                            MFE = k;
        //                            break;
        //                        default:
        //                            break;
        //                    }
        //                }

        //                HeaderReady = true;
        //            }
        //            else
        //            {
        //                if (HeaderReady)
        //                {
        //                    if (Cells[SymbolColumn] != "" && Cells[AccountColumn] != "" && Cells[OpeningColumn] != "" && Cells[ClosingColumn] != "" && Cells[QtColumn] != "" && Cells[SideColumn] != "" && 
        //                        Cells[EntryPriceColumn] != "" && Cells[ExitPriceColumn] != "" && Cells[ResultColumn] != "" && Cells[MAE] != "" && Cells[MFE] != "")
        //                    {
        //                        try
        //                        {
        //                            if (FirstAccount == null)
        //                                FirstAccount = Cells[AccountColumn];

        //                            GwOperation Trade = new GwOperation();

        //                            string StrSymbol = System.Text.RegularExpressions.Regex.Replace(Cells[SymbolColumn], @"[^A-Z]+", String.Empty); 

        //                            if (Enum.TryParse(StrSymbol, true, out DbE_CMESymbols Symbol) && FirstAccount == Cells[AccountColumn])
        //                            {
        //                                Trade.SymbolName = StrSymbol;
        //                                Trade.CurrentSymbolName = Cells[SymbolColumn];
        //                                Trade.Openning = Convert.ToDateTime(Cells[OpeningColumn]);
        //                                Trade.Closing = Convert.ToDateTime(Cells[ClosingColumn]);
        //                                Trade.Quantity = Convert.ToInt16(Cells[QtColumn]);
        //                                Trade.Position = Cells[SideColumn] == "Long" ? PositionSide.Buy : PositionSide.Sell;

        //                                string PrecoCompra = Trade.Position == PositionSide.Buy ? Cells[EntryPriceColumn].Replace("$", "").Replace(" ", "") : Cells[ExitPriceColumn].Replace("$", "").Replace(" ", "");
        //                                string PrecoVenda = Trade.Position == PositionSide.Buy ? Cells[ExitPriceColumn].Replace("$", "").Replace(" ", "") : Cells[EntryPriceColumn].Replace("$", "").Replace(" ", "");

        //                                if (!PrecoCompra.Contains(DecimalPoint))
        //                                {
        //                                    PrecoCompra = PrecoCompra.Replace('.', DecimalPoint);
        //                                    PrecoVenda = PrecoVenda.Replace('.', DecimalPoint);
        //                                }

        //                                Trade.GrossResult = Convert.ToDecimal(Cells[ResultColumn].Replace("$", "").Replace(" ", ""));
        //                                Trade.GrossResult += Convert.ToDecimal(Cells[CommiColumn].Replace("$", "").Replace(" ", ""));

        //                                Trade.MAE = Convert.ToDecimal(Cells[MAE].Replace("$", "").Replace(" ", ""));
        //                                Trade.MFE = Convert.ToDecimal(Cells[MFE].Replace("$", "").Replace(" ", ""));

        //                                DbM_CMESymbol Sym = DBContext.DbPool_CMESymbols.FirstOrDefault(x => x.Name == Symbol);

        //                                Trade.MAE = Trade.MAE / (decimal)Sym.TickValue * Trade.Quantity * -1; //Negativa para entrar em padrão com a B3
        //                                Trade.MFE = Trade.MFE / (decimal)Sym.TickValue * Trade.Quantity;

        //                                Trades.Add(Trade);
        //                            }
        //                        }
        //                        catch (Exception e)
        //                        { //somente para bypassar erros da planilha 

        //                            e = null;
        //                        }
        //                    }
        //                }
        //            }
        //        }
        //    }


        //    return Trades;
        //}

        //private List<GwOperationOrder> NinjaCSVOrders(IFormFile File)
        //{
        //    StreamReader FStream = new StreamReader(File.OpenReadStream(), Encoding.GetEncoding("iso-8859-1"));

        //    char CSVDelimiter = ';';
        //    char DecimalPoint = ',';

        //    string FirstAccount = null;
        //    bool HeaderReady = false;
        //    int SymbolColumn = 0, PositionColumn = 0, QtColumn = 0, PriceColumn = 0, TimeColumn = 0, ComissionColumn = 0, AccountColumn = 0;

        //    List<GwOperationOrder> Orders = new List<GwOperationOrder>();

        //    while (!FStream.EndOfStream)
        //    {
        //        string Line = FStream.ReadLine();
        //        if (Line != "")
        //        {
        //            if (Line.Contains(",") && !Line.Contains(";"))
        //                CSVDelimiter = ',';



        //            string[] Cells = Line.Split(CSVDelimiter);
        //            if (Cells[0].ToLower() == "instrument")
        //            {
        //                for (int k = 0; k < Cells.Length; k++)
        //                {
        //                    switch (Cells[k])
        //                    {
        //                        case "instrument":
        //                            SymbolColumn = k;
        //                            break;
        //                        case "Action":
        //                            PositionColumn = k;
        //                            break;
        //                        case "Quantity":
        //                            QtColumn = k;
        //                            break;
        //                        case "Price":
        //                            PriceColumn = k;
        //                            break;
        //                        case "Time":
        //                            TimeColumn = k;
        //                            break;
        //                        case "Commission":
        //                            ComissionColumn = k;
        //                            break;
        //                        case "Account":
        //                            AccountColumn = k;
        //                            break;

        //                        default:
        //                            break;
        //                    }
        //                }

        //                HeaderReady = true;
        //            }
        //            else
        //            {
        //                if (HeaderReady)
        //                {
        //                    if (Cells[SymbolColumn] != "" && Cells[PositionColumn] != "" && Cells[PriceColumn] != "" && Cells[QtColumn] != "" && Cells[TimeColumn] != "" &&
        //                        Cells[ComissionColumn] != "")
        //                    {
        //                        try
        //                        {
        //                            if (FirstAccount == null)
        //                                FirstAccount = Cells[AccountColumn];


        //                            GwOperationOrder Order = new GwOperationOrder();

        //                            string StrSymbol = System.Text.RegularExpressions.Regex.Replace(Cells[SymbolColumn], @"[^A-Z]+", String.Empty);

        //                            if (Enum.TryParse(StrSymbol, true, out DbE_CMESymbols Symbol) && FirstAccount == Cells[AccountColumn])
        //                            {
        //                                Order.Symbol = StrSymbol;
        //                                Order.Comission = decimal.Parse(Cells[ComissionColumn].Replace("$", "").Replace(" ", ""), new CultureInfo("pt-br"));
        //                                Order.Execution = Convert.ToDateTime(Cells[TimeColumn]);
        //                                Order.Position = Cells[PositionColumn] == "Buy" ? PositionSide.Buy : PositionSide.Sell;
        //                                Order.Price = decimal.Parse(Cells[PriceColumn], new CultureInfo("pt-br"));
        //                                Order.Quantity = Convert.ToInt16(Cells[QtColumn]);

        //                                Orders.Add(Order);
        //                            }
        //                        }
        //                        catch (Exception e)
        //                        { //somente para bypassar erros da planilha 

        //                            e = null;
        //                        }
        //                    }
        //                }
        //            }
        //        }
        //    }

        //    return Orders.OrderBy(x => x.Execution).ToList();
        //}


        //[HttpPost("save_cme_import")]
        //public async Task<IActionResult> SaveCMEImport([FromBody] List<GwOperation> TradesList)
        //{
        //    DbM_User User = await GetUser();

        //    if (ModelState.IsValid)
        //    {
        //        int Duplicates = 0;
        //        bool SymbolNotExistent = false;

        //        foreach (var item in TradesList)
        //        {
        //            DbM_CMEOperation Trade = SupportMethods.Cast<DbM_CMEOperation>(item);

        //            bool Exist = await DBContext.DbPool_CMETrades.AnyAsync(x => (x.Openning == Trade.Openning) && (x.Openning == Trade.Openning) && (x.Openning == Trade.Openning));

        //            DbM_CMESymbol Symbol = DBContext.DbPool_CMESymbols.FirstOrDefault(At => At.Name == Trade.Symbol);


        //            if (Symbol == null)
        //                SymbolNotExistent = true;

        //            if (!Exist && !SymbolNotExistent)
        //            {
        //                //DbM_CMEBrokerAcc Acc = DBContext.DbPool_CMEAccs.Include(T => T.Corretagens).Where(Ac => Ac.Id == item.BrokerageNavigation.Id).First();

        //                decimal TickValue = (decimal)Symbol.TickValue;
        //                decimal TickStep = (decimal)Symbol.TickStep;

        //                //decimal Brokerage = (decimal)Acc.Corretagens.Where(a => a.SymbolNavigation.Id == Symbol.Id).First().Brokerage * item.Quantity * 2;


        //                Trade.SymbolId = Symbol.Id;
        //                Trade.Cost = item.Orders.Sum(x => x.Comission);
        //                Trade.UserId = User.Id;

        //                Trade.Orders = Trade.Orders.OrderBy(x => x.Execution).ToList();

        //                foreach (var Order in Trade.Orders)
        //                    Order.UserId = User.Id;

        //                //item.NetCost = (item.Result / TickStep) * TickValue * item.Quantity / Symbol.LotSize - item.Cost;

        //                //item.StrategyNavigation = null;
        //                //item.UserNavigation.FirebaseId = LoggedUserId;

        //                try
        //                {
        //                    DBContext.Add(Trade);                           
        //                }
        //                catch(Exception e)
        //                {
        //                    return ShowError(e, "Ocorreu um erro ao importar as operações: ");
        //                }
        //            }
        //            else
        //                Duplicates++;
        //        }

        //        DBContext.SaveChanges();


        //        if (SymbolNotExistent)
        //            return ShowWarning("Trades importados mas alguns ativos não foram encontrados");

        //        if (Duplicates == TradesList.Count)
        //            return ShowWarning("Todos os trades já existem no banco de dados");

        //        else if (Duplicates > 0)
        //            return ShowWarning("Importação concluída parcialmente. Algumas operações já existiam no banco de dados", "trades");
        //        else
        //            return ShowSuccess("Importação concluída com sucesso !", "trades");
        //    }

        //    return ShowError("Ocorreu um erro desconhecido ao importar as operações.\nPor favor tente novamente");
        //}
        #endregion


        #region Editar


        /// <summary>
        /// Faz a editação da operação
        /// </summary>
        [HttpPost("edit_operation")]
        public async Task<IActionResult> EditOperation([FromBody] JOperationFilter Filter)
        {
            DbM_User User = await GetUser();
            if (User == null)
                return Unauthorized();


            DbM_Operation OldOperation = GetUserB3Trade(Filter.EditedOperation.Id);

            if(OldOperation == null)
                return BadRequest(new GwModelError(ErrorTypes.InvalidData, "Operação não encontrada", "-"));


            OldOperation.Comments = Filter.EditedOperation.Comments;
            OldOperation.Stop = Filter.EditedOperation.Stop;
            OldOperation.MaxDrawdown = Filter.EditedOperation.MaxDrawdown;

            if(Filter.EditedOperation.Tags != null && Filter.EditedOperation.Tags.Count > 0)
            {
                if (OldOperation.OpToTags != null && OldOperation.OpToTags.Count > 0)
                    OldOperation.OpToTags.Clear();

                foreach (var Strategy in Filter.EditedOperation.Tags)
                {
                    DbM_OpToTags DbStrategy = new DbM_OpToTags();
                    DbStrategy.TagId = Strategy.Id;

                    OldOperation.OpToTags.Add(DbStrategy);
                }
            }
            else
            {
                if(OldOperation.Tags != null && OldOperation.Tags.Count > 0)
                    OldOperation.Tags.Clear();
            }

            

            try
            {
                DBContext.Update(OldOperation);
                await DBContext.SaveChangesAsync();

                return await GetOperations(Filter);
            }
            catch (Exception E)
            {
                return BadRequest(new GwModelError(ErrorTypes.InvalidData, "Ocorreu um erro ao deletar a operação. Por favor tente novamente mais tarde", "-"));
            }
        }

        #endregion


        #region Deletar

        /// <summary>
        /// Deleta a operação do BD
        /// </summary>
        [HttpGet("delete_operation")]
        public async Task<IActionResult> DeleteOperation([FromQuery] JOperationFilter Filter)
        {
            DbM_Operation Operation = await DBContext.DbPool_Operations.Include(x => x.Orders).FirstOrDefaultAsync(x => x.Id == Filter.OperationIdToDelete);

            if(Operation != null)
            {
                DBContext.DbPool_Orders.RemoveRange(Operation.Orders);
                DBContext.DbPool_Operations.Remove(Operation);

                await DBContext.SaveChangesAsync();

                return await GetOperations(Filter);
            }

            return BadRequest(new GwModelError(ErrorTypes.InvalidData, "Operação não encontrada", "-"));
        }

        //[HttpPost("delete_cme_trade")]
        //public async Task<IActionResult> DeleteCMETrade([FromBody]JOperationFilter Filter)
        //{
        //    DbM_CMEOperation Trade = await DBContext.DbPool_CMETrades.Include(x => x.Orders).FirstOrDefaultAsync(x => x.Id == Filter.TradeId);

        //    if (Trade != null)
        //    {
        //        DBContext.DbPool_CMEOrders.RemoveRange(Trade.Orders);
        //        DBContext.DbPool_CMETrades.Remove(Trade);
                
        //        await DBContext.SaveChangesAsync();

        //        return await GetCMEData(Filter);
        //    }

        //    return ShowError("Ocorreu um erro ao deletar a operação. Por favor tente novamente mais tarde");
        //}     
        
        #endregion
    }
}

