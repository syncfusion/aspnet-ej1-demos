using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Syncfusion.JavaScript;

namespace WebSampleBrowser.FileExplorer
{
    /// <summary>
    /// Summary description for downloadFile
    /// </summary>
    public class downloadFile : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            HttpRequest request = context.Request;
            string path= request.QueryString["Path"];
            string[] names = request.QueryString.GetValues("Names");
            FileExplorerOperations opeartion = new FileExplorerOperations();
            opeartion.Download(path, names);                        
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