#region Copyright Syncfusion Inc. 2001 - 2018
// Copyright Syncfusion Inc. 2001 - 2018. All rights reserved.
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

namespace WebSampleBrowser.XlsIO
{
    public partial class Tables : System.Web.UI.Page
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
        /// Creates spreadsheet with table.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            ExcelEngine excelEngine = new ExcelEngine();
            IApplication application = excelEngine.Excel;         
            application.DefaultVersion = ExcelVersion.Excel2016;

            IWorkbook workbook = application.Workbooks.Create(1);
            IWorksheet sheet = workbook.Worksheets[0];

            # region Table data
            // Create data
            sheet[1, 1].Text = "Products";
            sheet[1, 2].Text = "Qtr1";
            sheet[1, 3].Text = "Qtr2";

            sheet[2, 1].Text = "Alfreds Futterkiste";
            sheet[2, 2].Number = 744.6;
            sheet[2, 3].Number = 162.56;

            sheet[3, 1].Text = "Antonio Moreno Taqueria";
            sheet[3, 2].Number = 5079.6;
            sheet[3, 3].Number = 1249.2;

            sheet[4, 1].Text = "Around the Horn";
            sheet[4, 2].Number = 1267.5;
            sheet[4, 3].Number = 1062.5;

            sheet[5, 1].Text = "Bon app";
            sheet[5, 2].Number = 1418;
            sheet[5, 3].Number = 756;

            sheet[6, 1].Text = "Eastern Connection";
            sheet[6, 2].Number = 4728;
            sheet[6, 3].Number = 4547.92;

            sheet[7, 1].Text = "Ernst Handel";
            sheet[7, 2].Number = 943.89;
            sheet[7, 3].Number = 349.6;
            # endregion

            // Create style for table number format
            IStyle style1 = workbook.Styles.Add("CurrencyFormat");
            style1.NumberFormat = "_($* #,##0.00_);_($* (#,##0.00);_($* \" - \"??_);_(@_)";

            // Apply number format
            sheet["B2:C8"].CellStyleName = "CurrencyFormat";

            // Create table
            IListObject table1 = sheet.ListObjects.Create("Table1", sheet["A1:C7"]);

            // Apply builtin style
            table1.BuiltInTableStyle = TableBuiltInStyles.TableStyleMedium9;

            // Total row
            table1.ShowTotals = true;
            table1.Columns[0].TotalsRowLabel = "Total";
            table1.Columns[1].TotalsCalculation = ExcelTotalsCalculation.Sum;
            table1.Columns[2].TotalsCalculation = ExcelTotalsCalculation.Sum;

            sheet.UsedRange.AutofitColumns();
            sheet.SetColumnWidth(2, 12.43);

            // Save and close the document          
            workbook.SaveAs("Sample.xlsx", Response, ExcelDownloadType.PromptDialog, ExcelHttpContentType.Excel2016);

            workbook.Close();
            excelEngine.Dispose();
        }
        # endregion
    }
}