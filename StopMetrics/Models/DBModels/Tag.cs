using StopMetrics.Models.Responses;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace StopMetrics.Models.DBModels
{
    [Table("tags")]
    public class DbM_OperationTag
    {
        [Key]
        public int Id { get; set; }
        
        [MaxLength(30)]
        public string Name { get; set; }

        [MaxLength(100)]
        public string Description { get; set; }

        public int UserId { get; set; }


        [Required]
        [ForeignKey(nameof(UserId))]
        public virtual DbM_User UserNavigation { get; set; }


        public virtual GwOperationTag CreateGwModel()
        {
            GwOperationTag Model = new GwOperationTag();

            Model.Description = Description;
            Model.Id = Id;
            Model.Name = Name;

            return Model;
        }
    }
}
