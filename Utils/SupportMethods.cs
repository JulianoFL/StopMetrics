using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Serialization;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Threading.Tasks;

namespace StopMetrics.Utils
{

    public static class SupportMethods
    {
        /// <summary>
        /// Faz a conversão de objetos, via serialização, ignorando erros
        /// </summary>
        public static T Cast<T>(object From)
        {
            if (From != null)
            {
                JsonSerializerSettings Settings = new JsonSerializerSettings();
                Settings.ContractResolver = new DefaultContractResolver { NamingStrategy = new SnakeCaseNamingStrategy() };
                Settings.Converters.Add(new StringEnumConverter(new SnakeCaseNamingStrategy()));
                Settings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;

                Settings.Error += delegate (object sender, Newtonsoft.Json.Serialization.ErrorEventArgs args)
                {
                    args.ErrorContext.Handled = true;
                };


                string JsonFrom = JsonConvert.SerializeObject(From, Formatting.Indented, Settings);

                T To = JsonConvert.DeserializeObject<T>(JsonFrom, Settings);


                return To;
            }
            else
            {
                return default;
            }

        }

        /// <summary>
        /// Faz a conversão de objetos, via serialização, ignorando erros
        /// </summary>
        public static object Cast(object From, Type ModelType)
        {
            if (From != null)
            {
                JsonSerializerSettings Settings = new JsonSerializerSettings();
                Settings.ContractResolver = new DefaultContractResolver { NamingStrategy = new SnakeCaseNamingStrategy() };
                Settings.Converters.Add(new StringEnumConverter(new SnakeCaseNamingStrategy()));
                Settings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;

                Settings.Error += delegate (object sender, Newtonsoft.Json.Serialization.ErrorEventArgs args)
                {
                    args.ErrorContext.Handled = true;
                };


                string JsonFrom = JsonConvert.SerializeObject(From, Formatting.Indented, Settings);

                object To = JsonConvert.DeserializeObject(JsonFrom, ModelType, Settings);


                return To;
            }
            else
            {
                return default;
            }

        }

        /// <summary>
        /// Converte um objeto A para B. A conversão é feita entre cópia de valores entre propriedades iguais entre os objetos
        /// </summary>
        public static TConvert CopyValues<TConvert>(this object entity) where TConvert : new()
        {
            var convertProperties = TypeDescriptor.GetProperties(typeof(TConvert)).Cast<PropertyDescriptor>();
            var entityProperties = TypeDescriptor.GetProperties(entity).Cast<PropertyDescriptor>();

            var convert = new TConvert();

            foreach (var entityProperty in entityProperties)
            {
                var property = entityProperty;
                var convertProperty = convertProperties.FirstOrDefault(prop => prop.Name == property.Name);
                if (convertProperty != null)
                {
                    convertProperty.SetValue(convert, Convert.ChangeType(entityProperty.GetValue(entity), convertProperty.PropertyType));
                }
            }

            return convert;
        }
    }
}
