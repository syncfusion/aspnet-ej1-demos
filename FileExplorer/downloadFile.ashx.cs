#region Copyright Syncfusion Inc. 2001-2021.
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