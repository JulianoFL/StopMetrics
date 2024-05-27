using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace StopMetrics.Models.Parameters
{
    public enum JPointStrength { Weak, Medium, Strong }

    public enum JPointPosition { Sell, Buy }

    public class JSignificantData : JBaseModel
    {
        [Required(AllowEmptyStrings = false, ErrorMessage = "variável é obrigatória")]
        public DateTime Date { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "variável é obrigatória")]
        public int Quantity { get; set; }

        public override JBaseModel ValidateModel(string AppendModelName = null)
        {
            return base.ValidateModel(AppendModelName);
        }
    }

    public class JSignificantPoint : JBaseModel
    {
        //[Required(AllowEmptyStrings = false, ErrorMessage = "variável é obrigatória")]
        public decimal Price { get; set; }

        //[Required(AllowEmptyStrings = false, ErrorMessage = "variável é obrigatória")]
        public DateTime StartDate { get; set; }

        public DateTime? EndDate { get; set; }

        //[Required(AllowEmptyStrings = false, ErrorMessage = "variável é obrigatória")]
        public JPointStrength? Strength { get; set; }

        //[Required(AllowEmptyStrings = false, ErrorMessage = "variável é obrigatória")]
        public JPointPosition? Position { get; set; }

        public string Annotation { get; set; }

        public override JBaseModel ValidateModel(string AppendModelName = null)
        {
            return base.ValidateModel(AppendModelName);
        }
    }
}
