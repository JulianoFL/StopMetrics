using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;

namespace StopMetrics.Utils.Http
{
    public abstract class HttpCalls
    {
        internal HttpClient HClient { get; set; }


        public HttpCalls() { }

        public HttpCalls(HttpClient HClient)
        {
            this.HClient = HClient;
        }


        public void SetClient(HttpClient HClient)
        {
            this.HClient = HClient;
        }


        public virtual async Task<T> GetAsync<T>(string URL)
        {
            int Attempt = 0;
            int Retries = 3;


            while (true)
            {
                try
                {
                    HttpResponseMessage Response = await HClient.GetAsync(URL);

                    if (Response.StatusCode != HttpStatusCode.GatewayTimeout && Response.StatusCode != HttpStatusCode.RequestTimeout)
                        return await CheckResponse<T>(Response);
                }
                catch (ArgumentNullException Error)
                {
                    if (Attempt > Retries)
                        throw;
                }
                catch (Exception Error)
                {
                    throw;
                }

                Attempt++;

                if (Attempt > Retries)
                    throw new Exception();
            }
        }

        public virtual async Task<T> PostAsync<T>(string URL, object PostBody)
        {
            int Attempt = 0;
            int Retries = 3;


            StringContent JsonContent = null;

            if (PostBody != null)
            {
                string JsonBody = SnakeCaseJsonObject.SerializeObject(PostBody);
                JsonContent = new StringContent(JsonBody);
                JsonContent.Headers.ContentType = new MediaTypeWithQualityHeaderValue("application/json");
            }

            while (true)
            {
                try
                {
                    HttpResponseMessage Response = await HClient.PostAsync(URL, JsonContent);

                    if (Response.StatusCode != HttpStatusCode.GatewayTimeout && Response.StatusCode != HttpStatusCode.RequestTimeout)
                        return await CheckResponse<T>(Response);
                }
                catch (ArgumentNullException Error)
                {
                    if (Attempt > Retries)
                        throw;
                }
                catch (Exception Error)
                {
                    throw Error;
                }

                Attempt++;

                if (Attempt > Retries)
                    throw new Exception();
            }
        }

        public virtual async Task<T> PostFormAsync<T>(string URL, Dictionary<string, object> PostBody, string FileType, string FileName)
        {
            int Attempt = 0;
            int Retries = 3;

            MultipartFormDataContent Content = new MultipartFormDataContent();

            foreach (var item in PostBody)
            {
                if (item.Value.GetType() == typeof(string))
                    Content.Add(new StringContent(item.Value.ToString()), item.Key);
                else
                {
                    ByteArrayContent BContent = new ByteArrayContent((byte[])item.Value);
                    BContent.Headers.ContentType = MediaTypeHeaderValue.Parse(FileType);

                    Content.Add(BContent, item.Key, FileName);
                }
            }

            while (true)
            {
                try
                {
                    HttpResponseMessage Response = await HClient.PostAsync(URL, Content);

                    if (Response.StatusCode != HttpStatusCode.GatewayTimeout && Response.StatusCode != HttpStatusCode.RequestTimeout)
                        return await CheckResponse<T>(Response);
                }
                catch (ArgumentNullException Error)
                {
                    if (Attempt > Retries)
                        throw;
                }
                catch (Exception Error)
                {
                    throw;
                }

                Attempt++;

                if (Attempt > Retries)
                    throw new Exception();
            }
        }

        public virtual async Task<T> PutAsync<T>(string URL, object PostBody = null)
        {
            int Attempt = 0;
            int Retries = 3;


            string JsonBody = SnakeCaseJsonObject.SerializeObject(PostBody);
            StringContent JsonContent = new StringContent(JsonBody);
            JsonContent.Headers.ContentType = new MediaTypeWithQualityHeaderValue("application/json");

            while (true)
            {
                try
                {
                    HttpResponseMessage Response = await HClient.PutAsync(URL, JsonContent);

                    if (Response.StatusCode != HttpStatusCode.GatewayTimeout && Response.StatusCode != HttpStatusCode.RequestTimeout)
                        return await CheckResponse<T>(Response);
                }
                catch (ArgumentNullException Error)
                {
                    if (Attempt > Retries)
                        throw;
                }
                catch (Exception Error)
                {
                    throw;
                }

                Attempt++;

                if (Attempt > Retries)
                    throw new Exception();
            }
        }

        public virtual async Task<T> DeleteAsync<T>(string URL)
        {
            int Attempt = 0;
            int Retries = 3;



            while (true)
            {
                try
                {
                    HttpResponseMessage Response = await HClient.DeleteAsync(URL);

                    if (Response.StatusCode != HttpStatusCode.GatewayTimeout && Response.StatusCode != HttpStatusCode.RequestTimeout)
                        return await CheckResponse<T>(Response);
                }
                catch (ArgumentNullException Error)
                {
                    if (Attempt > Retries)
                        throw Error;
                }
                catch (Exception Error)
                {
                    throw Error;
                }

                Attempt++;

                if (Attempt > Retries)
                    throw new Exception();
            }
        }


        private async Task<T> CheckResponse<T>(HttpResponseMessage Response)
        {
            string JsonResponse = await Response.Content.ReadAsStringAsync();

            if ((int)Response.StatusCode < 200 || (int)Response.StatusCode > 204)
                throw new Exception(JsonResponse);

            if (Response.StatusCode == HttpStatusCode.NoContent)
                return default;

            if (string.IsNullOrEmpty(JsonResponse))
                return default;

            if (IsValidJson<T>(JsonResponse))
                return SnakeCaseJsonObject.DeserializeObject<T>(JsonResponse);

            throw new ArgumentNullException();
        }

        public static bool IsValidJson<T>(string Json)
        {
            try
            {
                if (string.IsNullOrEmpty(Json))
                    return false;

                SnakeCaseJsonObject.DeserializeObject<T>(Json, false);
                return true;
            }
            catch (Exception E)
            {
                Console.WriteLine(E.Message);

                return false;
            }
        }
    }
}
