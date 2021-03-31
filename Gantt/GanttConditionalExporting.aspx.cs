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
using Syncfusion.Pdf.Graphics;

namespace WebSampleBrowser.Gantt
{
    public partial class GanttCondtionalExporting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TaskDetailsCollection TaskCollection = new TaskDetailsCollection();
            this.GanttConditionalExporting.DataSource = TaskCollection.GetExportDataSource();
            this.GanttConditionalExporting.DataBind();
        }

        protected void GanttConditionalExporting_ServerExcelExporting(object sender, Syncfusion.JavaScript.Web.GanttEventArgs e)
        {
            ExcelExport exp = new ExcelExport();
            GanttExportSettings settings = new GanttExportSettings();
            settings.Theme = ExportTheme.FlatLime;
            exp.Export(this.GanttConditionalExporting.Model, (IEnumerable)this.GanttConditionalExporting.DataSource, "Export.xlsx", ExcelVersion.Excel2010, new GanttExportSettings() { Theme = ExportTheme.FlatLime });
        }

        protected void GanttConditionalExporting_ServerPdfExporting(object sender, Syncfusion.JavaScript.Web.GanttEventArgs e)
        {
            PdfExport exp = new PdfExport();
            GanttPdfExportSettings settings = new GanttPdfExportSettings();
            settings.EnableFooter = true;
            settings.ProjectName = "Project Tracker";
            settings.Locale = e.Arguments["locale"].ToString();
            settings.Theme = GanttExportTheme.FlatLime;
            settings.IsFitToWidth = true;
            exp.Export(this.GanttConditionalExporting.Model, (IEnumerable)this.GanttConditionalExporting.DataSource, settings, "Gantt");
        }

        protected void GanttConditionalExporting_ServerPdfTaskbarInfo(object model, object args)
        {
            var record = (GanttRecord)((Dictionary<string, object>)args)["Data"];
            var taskbar = (PdfGanttTaskbar)((Dictionary<string, object>)args)["Taskbar"];
            if (!record.IsParentRow)
            {
                if (record.Progress > 80)
                {
                    taskbar.ProgressColor = new PdfColor(108, 52, 131);
                    taskbar.TaskBorderColor = taskbar.TaskColor = new PdfColor(165, 105, 189);
                }
                else if (record.Progress < 20)
                {
                    taskbar.ProgressColor = new PdfColor(205, 92, 92);
                    taskbar.TaskBorderColor = taskbar.TaskColor = new PdfColor(240, 128, 128);
                }
            }
        }

        protected void GanttConditionalExporting_ServerPdfQueryCell(object model, object args)
        {
            var record = (GanttRecord)((Dictionary<string, object>)args)["Data"];
            var cell = (PdfTreeGridCell)((Dictionary<string, object>)args)["Cell"];
            var column = (GanttColumn)((Dictionary<string, object>)args)["Column"];
            var ganttModel = (GanttProperties)model;

            if (column.MappingName == ganttModel.ProgressMapping && !record.IsParentRow)
            {
                if (record.Progress > 80)
                {
                    PdfBrush color = new PdfSolidBrush(new PdfColor(165, 105, 189));
                    cell.Style.BackgroundBrush = color;
                }
                else if (record.Progress < 20)
                {
                    PdfBrush color = new PdfSolidBrush(new PdfColor(240, 128, 128));
                    cell.Style.BackgroundBrush = color;
                }

            }
        }

        protected void GanttConditionalExporting_ServerExcelQueryCellInfo(object model, object args)
        {
            var record = (GanttRecordDetails)((Dictionary<string, object>)args)["Data"];
            var cell = (IRange)((Dictionary<string, object>)args)["Cell"];
            var column = (GanttColumn)((Dictionary<string, object>)args)["Column"];
            var ganttModel = (GanttProperties)model;
            
            if (column.MappingName == ganttModel.ProgressMapping && !record.IsParentRow)
            {
                if (float.Parse(cell.Value) > 80)
                    cell.CellStyle.Color = ColorConversion.GetColor(new PdfColor(165, 105, 189));
                else if (float.Parse(cell.Value) < 20)
                    cell.CellStyle.Color = ColorConversion.GetColor(new PdfColor(240, 128, 128));
            }
        }
    }
}