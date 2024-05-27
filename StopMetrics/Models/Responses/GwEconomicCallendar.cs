
namespace StopMetrics.Models.Responses
{
    public class GwEconomicEvent
    {        
        public string Category { get; set; }
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Type { get; set; }
        public int Priority { get; set; }
        public object Source { get; set; }
        public string Country { get; set; }
        public string Thumbnail { get; set; }
        public object Period { get; set; }
        public DateTime Date { get; set; }
        public bool AllDay { get; set; }
        public List<GwEconomicEventValues> Values { get; set; } = new List<GwEconomicEventValues>();
    }



    public class GwEconomicEventValues
    {
        public enum GwEconomicEventValuesNames { Atual, Consenso, Anterior }

        public GwEconomicEventValuesNames Name { get; set; }
        public string Value { get; set; }
        public string Unit { get; set; }
        public int Link { get; set; }
        public string Abbreviation { get; set; }
    }
}
