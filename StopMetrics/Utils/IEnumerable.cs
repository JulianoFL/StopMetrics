namespace System.Collections.Generic
{
    public static class ICollectionExtensions
    {
        /// <summary>
        /// Verifica se a coleção contém elementos, indicando que esta instanciada (não null) e não esta vazia
        /// </summary>
        public static bool IsNotNullOrEmpty<T>(this IEnumerable<T> Collection)
        {
            if (Collection != null && Collection.Count() > 0)
                return true;
            else
                return false;
        }
    }
}