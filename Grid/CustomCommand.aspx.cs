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
    public partial class CustomCommand : System.Web.UI.Page
    {
        List<Orders> order = new List<Orders>();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataSource();
        }

        private void BindDataSource()
        {
            order.Add(new Orders(1, "Nancy", "Davolio", new DateTime(1992, 05, 01), "USA", new DateTime(1948, 12, 08), "Sales Representative", "Seattle", "98122"));
            order.Add(new Orders(2, "Andrew", "Fuller", new DateTime(1992, 08, 14), "USA", new DateTime(1952, 02, 19), "Vice President", "Tacoma", "98122"));
            order.Add(new Orders(3, "Janet", "Leverling", new DateTime(1992, 04, 01), "USA", new DateTime(1963, 08, 30), "Sales Representative", "Kirkland", "98033"));
            order.Add(new Orders(4, "Margaret", "Peacock", new DateTime(1993, 05, 03), "USA", new DateTime(1937, 09, 19), "Sales Representative", "Redmond", "98052"));
            order.Add(new Orders(5, "Steven", "Buchanan", new DateTime(1993, 10, 17), "UK", new DateTime(1955, 03, 04), "Sales Manager", "London", "SW1 8JR"));
            order.Add(new Orders(6, "Michael", "Suyama", new DateTime(1993, 10, 17), "UK", new DateTime(1963, 07, 02), "Sales Representative", "London", "EC2 7JR"));
            order.Add(new Orders(7, "Robert", "King", new DateTime(1994, 01, 02), "UK", new DateTime(1960, 05, 29), "Sales Representative", "London", "RG1 9SP"));
            order.Add(new Orders(8, "Laura", "Callahan", new DateTime(1994, 03, 05), "USA", new DateTime(1958, 01, 09), "Inside Sales Coordinator", "Seattle", "98105"));
            order.Add(new Orders(9, "Anne", "Dodsworth", new DateTime(1994, 11, 15), "UK", new DateTime(1966, 01, 27), "Sales Representative", "London", "WG2 7LT"));

            this.EmployeesGrid.DataSource = order;
            this.EmployeesGrid.DataBind();
        }

        [Serializable]
        public class Orders
        {
            public Orders()
            {

            }
            public Orders(int EmployeeId, string FirstName, string LastName, DateTime HireDate, string Country, DateTime BirthDate, string Title, string City, string Code)
            {
                this.EmployeeID = EmployeeId;
                this.FirstName = FirstName;
                this.LastName = LastName;
                this.HireDate = HireDate;
                this.Country = Country;
                this.BirthDate = BirthDate;
                this.Title = Title;
                this.City = City;
                this.PostalCode = Code;
            }
            public int EmployeeID { get; set; }
            public string FirstName { get; set; }
            public string LastName { get; set; }
            public DateTime HireDate { get; set; }
            public string Country { get; set; }
            public DateTime BirthDate { get; set; }
            public string Title { get; set; }
            public string City { get; set; }
            public string PostalCode { get; set; }
        }
    }
}