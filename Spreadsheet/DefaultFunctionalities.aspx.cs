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
using WebSampleBrowser.SpreadsheetASP.Model;
using Syncfusion.EJ.Export;
using Syncfusion.XlsIO;

namespace WebSampleBrowser.SpreadsheetASP
{
    public partial class DefaultFunctionalities : System.Web.UI.Page
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
            var dataSource = ItemData.GetAllItemDetails.ToList();
            this.FlatSpreadsheet.Sheets.Add(new Syncfusion.JavaScript.Models.Sheet()
            {
                Datasource = dataSource
            });
        }

        [Serializable]
        public class Orders
        {
            public Orders()
            {
            }
            public Orders(long OrderId, string CustomerId, int EmployeeId, string ShipCity, string ShipName, string ShipCountry)
            {
                this.OrderID = OrderId;
                this.CustomerID = CustomerId;
                this.EmployeeID = EmployeeId;
                this.ShipName = ShipName;
                this.ShipCity = ShipCity;
                this.ShipCountry = ShipCountry;
            }
            public long OrderID { get; set; }
            public string CustomerID { get; set; }
            public int EmployeeID { get; set; }
            public string ShipCity { get; set; }
            public string ShipName { get; set; }
            public string ShipCountry { get; set; }
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