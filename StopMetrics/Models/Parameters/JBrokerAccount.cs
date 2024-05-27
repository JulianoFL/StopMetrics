using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace StopMetrics.Models.Parameters
{
    public class JBrokerAccount : JBaseModel
    {
        [Required(AllowEmptyStrings = false, ErrorMessage = "variável é obrigatória")]
        public string Id { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "variável é obrigatória")]
        public string Description { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "variável é obrigatória")]
        public JB3Brokerage[] Brokerages { get; set; }

        public override JBaseModel ValidateModel(string AppendModelName = null)
        {
            return base.ValidateModel(AppendModelName);
        }
    }

    public class JB3Brokerage : JBaseModel
    {
        [Required(AllowEmptyStrings = false, ErrorMessage = "variável é obrigatória")]
        public string SymbolTypeId { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "variável é obrigatória")]
        public decimal Brokerage { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "variável é obrigatória")]
        public decimal B3Cost { get; set; }

        public override JBaseModel ValidateModel(string AppendModelName = null)
        {
            return base.ValidateModel(AppendModelName);
        }
    }



    public class JCMEBrokerAccount : JBaseModel
    {
        [Required(AllowEmptyStrings = false, ErrorMessage = "variável é obrigatória")]
        public int Id { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "variável é obrigatória")]
        public string Description { get; set; }

        public override JBaseModel ValidateModel(string AppendModelName = null)
        {
            return base.ValidateModel(AppendModelName);
        }
    }
}
