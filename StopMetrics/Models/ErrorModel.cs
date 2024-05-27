using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace StopMetrics.Models
{
    public enum ErrorTypes
    {
        /// <summary>
        /// Erro desconhecido
        /// </summary>
        Unknown = -1,

        /// <summary>
        /// Parametro da chamada (como falta de variáveis) inválido
        /// </summary>
        InvalidParameter = 10000,

        /// <summary>
        /// Informação da chamada inválida (como Id de recebedor inválido)
        /// </summary>
        InvalidData = 10001,


        /// <summary>
        /// Um dos recebedores tem um valor de divisão menor do que a taxa a ser cobrada dele
        /// </summary>
        InsufficientSplitAmount = 20000,

        /// <summary>
        /// O valor calculado de transferência de taxas da transação é diferente do valor forncecido
        /// </summary>
        InvalidTransferAmount = 30000
    }

    /// <summary>
    /// Objeto padrão de retorno de erros das chamadas
    /// </summary>
    public class GwModelError
    {
        /// <summary>
        /// Tipo de erro retornado 
        /// </summary>
        public ErrorTypes ErrorType { get; set; }

        /// <summary>
        /// Código do erro 
        /// </summary>
        public int ErrorCode { get; set; }

        /// <summary>
        /// Mensagem sobre o erro
        /// </summary>
        public string ErrorMessage { get; set; }

        /// <summary>
        /// Parametro da chamada que causou o erro
        /// </summary>
        public string ErroredParameter { get; set; }

        /// <summary>
        /// Objeto padrão de retorno de erros das chamadas
        /// </summary>
        public GwModelError(ErrorTypes errorType, string errorMessage, string erroredParameter)
        {
            ErrorType = errorType; // errorType.ToString().ToSnakeCase();
            ErrorCode = EnumToInt(errorType);
            ErrorMessage = errorMessage;
            ErroredParameter = erroredParameter;
        }

        public static GwModelError GetDefaultError()
        {
            return new GwModelError(ErrorTypes.Unknown, "Ocorreu um erro ao processar sua chamada. Por favor tente novamente", "-");
        }

        public int EnumToInt<TValue>(TValue value) where TValue : Enum => (int)(object)value;
    }


    public partial class GwGatewayError
    {
        public List<GwModelError> Errors { get; set; }


        public GwGatewayError() { }

        public static GwGatewayError GetDefaultError()
        {
            return new GwGatewayError(new List<GwModelError>() { new GwModelError(ErrorTypes.Unknown, "Ocorreu um erro ao processar sua chamada. Por favor tente novamente", "-") });
        }

        public GwGatewayError(List<GwModelError> errors)
        {
            Errors = errors;
        }

        public GwGatewayError(ErrorTypes errorType, string errorMessage, string erroredParameter)
        {
            Errors = new List<GwModelError>() { new GwModelError(errorType, errorMessage, erroredParameter) };
        }
    }

    public partial class GwGatewayException : Exception
    {
        public GwModelError Error { get; private set; } = GwModelError.GetDefaultError();


        public GwGatewayException() { }

        public GwGatewayException(ErrorTypes ErrorType, string ErrorMessage)
        {
            Error = new GwModelError(ErrorType, ErrorMessage, "");
        }

        public GwGatewayException(ErrorTypes ErrorType, string ErrorMessage, string ErroredParameter)
        {
            Error = new GwModelError(ErrorType, ErrorMessage, ErroredParameter);
        }
    }
}
