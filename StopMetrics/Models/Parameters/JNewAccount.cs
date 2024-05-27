using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace StopMetrics.Models.Parameters
{
    public class JNewAccount : JBaseModel
    {
        [Required(AllowEmptyStrings = false, ErrorMessage = "variável é obrigatória")]
        public string Email { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "variável é obrigatória")]
        public string Name { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "variável é obrigatória")]
        public string Password { get; set; }

        public override JBaseModel ValidateModel(string AppendModelName = null)
        {
            return base.ValidateModel(AppendModelName);
        }
    }

    public class JLogin : JBaseModel
    {
        [Required(AllowEmptyStrings = false, ErrorMessage = "variável é obrigatória")]
        public string Email { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "variável é obrigatória")]
        public string Password { get; set; }

        public override JBaseModel ValidateModel(string AppendModelName = null)
        {
            return base.ValidateModel(AppendModelName);
        }
    }
}
