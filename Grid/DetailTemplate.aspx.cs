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
    public partial class DetailTemplate : System.Web.UI.Page
    {
        List<Orders> order = new List<Orders>();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataSource();
        }

        private void BindDataSource()
        {
            order.Add(new Orders(1, "Nancy", "Sales Representative", "Seattle", "USA"));
            order.Add(new Orders(2, "Andrew", "Vice President, Sales", "Tacoma", "USA"));
            order.Add(new Orders(3, "Janet", "Sales Representative", "Kirkland", "USA"));
            order.Add(new Orders(4, "Margaret", "Sales Representative", "Redmond", "USA"));
            order.Add(new Orders(5, "Steven", "Sales Manager", "London", "UK"));
            order.Add(new Orders(6, "Michael", "Sales Representative", "London", "UK"));
            order.Add(new Orders(7, "Robert", "Sales Representative", "London", "UK"));
            order.Add(new Orders(8, "Laura", "Inside Sales Coordinator", "Seattle", "USA"));
            order.Add(new Orders(9, "Anne", "Sales Representative", "London", "UK"));

            this.EmployeesGrid.DataSource = order;
            this.EmployeesGrid.DataBind();
        }

        [Serializable]
        public class Orders
        {
            public Orders()
            {

            }
            public Orders(int EmployeeId, string FirstName, string Title, string City, string Country)
            {

                this.EmployeeID = EmployeeId;
                this.FirstName = FirstName;
                this.Title = Title;
                this.City = City;
                this.Country = Country;
            }
            public int EmployeeID { get; set; }
            public string FirstName { get; set; }
            public string Title { get; set; }
            public string City { get; set; }
            public string Country { get; set; }
        }
    }
}