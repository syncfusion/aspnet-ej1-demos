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
    public partial class Searching : System.Web.UI.Page
    {
        List<Orders> order = new List<Orders>();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataSource();
        }

        private void BindDataSource()
        {
            int orderId = 10000;
            int empId = 0;
            for (int i = 1; i < 9; i++)
            {
                order.Add(new Orders(orderId + 1, "VINET", empId + 1, 32.38, "Reims", true));
                order.Add(new Orders(orderId + 2, "TOMSP", empId + 2, 11.61, "Munster", false));
                order.Add(new Orders(orderId + 3, "ANATER", empId + 3, 45.34, "Berlin", true));
                order.Add(new Orders(orderId + 4, "ALFKI", empId + 4, 37.28, "Mexico", false));
                order.Add(new Orders(orderId + 5, "FRGYE", empId + 5, 67.00, "Colchester", true));
                order.Add(new Orders(orderId + 6, "JGERT", empId + 6, 23.32, "Newyork", true));
                orderId += 6;
                empId += 6;
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
            public Orders(int orderId, string customerId, int empId, double freight, string shipCity, bool verified)
            {
                this.OrderID = orderId;
                this.CustomerID = customerId;
                this.EmployeeID = empId;
                this.Freight = freight;
                this.ShipCity = shipCity;
                this.Verified = verified;
            }
            public int OrderID { get; set; }
            public string CustomerID { get; set; }
            public int EmployeeID { get; set; }
            public double Freight { get; set; }
            public string ShipCity { get; set; }
            public bool Verified { get; set; }
        }
    }
}