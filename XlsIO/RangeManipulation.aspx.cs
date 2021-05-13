#region Copyright Syncfusion Inc. 2001-2021
//
//  Copyright Syncfusion Inc. 2001-2021. All rights reserved.
//
//  Use of this code is subject to the terms of our license.
//  A copy of the current license can be obtained at any time by e-mailing
//  licensing@syncfusion.com. Any infringement will be prosecuted under
//  applicable laws. 
//
#endregion

using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Syncfusion.XlsIO;

namespace WebSampleBrowser.XlsIO
{
    public partial class RangeManipulation : System.Web.UI.Page
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
        /// Create spreadsheet
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
            IWorkbook workbook;

            //Opening the Existing worksheet from a Workbook
            if (this.rBtnXls.Checked)
            {
                workbook = application.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath("RangeManipulation.xls", Request));
            }
            else
                workbook = application.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath("RangeManipulation.xlsx", Request));

            //The first worksheet object in the worksheets collection is accessed.
            IWorksheet sheet = workbook.Worksheets[0];

            # region AutoFilter

            //Creating an AutoFilter in the first worksheet. Specifying the Autofilter range. 
            sheet.AutoFilters.FilterRange = sheet.Range["B14:E91"];

            //Counting the auto filtered value.
            sheet.Range["D9"].Formula = "=SUBTOTAL(2,B14:B91)";

            # endregion

            # region Range copy

            // Copying a Range
            IRange source = sheet.Range["D8:D9"];
            IRange des = sheet.Range["E93"];
            source.CopyTo(des, ExcelCopyRangeOptions.CopyValueAndSourceFormatting);

            #endregion

            # region Clear Range
            source.Clear(true);
            # endregion

            # region Named Range

            //Defining the Range 
            IName lname1 = sheet.Names.Add("One");

            //Another way to refer range of cells.
            lname1.RefersToRange = sheet.Range[98, 4, 98, 5];

            #endregion

            # region Merge Cells

            sheet.Range["One"].Merge();
            sheet.Range["One"].Text = "Thank you for choosing the product";
            sheet.Range["One"].CellStyle.Font.Bold = true;

            #endregion

            # region MigrantRange

            //Optimal method for writting strings in the given range.
            IMigrantRange migrantRange = sheet.MigrantRange;
            migrantRange.ResetRowColumn(6, 4);
            migrantRange.Value = "INVENTORY REPORT";
            migrantRange.CellStyle.Font.Bold = true;
            migrantRange.CellStyle.Font.Size = 16;

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
    }
}