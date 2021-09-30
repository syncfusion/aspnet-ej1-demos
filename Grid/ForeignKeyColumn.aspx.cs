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
using Syncfusion.JavaScript.Models;

namespace WebSampleBrowser.Grid
{
    public partial class ForeignKeyColumn : System.Web.UI.Page
    {
        List<Orders> order = new List<Orders>();
        List<Employee> employee = new List<Employee>(); 
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataSource();
        }

        private void BindDataSource()
        {
            int code = 10000;
            for (int i = 1; i < 10; i++)
            {
                order.Add(new Orders(code + 1, "ALFKI", i + 2, 2.3 * i, "Berlin","Germany"));
                order.Add(new Orders(code + 2, "ANATR", i + 0, 3.3 * i, "Madrid","Spain"));
                order.Add(new Orders(code + 3, "ANTON", i + 4, 4.3 * i, "Cholchester","UK"));
                order.Add(new Orders(code + 4, "BLONP", i + 1, 5.3 * i, "Marseille","France"));
                order.Add(new Orders(code + 5, "BOLID", i + 3, 6.3 * i, "Tsawassen","Canada"));
                code += 5;
            }
            this.OrdersGrid.DataSource = order;
            this.OrdersGrid.DataBind();
           
                employee.Add(new Employee(1, "Michael"));
                employee.Add(new Employee(2, "Anne"));
                employee.Add(new Employee(3, "Janet"));
                employee.Add(new Employee(4, "Andrew"));
                employee.Add(new Employee(5, "Margaret"));
                employee.Add(new Employee(6, "Nancy"));
                employee.Add(new Employee(7, "Robert"));
                employee.Add(new Employee(8, "Laura"));
                employee.Add(new Employee(9, "Steven"));
                employee.Add(new Employee(10, "James"));
                employee.Add(new Employee(11, "Smith"));
                employee.Add(new Employee(12, "Jhonson"));
                employee.Add(new Employee(13, "George"));

            var index = this.OrdersGrid.Columns.FindIndex(col => col.Field == "EmployeeID");
            this.OrdersGrid.Columns.ElementAt(index).DataSource = employee;
        }

        [Serializable]
        public class Orders
        {
            public Orders()
            {

            }
            public Orders(long OrderId, string CustomerId, int EmployeeId, double Freight, string ShipCity, string ShipCountry)
            {
                this.OrderID = OrderId;
                this.CustomerID = CustomerId;
                this.EmployeeID = EmployeeId;
                this.Freight = Freight;
                this.ShipCity = ShipCity;
                this.ShipCountry = ShipCountry;
            }
            public long OrderID { get; set; }
            public string CustomerID { get; set; }
            public int EmployeeID { get; set; }
            public double Freight { get; set; }
            public string ShipCity { get; set; }
            public string ShipCountry { get; set; }
        }

        [Serializable]
        public class Employee
        {
            public Employee()
            {

            }
            public Employee(int EmployeeId, string FirstName)
            {
                this.EmployeeID = EmployeeId;
                this.FirstName = FirstName;
            }
            public int EmployeeID { get; set; }
            public string FirstName { get; set; }
        }
    }
}