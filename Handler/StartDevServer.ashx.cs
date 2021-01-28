#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Web;
using WebSampleBrowser.Utils;
using System.IO;
using System.Diagnostics;

namespace WebSampleBrowser.Handler
{
    /// <summary>
    /// Summary description for Handler2
    /// </summary>
    public class Handler2 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            
            DirectoryInfo webFolder, installedFolder;
            try
            {

                webFolder = new DirectoryInfo(context.Request.PhysicalApplicationPath).Parent.Parent;
                while (webFolder.Name.ToLower() != "web")
                {
                    webFolder = webFolder.Parent;
                }
                installedFolder = webFolder.Parent;
                
            }
            catch (Exception ex)
            {
                throw new Exception(string.Format("Exception while tracking 'Web' folder -{0}", ex.Message));
            }
            string productPath;
            if (context.Request.QueryString["product"] == null && context.Request.QueryString["product"] == null)
                throw new Exception("Requirred Query string [product] to handle the request.");
            if (context.Request.QueryString["path"] == null && context.Request.QueryString["path"] == null)
                productPath = @"JavaScript\\ionic samples\\desktop\\www";
            else productPath = context.Request.QueryString["path"];
            string path = Path.Combine(installedFolder.FullName, productPath);  
            string productname = context.Request.QueryString["product"].ToString().ToLower();
            if (!Directory.Exists(path))
            {
                context.Response.Write(string.Format("//asp.syncfusion.com/demos/{0}", productname));
            }
            else
            {
                DirectoryInfo productFolder = new DirectoryInfo(path);                

                string port = null;
                string physicalPath = string.Format("{0}", productFolder.FullName);
                string prefixURL = string.Empty;

                try
                {
                    string frameWorks = System.Configuration.ConfigurationManager.AppSettings["FrameWork"];
                    if (frameWorks == "4.5" || frameWorks == "4.5.1" || frameWorks == "4.0" || frameWorks == "4.6" )
                    {
                        CassiniWebServer.StartVersion45xWebServer(physicalPath, prefixURL, out port);
                    }
                    else
                    {
                        CassiniWebServer.StartVersion3xWebServer(physicalPath, prefixURL, out port);
                    }

                    context.Response.Write(string.Format("http://localhost:{0}", port));
                }
                catch (Exception ex)
                {
                    throw new Exception(string.Format("Error: Unable to start Webserver.web.exe, Message:{0}", ex.Message));
                }
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