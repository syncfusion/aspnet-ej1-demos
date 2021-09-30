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
using Syncfusion.XlsIO;
using System.Drawing;

namespace WebSampleBrowser.XlsIO
{
    public partial class Performance : System.Web.UI.Page
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
            int rowCount = Convert.ToInt32(textBoxRows.Text);
            int colCount = Convert.ToInt32(textBoxColumns.Text);

            if (rBtnXls.Checked)
            {
                if (colCount > 256)
                {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Column count must be less than or equal to 256 for Excel 2003 format.');document.location='" + ResolveClientUrl("~/XlsIO/Performance.aspx") + "';</script>");
                    return;
                }
                if (rowCount > 65536)
                {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Row count must be less than or equal to 65,536 for Excel 2003 format.');document.location='" + ResolveClientUrl("~/XlsIO/Performance.aspx") + "';</script>");
                    return;
                }
            }
            if (rBtnXlsx.Checked)
            {
                if (rowCount > 100001)
                {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Row count must be less than or equal to 100,000.');document.location='" + ResolveClientUrl("~/XlsIO/Performance.aspx") + "';</script>");
                    return;
                }
                if (colCount > 151)
                {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Column count must be less than or equal to 151.');document.location='" + ResolveClientUrl("~/XlsIO/Performance.aspx") + "';</script>");
                    return;
                }
            }
           
                System.Diagnostics.Stopwatch watcher = new System.Diagnostics.Stopwatch();
                watcher.Start();
                //New instance of XlsIO is created.[Equivalent to launching Microsoft Excel with no workbooks open].
                //The instantiation process consists of two steps.

                //Step 1 : Instantiate the spreadsheet creation engine.
                ExcelEngine excelEngine = new ExcelEngine();
                //Step 2 : Instantiate the excel application object.
                IApplication application = excelEngine.Excel;

                //Setp 3 : Set the default version
                if (this.rBtnXls.Checked)
                    application.DefaultVersion = ExcelVersion.Excel97to2003;
                else
                    application.DefaultVersion = ExcelVersion.Excel2016;

                //Step 4 : Instantiate the Workbook object.
                IWorkbook workbook = application.Workbooks.Create(1);
                IWorksheet sheet = workbook.Worksheets[0];

                workbook.DetectDateTimeInValue = false;
            if (this.import.Checked)
            {
                workbook.Version = ExcelVersion.Excel2013;
                DataTable dataTable = new DataTable();
                for (int column = 1; column <= colCount; column++)
                {
                    dataTable.Columns.Add("Column: " + column.ToString(), typeof(int));
                }
                //Adding data into data table
                for (int row = 1; row < rowCount; row++)
                {
                    dataTable.Rows.Add();
                    for (int column = 1; column <= colCount; column++)
                    {
                        dataTable.Rows[row - 1][column - 1] = row * column;
                    }
                }
                sheet.ImportDataTable(dataTable, 1, 1, true, true);
            }
            else
            {
                IMigrantRange migrantRange = sheet.MigrantRange;


                for (int column = 1; column <= colCount; column++)
                {
                    migrantRange.ResetRowColumn(1, column);
                    migrantRange.Text = "Column: " + column.ToString();
                }

                //Writing Data using normal interface
                for (int row = 2; row <= rowCount; row++)
                {
                    //double columnSum = 0.0; 
                    for (int column = 1; column <= colCount; column++)
                    {
                        //Writing number
                        migrantRange.ResetRowColumn(row, column);
                        migrantRange.Number = row * column;
                    }
                }
            }
                //Saving the workbook to disk.

                if (rBtnXls.Checked == true)
                {
                    workbook.Version = ExcelVersion.Excel97to2003;
                    workbook.SaveAs("Sample.xls", Response, ExcelDownloadType.PromptDialog);
                }
                else
                {
                    workbook.Version = ExcelVersion.Excel2016;
                    workbook.SaveAs("Sample.xlsx", Response, ExcelDownloadType.PromptDialog, ExcelHttpContentType.Excel2016);
                }              

                workbook.Close();
                excelEngine.Dispose();

                LogDetails(watcher.Elapsed);
            
        }

        private void LogDetails(TimeSpan timeSpan)
        {
            string s = "Number of rows : " + textBoxRows.Text + "\r\n" + "Number of columns: " + textBoxColumns.Text + "\r\n";
            this.label1.Text = s + "\r\n" + "Time taken : " + timeSpan.Minutes + "Mins : " + timeSpan.Seconds + "secs : " + timeSpan.Milliseconds + "msec";
        }

        protected void rBtnXls_CheckedChanged(object sender, EventArgs e)
        {
            if (this.rBtnXls.Checked)
            {
                this.import.Checked = false;
                this.import.Enabled = false;
            }
        }

        protected void rBtnXlsx_CheckedChanged(object sender, EventArgs e)
        {
            if (!this.import.Enabled)
                this.import.Enabled = true;
        }
        # endregion

    }
}