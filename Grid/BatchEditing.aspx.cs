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
    public partial class BatchEditing : System.Web.UI.Page
    {
        List<Orders> order = new List<Orders>();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataSource();
        }

        private void BindDataSource()
        {
            int orderId = 10643;
            int empId = 0;
            for (int i = 1; i < 9; i++)
            {
                order.Add(new Orders(orderId + 1, "ALFKI", empId + 1, new EmployeeInfo("507 - 20th Ave. E.Apt. 2A"), 32.38, "Alfreds Futterkiste ", "Germany"));
                order.Add(new Orders(orderId + 2, "ANATR", empId + 2, new EmployeeInfo("908 W. Capital Way"), 11.61, "Ana Trujillo Emparedados y helados", "Mexico"));
                order.Add(new Orders(orderId + 3, "ANTON", empId + 3, new EmployeeInfo("722 Moss Bay Blvd."), 45.34, "Antonio Moreno Taquería", "Mexico"));
                order.Add(new Orders(orderId + 4, "AROUT", empId + 4, new EmployeeInfo("4110 Old Redmond Rd."), 37.28, "Around the Horn", "UK"));
                order.Add(new Orders(orderId + 5, "BERGS", empId + 5, new EmployeeInfo("7 Houndstooth Rd."), 67.00, "Berglunds snabbköp", "Sweden"));
                order.Add(new Orders(orderId + 6, "BLONP", empId + 6, new EmployeeInfo("4726 - 11th Ave. N.E."), 23.32, "Blondel père et fils", "France"));
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
            public Orders(int orderId, string customerId, int empId, EmployeeInfo emp, double freight, string shipName, string shipCountry)
            {
                this.OrderID = orderId;
                this.CustomerID = customerId;
                this.EmployeeID = empId;
                this.Employee = emp;
                this.Freight = freight;
                this.ShipName = shipName;
                this.ShipCountry = shipCountry;
            }
            public int OrderID { get; set; }
            public string CustomerID { get; set; }
            public int EmployeeID { get; set; }
            public EmployeeInfo Employee { get; set; }
            public double Freight { get; set; }
            public string ShipName { get; set; }
            public string ShipCountry { get; set; }
        }
        public class EmployeeInfo
        {
            public string Address { get; set; }
            public EmployeeInfo(string Add)
            {
                this.Address = Add;
            }
        }
    }
}