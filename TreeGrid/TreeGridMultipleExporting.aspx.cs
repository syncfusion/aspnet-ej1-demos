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
using Syncfusion.EJ.Export;
using Syncfusion.Pdf;
using Syncfusion.XlsIO;
using WebSampleBrowser.TreeGrid.Model;

namespace WebSampleBrowser.TreeGrid
{
    public partial class TreeGridMultipleExporting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ExportTaskDetailsCollection TaskCollection = new ExportTaskDetailsCollection();
            this.TreeGridControlExporting.DataSource = TaskCollection.GetDataSource();
            this.TreeGridControlExporting.DataBind();
            this.TreeGridControlDesign.DataSource = TaskCollection.GetDesignPhaseDataSource();
            this.TreeGridControlDesign.DataBind();
            this.TreeGridControlImplementation.DataSource = TaskCollection.GetImplementationPhaseDataSource();
            this.TreeGridControlImplementation.DataBind();
        }

        protected void TreeGridControlExporting_ServerPdfExporting(object sender, Syncfusion.JavaScript.Web.TreeGridEventArgs e)
        {
            PdfExport exp = new PdfExport();
            PdfDocument document = exp.Export(this.TreeGridControlExporting.Model, (IEnumerable)this.TreeGridControlExporting.DataSource, new TreeGridExportSettings(){ Theme = ExportTheme.FlatLime},false,"Planning Phase");
            document = exp.Export(this.TreeGridControlDesign.Model, (IEnumerable)this.TreeGridControlDesign.DataSource, new TreeGridExportSettings() { Theme = ExportTheme.FlatLime }, "Export", document, false, "Design Phase");
            exp.Export(this.TreeGridControlImplementation.Model, (IEnumerable)this.TreeGridControlImplementation.DataSource, new TreeGridExportSettings() { Theme = ExportTheme.FlatLime }, "Export", document, true, "Implementation Phase");
        }

        protected void TreeGridControlExporting_ServerExcelExporting(object sender, Syncfusion.JavaScript.Web.TreeGridEventArgs e)
        {
            ExcelExport exp = new ExcelExport();
            IWorkbook workbook = exp.Export(this.TreeGridControlExporting.Model, (IEnumerable)this.TreeGridControlExporting.DataSource, new TreeGridExportSettings() { Theme = ExportTheme.FlatLime }, true, "Planning Phase");
            workbook = exp.Export(this.TreeGridControlDesign.Model, (IEnumerable)this.TreeGridControlDesign.DataSource, new TreeGridExportSettings() { Theme = ExportTheme.FlatLime }, workbook, true, "Design Phase");
            exp.Export(this.TreeGridControlImplementation.Model, (IEnumerable)this.TreeGridControlImplementation.DataSource,"ExcelExport.xlsx",ExcelVersion.Excel2010, new TreeGridExportSettings() { Theme = ExportTheme.FlatLime }, workbook, false, "Implementation Phase");
        }
    }
}