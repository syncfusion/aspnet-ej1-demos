#region Copyright Syncfusion Inc. 2001 - 2022
// Copyright Syncfusion Inc. 2001 - 2022. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
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
using System.Drawing;
using System.Drawing.Imaging;
using Syncfusion.XlsIO.Implementation;

namespace WebSampleBrowser.XlsIO
{
    public partial class WorksheetToHTML : System.Web.UI.Page
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

            // An existing workbook is opened.
            IWorkbook workbook = application.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath("NorthwindTemplate.xls", Request));

            // The first worksheet object in the worksheets collection is accessed.
            IWorksheet sheet = workbook.Worksheets[0];
            string fileName;

            if (this.sheetRBtn.Checked)
            {
                fileName = "WorksheetToHtml.html";
                sheet.SaveAsHtml(Server.MapPath(fileName));

                //// We may also set Image path and Text mode
                //HtmlSaveOptions options = new HtmlSaveOptions();
                //options.TextMode = HtmlSaveOptions.GetText.DisplayText;
                //options.ImagePath = @"..\..\Output\";

                //// Specify the HtmlSaveOptions when saving the sheet as Html
                //sheet.SaveAsHtml("Sample.html", options);
            }
            else
            {
                fileName = "WorkbookToHtml.html";
                workbook.SaveAsHtml(Server.MapPath(fileName), HtmlSaveOptions.Default);
            }


            ClientScript.RegisterClientScriptBlock(this.GetType(), "open", "window.open('" + fileName + "','_blank');", true);

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
            IWorkbook workbook = application.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath("NorthwindTemplate.xls", Request));
            workbook.Version = ExcelVersion.Excel97to2003;
            workbook.SaveAs("Template.xls", Response, ExcelDownloadType.PromptDialog);
        }
}
}