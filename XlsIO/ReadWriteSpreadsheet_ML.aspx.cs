#region Copyright Syncfusion Inc. 2001-2021
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
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
using System.Drawing;
using Syncfusion.XlsIO;
using System.Diagnostics;

namespace WebSampleBrowser.XlsIO
{
    public partial class ReadWriteSpreadsheet_ML : System.Web.UI.Page
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
        /// Creates a spreadsheetML in Office 2003 format
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                //New instance of XlsIO is created.[Equivalent to launching Microsoft Excel with no workbooks open].
                //The instantiation process consists of two steps.

                //Step 1 : Instantiate the spreadsheet creation engine.
                ExcelEngine excelEngine = new ExcelEngine();
                //Step 2 : Instantiate the excel application object.
                IApplication application = excelEngine.Excel;

                //A new workbook is created.[Equivalent to creating a new workbook in Microsoft Excel]
                //The new workbook will have 3 worksheets
                IWorkbook workbook = excelEngine.Excel.Workbooks.Create(3);
                //The first worksheet object in the worksheets collection is accessed.
                IWorksheet sheet = workbook.Worksheets[0];

                //Insert some sample data with formatting
                Random r = new Random();

                for (int i = 1; i <= 9; i++)
                {
                    for (int j = 1; j < 10; j++)
                    {
                        sheet.Range[i, j].Text = string.Format("row{0} col{1}", i, j);
                        sheet.Range[i, j].CellStyle.Color = Color.FromArgb(r.Next(0, 255), r.Next(0, 255), r.Next(0, 255));
                        sheet.Range[i, j].CellStyle.Font.Bold = true;
                    }
                }

                //Save as SpreadsheetML.
                workbook.SaveAsXml(Server.MapPath("SampleSpreadsheetML.xml"), ExcelXmlSaveType.MSExcel);

                //Close the workbook.
                workbook.Close();

                //No exception will be thrown if there are unsaved workbooks.
                excelEngine.ThrowNotSavedOnDestroy = false;
                excelEngine.Dispose();

                this.Button2.Enabled = true;

                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('SpreadsheetML saved successfully!');", true);
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        /// <summary>
        /// Read spreadsheetML and then resave it as BIFF8
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

            //Open an existing spreadsheet which will be used as a template for generating the new spreadsheet.
            //After opening, the workbook object represents the complete in-memory object model of the template spreadsheet.
            IWorkbook workbook = excelEngine.Excel.Workbooks.OpenFromXml(Server.MapPath("SampleSpreadsheetML.xml"), ExcelXmlOpenType.MSExcel);
            //The first worksheet object in the worksheets collection is accessed.
            IWorksheet sheet = workbook.Worksheets[0];

            //We can make any modification if required.
            sheet.Range["A1"].CellStyle.Color = Color.Red;

            //Save as BIFF8
            workbook.SaveAs("Sample.xls", ExcelSaveType.SaveAsXLS, Response, ExcelDownloadType.PromptDialog);

            //Close the workbook.
            workbook.Close();

            //No exception will be thrown if there are unsaved workbooks.
            excelEngine.ThrowNotSavedOnDestroy = false;
            excelEngine.Dispose();
        }
        # endregion
    }
}