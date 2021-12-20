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
using Syncfusion.XlsIO;
using Syncfusion.Pdf;
using Syncfusion.Pdf.Graphics;
using System.Drawing;
using WebSampleBrowser.Gantt.Model;

namespace WebSampleBrowser.Gantt
{
    public partial class GanttMultipleExporting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ExportTaskDetailsCollection TaskCollection = new ExportTaskDetailsCollection();
            this.GanttControlExporting.DataSource = TaskCollection.GetDataSource();
            this.GanttControlExporting.DataBind();
            this.GanttControlDesign.DataSource = TaskCollection.GetDesignPhaseDataSource();
            this.GanttControlDesign.DataBind();
            this.GanttControlImplementation.DataSource = TaskCollection.GetImplementationPhaseDataSource();
            this.GanttControlImplementation.DataBind();
        }
        protected void GanttControlExporting_ServerExcelExporting(object sender, Syncfusion.JavaScript.Web.GanttEventArgs e)
        {
            ExcelExport exp = new ExcelExport();
            IWorkbook document = exp.Export(this.GanttControlExporting.Model, (IEnumerable)this.GanttControlExporting.DataSource, new GanttExportSettings() { Theme = ExportTheme.FlatLime }, true, "Planning Phase");
            document = exp.Export(this.GanttControlDesign.Model, (IEnumerable)this.GanttControlDesign.DataSource, new GanttExportSettings() { Theme = ExportTheme.FlatLime }, "Export", document, true, "Design Phase");
            exp.Export(this.GanttControlImplementation.Model, (IEnumerable)this.GanttControlImplementation.DataSource, new GanttExportSettings() { Theme = ExportTheme.FlatLime }, "Export.xlsx", document, false, "Implementation Phase");
        }

        protected void GanttControlExporting_ServerPdfExporting(object sender, Syncfusion.JavaScript.Web.GanttEventArgs e)
        {
            PdfExport exp = new PdfExport();
            GanttPdfExportSettings settings = new GanttPdfExportSettings();
            settings.Theme = GanttExportTheme.FlatLime;
            settings.Locale = e.Arguments["locale"].ToString();
            //Create footer template
            RectangleF bounds = new RectangleF(0, 0,762, 25);
            PdfSolidBrush brush = new PdfSolidBrush(new PdfColor(51, 51, 51));
            PdfPen pen = new PdfPen(new PdfColor(200, 200, 200));
            PdfFont font = new PdfTrueTypeFont(new Font("Segoe UI", 10), true);
            PdfStringFormat format = new PdfStringFormat();
            format.Alignment = PdfTextAlignment.Center;
            format.LineAlignment = PdfVerticalAlignment.Middle;
            PdfPageTemplateElement footer = new PdfPageTemplateElement(bounds);
            PdfPageNumberField pageNumber = new PdfPageNumberField(font, brush);
            PdfCompositeField compositeField = new PdfCompositeField(font, brush, "Page {0}", pageNumber);
            compositeField.StringFormat = format;
            compositeField.Bounds = footer.Bounds;
            footer.Graphics.DrawRectangle(pen, bounds);
            compositeField.Draw(footer.Graphics, new PointF(0,0));
            PdfDocumentTemplate footerTemplate = new PdfDocumentTemplate();
            footerTemplate.Bottom = footer;
            settings.PdfDocumentTemplate = footerTemplate;
            PdfDocument document = exp.Export(this.GanttControlExporting.Model, (IEnumerable)this.GanttControlExporting.DataSource, settings, false);
            document = exp.Export(this.GanttControlDesign.Model, (IEnumerable)this.GanttControlDesign.DataSource, settings, document, false);
            exp.Export(this.GanttControlImplementation.Model, (IEnumerable)this.GanttControlImplementation.DataSource, settings,"Gantt",document, true);
        }
    }
}