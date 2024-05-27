using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace StopMetrics.Models.DBModels
{
    [Table("market_quotes")]
    public class DbM_Quote
    {
        [Key]
        public string Symbol { get; set; }

        [MaxLength(30)]
        public string HistoricalName { get; set; }

        [MaxLength(100)]
        public string Description { get; set; }

        public double Closing { get; set; }

        public double Openning { get; set; }

        public double Last { get; set; }

        public DateTime Timestamp { get; set; }

        [Column(TypeName = "decimal(2,2)")]
        public decimal NetChange { get; private set; }

        [Column(TypeName = "money")]
        public decimal? NetChange_M3 { get; private set; }

        [Column(TypeName = "money")]
        public decimal? NetChange_M5 { get; private set; }

        [Column(TypeName = "money")]
        public decimal? NetChange_M10 { get; private set; }
    }
}
