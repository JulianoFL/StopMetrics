using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace StopMetrics.Models.DBModels
{
    [Table("accounts")]
    public partial class DbM_BrokerAcc
    {
        public DbM_BrokerAcc()
        {
            Operations = new HashSet<DbM_Operation>();
            Brokerages = new HashSet<DbM_Brokerage>();
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public string Id { get; set; }

        [MaxLength(100)]
        public string Description { get; set; }

        public int UserId { get; set; }


        [Required]
        [ForeignKey(nameof(UserId))]
        [JsonIgnore]
        public virtual DbM_User UserNavigation { get; set; }
                
        public virtual ICollection<DbM_Operation> Operations { get; set; }
        public virtual ICollection<DbM_Brokerage> Brokerages { get; set; }
    }

    [Table("brokerages")]
    public partial class DbM_Brokerage
    {
        [Key]
        public int Id { get; set; }
        public int SymbolTypeId { get; set; }
        public string BrokerAccountId { get; set; }
        public double Brokerage { get; set; }


        [Required]
        [ForeignKey(nameof(SymbolTypeId))]        
        public virtual DbM_SymbolType SymbolTypeNavigation { get; set; }

        [Required]
        [ForeignKey(nameof(BrokerAccountId))]
        public virtual DbM_BrokerAcc BrokerAccNavigation { get; set; }
    }
    
}
