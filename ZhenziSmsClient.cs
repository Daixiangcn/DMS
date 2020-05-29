using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Text;
using System.Web;
using System.Security.Cryptography.X509Certificates;
using System.Net.Security;

namespace ZhenziSms
{
    public class ZhenziSmsClient
    {
        private static readonly string DEFAULT_CHARSET = "UTF-8";
        private static readonly int CONNECTION_TIMEOUT = 20 * 1000;
        private static readonly int READ_TIMEOUT = 20 * 1000;
        private String apiUrl = "";
        private string appId;
        private string appSecret;

        public ZhenziSmsClient(string apiUrl, string appId, string appSecret)
        {
            this.apiUrl = apiUrl;
            this.appId = appId;
            this.appSecret = appSecret;
        }
        public String Send(Dictionary<string, Object> parameters)
        {
            parameters.Add("appId", appId);
            parameters.Add("appSecret", appSecret);
            var result = DoPost(apiUrl + "/sms/v2/send.do", parameters, DEFAULT_CHARSET, CONNECTION_TIMEOUT,
                    READ_TIMEOUT);
            return result;
        }

        public String Balance()
        {
            var parameters = new Dictionary<string, Object>();
            parameters.Add("appId", appId);
            parameters.Add("appSecret", appSecret);

            var result = DoPost(apiUrl + "/account/balance.do",
                parameters,
                DEFAULT_CHARSET,
                CONNECTION_TIMEOUT,
                READ_TIMEOUT);
            return result;
        }
        public String FindSmsByMessageId(string messageId)
        {
            var parameters = new Dictionary<string, Object>();
            parameters.Add("appId", appId);
            parameters.Add("appSecret", appSecret);
            parameters.Add("messageId", messageId);
            var result = DoPost(apiUrl + "/smslog/findSmsByMessageId.do",
                parameters,
                DEFAULT_CHARSET,
                CONNECTION_TIMEOUT,
                READ_TIMEOUT);
            return result;
        }
        private string DoPost(string url, Dictionary<string, Object> parameters, string charset, int connectionTimeout, int readTimeout)
        {
            var ret = string.Empty;
            var contentType = "application/x-www-form-urlencoded;charset=" + charset;
            var encoding = BuildEncoding(charset);
            var query = BuildQuery(parameters, encoding);
            var queryBytes = encoding.GetBytes(query);
            var httpRequest = BuildRequest(url, contentType, queryBytes);

            var requestStream = httpRequest.GetRequestStream();
            requestStream.Write(queryBytes, 0, queryBytes.Length);

            using (var rsp = httpRequest.GetResponse())
            {
                using (var rspStream = rsp.GetResponseStream())
                {
                    using (var streamReader = new StreamReader(rspStream))
                    {
                        ret = streamReader.ReadToEnd();
                    }
                }
            }

            return ret;

        }
        private Encoding BuildEncoding(string charset)
        {
            var encoding = Encoding.UTF8;
            if (!string.IsNullOrEmpty(charset))
            {
                encoding = Encoding.GetEncoding(charset);
            }

            return encoding;
        }

        private HttpWebRequest BuildRequest(string url, string contentType, byte[] queryBytes)
        {
            HttpWebRequest httpRequest = null;
            if (url.StartsWith("https", StringComparison.OrdinalIgnoreCase))
            {
                //ServicePointManager.SecurityProtocol = spt; //不指定,使之自动协商/适应, 避免指定的版本与服务器不一样反而连不上
                ServicePointManager.ServerCertificateValidationCallback = new RemoteCertificateValidationCallback(CheckValidationResult);
                httpRequest = WebRequest.Create(url) as HttpWebRequest;
                httpRequest.ProtocolVersion = HttpVersion.Version10;
            }
            else
            {
                httpRequest = WebRequest.Create(url) as HttpWebRequest;
            }
            httpRequest.Method = "POST";
            httpRequest.ContentType = contentType;
            httpRequest.Accept = "text/xml,text/javascript,text/html";
            httpRequest.ContentLength = queryBytes.Length;
            return httpRequest;
        }

        /// <summary>
        /// 默认charset为UTF-8
        /// </summary>
        /// <param name="parameters"></param>
        /// <param name="charset"></param>
        /// <returns></returns>
        public String BuildQuery(Dictionary<string, Object> parameters, Encoding encoding)
        {
            if ((parameters == null) || (parameters.Count == 0))
            {
                return string.Empty;
            }

            var query = new StringBuilder();

            foreach (var kvp in parameters)
            {
                String name = kvp.Key;
                Object obj = kvp.Value;
                var value = "";
                if (obj.GetType() == typeof(string[]))
                    value = ToJSONString((string[])obj);
                else
                    value = obj.ToString();
                if (!string.IsNullOrEmpty(name))
                {
                    query.Append(name).Append("=").Append(HttpUtility.UrlEncode(value, encoding));
                    query.Append("&");
                }
            }
            if(query.Length > 0)
                query.Remove(query.Length - 1, 1);
            return query.ToString();
        }
        private bool CheckValidationResult(object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors errors)
        {
            return true; //总是接受
        }
        ///数组转json字符串
        private String ToJSONString(string[] array)
        {
            if (array == null)
                return "[]";
            StringBuilder sb = new StringBuilder();
            sb.Append("[");
            foreach (string item in array)
            {
                String val = Escape(item);
                sb.Append("\"");
                sb.Append(val);
                sb.Append("\"");
                sb.Append(",");
            }
            if (sb.Length > 1)
                sb.Remove(sb.Length - 1, 1);
            sb.Append("]");
            return sb.ToString();
        }
        
        ///字符转义
        private string Escape(string s)
        {
            StringBuilder sb = new StringBuilder();
            foreach (char c in s)
            {
                switch (c)
                {
                    case '\"':
                        sb.Append("\\\"");
                        break;
                    case '\\':
                        sb.Append("\\\\");
                        break;
                    case '/':
                        sb.Append("\\/");
                        break;
                    case '\b':
                        sb.Append("\\b");
                        break;
                    case '\f':
                        sb.Append("\\f");
                        break;
                    case '\n':
                        sb.Append("\\n");
                        break;
                    case '\r':
                        sb.Append("\\r");
                        break;
                    case '\t':
                        sb.Append("\\t");
                        break;
                    default:
                        sb.Append(c);
                        break;
                }
            }
            return sb.ToString();
        }
    }
    
}
