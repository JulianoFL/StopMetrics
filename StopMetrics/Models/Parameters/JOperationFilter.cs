using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace StopMetrics.Models.Parameters
{
    public class JOperationFilter : JBaseModel
    {
        public string Symbols { get; set; }

        public DateTime? InitialDate { get; set; }

        public DateTime? FinalDate { get; set; }

        public List<string> TagFilter
        {
            get
            {
                if (!string.IsNullOrEmpty(Tags))
                {
                    return Tags.Split(",").ToList();
                }

                return null;
            }
        }

        public List<string> BrokerageFilter
        {
            get
            {
                if (!string.IsNullOrEmpty(Accounts))
                {
                    return Accounts.Split(",").ToList();
                }

                return null;
            }
        }


        public int? OperationIdToDelete { get; set; }

        public GwOperation EditedOperation { get; set; }

        public string Tags { get; set; }

        public string Accounts { get; set; }

        public override JBaseModel ValidateModel(string AppendModelName = null)
        {
            return base.ValidateModel(AppendModelName);
        }
    }
}
