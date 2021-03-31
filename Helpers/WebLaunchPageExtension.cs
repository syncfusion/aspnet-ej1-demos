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
using System.Text;
using System.Web;
using System.Web.UI;

namespace WebSampleBrowser.Helpers
{
    /* Function used to check whether IIS installed, if so then pass URL to Launch OtherProduct*/
    public static class WebLaunchPageExt
    {       

        public static ServerMode RequestedServer()
        {
            return String.Equals(System.Diagnostics.Process.GetCurrentProcess().ProcessName, "iisexpress") ? ServerMode.IISExpress : HttpContext.Current.Request.ServerVariables["SERVER_SOFTWARE"].ToLower().IndexOf("iis") != -1 ? ServerMode.IIS : ServerMode.Other;
        }

        public static void IncludeIISUriPrefix(HttpContext context)
        {
            string uri = @"/sfmvc{0}samplebrowser";
            context.Response.Write(string.Format("iisPrefixLink='{0}'", uri));          

        }
    }
    public enum ServerMode
    {
        IIS,
        IISExpress,
        Other
    }
}
