#region Copyright Syncfusion Inc. 2001 - 2020
// Copyright Syncfusion Inc. 2001 - 2020. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Syncfusion.XlsIO;
using System.Drawing;

namespace WebSampleBrowser.XlsIO
{
    public partial class OleObject : System.Web.UI.Page
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
            application.DefaultVersion = ExcelVersion.Excel2016;

            //A new workbook is created.[Equivalent to creating a new workbook in Microsoft Excel]
            //The new workbook will have 3 worksheets
            IWorkbook workbook = application.Workbooks.Create(3);
            //The first worksheet object in the worksheets collection is accessed.
            IWorksheet sheet = workbook.Worksheets[0];

            sheet.IsGridLinesVisible = false;
            sheet.Pictures.AddPicture(2, 5, XlsIOHelper.ResolveApplicationImagePath(@"header.gif", Request));

            sheet["E5:M6"].Merge();
            sheet[5, 5].Text = "Syncfusion accept fax orders from customers worldwide. You can also order online through our secure web server.";
            sheet[5, 5].WrapText = true;

            sheet[8, 6].Text = "PDF Order Form";

            IOleObject oleObject1 = sheet.OleObjects.Add(XlsIOHelper.ResolveApplicationDataPath(@"FaxOrderForm.pdf", Request), System.Drawing.Image.FromFile(XlsIOHelper.ResolveApplicationImagePath(@"pdfIcon.jpg", Request)), OleLinkType.Embed);
            oleObject1.Location = sheet[8, 11];
            oleObject1.Size = new Size(100, 100);

            sheet[17, 6].Text = "Word Order Form";

            IOleObject oleObject2 = sheet.OleObjects.Add(XlsIOHelper.ResolveApplicationDataPath(@"FaxOrderForm.doc", Request), System.Drawing.Image.FromFile(XlsIOHelper.ResolveApplicationImagePath(@"wordIcon.jpg", Request)), OleLinkType.Embed);
            oleObject2.Location = sheet[17, 11];
            oleObject2.Size = new Size(100, 100);

            sheet[25, 5].Text = "Download the order form, print it out and fill in the required information.";

            // Save the file
            workbook.SaveAs("Sample.xlsx", Response, ExcelDownloadType.PromptDialog, ExcelHttpContentType.Excel2016);

            workbook.Close();
            excelEngine.Dispose();
        }
        #endregion
    }
}