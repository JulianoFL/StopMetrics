using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace StopMetrics.Models.DBModels
{
    [Table("symbol_types")]
    public partial class DbM_SymbolType
    {
        public DbM_SymbolType()
        {
            Symbols = new HashSet<DbM_Symbol>();
            Brokerages = new HashSet<DbM_Brokerage>();
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Id { get; set; }

        [MaxLength(30)]
        public string Name { get; set; }

        [MaxLength(100)]
        public string Description { get; set; }


        public virtual ICollection<DbM_Symbol> Symbols { get; set; }
        public virtual ICollection<DbM_Brokerage> Brokerages { get; set; }
    }

    [Table("symbols")]
    public class DbM_Symbol
    {
        [Key]
        public int Id { get; set; }

        [MaxLength(100)]
        public string Description { get; set; }

        public double TickValue { get; set; }

        public double TickStep { get; set; }

        public int TickForAPoint { get; set; }

        public int LotSize { get; set; }
        
        public int SymbolTypeId { get; set; }

        [Required]
        [ForeignKey(nameof(SymbolTypeId))]
        public virtual DbM_SymbolType SymbolTypeNavigation { get; set; }

        [MaxLength(30)]
        [Column(TypeName = "nvarchar(30)")]
        public DbE_Symbols Name { get; set; }


        public virtual ICollection<DbM_Operation> Operations { get; set; }
    }


    public enum DbE_Symbols { DOL, WDO, IND, WIN, FRP, MES, ES, SixE, CL }

    public enum DbE_Exchange { B3, CME, Nasdaq, NYSE }
}
