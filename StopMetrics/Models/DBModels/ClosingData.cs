using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace StopMetrics.Models.DBModels
{
    public abstract class DbM_ClosingData
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        //Chave Id e Symbol como FluentApi


        [Required]
        [MaxLength(100)]
        public string Symbol { get; set; }

        [Column(TypeName = "date")]        
        public DateTime Date { get; set; }

        [Column(TypeName = "decimal(8,2)")]
        public decimal Openning { get; set; }

        [Column(TypeName = "decimal(8,2)")]
        public decimal Closing { get; set; }

        [Column(TypeName = "decimal(8,2)")]
        public decimal Maximum { get; set; }

        [Column(TypeName = "decimal(8,2)")]
        public decimal Minimum { get; set; }
        
        [Column(TypeName = "decimal(8,2)")]
        public decimal AveragePrice { get; set; }

        public long NegociatedNumber { get; set; }

        public long ContractsNegociated { get; set; }

        public long Volume { get; set; }
    }

    [Table("b3_closing_data")]
    public class DbM_B3ClosingData : DbM_ClosingData
    {
        [Column(TypeName = "decimal(8,2)")]
        public decimal? Ajuste { get; set; }

        [Required]
        [MaxLength(100)]
        public DbE_Symbols MasterSymbol { get; set; }
    }
}
