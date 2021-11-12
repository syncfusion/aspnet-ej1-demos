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
    public partial class gridGroupingAPI : System.Web.UI.Page
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
                order.Add(new Orders(code + 1, "ALFKI", 2.3 * i, true, "Alfred's Futterkiste"));
                order.Add(new Orders(code + 2, "ANATR", 3.3 * i, false, "Ana Trujillo Emparedados y helados"));
                order.Add(new Orders(code + 3, "ANTON", 4.3 * i, true, "Antonio Moreno Taqueria"));
                order.Add(new Orders(code + 4, "AROUT", 5.3 * i, false, "Berglunds snabkkop"));
                order.Add(new Orders(code + 5, "BERGS", 6.3 * i, false, "Bon app'"));
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
            public Orders(long OrderId, string CustomerId, double Freight,bool Verified, string ShipName)
            {
                this.OrderID = OrderId;
                this.CustomerID = CustomerId;
                this.Freight = Freight;
                this.Verified = Verified;
                this.ShipName = ShipName;
            }
            public long OrderID { get; set; }
            public string CustomerID { get; set; }
            public double Freight { get; set; }
            public bool Verified { get; set; }
            public string ShipName { get; set; }
        }
    }
}