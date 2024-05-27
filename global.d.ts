import { DataPoolService } from './app/services/data-pool-service'
import { SupportServices } from "./app/services/support-services";

export { }

declare global {
    var DataPool: DataPoolService = new DataPoolService(); //Inicializado dentro de AuthContext.js
    var Support: SupportServices = new SupportServices(); //Inicializado dentro de AuthContext.js



    interface Number {
        FormatSymbolValue(SymbolName: string): string;
        ToCurrencyFormat(): string;
    }

    interface Array {
        IsNotNullOrEmpty(): boolean;
    }
}

