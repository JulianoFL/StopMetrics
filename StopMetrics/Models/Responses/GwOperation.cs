using StopMetrics.Models.DBModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace StopMetrics.Models.Responses
{
    public class GwOperation 
    {
        public enum OperationVideoProvider { YouTube, GoogleDrive }

        public int Id { get; set; }

        public string Symbol { get; set; }

        public string CurrentSymbolName { get; set; }

        public DateTime Openning { get; set; }

        public DateTime Closing { get; set; }

        public int Quantity { get; set; }

        public DbE_PositionSide Position { get; set; }

        public string Side
        {
            get
            {
                if (Position == DbE_PositionSide.Buy)
                    return "Compra";
                else
                    return "Venda";
            }
        }

        public decimal? Target { get; set; }

        public decimal? Stop { get; set; }

        public decimal? MaxDrawdown { get; set; }

        public double PointsResult { get; set; }

        public decimal Cost { get; set; }

        public decimal GrossResult { get; set; }

        public decimal? NetResult { get { return GrossResult - Cost; } }

        public int? StrategyId { get; set; }

        public int SymbolId { get; set; }

        public string BrokerageAccountId { get; set; }

        public decimal ExitPrice { get; set; }

        public decimal EntryPrice { get; set; }

        public string Comments { get; set; } = "";

        public OperationVideoProvider VideoProvider { get; set; }
        public string VideoURL { get; set; }


        public List<GwOperationOrder> Orders { get; set; } = new List<GwOperationOrder>();

        public List<GwOperationTag> Tags { get; set; } = new List<GwOperationTag>();
    }


    public class GwOperationOrder
    {
        public int Id { get; set; }

        public string Symbol { get; set; }

        public string OrderId { get; set; }

        public DateTime Execution { get; set; }

        public DbE_PositionSide Position { get; set; }

        public int Quantity { get; set; }

        public decimal Price { get; set; }

        public decimal OpAveragePrice { get; set; }

        public string Side
        {
            get
            {
                if (Position == DbE_PositionSide.Buy)
                    return "Compra";
                else
                    return "Venda";
            }
        }

    }

    public class GwOperationTag
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public string Description { get; set; }
        
    }
}

