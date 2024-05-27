
using StopMetrics.Utils;

namespace StopMetrics.Models.External
{
    public class TcEconomicEventData
    { 
        public List<TcEconomicEvent> Data { get; set; }
    }


    public class TcEconomicEvent
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
        public long Date { get; set; }
        public bool AllDay { get; set; }
        public List<TcEconomicEventContent> Content { get; set; }


        public GwEconomicEvent CreateGwModel(DateOnly EventDate)
        {
            GwEconomicEvent Model = SupportMethods.Cast<GwEconomicEvent>(this);

            if(Content.IsNotNullOrEmpty())
            {
                foreach (var Sub in Content)
                {
                    foreach (var item in Sub.Subfields)
                    {
                        Model.Values.Add(SupportMethods.Cast<GwEconomicEventValues>(item));
                    }
                }
            }

            if (!string.IsNullOrEmpty(Country))
            {
                if (Country == "Estados Unidos")
                    Model.Thumbnail = "https://www.worldometers.info/img/flags/us-flag.gif";
                else if (Country == "Alemanha")
                    Model.Thumbnail = "https://www.worldometers.info/img/flags/gm-flag.gif";
                else if (Country == "Zona do Euro")
                    Model.Thumbnail = "https://upload.wikimedia.org/wikipedia/commons/b/b7/Flag_of_Europe.svg";
                else if (Country == "Reino Unido")
                    Model.Thumbnail = "https://www.worldometers.info/img/flags/uk-flag.gif";
                else
                    Model.Thumbnail = "https://www.worldometers.info/img/flags/" + Country.Substring(0, 2).ToLower() + "-flag.gif";
            }


            Model.Date = new DateTime(EventDate, TimeOnly.FromDateTime(DateTimeOffset.FromUnixTimeMilliseconds(Date).UtcDateTime), DateTimeKind.Utc);


            return Model;
        }
    }

    public class TcEconomicEventContent
    {
        public string Name { get; set; }
        public List<TcEconomicEventValues> Subfields { get; set; }
    }

    public class TcEconomicEventValues
    {
        public string Name { get; set; }
        public string Value { get; set; }
        public string Unit { get; set; }
        public int Link { get; set; }
        public string Abbreviation { get; set; }
    }
}
