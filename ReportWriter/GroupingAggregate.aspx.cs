#region Copyright Syncfusion Inc. 2001-2018.
// Copyright Syncfusion Inc. 2001-2018. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.Web.UI;
using System.Web.UI.WebControls;
using Syncfusion.Reports.EJ;
using Syncfusion.EJ.ReportWriter;

namespace WebSampleBrowser.SynReportWriter
{
    public partial class GroupingAggregate : System.Web.UI.Page
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

                ReportDataSourceCollection dataSources = new ReportDataSourceCollection();
                dataSources.Add(new ReportDataSource { Name = "Sales", Value = SalesDetails.GetData() });
                ReportWriter reportWriter = new ReportWriter();
                reportWriter.ReportProcessingMode = ProcessingMode.Local;
                reportWriter.ReportPath = Server.MapPath("~/App_Data/Reports/KnockOut.rdlc");
                reportWriter.DataSources = dataSources;

                if (this.pdf.Checked)
                {
                    fileName = "GroupingAggregate.pdf";
                    format = WriterFormat.PDF;
                }
                else if (this.word.Checked)
                {
                    fileName = "GroupingAggregate.doc";
                    format = WriterFormat.Word;
                }
                else if (this.html.Checked)
                {
                    fileName = "GroupingAggregate.Html";
                    format = WriterFormat.HTML;
                }
                else
                {
                    fileName = "GroupingAggregate.xls";
                    format = WriterFormat.Excel;
                }
                reportWriter.Save(fileName, format, httpContext.Response);
            }
            catch { }
        }
    }
}