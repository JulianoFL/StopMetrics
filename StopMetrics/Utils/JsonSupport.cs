using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json.Serialization;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace StopMetrics.Utils
{
    /// <summary>
    /// Atributo de propriedades para ignorar serialização da mesma
    /// </summary>
    public class JsonIgnoreSerializationAttribute : Attribute { }
    
    /// <summary>
    /// Resolver para atributos customizáveis
    /// </summary>
    public class SnakeCaseContractResolver : DefaultContractResolver
    {
        public SnakeCaseContractResolver()
        {
            NamingStrategy = new SnakeCaseNamingStrategy();
        }

        protected override List<MemberInfo> GetSerializableMembers(Type objectType)
        {
            //Return properties that do NOT have the JsonIgnoreSerializationAttribute
            return objectType.GetProperties().Where(pi => !Attribute.IsDefined(pi, typeof(JsonIgnoreSerializationAttribute))).ToList<MemberInfo>();
        }
    }
    
    public static class SnakeCaseJsonObject
    {
        public static JsonSerializer GetDefaultSerializer(bool IgnoreErrors = true)
        {
            JsonSerializer Serializer = new JsonSerializer();

            Serializer.NullValueHandling = NullValueHandling.Ignore;
            Serializer.ContractResolver = new SnakeCaseContractResolver();
            Serializer.Converters.Add(new StringEnumConverter(new SnakeCaseNamingStrategy()));

            if (IgnoreErrors)
            {
                Serializer.Error += delegate (object sender, Newtonsoft.Json.Serialization.ErrorEventArgs args)
                {
                    args.ErrorContext.Handled = true;
                };
            }

            return Serializer;
        }

        public static JsonSerializerSettings GetDefaultSettings(bool IgnoreErrors = true)
        {
            JsonSerializerSettings Settings = new JsonSerializerSettings();
            Settings.NullValueHandling = NullValueHandling.Ignore;
            Settings.ContractResolver = new DefaultContractResolver { NamingStrategy = new SnakeCaseNamingStrategy() };
            Settings.Converters.Add(new StringEnumConverter(new SnakeCaseNamingStrategy()));

            if (IgnoreErrors)
            {
                Settings.Error += delegate (object sender, Newtonsoft.Json.Serialization.ErrorEventArgs args)
                {
                    args.ErrorContext.Handled = true;
                };
            }

            return Settings;
        }

        public static string SerializeObject(object Value, bool IgnoreErrors = false)
        {
            return JsonConvert.SerializeObject(Value, GetDefaultSettings(IgnoreErrors));
        }

        public static T DeserializeObject<T>(string Value, bool IgnoreErrors = false)
        {
            return JsonConvert.DeserializeObject<T>(Value, GetDefaultSettings(IgnoreErrors));
        }

        public static bool TryToObject(object Params, out JObject Value)
        {
            bool HasErrors = false;

            JsonSerializer Serializer = GetDefaultSerializer();

            Serializer.Error += delegate (object sender, Newtonsoft.Json.Serialization.ErrorEventArgs args)
            {
                args.ErrorContext.Handled = true;

                HasErrors = true;
            };
                        
            Value = JObject.FromObject(Params, Serializer);

            return !HasErrors;
        }


        public static async Task<object> DeserializeObjectAsync(Stream Value, Type ModelType, bool IgnoreErrors = false)
        {
            using (StreamReader sr = new StreamReader(Value))
            {

                string Json = await sr.ReadToEndAsync();

                return JsonConvert.DeserializeObject(Json, ModelType, GetDefaultSettings(IgnoreErrors));
            }
        }
    }

    public class DateFormatConverter : IsoDateTimeConverter
    {
        public DateFormatConverter(string format)
        {
            DateTimeFormat = format;
        }
    }
}
