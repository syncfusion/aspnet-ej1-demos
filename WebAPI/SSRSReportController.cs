#region Copyright Syncfusion Inc. 2001-2019.
// Copyright Syncfusion Inc. 2001-2019. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.EJ.ReportViewer;
using Syncfusion.Reports.EJ;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Configuration;
using System.Web.Http;
using System.Collections;
using System.Data;
using System.Reflection;

namespace WebSampleBrowser
{
    public class SSRSReportController : ApiController, IReportController
    {
        public object PostReportAction(Dictionary<string, object> jsonResult)
        {
            return ReportHelper.ProcessReport(jsonResult, this);
        }

        [System.Web.Http.ActionName("GetResource")]
        [AcceptVerbs("GET")]
        public object GetResource(string key, string resourcetype, bool isPrint)
        {
            return ReportHelper.GetResource(key, resourcetype, isPrint);
        }

        public void OnInitReportOptions(ReportViewerOptions reportOption)
        {
            string reportserverUrl = WebConfigurationManager.AppSettings["ReportServerUrl"];
            if (reportOption.ReportModel.ReportPath.Contains("InvoiceTemplate"))
            {
                //reportOption.ReportModel.ReportServerUrl = reportserverUrl;                       
                //reportOption.ReportModel.ReportServerCredential = new System.Net.NetworkCredential("ssrs", "RDLReport1");
                //reportOption.ReportModel.DataSourceCredentials.Add(new DataSourceCredentials("NorthWindIO", "ssrs1", "RDLReport1"));
            }
            else if (reportOption.ReportModel.ReportPath.Contains("Territory Sales"))
            {
                reportOption.ReportModel.ReportServerUrl = reportserverUrl;                        
                reportOption.ReportModel.ReportServerCredential = new System.Net.NetworkCredential("ssrs", "RDLReport1");
                reportOption.ReportModel.DataSourceCredentials.Add(new DataSourceCredentials("AdventureWorks", "ssrs1", "RDLReport1"));
            }
        }

        public void OnReportLoaded(ReportViewerOptions reportOption)
        {

        }
    }
}