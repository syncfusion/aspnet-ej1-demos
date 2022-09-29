#region Copyright Syncfusion Inc. 2001-2022
//
//  Copyright Syncfusion Inc. 2001-2022. All rights reserved.
//
//  Use of this code is subject to the terms of our license.
//  A copy of the current license can be obtained at any time by e-mailing
//  licensing@syncfusion.com. Any infringement will be prosecuted under
//  applicable laws. 
//
#endregion

using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Syncfusion.XlsIO;

namespace WebSampleBrowser.XlsIO
{
    public partial class RowColumnManipulations : System.Web.UI.Page
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
            //New instance of XlsIO is created.[Equivalent to launching Microsoft Excel with no workbooks open].
            //The instantiation process consists of two steps.

            //Step 1 : Instantiate the spreadsheet creation engine.
            ExcelEngine excelEngine = new ExcelEngine();
            //Step 2 : Instantiate the excel application object.
            IApplication application = excelEngine.Excel;

            //A new workbook is created.[Equivalent to creating a new workbook in Microsoft Excel]
            //The new workbook will have 3 worksheets
            IWorkbook workbook;

            if (this.rBtnXls.Checked)
                workbook = application.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath("monthly_sales.xls", Request));
            else
                workbook = application.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath("monthly_sales.xlsx", Request));

            //The first worksheet object in the worksheets collection is accessed.
            IWorksheet sheet = workbook.Worksheets[0];

            #region Grouping and ungrouping

            // Grouping by Rows
            sheet.Range["C5:F7"].Group(ExcelGroupBy.ByRows);

            // Grouping by Columns
            sheet.Range["C10:F10"].Group(ExcelGroupBy.ByColumns);

            #endregion

            #region Hiding unhiding

            // Hiding fifth and sixth Column
            sheet.ShowColumn(5, false);
            sheet.ShowColumn(6, false);

            //Showing the 28th row
            sheet.ShowRow(28, true);

            #endregion

            #region Insert and delete

            //Deleting Row
            sheet.DeleteRow(25);

            //Inserting Column
            sheet.InsertColumn(7, 1, ExcelInsertOptions.FormatAsBefore);
            sheet.Range["G4"].Text = "Loss/Gain";

            //Deleting Column
            sheet.DeleteColumn(8);

            #endregion

            #region ColumnWidth and RowHeight

            // Changing the Column Width
            sheet.Range["D5"].ColumnWidth = 15;

            // Changing the Row Height
            sheet.Range["D29"].RowHeight = 25;

            #endregion

            //Saving the workbook to disk.
            if (this.rBtnXls.Checked)
                workbook.SaveAs("Sample.xls", ExcelSaveType.SaveAsXLS, Response, ExcelDownloadType.PromptDialog);
            else
                workbook.SaveAs("Sample.xlsx", Response, ExcelDownloadType.PromptDialog, ExcelHttpContentType.Excel2016);


            //Close the workbook.
            workbook.Close();
            excelEngine.Dispose();
        }
        # endregion

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Step 1 : Instantiate the spreadsheet creation engine.
            ExcelEngine excelEngine = new ExcelEngine();
            //Step 2 : Instantiate the excel application object.
            IApplication application = excelEngine.Excel;
            //A new workbook is created.[Equivalent to creating a new workbook in Microsoft Excel]
            //The new workbook will have 2 worksheets
            IWorkbook workbook = application.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath("monthly_sales.xls", Request));
            workbook.Version = ExcelVersion.Excel97to2003;
            workbook.SaveAs("Template.xls", Response, ExcelDownloadType.PromptDialog);
        }
}
}