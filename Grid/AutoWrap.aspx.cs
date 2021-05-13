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

namespace WebSampleBrowser.Grid
{
    public partial class AutoWrap : System.Web.UI.Page
    {
        List<Orders> order = new List<Orders>();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataSource();
        }

        private void BindDataSource()
        {
            int code = 10000;
            for (int i = 1; i < 10; i++)
            {
                order.Add(new Orders(code + 1, "TOMSP", i + 0, 2.3 * i, "Münster", "Toms Spezialitäten", new DateTime(1991, 05, 15), "Germany", "44087", false));
                order.Add(new Orders(code + 2, "HANAR", i + 2, 3.3 * i, "Rio de Janeiro", "Hanari Carnes", new DateTime(1990, 04, 04), "Brazil", "05454-876", true));
                order.Add(new Orders(code + 3, "VICTE", i + 1, 4.3 * i, "Lyon", "Victuailles en stock", new DateTime(1957, 11, 30), "France", "69004", true));
                order.Add(new Orders(code + 4, "VINET", i + 3, 5.3 * i, "Reims", "Vins et alcools Chevalier", new DateTime(1930, 10, 22), "France", "51100", true));
                order.Add(new Orders(code + 5, "SUPRD", i + 4, 6.3 * i, "Charleroi", "Suprêmes délices", new DateTime(1953, 02, 18), "Belgium", "B-6000", false));
                code += 5;
            }
            this.OrdersGrid.DataSource = order;
            this.OrdersGrid.DataBind();
        }

        [Serializable]
        public class Orders
        {
            public Orders()
            {

            }
            public Orders(long OrderId, string CustomerId, int EmployeeId, double Freight, string ShipCity, string ShipName,
                DateTime OrderDate, string ShipCountry, string ShipPostalCode, bool Verified)
            {
                this.OrderID = OrderId;
                this.CustomerID = CustomerId;
                this.EmployeeID = EmployeeId;
                this.Freight = Freight;
                this.ShipCity = ShipCity;
                this.ShipName = ShipName;
                this.OrderDate = OrderDate;
                this.ShipCountry = ShipCountry;
                this.ShipPostalCode = ShipPostalCode;
                this.Verified = Verified;
            }
            public long OrderID { get; set; }
            public string CustomerID { get; set; }
            public int EmployeeID { get; set; }
            public double Freight { get; set; }
            public string ShipCity { get; set; }
            public string ShipName { get; set; }
            public DateTime OrderDate { get; set; }
            public string ShipCountry { get; set; }
            public string ShipPostalCode { get; set; }
            public bool Verified { get; set; }
        }
    }
}