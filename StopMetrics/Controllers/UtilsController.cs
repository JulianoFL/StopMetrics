using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using StopMetrics.Models.DBModels;
using StopMetrics.Services;

namespace StopMetrics.Controllers
{
    [Route("api/utils")]
    public class UtilsController : BaseController
    {
        public UtilsController(StopMetricsDBContext DBContext, BackgroundSuportServices BackServices) : base(DBContext, BackServices) { }

        [HttpGet("[action]"), ActionName("get_timenow")]
        public IActionResult GetTimeNow()
        {
            return Ok(BackServices.ServerTime);
        }
    }
}