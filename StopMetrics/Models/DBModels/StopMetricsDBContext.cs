using Google.Apis.YouTube.v3.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Microsoft.Extensions.DependencyInjection;
using StopMetrics.Services;
using StopMetrics.Utils.Extensions;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using static StopMetrics.Models.DBModels.DbM_User;


//dotnet ef migrations add InitialCreate
//dotnet ef database update
//dotnet ef migrations remove

namespace StopMetrics.Models.DBModels
{
    public partial class StopMetricsDBContext : DbContext
    {
        public virtual DbSet<DbM_User> DbPool_Users { get; set; }

        public virtual DbSet<DbM_SymbolType> DbPool_SymbolTypes { get; set; }

        public virtual DbSet<DbM_BrokerAcc> DbPool_Accounts { get; set; }
        public virtual DbSet<DbM_OperationTag> DbPool_Strategies { get; set; }

        public virtual DbSet<DbM_Operation> DbPool_Operations { get; set; }

        public virtual DbSet<DbM_OperationOrder> DbPool_Orders { get; set; }


        public virtual DbSet<DbM_Symbol> DbPool_Symbols { get; set; }

        public virtual DbSet<DbM_B3ClosingData> DbPool_B3ClosingData { get; set; }
        public virtual DbSet<B3SignificantPoint> DbPool_B3SignificantPoints { get; set; }
        
        public virtual DbSet<DbM_Quote> DbPool_MarketQuotes { get; set; }
        public virtual List<GwEconomicEvent> DbPool_EconnomicCallendar { get; set; }

        public virtual List<DbM_B3RegistryTax> DbPool_B3RegistryTaxes { get; set; }
        public virtual List<DbM_B3StimulusPolicy> DbPool_B3StimulusPolicies { get; set; }


        public virtual DbM_Properties DbPool_Props { get; set; }


        public virtual DbM_SystemConfigs DbPool_SysConfigs { get; set; } 
        private DbSet<DbM_SystemConfigs> DbPoolSysConfigs { get; set; }


        public StopMetricsDBContext(DbContextOptions options) : base(options)
        {
            DbPool_Props = new DbM_Properties(DbPool_Symbols);

            DbPool_SysConfigs = DbPoolSysConfigs.FirstOrDefault();

            #region B3Taxes
            DbPool_B3RegistryTaxes = new List<DbM_B3RegistryTax>();
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.DOL,
                MaxQuantity = 250,
                Emoluments = 0.37M,
                VariableTax = 0.68M,
                FixedTax = 0.0319502M
            });
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.DOL,
                MaxQuantity = 1000,
                Emoluments = 0.33M,
                VariableTax = 0.62M,
                FixedTax = 0.0319502M
            });
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.DOL,
                MaxQuantity = 2500,
                Emoluments = 0.31M,
                VariableTax = 0.58M,
                FixedTax = 0.0319502M
            });
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.DOL,
                MaxQuantity = 6000,
                Emoluments = 0.29M,
                VariableTax = 0.54M,
                FixedTax = 0.0319502M
            });
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.DOL,
                MaxQuantity = 10000,
                Emoluments = 0.27M,
                VariableTax = 0.51M,
                FixedTax = 0.0319502M
            });
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.DOL,
                MaxQuantity = 15000,
                Emoluments = 0.26M,
                VariableTax = 0.48M,
                FixedTax = 0.0319502M
            });
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.DOL,
                MaxQuantity = 25000,
                Emoluments = 0.25M,
                VariableTax = 0.45M,
                FixedTax = 0.0319502M
            });
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.DOL,
                MaxQuantity = 45000,
                Emoluments = 0.23M,
                VariableTax = 0.43M,
                FixedTax = 0.0319502M
            });
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.DOL,
                MaxQuantity = 80000,
                Emoluments = 0.22M,
                VariableTax = 0.40M,
                FixedTax = 0.0319502M
            });
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.DOL,
                MaxQuantity = 999999999,
                Emoluments = 0.20M,
                VariableTax = 0.38M,
                FixedTax = 0.0319502M
            });


            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.WDO,
                MaxQuantity = 250,
                Emoluments = 0.37M,
                VariableTax = 0.68M,
                FixedTax = 0.94M
            });
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.WDO,
                MaxQuantity = 1000,
                Emoluments = 0.33M,
                VariableTax = 0.62M,
                FixedTax = 0
            });
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.WDO,
                MaxQuantity = 2500,
                Emoluments = 0.31M,
                VariableTax = 0.58M,
                FixedTax = 0
            });
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.WDO,
                MaxQuantity = 6000,
                Emoluments = 0.29M,
                VariableTax = 0.54M,
                FixedTax = 0
            });
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.WDO,
                MaxQuantity = 10000,
                Emoluments = 0.27M,
                VariableTax = 0.51M,
                FixedTax = 0
            });
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.WDO,
                MaxQuantity = 15000,
                Emoluments = 0.26M,
                VariableTax = 0.48M,
                FixedTax = 0
            });
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.WDO,
                MaxQuantity = 25000,
                Emoluments = 0.25M,
                VariableTax = 0.45M,
                FixedTax = 0
            });
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.WDO,
                MaxQuantity = 45000,
                Emoluments = 0.23M,
                VariableTax = 0.43M,
                FixedTax = 0
            });
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.WDO,
                MaxQuantity = 80000,
                Emoluments = 0.22M,
                VariableTax = 0.40M,
                FixedTax = 0
            });
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.WDO,
                MaxQuantity = 999999999,
                Emoluments = 0.20M,
                VariableTax = 0.38M,
                FixedTax = 0
            });


            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.IND,
                MaxQuantity = 50,
                Emoluments = 0.63M,
                VariableTax = 1.22M,
                FixedTax = 0.1166181M
            });
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.IND,
                MaxQuantity = 150,
                Emoluments = 0.58M,
                VariableTax = 1.12M,
                FixedTax = 0.1166181M
            });
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.IND,
                MaxQuantity = 500,
                Emoluments = 0.54M,
                VariableTax = 1.06M,
                FixedTax = 0.1166181M
            });
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.IND,
                MaxQuantity = 1500,
                Emoluments = 0.49M,
                VariableTax = 0.96M,
                FixedTax = 0.1166181M
            });
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.IND,
                MaxQuantity = 3500,
                Emoluments = 0.44M,
                VariableTax = 0.39M,
                FixedTax = 0.1166181M
            });
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.IND,
                MaxQuantity = 7500,
                Emoluments = 0.39M,
                VariableTax = 0.76M,
                FixedTax = 0.1166181M
            });
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.IND,
                MaxQuantity = 15000,
                Emoluments = 0.36M,
                VariableTax = 0.69M,
                FixedTax = 0.1166181M
            });
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.IND,
                MaxQuantity = 999999999,
                Emoluments = 0.32M,
                VariableTax = 0.63M,
                FixedTax = 0.1166181M
            });


            #region WIN
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.WIN,
                MaxQuantity = 50,
                Emoluments = 0.63M,
                VariableTax = 1.22M,
                FixedTax = 0
            });
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.WIN,
                MaxQuantity = 150,
                Emoluments = 0.58M,
                VariableTax = 1.12M,
                FixedTax = 0
            });
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.WIN,
                MaxQuantity = 500,
                Emoluments = 0.54M,
                VariableTax = 1.06M,
                FixedTax = 0
            });
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.WIN,
                MaxQuantity = 1500,
                Emoluments = 0.49M,
                VariableTax = 0.96M,
                FixedTax = 0
            });
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.WIN,
                MaxQuantity = 3500,
                Emoluments = 0.44M,
                VariableTax = 0.39M,
                FixedTax = 0
            });
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.WIN,
                MaxQuantity = 7500,
                Emoluments = 0.39M,
                VariableTax = 0.76M,
                FixedTax = 0
            });
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.WIN,
                MaxQuantity = 15000,
                Emoluments = 0.36M,
                VariableTax = 0.69M,
                FixedTax = 0
            });
            DbPool_B3RegistryTaxes.Add(new DbM_B3RegistryTax
            {
                Symbol = DbE_Symbols.WIN,
                MaxQuantity = 999999999,
                Emoluments = 0.32M,
                VariableTax = 0.63M,
                FixedTax = 0
            });
            #endregion

            #region DOL
            DbPool_B3StimulusPolicies = new List<DbM_B3StimulusPolicy>();
            DbPool_B3StimulusPolicies.Add(new DbM_B3StimulusPolicy
            {
                Symbol = DbE_Symbols.DOL,
                MaxQuantity = 20,
                Deduction = 5M / 100M
            });
            DbPool_B3StimulusPolicies.Add(new DbM_B3StimulusPolicy
            {
                Symbol = DbE_Symbols.DOL,
                MaxQuantity = 200,
                Deduction = 15M / 100M
            });
            DbPool_B3StimulusPolicies.Add(new DbM_B3StimulusPolicy
            {
                Symbol = DbE_Symbols.DOL,
                MaxQuantity = 600,
                Deduction = 35M / 100M
            });
            DbPool_B3StimulusPolicies.Add(new DbM_B3StimulusPolicy
            {
                Symbol = DbE_Symbols.DOL,
                MaxQuantity = 2000,
                Deduction = 45M / 100M
            });
            DbPool_B3StimulusPolicies.Add(new DbM_B3StimulusPolicy
            {
                Symbol = DbE_Symbols.DOL,
                MaxQuantity = 5000,
                Deduction = 50M / 100M
            });
            DbPool_B3StimulusPolicies.Add(new DbM_B3StimulusPolicy
            {
                Symbol = DbE_Symbols.DOL,
                MaxQuantity = 10000,
                Deduction = 55M / 100M
            });
            DbPool_B3StimulusPolicies.Add(new DbM_B3StimulusPolicy
            {
                Symbol = DbE_Symbols.DOL,
                MaxQuantity = 20000,
                Deduction = 57.5M / 100M
            });
            DbPool_B3StimulusPolicies.Add(new DbM_B3StimulusPolicy
            {
                Symbol = DbE_Symbols.DOL,
                MaxQuantity = 35000,
                Deduction = 60M / 100M
            });
            DbPool_B3StimulusPolicies.Add(new DbM_B3StimulusPolicy
            {
                Symbol = DbE_Symbols.DOL,
                MaxQuantity = 60000,
                Deduction = 62.5M / 100M
            });
            DbPool_B3StimulusPolicies.Add(new DbM_B3StimulusPolicy
            {
                Symbol = DbE_Symbols.DOL,
                MaxQuantity = 99999999,
                Deduction = 65M / 100M
            });
            #endregion


            DbPool_B3StimulusPolicies.Add(new DbM_B3StimulusPolicy
            {
                Symbol = DbE_Symbols.WDO,
                MaxQuantity = 99999999,
                Deduction = 22M / 100M
            });

            DbPool_B3StimulusPolicies.Add(new DbM_B3StimulusPolicy
            {
                Symbol = DbE_Symbols.IND,
                MaxQuantity = 5,
                Deduction = 35M / 100M
            });
            DbPool_B3StimulusPolicies.Add(new DbM_B3StimulusPolicy
            {
                Symbol = DbE_Symbols.IND,
                MaxQuantity = 50,
                Deduction = 40M / 100M
            });
            DbPool_B3StimulusPolicies.Add(new DbM_B3StimulusPolicy
            {
                Symbol = DbE_Symbols.IND,
                MaxQuantity = 150,
                Deduction = 55M / 100M
            });
            DbPool_B3StimulusPolicies.Add(new DbM_B3StimulusPolicy
            {
                Symbol = DbE_Symbols.IND,
                MaxQuantity = 1500,
                Deduction = 70M / 100M
            });
            DbPool_B3StimulusPolicies.Add(new DbM_B3StimulusPolicy
            {
                Symbol = DbE_Symbols.IND,
                MaxQuantity = 99999999,
                Deduction = 75M / 100M
            });


            DbPool_B3StimulusPolicies.Add(new DbM_B3StimulusPolicy
            {
                Symbol = DbE_Symbols.WIN,
                MaxQuantity = 99999999,
                Deduction = 21M / 100M
            });
            #endregion
        }


        public void ConfigureServices(IServiceCollection services) { }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.EnableSensitiveDataLogging();

            //if (!optionsBuilder.IsConfigured)
            //{
            //    optionsBuilder.UseSqlServer("Name=DefaultConnection");
            //}
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            foreach (var EntityType in modelBuilder.Model.GetEntityTypes())
            {
                // Replace column names            
                foreach (var property in EntityType.GetProperties())                
                    property.SetColumnName(property.GetColumnName(StoreObjectIdentifier.Table(EntityType.GetTableName(), null)).ToSnakeCase());                

                foreach (var key in EntityType.GetKeys())                
                    key.SetName(key.GetName().ToSnakeCase());                

                foreach (var key in EntityType.GetForeignKeys())
                {
                    key.SetConstraintName(key.GetConstraintName().ToSnakeCase());
                    key.DeleteBehavior = DeleteBehavior.Restrict;
                }
                    

                foreach (var index in EntityType.GetIndexes())                
                    index.SetDatabaseName(index.GetDatabaseName().ToSnakeCase());                
            }

            modelBuilder.Entity<DbM_B3ClosingData>(entity =>
            {
                entity.HasKey(e => new { e.Symbol, e.Date });
            });

            modelBuilder.Entity<DbM_OpToTags>(entity =>
            {
                //entity.HasIndex(e => new { e.StrategyId, e.OperationId }).IsUnique();

                entity.HasOne(e => e.OperationNavigation).WithMany(e => e.OpToTags).OnDelete(DeleteBehavior.Cascade);

            });

            modelBuilder.Entity<DbM_User>(entity =>
            {
                entity.Property(e => e.RecordingStorageType).HasConversion(new EnumToStringConverter<RecordingStorageProvider>());
            });

            modelBuilder.Entity<DbM_Symbol>(entity =>
            {
                entity.Property(e => e.Name).HasConversion(new EnumToStringConverter<DbE_Symbols>());
            });

            modelBuilder.Entity<DbM_Operation>(entity =>
            {
                entity.Property(p => p.Id).ValueGeneratedOnAdd().Metadata.SetBeforeSaveBehavior(PropertySaveBehavior.Ignore);

                entity.Property(e => e.Symbol).HasConversion(new EnumToStringConverter<DbE_Symbols>());

                entity.Property(e => e.Position).HasConversion(new EnumToStringConverter<DbE_PositionSide>());

                entity.Property(e => e.Exchange).HasConversion(new EnumToStringConverter<DbE_Exchange>());
            });

            modelBuilder.Entity<DbM_OperationOrder>(entity =>
            {
                entity.Property(p => p.Id).ValueGeneratedOnAdd().Metadata.SetBeforeSaveBehavior(PropertySaveBehavior.Ignore);
            });
        }
    }
}