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
    public partial class ColumnFormatting : System.Web.UI.Page
    {
        List<Orders> order = new List<Orders>();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataSource();
        }

        private void BindDataSource()
        {
            order.Add(new Orders(3233333.233876, 3500044, new DateTime(2015, 3, 20)));
            order.Add(new Orders(16166662, 175002, new DateTime(2015, 3, 21)));
            order.Add(new Orders(107777774, 1166681, new DateTime(2015, 3, 22)));
            order.Add(new Orders(80833331, 875011, new DateTime(2015, 3, 23)));
            order.Add(new Orders(64666665, 700008, new DateTime(2015, 3, 24)));
            order.Add(new Orders(53888887, 583340, new DateTime(2015, 3, 25)));
            order.Add(new Orders(46190475, 500006, new DateTime(2015, 3, 26)));
            order.Add(new Orders(40416665, 437505, new DateTime(2015, 3, 27)));
            order.Add(new Orders(35925925, 388893, new DateTime(2015, 3, 28)));
            this.FormatGrid.DataSource = order;
            this.FormatGrid.DataBind();
        }

        [Serializable]
        public class Orders
        {
            public Orders()
            {

            }
            public Orders(double Number, long Currency, DateTime Date)
            {
                this.Number = Number;
                this.Currency = Currency;
                this.Date = Date;
            }
            public double Number { get; set; }
            public long Currency { get; set; }
            public DateTime Date { get; set; }
        }
    }
}