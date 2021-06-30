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
    public partial class HeaderTemplate : System.Web.UI.Page
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
                order.Add(new Orders(code + 1, "ALFKI", i + 0, new DateTime(1991, 05, 15), "Germany","Münster"));
                order.Add(new Orders(code + 2, "ANATR", i + 2, new DateTime(1990, 04, 04), "Mexico", "Rio de Janeiro"));
                order.Add(new Orders(code + 3, "ANTON", i + 1, new DateTime(1957, 11, 30), "Sweden", "Lyon"));
                order.Add(new Orders(code + 4, "BLONP", i + 3, new DateTime(1930, 10, 22), "France", "Reims"));
                order.Add(new Orders(code + 5, "BOLID", i + 4, new DateTime(1953, 02, 18), "Spain", "Charleroi"));
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
            public Orders(long OrderId, string CustomerId, int EmployeeId, DateTime OrderDate, string ShipCountry, string ShipCity)
            {
                this.OrderID = OrderId;
                this.CustomerID = CustomerId;
                this.EmployeeID = EmployeeId;
                this.OrderDate = OrderDate;
                this.ShipCountry = ShipCountry;
                this.ShipCity = ShipCity;
            }
            public long OrderID { get; set; }
            public string CustomerID { get; set; }
            public int EmployeeID { get; set; }
            public DateTime OrderDate { get; set; }
            public string ShipCountry { get; set; }
            public string ShipCity { get; set; }
        }
    }
}