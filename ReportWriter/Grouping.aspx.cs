#region Copyright Syncfusion Inc. 2001-2019.
// Copyright Syncfusion Inc. 2001-2019. All rights reserved.
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

namespace WebSampleBrowser.SynReportWriter
{
    public partial class DrillDown : System.Web.UI.Page
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
                HttpContext httpContext = System.Web.HttpContext.Current;
                ReportWriter reportWriter = new ReportWriter(ReportViewerHelper.GetReportPath("drilldown.rdlc"));
                reportWriter.ReportProcessingMode = ProcessingMode.Local;
                reportWriter.DataSources.Clear();
                reportWriter.DataSources.Add(new ReportDataSource { Name = "Customers", Value = Customers.GetData() });

                if (this.pdf.Checked)
                {
                    fileName = "Grouping.pdf";
                    format = WriterFormat.PDF;
                }
                else if (this.word.Checked)
                {
                    fileName = "Grouping.doc";
                    format = WriterFormat.Word;
                }
                else if (this.html.Checked)
                {
                    fileName = "Grouping.Html";
                    format = WriterFormat.HTML;
                }
                else
                {
                    fileName = "Grouping.xls";
                    format = WriterFormat.Excel;
                }
                reportWriter.Save(fileName, format, httpContext.Response);
            }
            catch { }
        }
    }
}
