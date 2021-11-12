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
    public partial class WorkBookProtection : System.Web.UI.Page
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
        /// Creates and protects workbook
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

            // Opening the Existing Worksheet from a Workbook
            IWorkbook workbook = application.Workbooks.Create(1);

            //The first worksheet object in the worksheets collection is accessed.
            IWorksheet sheet = workbook.Worksheets[0];

            sheet.Range["C5"].Text = "Workbook is protected with password 'syncfusion'";
            sheet.Range["C6"].Text = "You can't make changes to structure and window of the workbook.";
            sheet.Range["C5"].CellStyle.Font.Bold = true;
            sheet.Range["C5"].CellStyle.Font.Size = 12;

            sheet.Range["C6"].CellStyle.Font.Bold = true;
            sheet.Range["C6"].CellStyle.Font.Size = 12;

            sheet.Range["C8"].Text = "For Excel 2003: Click 'Tools->Protection' to unprotect the workbook.";
            sheet.Range["C8"].CellStyle.Font.Bold = true;
            sheet.Range["C8"].CellStyle.Font.Size = 12;

            sheet.Range["C10"].Text = "For Excel 2007 and above: Click 'Review Tab->Protect Workbook' to unprotect the workbook.";
            sheet.Range["C10"].CellStyle.Font.Bold = true;
            sheet.Range["C10"].CellStyle.Font.Size = 12;

            workbook.Protect(true, true, "syncfusion");

            //Saving the workbook to disk.

            workbook.SaveAs("Sample.xls", ExcelSaveType.SaveAsXLS, Response, ExcelDownloadType.PromptDialog);

        }

        /// <summary>
        /// Unprotects the workbook
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button2_Click(object sender, EventArgs e)
        {
            //New instance of XlsIO is created.[Equivalent to launching Microsoft Excel with no workbooks open].
            //The instantiation process consists of two steps.

            //Step 1 : Instantiate the spreadsheet creation engine.
            ExcelEngine excelEngine = new ExcelEngine();
            //Step 2 : Instantiate the excel application object.
            IApplication application = excelEngine.Excel;

            // Opening the encrypted Workbook.
            IWorkbook workbook = application.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath("ProtectedWorkbook.xls", Request));

            //Unprotecting( unlocking) Workbook using the Password
            workbook.Unprotect("syncfusion");

            //The first worksheet object in the worksheets collection is accessed.
            IWorksheet sheet = workbook.Worksheets[0];

            sheet.Range["C5"].Text = "Workbook is Unprotected with password 'syncfusion' and changes are done";
            sheet.Range["C6"].Text = "You can now edit the structure and window of this workbook.";

            sheet.Range["C5"].CellStyle.Font.Bold = true;
            sheet.Range["C5"].CellStyle.Font.Size = 12;

            sheet.Range["C8"].Text = "Click 'Tools->Protection' to view the Protection settings.";
            sheet.Range["C8"].CellStyle.Font.Bold = true;
            sheet.Range["C8"].CellStyle.Font.Size = 12;

            sheet.Range["C10"].Text = "For Excel 2007 and above: Click 'Review Tab->Protect Sheet' to view the Protection settings.";
            sheet.Range["C10"].CellStyle.Font.Bold = true;
            sheet.Range["C10"].CellStyle.Font.Size = 12;

            //Saving the workbook to disk.
            workbook.SaveAs("Final.xls", ExcelSaveType.SaveAsXLS, Response, ExcelDownloadType.PromptDialog);

        }
        # endregion
    }
}