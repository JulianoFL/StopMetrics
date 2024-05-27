using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace StopMetrics.Models.Responses
{
    public enum GwPointType { Openning, Closing, Maximum, Minimum, Ajuste, Weak, Medium, Strong }

    public class GwSignificantPoints
    {
        public int DateDiff { get; set; }

        public GwPointType Type { get; set; }

        public string Annotation { get; set; }
    }


    public class GwSignificantData
    {
        public Dictionary<decimal, List<GwSignificantPoints>> PointsDOM { get; set; } = new Dictionary<decimal, List<GwSignificantPoints>>();

        public Dictionary<string, SortedDictionary<DateTime, decimal>> PointsTypesValues { get; set; } = new Dictionary<string, SortedDictionary<DateTime, decimal>>();
    }
}
