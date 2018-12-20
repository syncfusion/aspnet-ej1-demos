#region Copyright Syncfusion Inc. 2001-2018.
// Copyright Syncfusion Inc. 2001-2018. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Syncfusion.EJ.ReportWriter;
using Syncfusion.Reports.EJ;
using System.Web.Configuration;
using System.Web.Http;

namespace WebSampleBrowser.SynReportWriter
{
    public partial class Default : System.Web.UI.Page
    {
        # region Page Load
        /// <summary>
        /// Handles the page load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        # endregion

        /// <summary>
        /// Generates a document
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string fileName = null;
                WriterFormat format;
                string reportserverUrl = WebConfigurationManager.AppSettings["ReportServerUrl"];
                HttpContext httpContext = System.Web.HttpContext.Current;
                ReportWriter reportWriter = new ReportWriter();
                reportWriter.ReportProcessingMode = ProcessingMode.Remote;
                reportWriter.ReportServerUrl = reportserverUrl;
                reportWriter.ReportPath = "/SSRSSamples2/Territory Sales new";
                reportWriter.ReportServerCredential = new System.Net.NetworkCredential("ssrs", "RDLReport1");

                DataSourceCredentials _credential = new DataSourceCredentials();
                _credential.Name = "AdventureWorks";
                _credential.UserId = "ssrs1";
                _credential.Password = "RDLReport1";

                IList<DataSourceCredentials> _credentials = new List<DataSourceCredentials>();
                _credentials.Add(_credential);
                reportWriter.SetDataSourceCredentials(_credentials);

                if (this.pdf.Checked)
                {
                    fileName = "Territory Sales .pdf";
                    format = WriterFormat.PDF;
                }
                else if (this.word.Checked)
                {
                    fileName = "Territory Sales .doc";
                    format = WriterFormat.Word;
                }
                else if (this.html.Checked)
                {
                    fileName = "Territory Sales .Html";
                    format = WriterFormat.HTML;
                }
                else
                {
                    fileName = "Territory Sales .xls";
                    format = WriterFormat.Excel;
                }
                reportWriter.Save(fileName, format, httpContext.Response);
            }
            catch { }
        }
    }
}
