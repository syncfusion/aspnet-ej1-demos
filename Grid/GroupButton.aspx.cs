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
    public partial class gridGroupbutton : System.Web.UI.Page
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
                order.Add(new Orders(code + 1, "ALFKI", i + 4, 2.3 * i, "Alfred's Futterkiste"));
                order.Add(new Orders(code + 2, "ANATR", i + 5, 3.3 * i, "Ana Trujillo Emparedados y helados"));
                order.Add(new Orders(code + 3, "ANTON", i + 3, 4.3 * i, "Antonio Moreno Taqueria"));
                order.Add(new Orders(code + 4, "AROUT", i + 2, 5.3 * i, "Berglunds snabkkop"));
                order.Add(new Orders(code + 5, "BERGS", i + 1, 6.3 * i, "Bon app'"));
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
            public Orders(long OrderId, string CustomerId, int EmployeeId, double Freight, string ShipName)
            {
                this.OrderID = OrderId;
                this.CustomerID = CustomerId;
                this.EmployeeID = EmployeeId;
                this.Freight = Freight;
                this.ShipName = ShipName;
            }
            public long OrderID { get; set; }
            public string CustomerID { get; set; }
            public int EmployeeID { get; set; }
            public double Freight { get; set; }
            public string ShipName { get; set; }
        }
    }
}