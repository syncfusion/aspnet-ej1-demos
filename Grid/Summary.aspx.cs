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
    public partial class Summary : System.Web.UI.Page
    {
        private List<Orders> order = new List<Orders>();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataSource();
        }

        private void BindDataSource()
        {
            int code = 10000;
            for (int i = 1; i < 10; i++)
            {
                order.Add(new Orders(code + 1, i + 0, "Berlin", "Alfreds Futterkiste", "Germany", 2.3*i));
                order.Add(new Orders(code + 2, i + 2, "Madrid", "Bólido Comidas preparadas", "Spain", 3.3*i));
                order.Add(new Orders(code + 3, i + 1, "Cholchester", "Around the Horn", "UK", 4.3*i));
                order.Add(new Orders(code + 4, i + 3, "Marseille", "Bon app'", "France", 5.3*i));
                order.Add(new Orders(code + 5, i + 4, "London", "B's Beverages", "UK", 6.3*i));
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
            public Orders(long OrderId, int EmployeeId, string ShipCity, string ShipName, string ShipCountry,
                double Freight)
            {
                this.OrderID = OrderId;
                this.EmployeeID = EmployeeId;
                this.ShipCity = ShipCity;
                this.ShipName = ShipName;
                this.ShipCountry = ShipCountry;
                this.Freight = Freight;
            }
            public long OrderID { get; set; }
            public int EmployeeID { get; set; }
            public string ShipCity { get; set; }
            public string ShipName { get; set; }
            public string ShipCountry { get; set; }
            public double Freight { get; set; }
        }
    }
}