using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace StopMetrics.Models.DBModels
{
    public enum DbE_PointStrength { Weak, Medium, Strong }

    public enum DbE_PointPosition { Sell, Buy }

    public abstract class SignificantPoint
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [MaxLength(100)]
        public string Symbol { get; set; }

        [Column(TypeName = "date")]        
        public DateTime StartDate { get; set; }

        [Column(TypeName = "date")]
        public DateTime? EndDate { get; set; }

        [Column(TypeName = "decimal(8,2)")]
        public decimal Price { get; set; }

        [Column(TypeName = "nvarchar(50)")]
        public DbE_PointPosition Position { get; set; }

        [Column(TypeName = "nvarchar(50)")]
        public DbE_PointStrength Strength { get; set; }

        public int UserId { get; set; }

        public string Annotation { get; set; }


        [Required]
        [ForeignKey(nameof(UserId))]
        public virtual DbM_User UserNavigation { get; set; }
    }

    [Table("b3_significant_points")]
    public class B3SignificantPoint : SignificantPoint
    {
    }
}
