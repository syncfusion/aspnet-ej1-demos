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
using Syncfusion.JavaScript.Web;

namespace WebSampleBrowser.Grid
{
    public partial class LockRow : System.Web.UI.Page
    {
        List<Orders> order = new List<Orders>();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataSource();
            Session["LockRowDataSource"] = order;
        }

        private void BindDataSource()
        {
            if ((List<Orders>)Session["LockRowDataSource"] == null)
            {
            int orderId = 10000;
            int empId = 0;
            for (int i = 1; i < 9; i++)
            {
                order.Add(new Orders(orderId + 1, empId + 1, 32.38, "Reims",true));
                order.Add(new Orders(orderId + 2, empId + 2, 11.61,  "Munster",true));
                order.Add(new Orders(orderId + 3, empId + 3, 45.34,  "Berlin",false));
                order.Add(new Orders(orderId + 4, empId + 4, 37.28,  "Mexico",true));
                order.Add(new Orders(orderId + 5, empId + 5, 67.00,  "Colchester",false));
                order.Add(new Orders(orderId + 6, empId + 6, 23.32,  "Newyork",false));
                orderId += 6;
                empId += 6;
            }
            }
            else
            {
                order = (List<Orders>)Session["LockRowDataSource"];
            }
            this.OrdersGrid.DataSource = order;
            this.OrdersGrid.DataBind();
            this.autoDefault.DataSource = order.Select(s=>s.OrderID).ToList();
        }

        protected void EditEvents_ServerEditRow(object sender, GridEventArgs e)
        {
            EditAction(e.EventType, e.Arguments["data"]);
        }      

        protected void EditAction(string eventType, object record)
        {
            List<Orders> data = Session["LockRowDataSource"] as List<Orders>;
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
                    else if (keyval.Key == "EmployeeID")
                        value.EmployeeID = Convert.ToInt32(keyval.Value);
                    else if (keyval.Key == "Freight")
                        value.Freight = Convert.ToDouble(keyval.Value);
                    else if (keyval.Key == "ShipCity")
                        value.ShipCity = Convert.ToString(keyval.Value);
                    else if (keyval.Key == "Verified")
                        value.Verified = Convert.ToBoolean(keyval.Value);
                }
            }            
            Session["LockRowDataSource"] = data;
            this.OrdersGrid.DataSource = data;
            this.OrdersGrid.DataBind();
        }

        [Serializable]
        public class Orders
        {
            public Orders()
            {
                
            }
            public Orders(int orderId, int empId, double freight, string shipCity, bool verified)
            {
                this.OrderID = orderId;
                this.EmployeeID = empId;
                this.Freight = freight;
                this.Verified = verified;
                this.ShipCity = shipCity;
            }
            public int OrderID { get; set; }
            public int EmployeeID { get; set; }
            public double Freight { get; set; }
            public string ShipCity { get; set; }
            public bool Verified { get; set; }
        }
    }
}