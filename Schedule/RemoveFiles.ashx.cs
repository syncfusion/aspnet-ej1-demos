using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace ImportApp.Views.Home
{
    /// <summary>
    /// Summary description for RemoveFiles
    /// </summary>
    public class RemoveFiles : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            var s = context.Request.Params;
            string fileName = s["fileNames"];
            string targetFolder = HttpContext.Current.Server.MapPath("uploadfiles");
            if (!Directory.Exists(targetFolder))
            {
                Directory.CreateDirectory(targetFolder);
            }

            var physicalPath = targetFolder + "\\" + fileName;
            if (System.IO.File.Exists(physicalPath))
            {
                System.IO.File.Delete(physicalPath);
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