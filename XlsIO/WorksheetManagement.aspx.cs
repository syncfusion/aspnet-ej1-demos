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
    public partial class WorksheetManagement : System.Web.UI.Page
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
            //New instance of Excel is created.[Equivalent to launching Microsoft Excel with no workbooks open].
            //The instantiation process consists of two steps.

            //Step 1 : Instantiate the spreadsheet creation engine.
            ExcelEngine excelEngine = new ExcelEngine();
            //Step 2 : Instantiate the excel object.
            IApplication application = excelEngine.Excel;

            //Open the Source WorkBook	
            IWorkbook sourceWorkbook = excelEngine.Excel.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath("SourceWorkbookTemplate.xls", Request));

            //Open the Destination WorkBook	
            IWorkbook destinationWorkbook = excelEngine.Excel.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath("DestinationWorkbookTemplate.xls", Request));

            //Copy the first worksheet from Source workbook to destination workbook.
            destinationWorkbook.Worksheets.AddCopy(sourceWorkbook.Worksheets[0]);

            //Activate the newly added worksheet in the destination workbook.
            destinationWorkbook.ActiveSheetIndex = 1;

            //Saving the workbook to disk.
            destinationWorkbook.SaveAs("Sample.xls", ExcelSaveType.SaveAsXLS, Response, ExcelDownloadType.PromptDialog);


            //No exception will be thrown if there are unsaved workbooks.
            excelEngine.ThrowNotSavedOnDestroy = false;
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
            IWorkbook workbook = application.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath("SourceWorkbookTemplate.xls", Request));
            workbook.Version = ExcelVersion.Excel97to2003;
            workbook.SaveAs("Template.xls", Response, ExcelDownloadType.PromptDialog);
        }
}
}