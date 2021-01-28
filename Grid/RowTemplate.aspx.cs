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
    public partial class RowTemplate : System.Web.UI.Page
    {
        List<Orders> order = new List<Orders>();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataSource();
        }

        private void BindDataSource()
        {
            order.Add(new Orders(1, "Nancy", "Davolio","Sales Representative", new DateTime(1948, 12, 08),new DateTime(1992,05,01)));
            order.Add(new Orders(2, "Andrew", "Fuller","Vice President, Sales", new DateTime(1952, 02, 19),new DateTime(1992,08,14) ));
            order.Add(new Orders(3, "Janet", "Leverling","Sales Representative", new DateTime(1963, 08, 30),new DateTime(1992,04,01)));
            order.Add(new Orders(4, "Margaret", "Peacock",	"Sales Representative", new DateTime(1937, 09, 19),new DateTime(1993,05,03)));
            order.Add(new Orders(5, "Steven", "Buchanan",	"Sales Manager", new DateTime(1955, 03, 04),new DateTime(1993,10,17)));
            order.Add(new Orders(6, "Michael", "Suyama", "Sales Representative", new DateTime(1963, 07, 02), new DateTime(1993, 10, 17)));
            order.Add(new Orders(7, "Robert", "King", "Sales Representative",new DateTime(1960, 05, 29),new DateTime(1994,01,02)));
            order.Add(new Orders(8, "Laura", "Callahan", "Inside Sales Coordinator", new DateTime(1958, 01, 09),new DateTime(1994,03,05)));
            order.Add(new Orders(9, "Anne", "Dodsworth", "Sales Representative", new DateTime(1966, 01, 27), new DateTime(1994, 11, 15)));

            this.EmployeesGrid.DataSource = order;
            this.EmployeesGrid.DataBind();
        }

        [Serializable]
        public class Orders
        {
            public Orders()
            {

            }
            public Orders(int EmployeeID, string FirstName, string LastName, string Title, DateTime BirthDate, DateTime HireDate)
            {
                this.EmployeeID = EmployeeID;
                this.FirstName = FirstName;
                this.LastName = LastName;
                this.Title = Title;
                this.BirthDate = BirthDate;
                this.HireDate = HireDate;
            }
            public int EmployeeID { get; set; }
            public string FirstName { get; set; }
            public string LastName { get; set; }
            public string Title { get; set; }
            public DateTime BirthDate { get; set; }
            public DateTime HireDate { get; set; }
        }
    }
}