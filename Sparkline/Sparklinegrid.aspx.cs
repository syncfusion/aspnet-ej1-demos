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

namespace WebSampleBrowser.Sparkline
{
    public partial class Sparklinegrid : System.Web.UI.Page
    {
        List<Orders> order = new List<Orders>();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataSource();
        }

        private void BindDataSource()
        {
            order.Add(new Orders(1, "Nancy", "Davolio", new DateTime(1948, 12, 08), "USA"));
            order.Add(new Orders(2, "Andrew", "Fuller", new DateTime(1952, 02, 19), "USA"));
            order.Add(new Orders(3, "Janet", "Leverling", new DateTime(1963, 08, 30), "USA"));
            order.Add(new Orders(4, "Margaret", "Peacock", new DateTime(1937, 09, 19), "USA"));
            order.Add(new Orders(5, "Steven", "Buchanan", new DateTime(1955, 03, 04), "UK"));
            order.Add(new Orders(6, "Michael", "Suyama", new DateTime(1963, 07, 02), "UK"));
            order.Add(new Orders(7, "Robert", "King", new DateTime(1960, 05, 29), "UK"));
            order.Add(new Orders(8, "Laura", "Callahan", new DateTime(1958, 01, 09), "USA"));
            order.Add(new Orders(9, "Anne", "Dodsworth", new DateTime(1966, 01, 27), "UK"));

            this.EmployeesGrid.DataSource = order;
            this.EmployeesGrid.DataBind();
        }

        
    }
}