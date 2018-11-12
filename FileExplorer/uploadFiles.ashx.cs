using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace WebSampleBrowser.FileExplorer
{
    /// <summary>
    /// Summary description for uploadFiles
    /// </summary>
    public class uploadFiles : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            HttpRequest request = context.Request;
            string targetFolder = HttpContext.Current.Server.MapPath(request.QueryString["Path"]);
            if (!Directory.Exists(targetFolder))
            {
                //Directory.CreateDirectory(targetFolder);
            }
            HttpFileCollection uploadedFiles = request.Files;
            if (uploadedFiles != null && uploadedFiles.Count > 0)
            {
                throw new Exception("Restricted to modify data in online demo.");
                //for (int i = 0; i < uploadedFiles.Count; i++)
                //{
                    
                    //string fileName = uploadedFiles[i].FileName;
                    //int indx = fileName.LastIndexOf("\\");
                    //if (indx > -1)
                    //{
                    //    fileName = fileName.Substring(indx + 1);
                    //}
                    //uploadedFiles[i].SaveAs(targetFolder + "\\" + fileName);
                //}
            }           
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