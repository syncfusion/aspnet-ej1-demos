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
    public partial class RealTimeBinding : System.Web.UI.Page
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
                order.Add(new Orders(code + 1, "TOMSP", i + 0, 2.3 * i, "Toms Spezialitäten", "Germany"));
                order.Add(new Orders(code + 2, "HANAR", i + 2, 3.3 * i, "Hanari Carnes", "Brazil"));
                order.Add(new Orders(code + 3, "VICTE", i + 1, 4.3 * i, "Victuailles en stock", "France"));
                order.Add(new Orders(code + 4, "VINET", i + 3, 5.3 * i, "Vins et alcools Chevalier", "France"));
                order.Add(new Orders(code + 5, "SUPRD", i + 4, 6.3 * i, "Suprêmes délices", "Belgium"));
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
            public Orders(long OrderId, string CustomerId, int EmployeeId, double Freight, string ShipName, string ShipCountry)
            {
                this.OrderID = OrderId;
                this.CustomerID = CustomerId;
                this.EmployeeID = EmployeeId;
                this.Freight = Freight;
                this.ShipName = ShipName;
                this.ShipCountry = ShipCountry;
            }
            public long OrderID { get; set; }
            public string CustomerID { get; set; }
            public int EmployeeID { get; set; }
            public double Freight { get; set; }
            public string ShipName { get; set; }
            public string ShipCountry { get; set; }
        }
    }
}