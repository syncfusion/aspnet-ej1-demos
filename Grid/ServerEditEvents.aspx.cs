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
using Syncfusion.Olap.MDXQueryParser;
using Syncfusion.XlsIO.Parser.Biff_Records;

namespace WebSampleBrowser.Grid
{
    public partial class ServerEditEvents : System.Web.UI.Page
    {
        private List<Orders> order = new List<Orders>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDataSource();
                ViewState["DataSource"] = order;
            }
        }

        private void BindDataSource()
        {
            int orderId = 10000;
            int empId = 0;
            for (int i = 1; i < 9; i++)
            {
                order.Add(new Orders(orderId + 1, "VINET", empId + 1, 32.38, new DateTime(2014, 12, 25), "Reims"));
                order.Add(new Orders(orderId + 2, "TOMSP", empId + 2, 11.61, new DateTime(2014, 12, 21), "Munster"));
                order.Add(new Orders(orderId + 3, "ANATER", empId + 3, 45.34, new DateTime(2014, 10, 18), "Berlin"));
                order.Add(new Orders(orderId + 4, "ALFKI", empId + 4, 37.28, new DateTime(2014, 11, 23), "Mexico"));
                order.Add(new Orders(orderId + 5, "FRGYE", empId + 5, 67.00, new DateTime(2014, 05, 05), "Colchester"));
                order.Add(new Orders(orderId + 6, "JGERT", empId + 6, 23.32, new DateTime(2014, 10, 18), "Newyork"));
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

        public string span = "<span class='serverEvent' style='display: inline-block;'>Grid <span class='eventTitle'>";
        protected void EditEvents_ServerRecordDoubleClick(object sender, GridEventArgs e)
        {
            this.OrdersGrid.DataSource = ViewState["DataSource"] as List<Orders>;
            this.OrdersGrid.DataBind();
            serverEvent.InnerHtml = serverEvent.InnerHtml + span + "recordDoubleClick</span> event called</span><hr>";
        }

        protected void EditEvents_ServerEditRow(object sender, GridEventArgs e)
        {
            EditAction(e.EventType, e.Arguments["data"]);
            serverEvent.InnerHtml = serverEvent.InnerHtml + span + "endEdit</span> event called</span><hr>";
        }

        protected void EditEvents_ServerAddRow(object sender, GridEventArgs e)
        {
            EditAction(e.EventType, e.Arguments["data"]);
            serverEvent.InnerHtml = serverEvent.InnerHtml + span + "endAdd</span> event called</span><hr>";
        }

        protected void EditEvents_ServerDeleteRow(object sender, GridEventArgs e)
        {
            EditAction(e.EventType, e.Arguments["data"]);
            serverEvent.InnerHtml = serverEvent.InnerHtml + span + "endDelete</span> event called</span><hr>";
        }

        protected void Clear_OnClick(object sender, ButtonEventArgs e)
        {
            this.OrdersGrid.DataSource = ViewState["DataSource"] as List<Orders>;
            this.OrdersGrid.DataBind();
            serverEvent.InnerHtml = "";
        }

        protected void EditAction(string eventType, object record)
        {
            List<Orders> data = ViewState["DataSource"] as List<Orders>;
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
                    else if (keyval.Key == "CustomerID")
                        value.CustomerID = Convert.ToString(keyval.Value);
                    else if (keyval.Key == "EmployeeID")
                        value.EmployeeID = Convert.ToInt32(keyval.Value);
                    else if (keyval.Key == "Freight")
                        value.Freight = Convert.ToDouble(keyval.Value);
                    else if (keyval.Key == "ShipCity")
                        value.ShipCity = Convert.ToString(keyval.Value);
                }
            }

            else if (eventType == "endAdd")
            {
                Orders newRecord = new Orders();
                foreach (KeyValuePair<string, object> keyval in KeyVal)
                {
                    
                        if (keyval.Key == "OrderID")
                            newRecord.OrderID = Convert.ToInt32(keyval.Value);
                        else if (keyval.Key == "CustomerID")
                            newRecord.CustomerID = Convert.ToString(keyval.Value);
                        else if (keyval.Key == "EmployeeID")
                            newRecord.EmployeeID = Convert.ToInt32(keyval.Value);
                        else if (keyval.Key == "Freight")
                            newRecord.Freight = Convert.ToDouble(keyval.Value);
                        else if (keyval.Key == "ShipCity")
                            newRecord.ShipCity = Convert.ToString(keyval.Value);
                   
                }
                data.Insert(0, newRecord);
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
            ViewState["DataSource"] = data;
            this.OrdersGrid.DataSource = data;
            this.OrdersGrid.DataBind();
        }
    }
}
