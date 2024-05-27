using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Threading.Tasks;

namespace StopMetrics.Models.DBModels
{
    /// <summary>
    /// Classe com as propriedades do mercado B3
    /// </summary>
    public class DbM_Properties
    {
        public B3SymbolsStruct Symbols { get; private set; }


        public DbM_Properties(DbSet<DbM_Symbol> SymbolsList)
        {
            Symbols = new B3SymbolsStruct(SymbolsList);
        }    
    }

    public class B3SymbolsStruct
    {
        public DbM_Symbol Indice { get; private set; }
        public DbM_Symbol MiniIndice { get; private set; }
        public DbM_Symbol Dolar { get; private set; }
        public DbM_Symbol MiniDolar { get; private set; }


        public DbSet<DbM_Symbol> SymbolsList { get; private set; }

        internal B3SymbolsStruct(DbSet<DbM_Symbol> SymbolsList)
        {
            this.SymbolsList = SymbolsList;

            Indice = SymbolsList.Where(x => x.Name == DbE_Symbols.IND).FirstOrDefault();
            MiniIndice = SymbolsList.Where(x => x.Name == DbE_Symbols.WIN).FirstOrDefault();
            Dolar = SymbolsList.Where(x => x.Name == DbE_Symbols.DOL).FirstOrDefault();
            MiniDolar = SymbolsList.Where(x => x.Name == DbE_Symbols.WDO).FirstOrDefault();
        }
    }
}
