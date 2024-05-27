using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace StopMetrics.Models.DBModels
{
    [Table("system_configuration")]
    public class DbM_SystemConfigs
    {
        [Key]
        public int Id { get; set; }

        [MaxLength(100)]
        public string EcoPlataformUser { get; set; }

        [MaxLength(300)]
        public string EcoPlataformPassword { get; set; }
    }
}
