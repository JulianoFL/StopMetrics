using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.AspNetCore.Mvc.ModelBinding.Binders;
using Microsoft.Extensions.Primitives;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using StopMetrics.Models;
using StopMetrics.Models.Parameters;
using StopMetrics.Utils;
using StopMetrics.Utils.Extensions;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using System.Web;

namespace StopMetrics.Utils.Middleware
{
    public class GatewayBinderProvider : IModelBinderProvider
    {
        public IModelBinder GetBinder(ModelBinderProviderContext Context)
        {
            if(Context == null)
            {
                throw new ArgumentNullException(nameof(Context));
            }

            if(Context.Metadata.ModelType.BaseType == typeof(JBaseModel))
            {
                return new BinderTypeModelBinder(typeof(JObjModelBinder));
            }

            //if(Context.Metadata.BindingSource.Id == "Query")
            //{
            //    return new BinderTypeModelBinder(typeof(JParamBinder));
            //}

            return null;
        }
    }

    public class JObjModelBinder : IModelBinder
    {
        public Task BindModelAsync(ModelBindingContext BindContext)
        {
            if (BindContext.ModelType.BaseType != null && BindContext.ModelType.BaseType != typeof(JBaseModel) && BindContext.BindingSource.DisplayName != "Query")
            {
                return Task.CompletedTask;
            }

            if (BindContext.BindingSource.DisplayName == "Query")
            {
                object JObj = Activator.CreateInstance(BindContext.ModelType);

                foreach (var Param in BindContext.HttpContext.Request.Query)
                {
                    PropertyInfo Prop = BindContext.ModelType.GetProperty(Param.Key.ToPascalCase());

                    if(Prop != null)
                    {
                        if (Prop.PropertyType.IsGenericType && Prop.PropertyType.GetGenericTypeDefinition() == typeof(Nullable<>))
                        {
                            object PropValue = Convert.ChangeType(Param.Value.ToString(), Prop.PropertyType.GenericTypeArguments[0]);
                            Prop.SetValue(JObj, PropValue);
                        }
                        else
                        {
                            try
                            {
                                object PropValue = Convert.ChangeType(Param.Value.ToString(), Prop.PropertyType);
                                Prop.SetValue(JObj, PropValue);
                            }
                            catch (Exception)
                            {
                                object PropValue = null;
                                Prop.SetValue(JObj, PropValue);
                            }
                        }
                    }
                }

                BindContext.Result = ModelBindingResult.Success(JObj);

                return Task.CompletedTask;
            }
            else
            {
                object BaseJObj = SnakeCaseJsonObject.DeserializeObjectAsync(BindContext.HttpContext.Request.Body, BindContext.ModelType, true).Result;
                
                BindContext.Result = ModelBindingResult.Success(BaseJObj);
                
                return Task.CompletedTask;
            }
        }
    }

    //public class JParamBinder:IModelBinder
    //{
    //    public Task BindModelAsync(ModelBindingContext BindContext)
    //    {
    //        if(BindContext.BindingSource.DisplayName == "Query")
    //        {
    //            Dictionary<string, StringValues> NewQuery = new Dictionary<string, StringValues>();

    //            foreach(var Param in BindContext.HttpContext.Request.Query)
    //            {
    //                var valueProviderResult = BindContext.ValueProvider.GetValue(BindContext.ModelName);
    //                var value = valueProviderResult.FirstValue; // get the value as string


    //                if (value != null)
    //                {
    //                    var model = value.Split(",");

    //                    if(Param.Key.ToPascalCase() == BindContext.FieldName.ToPascalCase())
    //                        BindContext.Result = ModelBindingResult.Success(model);
    //                }



    //                //if(NewQuery.ContainsKey(BindContext.FieldName.ToPascalCase()))
    //                //    BindContext.Result = ModelBindingResult.Success(NewQuery[BindContext.FieldName.ToPascalCase()]);

    //                //NewQuery.Add(Param.Key.ToPascalCase(), Param.Value);
    //            }

                


    //            return Task.CompletedTask;
    //        }
    //        else
    //        {
    //            object BaseJObj = SnakeCaseJsonObject.DeserializeObjectAsync(BindContext.HttpContext.Request.Body, BindContext.ModelType, true).Result;

    //            BindContext.Result = ModelBindingResult.Success(BaseJObj);

    //            return Task.CompletedTask;
    //        }
    //    }
    //}

    public class JObjModelValidator : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext Context)
        {
            Context.ModelState.Clear();

            List<GwModelError> Errors = new List<GwModelError>();

            foreach (var item in Context.ActionArguments)
            {
                if (item.Value?.GetType().BaseType == (typeof(JBaseModel)))
                {
                    JBaseModel Model = item.Value as JBaseModel;

                    Model.ValidateModel();

                    if (!Model.IsValid)
                        Errors.AddRange(Model.Errors);
                }
            }

            if (Errors.Count > 0)            
                Context.Result = new BadRequestObjectResult(new GwGatewayError(Errors));
        }
    }
}
