using Newtonsoft.Json;
using StopMetrics.Migrations;
using StopMetrics.Models.Responses;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using static StopMetrics.Models.Responses.GwOperation;

namespace StopMetrics.Models.DBModels
{
    public enum DbE_PositionSide { Buy, Sell }

    [Table("operations")]
    public class DbM_Operation
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public DbE_Exchange Exchange { get; set; }

        [Required]
        [MaxLength(30)]
        public DbE_Symbols Symbol { get; set; }

        [Required]
        [MaxLength(30)]
        public string CurrentSymbolName { get; set; }
                
        [Required]
        public DateTime Openning { get; set; }

        [Required]
        public DateTime Closing { get; set; }

        [Required]
        public int Quantity { get; set; }

        [Required]
        public string BrokerageAccountId { get; set; }

        [Required]
        public DbE_PositionSide Position { get; set; }

        [Column(TypeName = "money")]
        public decimal? Target { get; set; }

        [Column(TypeName = "money")]
        public decimal? Stop { get; set; }

        [Column(TypeName = "money")]
        public decimal? MaxDrawdown { get; set; }

        [Column(TypeName = "money")]
        public decimal GrossResult { get; set; }

        [Column(TypeName="money")]
        public decimal? Cost { get; set; }

        public double PointsResult { get; set; }

        public string Comments { get; set; }

        public OperationVideoProvider VideoProvider { get; set; }

        public string VideoURL { get; set; }

        [Required]
        public int UserId { get; set; }

        [Required]
        public int SymbolId { get; set; }

        [Required]//Cacade delete
        public virtual ICollection<DbM_OperationOrder> Orders { get; set; } = new List<DbM_OperationOrder>();

        [Required]
        public virtual ICollection<DbM_OpToTags> OpToTags { get; set; } = new List<DbM_OpToTags>();

        [Required]
        [ForeignKey(nameof(SymbolId))]
        [JsonIgnore]
        public virtual DbM_Symbol SymbolNavigation { get; set; }

        [Required]
        [ForeignKey(nameof(BrokerageAccountId))]
        [JsonIgnore]
        public virtual DbM_BrokerAcc BrokerageNavigation { get; set; }

        [JsonIgnore]
        [Required]
        [ForeignKey(nameof(UserId))]
        public virtual DbM_User UserNavigation { get; set; }


        [NotMapped]
        public decimal? NetResult
        {
            get { return GrossResult - Cost; }
        }

        [NotMapped]
        public decimal EntryPrice
        {
            get
            {
                if(Orders != null && Orders.Count > 0)
                {
                    return Orders.OrderBy(x => x.Execution).FirstOrDefault().Price;
                }
                else
                    return 0;
            }
        }

        [NotMapped]
        public decimal ExitPrice
        {
            get
            {
                if(Orders != null && Orders.Count > 0)
                {
                    return Orders.OrderByDescending(x => x.Execution).FirstOrDefault().Price;
                }
                else
                    return 0;
            }
        }

        [NotMapped]
        public List<DbM_OperationTag> Tags
        {
            get
            {
                if(OpToTags.IsNotNullOrEmpty())
                    return OpToTags.Select(x => x.TagNavigation).ToList();
                else
                    return null;
            }
        }

        [NotMapped]
        public decimal? DrawdownFromPStop
        {
            get
            {
                if(Stop != null && MaxDrawdown != null)
                {
                    decimal StopInPoints = Math.Abs(EntryPrice - (decimal)Stop);
                    decimal DrawdownInPoints = Math.Abs(EntryPrice - (decimal)MaxDrawdown);

                    return 1 + ((DrawdownInPoints - StopInPoints) / StopInPoints);
                }

                return null;
            }
        }



        public virtual GwOperation CreateGwModel()
        {
            GwOperation Model = new GwOperation();

            Model.BrokerageAccountId = BrokerageAccountId.ToString();
            Model.Closing = Closing;
            Model.Comments = Comments;
            Model.Cost = (decimal)Cost;
            Model.CurrentSymbolName = CurrentSymbolName;
            Model.GrossResult = GrossResult;
            Model.Id = Id;
            Model.Openning = Openning;
            Model.Position = Position;
            Model.Quantity = Quantity;
            Model.Stop = Stop;
            Model.SymbolId = SymbolId;
            Model.Symbol = Symbol.ToString();
            Model.Target = Target;
            Model.PointsResult = PointsResult;
            Model.VideoProvider = VideoProvider;
            Model.VideoURL = VideoURL;
            Model.MaxDrawdown = MaxDrawdown;

            Model.EntryPrice = EntryPrice;
            Model.ExitPrice = ExitPrice;

            if(Orders != null && Orders.Count > 0)
            {
                Model.Orders = new List<GwOperationOrder>();

                foreach(var item in Orders)
                {
                    Model.Orders.Add(item.CreateGwModel());
                }
            }

            if(Tags != null && Tags.Count > 0)
            {
                Model.Tags = new List<GwOperationTag>();

                foreach(var item in Tags)
                {
                    Model.Tags.Add(item.CreateGwModel());
                }
            }

            return Model;
        }

        public static DbM_Operation CreateFromGwModel(GwOperation Operation, int UserId)
        {
            DbM_Operation Model = new DbM_Operation();

            Model.BrokerageAccountId = Operation.BrokerageAccountId;
            Model.Closing = Operation.Closing;
            Model.Comments = Operation.Comments;
            Model.Cost = Operation.Cost;
            Model.CurrentSymbolName = Operation.CurrentSymbolName;
            Model.GrossResult = Operation.GrossResult;
            Model.Id = Operation.Id;
            Model.Openning = Operation.Openning;
            Model.Position = Operation.Position;
            Model.Quantity = Operation.Quantity;
            Model.Stop = Operation.Stop;
            Model.SymbolId = Operation.SymbolId;
            Model.Symbol = Enum.Parse< DbE_Symbols>(Operation.Symbol);
            Model.Target = Operation.Target;
            Model.UserId = UserId;
            Model.PointsResult = Operation.PointsResult;
            Model.VideoProvider = Operation.VideoProvider;
            Model.VideoURL = Operation.VideoURL;
            Model.MaxDrawdown = Operation.MaxDrawdown;

            if(Operation.Orders.IsNotNullOrEmpty())
            {
                foreach(var Order in Operation.Orders)
                    Model.Orders.Add(DbM_OperationOrder.CreateFromGwModel(Order, UserId));
                
            }

            if(Operation.Tags.IsNotNullOrEmpty())
            {   
                foreach(var Strategy in Operation.Tags)
                {
                    DbM_OpToTags OpToStrategies = new DbM_OpToTags();

                    OpToStrategies.TagId = Strategy.Id;
                    Model.OpToTags.Add(OpToStrategies);
                }
            }

            return Model;
        }
    }


    [Table("orders")]
    public class DbM_OperationOrder
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column(Order = 1)]
        public int Id { get; set; }

        public int OperationId { get; set; }

        public int UserId { get; set; }

        [Column(Order = 0)]
        public DateTime Execution { get; set; }

        public DbE_PositionSide Position { get; set; }

        public int Quantity { get; set; }
                
        [Column(TypeName = "money")]
        public decimal Price { get; set; }

        [Column(TypeName = "money")]
        public decimal OpAveragePrice { get; set; }


        [Required]
        [ForeignKey(nameof(OperationId))]
        public virtual DbM_Operation OperationNavigation { get; set; }

        [Required]
        [JsonIgnore]
        [ForeignKey(nameof(UserId))]
        public virtual DbM_User UserNavigation { get; set; }


        public virtual GwOperationOrder CreateGwModel()
        {
            GwOperationOrder Model = new GwOperationOrder();

            Model.Execution = Execution;
            Model.Id = Id;
            Model.Position = Position;
            Model.Price = Price;
            Model.Quantity = Quantity;
            Model.OpAveragePrice = OpAveragePrice;

            return Model;
        }

        public static DbM_OperationOrder CreateFromGwModel(GwOperationOrder Order, int UserId)
        {
            DbM_OperationOrder Model = new DbM_OperationOrder();

            Model.Execution = Order.Execution;;
            Model.Position = Order.Position;
            Model.Price = Order.Price;
            Model.Quantity = Order.Quantity;
            Model.UserId = UserId;
            Model.OpAveragePrice = Order.OpAveragePrice;

            return Model;
        }
    }

    [Table("op_to_tags")]
    public class DbM_OpToTags
    {
        [Key]
        public int Id { get; set; }

        public int OperationId { get; set; }

        public int TagId { get; set; }

        [Required]
        [ForeignKey(nameof(OperationId))]
        public virtual DbM_Operation OperationNavigation { get; set; }

        [Required]
        [ForeignKey(nameof(TagId))]
        public virtual DbM_OperationTag TagNavigation { get; set; }
    }        
}
