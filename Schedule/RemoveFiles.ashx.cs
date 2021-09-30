#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
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