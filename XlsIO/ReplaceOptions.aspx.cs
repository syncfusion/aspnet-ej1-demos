#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Syncfusion.XlsIO;
using System.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls.WebParts;
using System.Globalization;

namespace WebSampleBrowser.XlsIO
{
    public partial class ReplaceOptions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string[] findOptions = { "Berlin", "8000", "Representative", "3/6/2013" };
            for (int i = 0; i < findOptions.Length; i++)
            {
                FindList.Items.Add(findOptions[i]);
            }

        }
               
        protected void Button2_Click(object sender, EventArgs e)
        {
            #region Workbook Initialize

            ExcelEngine excelEngine = new ExcelEngine();
            //Get the path of the input file
            string inputPath = XlsIOHelper.ResolveApplicationDataPath("ReplaceOptions.xlsx", Request);
            IWorkbook workbook = excelEngine.Excel.Workbooks.Open(inputPath, ExcelOpenType.Automatic);
            IWorksheet sheet = workbook.Worksheets[0];

            ExcelFindOptions options = ExcelFindOptions.None;
            if (Check1.Checked == true) options |= ExcelFindOptions.MatchCase;
            if (Check2.Checked == true) options |= ExcelFindOptions.MatchEntireCellContent;

            sheet.Replace(FindList.SelectedItem.ToString(), textbox1.Text, options);

            //Saving the workbook to disk.
            workbook.SaveAs("ReplaceOptions.xlsx", Response, ExcelDownloadType.PromptDialog, ExcelHttpContentType.Excel2016);

            workbook.Close();
            excelEngine.Dispose();

            #endregion
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Step 1 : Instantiate the spreadsheet creation engine.
            ExcelEngine excelEngine = new ExcelEngine();

            //Step 2 : Instantiate the excel application object.
            IApplication application = excelEngine.Excel;

            //Open an existing spreadsheet which will be used as a template for generating the new spreadsheet.
            //After opening, the workbook object represents the complete in-memory object model of the template spreadsheet.
            IWorkbook workbook = excelEngine.Excel.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath(@"ReplaceOptions.xlsx", Request), ExcelOpenType.Automatic);

            workbook.SaveAs("InputTemplate.xlsx", Response, ExcelDownloadType.PromptDialog);
            workbook.Close();
        }
    }
}
