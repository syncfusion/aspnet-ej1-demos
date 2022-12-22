#region Copyright Syncfusion Inc. 2001-2022.
// Copyright Syncfusion Inc. 2001-2022. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Syncfusion.XlsIO;

namespace WebSampleBrowser.XlsIO
{
    public partial class HTMLtoWorksheet : System.Web.UI.Page
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

        # region Events
        /// <summary>
        /// Creates spreadsheet
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            // New instance of XlsIO is created.[Equivalent to launching Microsoft Excel with no workbooks open].
            // The instantiation process consists of two steps.

            // Step 1 : Instantiate the spreadsheet creation engine.
            ExcelEngine excelEngine = new ExcelEngine();

            // Step 2 : Instantiate the excel application object.
            IApplication application = excelEngine.Excel;

            // A workbook is created.
            IWorkbook workbook = application.Workbooks.Create(1);

            // The first worksheet object in the worksheets collection is accessed.
            IWorksheet sheet = workbook.Worksheets[0];

            string fileName = "";
            if (DetectFormula.Checked)
            {
                sheet.ImportHtmlTable(XlsIOHelper.ResolveApplicationDataPath("HTMLwithFormulaToExcel.html", Request), 1, 1, HtmlImportOptions.DetectFormulas);
                sheet.Range["E2:F25"].NumberFormat = "_($* #,##0.00_);_($* (#,##0.00)";
                sheet.Range["H2:I25"].NumberFormat = "_($* #,##0.00_);_($* (#,##0.00)";
                fileName = "Import-HTML-Table-with-Formula.xlsx";
            }
            else
            {
                sheet.ImportHtmlTable(XlsIOHelper.ResolveApplicationDataPath("HTMLToExcel.html", Request), 1, 1);
                fileName = "Import-HTML-Table.xlsx";
            }
            sheet.UsedRange.AutofitColumns();
            sheet.UsedRange.AutofitRows();

            workbook.SaveAs(fileName, Response, ExcelDownloadType.PromptDialog);

            ClientScript.RegisterClientScriptBlock(this.GetType(), "open", "window.open('" + fileName + "','_blank');", true);

            //Close the excel engine.
            excelEngine.Dispose();
        }

        # endregion

        protected void Button2_Click(object sender, EventArgs e)
        {
            FileStream input = null;
            string value = "";
            if (DetectFormula.Checked)
            {
                input = new FileStream(XlsIOHelper.ResolveApplicationDataPath("HTMLwithFormulaToExcel.html", Request), FileMode.Open, FileAccess.ReadWrite);
                value = "attachment; filename=Import-HTML-Table-with-Formula.html";
            }
            else
            {
                input = new FileStream(XlsIOHelper.ResolveApplicationDataPath("HTMLToExcel.html", Request), FileMode.Open, FileAccess.ReadWrite);
                value = "attachment; filename=Import-HTML-Table.html";
            }
            input.CopyTo(Response.OutputStream);
            Response.ContentType = "text/html";
            Response.AppendHeader("Content-Disposition", value);
            input.Close();
            Response.Flush();
            Response.End();
        }
    }
}