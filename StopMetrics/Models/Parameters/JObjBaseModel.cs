using Microsoft.AspNetCore.Mvc.ModelBinding;
using StopMetrics.Utils.Extensions;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace StopMetrics.Models.Parameters
{
    public abstract class JBaseModel
    {
        [JsonIgnore]
        public bool IsValid { get { return Errors.Count() == 0; } }


        [JsonIgnore]
        public List<GwModelError> Errors { get; private set; } = new List<GwModelError>();


        public virtual JBaseModel ValidateModel(string AppendModelName = null)
        {

            ValidationContext vc = new ValidationContext(this);

            List<ValidationResult> Results = new List<ValidationResult>();


            string VarName = "";
            if (!string.IsNullOrEmpty(AppendModelName))
                VarName = AppendModelName + ".";


            Validator.TryValidateObject((JBaseModel)this, vc, Results, true);

            foreach (var item in Results)
            {
                Errors.Add(new GwModelError(ErrorTypes.InvalidParameter, item.ErrorMessage, VarName + item.MemberNames.FirstOrDefault().ToSnakeCase()));
            }

            return this;
        }
    }
}
