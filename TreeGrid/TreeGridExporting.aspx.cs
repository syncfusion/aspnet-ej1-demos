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
using WebSampleBrowser.TreeGrid.Model;

namespace WebSampleBrowser.TreeGrid
{
    public partial class TreeGridExporting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TaskDetailsCollection TaskCollection = new TaskDetailsCollection();
            this.TreeGridControlExporting.DataSource = TaskCollection.GetDataSource();
            this.TreeGridControlExporting.DataBind();
        }

        protected void TreeGridControlExporting_ServerPdfExporting(object sender, Syncfusion.JavaScript.Web.TreeGridEventArgs e)
        {
            PdfExport exp = new PdfExport();
            TreeGridExportSettings settings = new TreeGridExportSettings();
            settings.Theme = ExportTheme.FlatLime;
            exp.Export(this.TreeGridControlExporting.Model, (IEnumerable)this.TreeGridControlExporting.DataSource, settings, "Export");
        }

        protected void TreeGridControlExporting_ServerExcelExporting(object sender, Syncfusion.JavaScript.Web.TreeGridEventArgs e)
          {
            ExcelExport exp = new ExcelExport();
            TreeGridExportSettings settings = new TreeGridExportSettings();
            settings.Theme = ExportTheme.FlatLime;
            exp.Export(this.TreeGridControlExporting.Model, (IEnumerable)this.TreeGridControlExporting.DataSource, "Export.xlsx", ExcelVersion.Excel2010, new TreeGridExportSettings() { Theme = ExportTheme.BootstrapTheme });
          }
    }
}