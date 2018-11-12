using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace WebSampleBrowser.UploadBox
{
    /// <summary>
    /// Summary description for saveFiles
    /// </summary>
    public class saveFiles : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string targetFolder = HttpContext.Current.Server.MapPath("uploadfiles");
            if (!Directory.Exists(targetFolder))
            {
                Directory.CreateDirectory(targetFolder);
            }
            HttpRequest request = context.Request;
            HttpFileCollection uploadedFiles = context.Request.Files;
            if (uploadedFiles != null && uploadedFiles.Count > 0)
            {
                for (int i = 0; i < uploadedFiles.Count; i++)
                {
                    string fileName = uploadedFiles[i].FileName;
                    int indx = fileName.LastIndexOf("\\");
                    if (indx > -1)
                    {
                        fileName = fileName.Substring(indx + 1);
                    }
                    //uploadedFiles[i].SaveAs(targetFolder + "\\" + fileName);
                }
            }
            else
            {

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