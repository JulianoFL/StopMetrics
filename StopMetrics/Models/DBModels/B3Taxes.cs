using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace StopMetrics.Models.DBModels
{
    public class DbM_B3RegistryTax
    {
        public DbE_Symbols Symbol { get; set; }
        public int MaxQuantity { get; set; }
        public decimal Emoluments { get; set; }
        public decimal VariableTax { get; set; }
        public decimal FixedTax { get; set; }
    }

    public class DbM_B3StimulusPolicy
    {
        public DbE_Symbols Symbol { get; set; }
        public int MaxQuantity { get; set; }
        public decimal Deduction { get; set; }
    }
}
