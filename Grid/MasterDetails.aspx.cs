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
    public partial class MasterDetails : System.Web.UI.Page
    {
        private List<Orders> order = new List<Orders>();
        private List<Employee> employee = new List<Employee>();
        protected void Page_Load(object sender, EventArgs e)
        {
            OrderDetails();
            EmployeeDetails();
        }

        private void EmployeeDetails()
        {
            employee.Add(new Employee(1, "Nancy", "Davolia", "Sales Representative", new DateTime(1970, 12, 24), "USA"));
            employee.Add(new Employee(2, "Andrew", "Fuller", "Sales Representative", new DateTime(1974, 1, 4), "USA"));
            employee.Add(new Employee(3, "Janet", "Leverling", "Sales Representative", new DateTime(1977, 2, 7), "USA"));
            employee.Add(new Employee(4, "Margaret", "peacock", "Sales Representative", new DateTime(1979, 8, 16), "USA"));
            employee.Add(new Employee(5, "Stevan", "Bhuchanan", "Sales Representative", new DateTime(1980, 5, 20), "USA"));
            this.EmployeesGrid.DataSource = employee;
            this.EmployeesGrid.DataBind();
        }

        private void OrderDetails()
        {
                order.Add(new Orders(10001, "VINET", 1, 32.38, new DateTime(2014, 12, 25), "Reims"));
                order.Add(new Orders(10002, "TOMSP", 2, 11.61, new DateTime(2014, 12, 21), "Munster"));
                order.Add(new Orders(10003, "ANATER", 3, 45.34, new DateTime(2014, 10, 18), "Berlin"));
                order.Add(new Orders(10004, "ALFKI", 4, 37.28, new DateTime(2014, 11, 23), "Mexico"));
                order.Add(new Orders(10005, "FRGYE", 5, 67.00, new DateTime(2014, 05, 05), "Colchester"));
                order.Add(new Orders(10006, "ANATER", 1, 32.38, new DateTime(2014, 12, 25), "Munster"));
                order.Add(new Orders(10007, "ALFKI", 2, 12.61, new DateTime(2014, 12, 23), "Berlin"));
                order.Add(new Orders(10008, "VINET", 3, 48.34, new DateTime(2014, 10, 08), "Lisboa"));
                order.Add(new Orders(10009, "ALFKI", 4, 67.28, new DateTime(2014, 01, 23), "Portland"));
                order.Add(new Orders(10010, "VINET", 5, 127.00, new DateTime(2014, 05, 05), "Sevilla"));
                order.Add(new Orders(10011, "FRGYE", 1, 32.38, new DateTime(2014, 12, 23), "Rio de Janeiro"));
                order.Add(new Orders(10012, "ALFKI", 2, 44.61, new DateTime(2014, 11, 21), "London"));
                order.Add(new Orders(10013, "ANATER", 3, 45.34, new DateTime(2014, 10, 18), "Madrid"));
                order.Add(new Orders(10014, "VINET", 4, 87.28, new DateTime(2014, 10, 03), "Leipzig"));
                order.Add(new Orders(10015, "FRGYE", 5, 57.00, new DateTime(2014, 05, 05), "Bergamo"));
                order.Add(new Orders(10016, "VINET", 1, 42.38, new DateTime(2014, 12, 25), "Lander"));
                order.Add(new Orders(10017, "FRGYE", 2, 21.61, new DateTime(2014, 12, 21), "Seatle"));
                order.Add(new Orders(10018, "ANATER", 3, 45.34, new DateTime(2014, 10, 18), "Charleroi"));
                order.Add(new Orders(10019, "FRGYE", 4, 37.28, new DateTime(2014, 11, 23), "Graz"));
                order.Add(new Orders(10020, "ANATER", 5, 87.00, new DateTime(2014, 05, 06), "Bern"));
                order.Add(new Orders(10021, "FRGYE", 1, 32.38, new DateTime(2014, 12, 27), "Lyon"));
                order.Add(new Orders(10022, "ALFKI", 2, 61.61, new DateTime(2014, 12, 29), "Reims"));
                order.Add(new Orders(10023, "ANATER", 3, 25.34, new DateTime(2014, 10, 08), "Colchester"));
                order.Add(new Orders(10024, "ALFKI", 4, 57.28, new DateTime(2014, 12, 23), "Munster"));
                order.Add(new Orders(10025, "TOMSP", 5, 67.30, new DateTime(2014, 08, 05), "Berlin"));
            this.OrdersGrid.DataSource = order;
            this.OrdersGrid.DataBind();
        }

        [Serializable]
        public class Employee
        {
            public Employee()
            {

            }
            public Employee(int employeeId, string firstName, string lastName, string title, DateTime dob,
                string country)
            {
                this.EmployeeID = employeeId;
                this.FirstName = firstName;
                this.LastName = lastName;
                this.Title = title;
                this.BirthDate = dob;
                this.Country = country;
            }
            public int EmployeeID { get; set; }
            public string FirstName { get; set; }
            public string LastName { get; set; }
            public string Title { get; set; }
            public DateTime BirthDate { get; set; }
            public string Country { get; set; }
        }

        [Serializable]
        public class Orders
        {
            public Orders()
            {

            }
            public Orders(int orderId, string customerId, int empId, double freight, DateTime orderDate, string shipCity)
            {
                this.OrderID = orderId;
                this.CustomerID = customerId;
                this.EmployeeID = empId;
                this.Freight = freight;
                this.OrderDate = orderDate;
                this.ShipCity = shipCity;
            }
            public int OrderID { get; set; }
            public string CustomerID { get; set; }
            public int EmployeeID { get; set; }
            public double Freight { get; set; }
            public DateTime OrderDate { get; set; }
            public string ShipCity { get; set; }
        }
    }
}