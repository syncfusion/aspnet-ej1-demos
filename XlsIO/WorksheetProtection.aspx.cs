#region Copyright Syncfusion Inc. 2001 - 2018
//
//  Copyright Syncfusion Inc. 2001 - 2018. All rights reserved.
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
    public partial class WorksheetProtection : System.Web.UI.Page
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
        /// Creates a workbook and protects worksheet
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

            sheet.Range["C5"].Text = "Worksheet protected with password 'syncfusion'";
            sheet.Range["C6"].Text = "You can't edit any cells other than A1 and A2";
            sheet.Range["C5"].CellStyle.Font.Bold = true;
            sheet.Range["C5"].CellStyle.Font.Size = 12;

            sheet.Range["C6"].CellStyle.Font.Bold = true;
            sheet.Range["C6"].CellStyle.Font.Size = 12;

            sheet.Range["C8"].Text = "For Excel 2003: Click 'Tools->Protection' to Unprotect the sheet.";
            sheet.Range["C8"].CellStyle.Font.Bold = true;
            sheet.Range["C8"].CellStyle.Font.Size = 12;

            sheet.Range["C10"].Text = "For Excel 2007 and above: Click 'Review Tab->Unprotect Sheet' to Unprotect the sheet.";
            sheet.Range["C10"].CellStyle.Font.Bold = true;
            sheet.Range["C10"].CellStyle.Font.Size = 12;

            sheet.Range["A1:A2"].Text = "You can edit this cell";
            sheet.Range["A1:A2"].CellStyle.Font.Bold = true;

            //Protecting Worksheet using Password
            sheet.Protect("syncfusion");

            //Unlocking the cells which are needed to be edited
            sheet.Range["A1"].CellStyle.Locked = false;
            sheet.Range["A2"].CellStyle.Locked = false;

            //Saving the workbook to disk.

            workbook.SaveAs("WorksheetProtectionTemplate.xls", ExcelSaveType.SaveAsXLS, Response, ExcelDownloadType.PromptDialog);


            //No exception will be thrown if there are unsaved workbooks. No use here since we are
            // saving the workbook.
            excelEngine.ThrowNotSavedOnDestroy = false;
            excelEngine.Dispose();
        }

        /// <summary>
        /// Unprotect and modify spreadsheet
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

            // Opening a Existing(Protected) Worksheet from a Workbook
            IWorkbook workbook = application.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath("WorksheetProtectionTemplate.xls", Request));
            //The first worksheet object in the worksheets collection is accessed.
            IWorksheet sheet = workbook.Worksheets[0];

            //Unprotecting( unlocking) Worksheet using the Password
            sheet.Unprotect("syncfusion");

            sheet.Range["C5"].Text = "Worksheet is Unprotected with password 'syncfusion' and changes are done";
            sheet.Range["C6"].Text = "You can edit any cell";
            sheet.Range["A1:A2"].Text = " ";

            sheet.Range["C5"].CellStyle.Font.Bold = true;
            sheet.Range["C5"].CellStyle.Font.Size = 12;

            sheet.Range["C8"].Text = "For Excel 2003: Click 'Tools->Protection' to view the Protection settings.";
            sheet.Range["C8"].CellStyle.Font.Bold = true;
            sheet.Range["C8"].CellStyle.Font.Size = 12;

            sheet.Range["C10"].Text = "For Excel 2007 and above: Click 'Review Tab->Protect Sheet' to view the Protection settings.";
            sheet.Range["C10"].CellStyle.Font.Bold = true;
            sheet.Range["C10"].CellStyle.Font.Size = 12;

            //Saving the workbook to disk.        
            workbook.SaveAs(Server.MapPath("Final.xls"), ExcelSaveType.SaveAsXLS, Response, ExcelDownloadType.PromptDialog);


            //No exception will be thrown if there are unsaved workbooks. No use here since we are
            // saving the workbook.
            excelEngine.ThrowNotSavedOnDestroy = false;
            excelEngine.Dispose();
        }
        #endregion
    }
}