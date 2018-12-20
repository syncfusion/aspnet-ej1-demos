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
using System.Data.OleDb;
using System.IO;
using System.Drawing;
using System.Collections;
using System.Globalization;

namespace WebSampleBrowser.XlsIO
{
    public partial class StockPortFolio : System.Web.UI.Page
    {
        #region Constants
        /// <summary>
        /// Specifies database connection string
        /// </summary>
        private string conString;
        /// <summary>
        /// Specifies number of the first row in data grid in first worksheet.
        /// </summary>
        private const int DEF_FST_ROW_NUM_FS = 38;
        /// <summary>
        /// Specifies number of the first row in data grid in first worksheet.
        /// </summary>
        private const int DEF_FST_ROW_NUM_SC = 25;
        #endregion

        #region Fields
        /// <summary>
        /// DataSet.
        /// </summary>
        private DataSet ds;
        /// <summary>
        /// Specifies workbook.
        /// </summary>
        private IWorkbook myWorkbook;
        /// <summary>
        /// Image for ChartArea background.
        /// </summary>
        private string userImage = null;
        /// <summary>
        /// Data directory
        /// </summary>
        private DirectoryInfo dataDirectory = null;
        /// <summary>
        /// Report's directory.
        /// </summary>
        private string reportDirectory = null;
        #endregion

        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                CheckBoxList1.Items[0].Selected = true;
                CheckBoxList1.Items[2].Selected = true;
                CheckBoxList1.Items[4].Selected = true;
            }

            // Create the DataSet
            ds = new DataSet();

            string path = XlsIOHelper.ResolveApplicationDataPath("Database.mdb",Request);

            dataDirectory = new DirectoryInfo(path);
            conString = @"Provider=Microsoft.JET.OLEDB.4.0;" + @"data source=" + dataDirectory.FullName;

            // Create an open the connection
            OleDbConnection conn = new OleDbConnection(conString);
            conn.Open();

            // Create the adapter and fill the DataSet
            OleDbCommand command = new OleDbCommand(@"SELECT Min(Date) as MinDate, Max(Date) as MaxDate FROM StockData", conn);

            OleDbDataAdapter adapter = new OleDbDataAdapter(command);
            adapter.Fill(ds);

            DateTime minDate = DateTime.Parse(ds.Tables[0].Rows[0]["MinDate"].ToString().Trim(), CultureInfo.InvariantCulture);
            DateTime maxDate = DateTime.Parse(ds.Tables[0].Rows[0]["MaxDate"].ToString().Trim(), CultureInfo.InvariantCulture);

            // Close the connection
            conn.Close();
        }
        #endregion

        #region Create Report
        protected void Button1_Click(object sender, EventArgs e)
        {
            DateTime MaxDate = new DateTime(2008, 1, 29);
            DateTime MinDate = new DateTime(2008, 1, 1);
            if (Calendar2.SelectedDate > MaxDate || Calendar2.SelectedDate < MinDate || Calendar1.SelectedDate < MinDate || Calendar1.SelectedDate > MaxDate)
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Selected Date is not valid.Please select the date between 1st Jan 2008 and 29th Jan 2008!');", true);
            else
            {
                ExcelEngine excelEngine = new ExcelEngine();
                IApplication application = excelEngine.Excel;
                // A new workbook is created.[Equivalent to creating a new workbook in Microsoft Excel]
                // The number of default worksheets is the application setting in Microsoft Excel.
                myWorkbook = excelEngine.Excel.Workbooks.Add(XlsIOHelper.ResolveApplicationDataPath("Template.xls", Request));
                ListItem[] StockList;// = new ListItem();
                //  ArrayList[] StockList;
                int index = 0;
                foreach (ListItem lItem in CheckBoxList1.Items)
                {
                    if (lItem.Selected)
                    {
                        index++;
                    }

                }
                StockList = new ListItem[index];
                int stockItem = 0;
                foreach (ListItem lItem in CheckBoxList1.Items)
                {
                    if (lItem.Selected)
                    {
                        StockList[stockItem] = lItem;
                        stockItem++;

                    }

                }
                IChart chart = myWorkbook.Worksheets[1].Charts[0];
                chart.PrimaryCategoryAxis.NumberFormat = "m/d/yyyy";
                chart.PrimaryValueAxis.NumberFormat = "\"$\"#,##0.00";
                chart.SecondaryValueAxis.NumberFormat = "\"$\"#,##0.00";
                chart.SecondaryValueAxis.TickLabelPosition = ExcelTickLabelPosition.TickLabelPosition_High;

                // Adding new worksheets in workbook's sheets collection
                for (int count = 1; count < StockList.Length; count++)
                {
                    myWorkbook.Worksheets.AddCopyAfter(myWorkbook.Worksheets[1], myWorkbook.Worksheets[0]);
                }

                // Adding hyperlinks to menu sheet 
                IWorksheet menu_sheet = myWorkbook.Worksheets[0];
                int InsertIndex = DEF_FST_ROW_NUM_SC - 3;

                menu_sheet.HyperLinks.RemoveAt(0);
                menu_sheet.Range["G21"].Text = "";

                for (int count = 0; count < StockList.Length; count++)
                {
                    menu_sheet.InsertRow(InsertIndex, 2, ExcelInsertOptions.FormatAsBefore);
                    IHyperLink report_hyperlink = menu_sheet.HyperLinks.Add(menu_sheet.Range["G" + InsertIndex + ":I" + InsertIndex]);
                    report_hyperlink.Type = ExcelHyperLinkType.Workbook;
                    report_hyperlink.Address = StockList[count].Text + "!A1";
                    report_hyperlink.TextToDisplay = StockList[count].Text;

                    InsertIndex += 2;
                }

                // Creating Stock report
                int itemIndex = 1;

                foreach (Object StockListItem in StockList)
                {
                    CreateStockReport(StockListItem.ToString(), itemIndex);
                    FillAnalysisPortfolioSheet(StockListItem.ToString());
                    itemIndex += 1;
                }
                myWorkbook.Worksheets[0].Activate();
                //Saving the workbook to disk.
               

                if (rBtnXls.Checked == true)
                {
                    myWorkbook.Version = ExcelVersion.Excel97to2003;
                    myWorkbook.SaveAs(reportDirectory + "\\Sample.xls", ExcelSaveType.SaveAsXLS, Response, ExcelDownloadType.PromptDialog);
                }
                else
                {
                    myWorkbook.Version = ExcelVersion.Excel2016;
                    myWorkbook.SaveAs(reportDirectory + "\\Sample.xlsx", ExcelSaveType.SaveAsXLS, Response, ExcelDownloadType.PromptDialog,ExcelHttpContentType.Excel2016);
                }               
                //No exception will be thrown if there are unsaved workbooks.
                excelEngine.ThrowNotSavedOnDestroy = false;
                excelEngine.Dispose();
            }
        }
        #endregion

        #region Helper Methods

        #region FillAnalysisPortfolioSheet
        private void FillAnalysisPortfolioSheet(string StockSymbol)
        {
            // Fill Portfolio Analysis sheet
            int AnalysisPortfolioSheetNum = myWorkbook.Worksheets.Count - 1;

            IWorksheet portf_analysis_sheet = myWorkbook.Worksheets[AnalysisPortfolioSheetNum];

            OleDbConnection conn = new OleDbConnection(conString);
            conn.Open();

            // Fill StockStyle
            ds.Tables.Clear();

            // Create the adapter and fill the DataSet
            OleDbCommand command = new OleDbCommand(@"select * from StockStyles", conn);

            OleDbDataAdapter adapter = new OleDbDataAdapter(command);
            adapter.Fill(ds);

            for (int count = 0; count < ds.Tables[0].Rows.Count; count++)
            {
                portf_analysis_sheet.Range["D" + (DEF_FST_ROW_NUM_SC + count)].Value = ds.Tables[0].Rows[count]["StockStyle"].ToString();
            }

            // Fill StockTypes
            ds.Tables.Clear();

            command = new OleDbCommand(@"select * from StockTypes", conn);

            adapter = new OleDbDataAdapter(command);
            adapter.Fill(ds);

            for (int count = 0; count < ds.Tables[0].Rows.Count; count++)
            {
                portf_analysis_sheet.Range["I" + (DEF_FST_ROW_NUM_SC + count)].Value = ds.Tables[0].Rows[count]["StockType"].ToString();
            }

            // Clear all tables in dataset
            ds.Tables.Clear();

            command = new OleDbCommand(@"select * from StockInfo where StockName = '" + StockSymbol + "'", conn);

            adapter = new OleDbDataAdapter(command);
            adapter.Fill(ds);

            int cell_num = DEF_FST_ROW_NUM_SC + Int32.Parse(ds.Tables[0].Rows[0]["StockStyle"].ToString()) - 1;

            int cell_value = 0;

            if (portf_analysis_sheet.Range["E" + cell_num.ToString()].Value.Length > 0)
                cell_value = Int32.Parse(portf_analysis_sheet.Range["E" + cell_num.ToString()].Value);

            cell_value += 1;
            portf_analysis_sheet.Range["E" + cell_num.ToString()].Value2 = cell_value;

            cell_num = DEF_FST_ROW_NUM_SC + Int32.Parse(ds.Tables[0].Rows[0]["StockType"].ToString()) - 1;

            cell_value = 0;

            if (portf_analysis_sheet.Range["E" + cell_num.ToString()].Value.Length > 0)
                cell_value = Int32.Parse(portf_analysis_sheet.Range["E" + cell_num.ToString()].Value);

            cell_value += 1;

            portf_analysis_sheet.Range["J" + cell_num.ToString()].Value2 = cell_value;

            // Close the connection
            conn.Close();
        }
        #endregion

        #region CreateStockReport
        private void CreateStockReport(string StockSymbol, int itemIndex)
        {
            // Clear all tables in dataset
            ds.Tables.Clear();

            // Create an open the connection
            OleDbConnection conn = new OleDbConnection(conString);
            conn.Open();

            // Create the adapter and fill the DataSet
            OleDbCommand command = new OleDbCommand(@"select Date, Volume, OpenPrice, HighPrice, LowPrice, ClosePrice from StockData where symbol = '"
               + StockSymbol + "' and Date between @FromDate and @ToDate order by Date", conn);

            command.Parameters.Add("@FromDate", OleDbType.Date).Value = Calendar1.SelectedDate;
            command.Parameters.Add("@ToDate", OleDbType.Date).Value = Calendar2.SelectedDate;

            OleDbDataAdapter adapter = new OleDbDataAdapter(command);
            adapter.Fill(ds);
            // Close the connection
            conn.Close();

            DataTable table = ds.Tables[0];

            if (table.Rows.Count > 0)
            {
                if (itemIndex > 1)
                    FillReport(itemIndex, table, StockSymbol, false);
                else
                    FillReport(1, table, StockSymbol, false);
            }
        }
        #endregion

        #region FillReport
        private void FillReport(int report, DataTable table, string StockSymbol, bool hasLegend)
        {
            IWorksheet reportSheet = myWorkbook.Worksheets[report];

            reportSheet.Name = StockSymbol;

            if (table.Rows.Count > 1)
                reportSheet.InsertRow(DEF_FST_ROW_NUM_FS + 1, table.Rows.Count - 1, ExcelInsertOptions.FormatAsBefore);
            // Inserting data into the spreadsheet.
            reportSheet.ImportDataTable(table, true, (DEF_FST_ROW_NUM_FS - 1), 3);

            int rownum = DEF_FST_ROW_NUM_FS - 1;

            reportSheet.Range["I3"].Text = StockSymbol;
            reportSheet.Range["C" + rownum.ToString()].Text = "Date";
            reportSheet.Range["D" + rownum.ToString()].Text = "Volume";
            reportSheet.Range["E" + rownum.ToString()].Text = "Open Price";
            reportSheet.Range["F" + rownum.ToString()].Text = "High Price";
            reportSheet.Range["G" + rownum.ToString()].Text = "Low Price";
            reportSheet.Range["H" + rownum.ToString()].Text = "Close Price";

            for (int count = 0; count < table.Rows.Count; count++)
            {
                string cellNum = (count + DEF_FST_ROW_NUM_FS).ToString();
                reportSheet.Range["I" + cellNum].Formula = "$H" + cellNum + "-$E" + cellNum;
            }

            IChartShapes charts = reportSheet.Charts;
            foreach (IChartShape chart in charts)
            {
                chart.DataRange = reportSheet.Range["C" + DEF_FST_ROW_NUM_FS + ":H" + (table.Rows.Count + (DEF_FST_ROW_NUM_FS - 1))];
                chart.ChartType = ExcelChartType.Stock_VolumeOpenHighLowClose;


                if (userImage != null && userImage.Length > 0)
                    chart.ChartArea.Fill.UserPicture(userImage);

                chart.Series[0].SerieFormat.LineProperties.LinePattern = ExcelChartLinePattern.Solid;
                chart.Series[0].SerieFormat.LineProperties.LineWeight = ExcelChartLineWeight.Narrow;
                chart.Series[0].SerieFormat.LineProperties.LineColor = Color.Blue;

                chart.Series[1].SerieFormat.LineProperties.LinePattern = ExcelChartLinePattern.Solid;
                chart.Series[1].SerieFormat.LineProperties.LineWeight = ExcelChartLineWeight.Narrow;
                chart.Series[1].SerieFormat.LineProperties.LineColor = Color.Blue;

                chart.HasLegend = hasLegend;
            }
        }
        #endregion

        #endregion

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Step 1 : Instantiate the spreadsheet creation engine.
            ExcelEngine excelEngine = new ExcelEngine();
            //Step 2 : Instantiate the excel application object.
            IApplication application = excelEngine.Excel;
            //A new workbook is created.[Equivalent to creating a new workbook in Microsoft Excel]
            //The new workbook will have 2 worksheets
            IWorkbook workbook = application.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath("Template.xls", Request));
            workbook.Version = ExcelVersion.Excel97to2003;
            workbook.SaveAs("Template.xls", Response, ExcelDownloadType.PromptDialog);
        }
}
}