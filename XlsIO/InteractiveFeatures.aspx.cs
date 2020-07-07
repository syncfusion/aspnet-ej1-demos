#region Copyright Syncfusion Inc. 2001 - 2020
//
//  Copyright Syncfusion Inc. 2001 - 2020. All rights reserved.
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
using System.Drawing;

namespace WebSampleBrowser.XlsIO
{
    public partial class InteractiveFeatures : System.Web.UI.Page
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

            if (this.rBtnXls.Checked)
                application.DefaultVersion = ExcelVersion.Excel97to2003;            
            else
                application.DefaultVersion = ExcelVersion.Excel2016;

            //A new workbook is created.[Equivalent to creating a new workbook in Microsoft Excel]
            //The new workbook will have 3 worksheets
            IWorkbook workbook = application.Workbooks.Create(3);
            //The first worksheet object in the worksheets collection is accessed.
            IWorksheet sheet = workbook.Worksheets[0];

            sheet.IsGridLinesVisible = false;

            sheet.Range["B2"].Text = "Interactive features";
            sheet.Range["B2"].CellStyle.Font.Bold = true;
            sheet.Range["B2"].CellStyle.Font.Size = 14;

            sheet.Range["A4"].Text = "Some Useful links";
            sheet.Range["A4"].CellStyle.Font.Bold = true;
            sheet.Range["A4"].CellStyle.Font.Size = 12;

            sheet.Range["A20"].Text = "Comments";
            sheet.Range["A20"].CellStyle.Font.Bold = true;
            sheet.Range["A20"].CellStyle.Font.Size = 12;

            sheet.Range["B5"].Text = "Feature page";
            sheet.Range["B7"].Text = "Support Email Id";
            sheet.Range["B9"].Text = "Samples";
            sheet.Range["B11"].Text = "Read the comment about XlsIO";
            sheet.Range["B13"].Text = "Read the Comment about Interactive features";
            sheet.Range["B20"].Text = "XlsIO";
            sheet.Range["B22"].Text = "Interactive features";

            #region Hyperlink
            //Creating Hyperlink for a Website
            IHyperLink hyperlink = sheet.HyperLinks.Add(sheet.Range["C5"]);
            hyperlink.Type = ExcelHyperLinkType.Url;
            hyperlink.Address = "http://www.syncfusion.com/products/windows-forms/xlsio";
            hyperlink.ScreenTip = "To know more About XlsIO go through this link";

            //Creating Hyperlink for e-mail
            IHyperLink hyperlink1 = sheet.HyperLinks.Add(sheet.Range["C7"]);
            hyperlink1.Type = ExcelHyperLinkType.Url;
            hyperlink1.Address = "mailto:support@syncfusion.com";
            hyperlink1.ScreenTip = "Send Mail to this id for your queries";

            //Creating Hyperlink for Opening Files using type as  File
            IHyperLink hyperlink2 = sheet.HyperLinks.Add(sheet.Range["C9"]);
            hyperlink2.Type = ExcelHyperLinkType.File;

            hyperlink2.Address = Server.MapPath(@".\.\.\");
            hyperlink2.ScreenTip = "File path";
            hyperlink2.TextToDisplay = "Hyperlink for files using File as type";

            //Creating Hyperlink to another cell using type as Workbook
            IHyperLink hyperlink4 = sheet.HyperLinks.Add(sheet.Range["C11"]);
            hyperlink4.Type = ExcelHyperLinkType.Workbook;
            hyperlink4.Address = "Sheet1!B20";
            hyperlink4.ScreenTip = "Click here";
            hyperlink4.TextToDisplay = "Click here to move to the cell with Comments about XlsIO";

            IHyperLink hyperlink5 = sheet.HyperLinks.Add(sheet.Range["C13"]);
            hyperlink5.Type = ExcelHyperLinkType.Workbook;
            hyperlink5.Address = "Sheet1!B22";
            hyperlink5.ScreenTip = "Click here";
            hyperlink5.TextToDisplay = "Click here to move to the cell with Comments about this sample";

            #endregion

            #region Comments

            //Insert Comments
            //Adding comments to a cell.
            sheet.Range["B20"].AddComment().Text = "XlsIO is a Backoffice product with high performance!";

            //Add RichText Comments
            IRange range = sheet.Range["B22"];
            range.AddComment().RichText.Text = "Great Sample!";
            IRichTextString rtf = range.Comment.RichText;

            //Formatting first 4 characters
            IFont greyFont = workbook.CreateFont();
            greyFont.Bold = true;
            greyFont.Italic = true;
            greyFont.RGBColor = Color.FromArgb(333365);
            rtf.SetFont(0, 3, greyFont);

            //Formatting last 4 characters
            IFont greenFont = workbook.CreateFont();
            greenFont.Bold = true;
            greenFont.Italic = true;
            greenFont.RGBColor = Color.Green;
            rtf.SetFont(4, 7, greenFont);            

            #endregion

            sheet.UsedRange.AutofitColumns();
            sheet.UsedRange.AutofitRows();
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