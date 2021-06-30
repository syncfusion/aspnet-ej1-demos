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
    public partial class ResizetoFit : System.Web.UI.Page
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
                order.Add(new Orders(code + 1, "TOMSP", i + 0, new DateTime(1991, 05, 15), 2.3 * i, "Toms Spezialitäten", "Münster" ));
                order.Add(new Orders(code + 2, "HANAR", i + 2, new DateTime(1990, 04, 04), 3.3 * i, "Hanari Carnes", "Rio de Janeiro"));
                order.Add(new Orders(code + 3, "VICTE", i + 1, new DateTime(1957, 11, 30), 4.3 * i, "Victuailles en stock", "Lyon"));
                order.Add(new Orders(code + 4, "VINET", i + 3, new DateTime(1930, 10, 22), 5.3 * i, "Vins et alcools Chevalier", "Reims" ));
                order.Add(new Orders(code + 5, "SUPRD", i + 4, new DateTime(1953, 02, 18), 6.3 * i, "Suprêmes délices", "Charleroi"));
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
            public Orders(long OrderId, string CustomerId, int EmployeeId, DateTime OrderDate, double Freight, string ShipName, string ShipCity)
            {
                this.OrderID = OrderId;
                this.CustomerID = CustomerId;
                this.EmployeeID = EmployeeId;
                this.OrderDate = OrderDate;
                this.Freight = Freight;
                this.ShipName = ShipName;
                this.ShipCity = ShipCity;
            }
            public long OrderID { get; set; }
            public string CustomerID { get; set; }
            public int EmployeeID { get; set; }
            public DateTime OrderDate { get; set; }
            public double Freight { get; set; }
            public string ShipName { get; set; }
            public string ShipCity { get; set; }
        }
    }
}