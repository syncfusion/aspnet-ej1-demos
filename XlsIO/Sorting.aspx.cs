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

namespace WebSampleBrowser.XlsIO
{
    public partial class Sorting : System.Web.UI.Page
    {
       
        const string Descending = "Descending";
        const string OnBottom = "OnBottom";
        const string OnTop = "OnTop";
        const string Ascending = "Ascending";
        SortOn sortOn;
        
        ExcelEngine excelEngine;
        OrderBy orderBy;

        # region Page Load
        /// <summary>
        /// Handles the page load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                ddlSortOn.Items.Add("FontColor");
                ddlSortOn.Items.Add("CellColor");
                string[] columnNames = { "ID", "Name", "DOJ" };
                cmbAlgorithm0.Items.Add("None");
                cmbAlgorithm1.Items.Add("None");
                cmbAlgorithm2.Items.Add("None");
                foreach (string columnName in columnNames)
                {
                    cmbAlgorithm0.Items.Add(columnName);
                    cmbAlgorithm1.Items.Add(columnName);
                    cmbAlgorithm2.Items.Add(columnName);

                }
                rdbAscending.Checked = true;
                RadioButton1.Checked = true;
                cmbAlgorithm0.SelectedIndex = 1;
            }
            excelEngine = new ExcelEngine();
        }
        # endregion

        # region Events
        protected void cmbAlgorithm_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        /// <summary>
        /// Creates spreadsheet
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {

        }
        protected void btnSort_Click(object sender, EventArgs e)
        {
            string fileName = "output.xlsx";
            orderBy = (rdbDescending.Checked) ? OrderBy.Descending : OrderBy.Ascending;
            SortValues(fileName);

        }

        # endregion

        # region Helpher Methods
        private void SortColor(string outFileName)
        {
            IWorkbook book = excelEngine.Excel.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath(@"SortingData.xlsx", Request), ExcelOpenType.Automatic);
            book.Version = ExcelVersion.Excel2016;
            IWorksheet sheet = book.Worksheets[1];
            IRange range = sheet["A2:C50"];

            IDataSort sorter = book.CreateDataSorter();
            sorter.SortRange = range;
            ISortField field = sorter.SortFields.Add(2, sortOn, orderBy);
            field.Color = Color.Red;
            field = sorter.SortFields.Add(2, sortOn, orderBy);
            field.Color = Color.Blue;

            sorter.Sort();
            book.Worksheets.Remove(0);
            book.SaveAs(outFileName, Response, ExcelDownloadType.PromptDialog, ExcelHttpContentType.Excel2016);
            book.Close();
        }
        private void SortValues(string outFileName)
        {
            IWorkbook book = excelEngine.Excel.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath(@"SortingData.xlsx", Request), ExcelOpenType.Automatic);
            IWorksheet sheet = book.Worksheets[0];
            IRange range = sheet["A2:D51"];

            //Create the data sorter.
            IDataSort sorter = book.CreateDataSorter();
            //Specify the range to sort.
            sorter.SortRange = range;

            //Specify the sort field attributes (column index and sort order)
            if (cmbAlgorithm0.SelectedIndex != 0)
                sorter.SortFields.Add(((int)cmbAlgorithm0.SelectedIndex) - 1, SortOn.Values, orderBy);
            else
                sorter.SortFields.Add(((int)cmbAlgorithm0.SelectedIndex), SortOn.Values, orderBy);

            if (cmbAlgorithm1.SelectedIndex != 0)
                sorter.SortFields.Add(((int)cmbAlgorithm1.SelectedIndex) - 1, SortOn.Values, orderBy);
            if (cmbAlgorithm2.SelectedIndex != 0)
                sorter.SortFields.Add(((int)cmbAlgorithm2.SelectedIndex) - 1, SortOn.Values, orderBy);


            //sort the data based on the sort field attributes.
            sorter.Sort();
            book.Worksheets.Remove(1);
            book.SaveAs(outFileName, Response, ExcelDownloadType.PromptDialog, ExcelHttpContentType.Excel2016);

            book.Close();
        }

        # endregion
        protected void cmbAlgorithm_SelectedIndexChanged1(object sender, EventArgs e)
        {


        }
        protected void Button1_Click1(object sender, EventArgs e)
        {
            //Step 1 : Instantiate the spreadsheet creation engine.
            ExcelEngine excelEngine = new ExcelEngine();

            //Step 2 : Instantiate the excel application object.
            IApplication application = excelEngine.Excel;

            //Open an existing spreadsheet which will be used as a template for generating the new spreadsheet.
            //After opening, the workbook object represents the complete in-memory object model of the template spreadsheet.
            IWorkbook workbook = excelEngine.Excel.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath(@"SortingData.xlsx", Request), ExcelOpenType.Automatic);

            workbook.SaveAs("sample.xlsx", Response, ExcelDownloadType.PromptDialog);
            workbook.Close();
        }
        protected void btnSortColor_Click(object sender, EventArgs e)
        {
            string fileName = "output.xlsx";
            orderBy = (RadioButton1.Checked) ? OrderBy.OnTop : OrderBy.OnBottom;
            sortOn = (ddlSortOn.SelectedIndex == 0) ? SortOn.FontColor : SortOn.CellColor;
            SortColor(fileName);
        }
    }
}