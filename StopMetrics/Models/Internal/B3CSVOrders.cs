using StopMetrics.Models.DBModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace StopMetrics.Models.Internal
{
    public class B3CSVOrder
    {
        public string OrderId { get; set; }
        public string CurrentSymbol { get; set; }
        public DbE_Symbols Symbol { get; set; }
        public DbE_PositionSide Position { get; set; }
        public DateTime Execution { get; set; }
        public DateTime Updated { get; set; }
        public decimal Price { get; set; }
        public string BrokerageAccountId { get; set; }
        public int Quantity { get; set; }
    }
}
