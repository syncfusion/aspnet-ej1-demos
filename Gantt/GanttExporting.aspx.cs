#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.JavaScript;
using Syncfusion.JavaScript.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using Syncfusion.XlsIO;
using Syncfusion.EJ.Export;
using WebSampleBrowser.Gantt.Model;

namespace WebSampleBrowser.Gantt
{
    public partial class GanttExporting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TaskDetailsCollection TaskCollection = new TaskDetailsCollection();
            this.GanttControlExporting.DataSource = TaskCollection.GetDataSource();
            this.GanttControlExporting.DataBind();
        }

        protected void GanttControlExporting_ServerExcelExporting(object sender, Syncfusion.JavaScript.Web.GanttEventArgs e)
          {
            ExcelExport exp = new ExcelExport();
            GanttExportSettings settings = new GanttExportSettings();
            settings.Theme = ExportTheme.FlatLime;
            exp.Export(this.GanttControlExporting.Model, (IEnumerable)this.GanttControlExporting.DataSource, "Export.xlsx", ExcelVersion.Excel2010, new GanttExportSettings() { Theme = ExportTheme.FlatLime });
          }

        protected void GanttControlExporting_ServerPdfExporting(object sender, Syncfusion.JavaScript.Web.GanttEventArgs e)
        {
            PdfExport exp = new PdfExport();
            GanttPdfExportSettings settings = new GanttPdfExportSettings();
            settings.EnableFooter = true;
            settings.ProjectName = "Project Tracker";
            settings.Locale = e.Arguments["locale"].ToString();
            settings.Theme = GanttExportTheme.FlatLime;
            settings.IsFitToWidth = this.EnablePageBreak.Checked;
            exp.Export(this.GanttControlExporting.Model, (IEnumerable)this.GanttControlExporting.DataSource, settings, "Gantt");
        }
    }
}