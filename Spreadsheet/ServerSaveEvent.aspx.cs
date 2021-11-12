#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.JavaScript.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.SpreadsheetASP
{
    public partial class ServerSaveEvent : System.Web.UI.Page
    {
        private List<Orders> order = new List<Orders>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDataSource();
                ViewState["DataSource"] = order;
            }
        }

        private void BindDataSource()
        {
            int code = 10000;
            for (int i = 1; i <= 20; i++)
            {
                order.Add(new Orders(code + 1, "TOMSP", i + 0, "Münster", "Toms Spezialitäten", "Germany"));
                order.Add(new Orders(code + 2, "HANAR", i + 2, "Rio de Janeiro", "Hanari Carnes", "Brazil"));
                order.Add(new Orders(code + 3, "VICTE", i + 1, "Lyon", "Victuailles en stock", "France"));
                order.Add(new Orders(code + 4, "VINET", i + 3, "Reims", "Vins et alcools Chevalier", "France"));
                order.Add(new Orders(code + 5, "SUPRD", i + 4, "Charleroi", "Suprêmes délices", "Belgium"));
                code += 5;
            }
            this.FlatSpreadsheet.Sheets[0].RangeSetting[0].Datasource = order;
        }

        [Serializable]
        public class Orders
        {
            public Orders()
            {

            }
            public Orders(long OrderId, string CustomerId, int EmployeeId, string ShipCity, string ShipName, string ShipCountry)
            {
                this.OrderID = OrderId.ToString();
                this.CustomerID = CustomerId;
                this.EmployeeID = EmployeeId.ToString();
                this.ShipName = ShipName;
                this.ShipCity = ShipCity;
                this.ShipCountry = ShipCountry;
            }
            public string OrderID { get; set; }
            public string CustomerID { get; set; }
            public string EmployeeID { get; set; }
            public string ShipCity { get; set; }
            public string ShipName { get; set; }
            public string ShipCountry { get; set; }
        }

        public string span = "<span class='serverEvent' style='display: inline-block;'>Spreadsheet <span class='eventTitle'>";

        protected void Spreadsheet_ServerCellSave(object sender, SpreadsheetEventArgs e)
        {
            List<Orders> data = ViewState["DataSource"] as List<Orders>;
            Dictionary<string, object> KeyVal = e.Arguments as Dictionary<string, object>;
            var rowIdx = Convert.ToInt32(KeyVal["rowIndex"]);

            if (e.EventType == "cellSave" && rowIdx < data.Count)
            {
                Orders record = data[rowIdx];
                var colIdx = Convert.ToInt32(KeyVal["colIndex"]);
                if (colIdx < record.GetType().GetProperties().Length)
                {
                    var value = KeyVal["value"];
                    string colName = record.GetType().GetProperties()[Convert.ToInt32(KeyVal["colIndex"])].Name;
                    if (colName == "OrderID")
                        record.OrderID = Convert.ToString(value);
                    else if (colName == "CustomerID")
                        record.CustomerID = Convert.ToString(value);
                    else if (colName == "EmployeeID")
                        record.EmployeeID = Convert.ToString(value);
                    else if (colName == "ShipCity")
                        record.ShipCity = Convert.ToString(value);
                    else if (colName == "ShipCountry")
                        record.ShipCountry = Convert.ToString(value);
                    else if (colName == "ShipName")
                        record.ShipName = Convert.ToString(value);
                }
            }
            ViewState["DataSource"] = data;
            this.FlatSpreadsheet.Sheets[0].RangeSetting[0].Datasource = data;
            serverEvent.InnerHtml = serverEvent.InnerHtml + span + "cell Save</span> event called</span><hr>";
        }

        protected void Clear_OnClick(object sender, ButtonEventArgs e)
        {
            this.FlatSpreadsheet.Sheets[0].RangeSetting[0].Datasource = ViewState["DataSource"] as List<Orders>;
            serverEvent.InnerHtml = "";
        }
    }
}