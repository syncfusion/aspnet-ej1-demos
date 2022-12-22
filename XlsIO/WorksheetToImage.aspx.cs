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

namespace WebSampleBrowser.XlsIO
{
    public partial class WorksheetToImage : System.Web.UI.Page
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
            application.DefaultVersion = ExcelVersion.Excel2016;

            // An existing workbook is opened.
            IWorkbook workbook = application.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath("WorkSheetToImage.xlsx", Request));

            // The first worksheet object in the worksheets collection is accessed.
            IWorksheet sheet = workbook.Worksheets["Pivot Table"];

            sheet.UsedRangeIncludesFormatting = false;
            int lastRow = sheet.UsedRange.LastRow + 1;
            int lastColumn = sheet.UsedRange.LastColumn + 1;

            System.Drawing.Image img;
            // Save the image.

            // Convert the worksheet to bitmap
            img = sheet.ConvertToImage(1, 1, lastRow, lastColumn, ImageType.Bitmap, null);
            img.Save(Server.MapPath("Sample.png"), ImageFormat.Png);

            ClientScript.RegisterClientScriptBlock(this.GetType(), "open", "window.open('Sample.png','_blank');", true);

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
            IWorkbook workbook = application.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath("WorkSheetToImage.xlsx", Request));
            workbook.Version = ExcelVersion.Excel2016;
            workbook.SaveAs("Template.xlsx", Response, ExcelDownloadType.PromptDialog);
        }
}
}