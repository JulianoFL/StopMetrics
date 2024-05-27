using FirebaseAdmin;
using Google.Apis.Auth.OAuth2;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;
using StopMetrics.Models;
using StopMetrics.Models.DBModels;
using StopMetrics.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Threading.Tasks;

namespace StopMetrics.Controllers
{    
    [Microsoft.AspNetCore.Authorization.Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    public abstract class BaseController : Controller
    {
        public StopMetricsDBContext DBContext { get; private set; }

        public BackgroundSuportServices BackServices { get; private set; }

        public IHubContext<SignalHubService> HubContext { get; set; }

        public ExternalCallsService ExtCallsService { get; set; }


        public BaseController(StopMetricsDBContext DBContext, BackgroundSuportServices BackServices)
        {
            this.DBContext = DBContext;
            this.BackServices = BackServices;

            ExtCallsService = new ExternalCallsService();
        }

        public BaseController(StopMetricsDBContext DBContext, BackgroundSuportServices BackServices, IHubContext<SignalHubService> HubContext) 
        {
            this.DBContext = DBContext;
            this.BackServices = BackServices;
            this.HubContext = HubContext;

            ExtCallsService = new ExternalCallsService();
        }


        public enum MessageType { Info, Warning, Error, Success, Question }


        public async Task<DbM_User> GetUser()
        {
            string FirebaseId = HttpContext.User.Claims.FirstOrDefault(x => x.Type == "user_id").Value;
                        
            DbM_User User = await DBContext.DbPool_Users
                .Include(x => x.Accounts)
                .Include(x => x.OperationsTags)
                .FirstOrDefaultAsync(x => x.FirebaseId == FirebaseId);

            return User;
        }
        public async Task<DbM_User> GetUser(string Email)
        {
            DbM_User User = await DBContext.DbPool_Users
                .Include(x => x.Accounts)
                .Include(x => x.OperationsTags)
                .FirstOrDefaultAsync(x => x.Email == Email);

            return User;
        }


        public DbM_Operation GetUserB3Trade(int TradeId)
        {
            DbM_Operation B3Trade = DBContext.DbPool_Operations.Include(x => x.OpToTags).Include(x => x.Orders).FirstOrDefault(x => x.Id == TradeId);

            return B3Trade;
        }
        public List<DbM_Operation> GetUserB3Trades(DbM_User User)
        {
            List<DbM_Operation> B3Trades = DBContext.DbPool_Operations.Include(x => x.OpToTags).Include(x => x.Orders).Where(x => x.UserId == User.Id).ToList();

            return B3Trades;
        }


        public ObjectResult ShowError(string Message)
        {
            return new BadRequestObjectResult(CreateParameters(MessageType.Error, "Ops ...", Message, null));
        }
        public ObjectResult ShowError(Exception Excep, string Message)
        {
            return new BadRequestObjectResult(CreateParameters(MessageType.Error, "Ops ...", Message + "  \n " + Excep.Message, null));
        }
        public ObjectResult ShowSuccess(string Message)
        {
            return new OkObjectResult(CreateParameters(MessageType.Success, "Sucesso !!", Message, null));
        }
        public ObjectResult ShowSuccess(string Message, string PathToRedirect)
        {
            return new OkObjectResult(CreateParameters(MessageType.Success, "Sucesso !!", Message, PathToRedirect));
        }
        public ObjectResult ShowWarning(string Message)
        {
            return new BadRequestObjectResult(CreateParameters(MessageType.Warning, "Atenção ...", Message, null));
        }
        public ObjectResult ShowWarning(string Message, string PathToRedirect)
        {
            return new OkObjectResult(CreateParameters(MessageType.Warning, "Atenção ...", Message, PathToRedirect));
        }

        private object CreateParameters(MessageType Type, string Title, string Message, string PathToRedirect = null)
        {
            return new { Type = Type.ToString().ToLower(), Message = Message, Title = Title };
        }
    }
}
