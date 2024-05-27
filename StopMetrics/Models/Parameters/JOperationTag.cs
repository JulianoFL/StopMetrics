using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace StopMetrics.Models.Parameters
{
    public class JOperationTag : JBaseModel
    {
        [Required(AllowEmptyStrings = false, ErrorMessage = "variável é obrigatória")]
        public string Name { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "variável é obrigatória")]
        public string Description { get; set; }
        
        public int Id { get; set; }


        public override JBaseModel ValidateModel(string AppendModelName = null)
        {
            return base.ValidateModel(AppendModelName);
        }
    }
}
