#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
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
using Syncfusion.EJ.Export;
using Syncfusion.XlsIO;

namespace WebSampleBrowser.Dashboard
{
    public partial class SpreadsheetTemplate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDataSource();
            }
        }

        private void BindDataSource()
        {
            var dataSource = GetLoanDetails().ToList();
            var sampleData = GetPaymentDetails().ToList();
            this.Spreadsheet1.Sheets[0].RangeSetting[0].Datasource = dataSource;
            this.Spreadsheet1.Sheets[0].RangeSetting[1].Datasource = sampleData;
        }



        private List<ItemDetail> GetLoanDetails()
        {
            List<ItemDetail> Items = new List<ItemDetail>();
            Items.Add(new ItemDetail() { DATE = "1/2/2013", ITEM = "January payment", AMOUNT = 321, CHECK = 1055, REMARKS = "Good" });
            Items.Add(new ItemDetail() { DATE = "2/2/2013", ITEM = "February payment", AMOUNT = 451, CHECK = 1062, REMARKS = "Average" });
            return Items;
        }
        public class ItemDetail
        {
            public string DATE { get; set; }
            public string ITEM { get; set; }
            public int AMOUNT { get; set; }
            public int CHECK { get; set; }
            public string REMARKS { get; set; }
        }

        private List<paymentDetail> GetPaymentDetails()
        {
            List<paymentDetail> Items = new List<paymentDetail>();
            Items.Add(new paymentDetail() { DATE = "1/5/2013", ITEM = "Oil change", COST = 45, ODOM = 10567, REMARKS = "Average" });
            Items.Add(new paymentDetail() { DATE = "1/18/2013", ITEM = "Service", COST = 91, ODOM = 11420, REMARKS = "Bad" });
            Items.Add(new paymentDetail() { DATE = "3/1/2013", ITEM = "Alignment", COST = 88, ODOM = 12889, REMARKS = "Good" });
            return Items;
        }
        public class paymentDetail
        {
            public string DATE { get; set; }
            public string ITEM { get; set; }
            public int COST { get; set; }
            public int ODOM { get; set; }
            public string REMARKS { get; set; }
        }

        protected void Spreadsheet_ServerExcelExporting(object sender, Syncfusion.JavaScript.Web.SpreadsheetEventArgs e)
        {
            var args = e.Arguments;
            string password = args["password"].ToString();
            string sheetModel = args["sheetModel"].ToString();
            string sheetData = args["sheetData"].ToString();
            string fileName = args["fileName"].ToString();
			
            if (!string.IsNullOrEmpty(password)) 
                Spreadsheet.Save(sheetModel, sheetData, fileName, ExportFormat.XLSX, ExcelVersion.Excel2013, password);
            else
                Spreadsheet.Save(sheetModel, sheetData, fileName, ExportFormat.XLSX, ExcelVersion.Excel2013);
        }

        protected void Spreadsheet_ServerCsvExporting(object sender, Syncfusion.JavaScript.Web.SpreadsheetEventArgs e)
        {
            var args = e.Arguments;
            Spreadsheet.Save(args["sheetModel"].ToString(), args["sheetData"].ToString(), args["fileName"].ToString(), ExportFormat.CSV);
        }

        protected void Spreadsheet_ServerPdfExporting(object sender, Syncfusion.JavaScript.Web.SpreadsheetEventArgs e)
        {
            var args = e.Arguments;
            
            Spreadsheet.Save(args["sheetModel"].ToString(), args["sheetData"].ToString(), args["fileName"].ToString(), ExportFormat.PDF);
        }
    }
}