#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.JavaScript.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.Grid
{
    public partial class CommandColumn : System.Web.UI.Page
    {
        List<Orders> order = new List<Orders>();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataSource();
            Session["CommandColumnDataSource"] = order;
        }

        private void BindDataSource()
        {
            if ((List<Orders>)Session["CommandColumnDataSource"] == null)
            {
            int code = 10000;
            for (int i = 1; i < 10; i++)
            {
                order.Add(new Orders(code + 1, i + 0, 2.3 * i, "Münster", "Germany", false));
                order.Add(new Orders(code + 2, i + 2, 3.3 * i, "Rio de Janeiro", "Brazil", true));
                order.Add(new Orders(code + 3, i + 1, 4.3 * i, "Lyon", "France", true));
                order.Add(new Orders(code + 4, i + 3, 5.3 * i, "Reims", "France", true));
                order.Add(new Orders(code + 5, i + 4, 6.3 * i, "Charleroi", "Belgium", false));
                code += 5;
            }
            }
            else
            {
                order = (List<Orders>)Session["CommandColumnDataSource"];
            }
            this.OrdersGrid.DataSource = order;
            this.OrdersGrid.DataBind();
        }

         protected void EditEvents_ServerEditRow(object sender, GridEventArgs e)
        {
            EditAction(e.EventType, e.Arguments["data"]);
        }
      
        protected void EditEvents_ServerDeleteRow(object sender, GridEventArgs e)
        {
            EditAction(e.EventType, e.Arguments["data"]);
        }

        protected void EditAction(string eventType, object record)
        {
            List<Orders> data = Session["CommandColumnDataSource"] as List<Orders>;
            Dictionary<string, object> KeyVal = record as Dictionary<string, object>;
            if (eventType == "endEdit")
            {
                Orders value = new Orders();
                foreach (KeyValuePair<string, object> keyval in KeyVal)
                {

                    if (keyval.Key == "OrderID")
                    {
                        value = data.Where(d => d.OrderID == (int)keyval.Value).FirstOrDefault();
                        value.OrderID = Convert.ToInt32(keyval.Value);
                    }
                    else if (keyval.Key == "Verified")
                        value.Verified = Convert.ToBoolean(keyval.Value);
                    else if (keyval.Key == "EmployeeID")
                        value.EmployeeID = Convert.ToInt32(keyval.Value);
                    else if (keyval.Key == "Freight")
                        value.Freight = Convert.ToDouble(keyval.Value);
                    else if (keyval.Key == "ShipCountry")
                        value.ShipCountry = Convert.ToString(keyval.Value);
                    else if (keyval.Key == "ShipCity")
                        value.ShipCity = Convert.ToString(keyval.Value);
                }
            }
          
            else if (eventType == "endDelete")
            {
                foreach (KeyValuePair<string, object> keyval in KeyVal)
                {
                    if (keyval.Key == "OrderID")
                    {
                        Orders value = data.Where(d => d.OrderID == (int)keyval.Value).FirstOrDefault();
                        data.Remove(value);
                    }
                }
            }
            Session["CommandColumnDataSource"] = data;
            this.OrdersGrid.DataSource = data;
            this.OrdersGrid.DataBind();
        }

        [Serializable]
        public class Orders
        {
            public Orders()
            {

            }
            public Orders(long OrderId, int EmployeeId, double Freight, string ShipCity, string ShipCountry, bool Verified)
            {
                this.OrderID = OrderId;
                this.EmployeeID = EmployeeId;
                this.Freight = Freight;
                this.ShipCity = ShipCity;
                this.ShipCountry = ShipCountry;
                this.Verified = Verified;
            }
            public long OrderID { get; set; }
            public int EmployeeID { get; set; }
            public double Freight { get; set; }
            public string ShipCity { get; set; }
            public string ShipCountry { get; set; }
            public bool Verified { get; set; }
        }
    }
}