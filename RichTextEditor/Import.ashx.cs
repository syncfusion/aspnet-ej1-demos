#region Copyright Syncfusion Inc. 2001-2021
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Syncfusion.DocIO;
using Syncfusion.DocIO.DLS;
using System.Web.Http;
using System.Collections.Generic;
using Syncfusion.EJ.Export;
using Syncfusion.DocToPDFConverter;
using Syncfusion.Pdf;

namespace WebSampleBrowser.RichTextEditor
{
    /// <summary>
    /// Summary description for saveFiles
    /// </summary>
    public class Import : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            HttpContext.Current.Response.Write(ImportDoc());
        }
        public string ImportDoc()
        {
            string HtmlString = string.Empty;
            if (HttpContext.Current.Request.Files.AllKeys.Any())
            {
                string RTEID = HttpContext.Current.Request.QueryString["rteid"];
                var fileName = RTEID + "_importUpload";
                var httpPostedFile = HttpContext.Current.Request.Files[fileName];
                if (httpPostedFile != null)
                {
                    using (var mStream = new MemoryStream())
                    {
                        new WordDocument(httpPostedFile.InputStream).Save(mStream, FormatType.Html);
                        mStream.Position = 0;
                        HtmlString = new StreamReader(mStream).ReadToEnd();
                    };

                    HtmlString = ExtractBodyContent(HtmlString);

                    foreach (var item in DecodeKeys())
                    {
                        HtmlString = HtmlString.Replace(item.Key, item.Value);
                    }
                }
                else HttpContext.Current.Response.Write("Select any file to upload.");

            }
            return HtmlString;
        }
        public string ExtractBodyContent(string html)
        {
            if (html.Contains("<html") && html.Contains("<body"))
            {
                return html.Remove(0, html.IndexOf("<body>") + 6).Replace("</body></html>", "");

            }
            return html;
        }

        public IDictionary<string, string> DecodeKeys()
        {
            IDictionary<string, string> KeyValuePair = new Dictionary<string, string>()
            {
               {"\"", "'"},{"\r", " "},{"\n", "<br/> "},{"\r\n", " "},{"( )+", " "},{"&nbsp;", " "},{"&bull;", "*"},{"&lsaquo;", "<"},
               {"&rsaquo;", ">"},{"&trade;", "(tm)"},{"&copy;", "(c)"},{"&reg;", "(r)"}
            };

            return KeyValuePair;
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}