#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.JavaScript;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.Grid
{
    public partial class DragAndDrop : System.Web.UI.Page
    {
        private List<Orders> order = new List<Orders>();
        private string DestGridID = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (HttpContext.Current.Session["DataSource"] == null)
                {
                    BindDataSource();
                    HttpContext.Current.Session["DataSource"] = order;
                }
                else
                {
                    order = (List<Orders>)HttpContext.Current.Session["DataSource"];
                    this.OrdersGrid.DataManager = new DataSource() { Json = order, Adaptor = "remoteSaveAdaptor" };
                }
                var data2 = (IList<Orders>)HttpContext.Current.Session["DataSource2"];
                if (data2 == null)
                    HttpContext.Current.Session["DataSource2"] = data2 = new List<Orders>();
                this.DestGrid.DataManager = new DataSource() { Json = data2, Adaptor = "remoteSaveAdaptor" };
                this.OrdersGrid.RowDropSettings.DropTargetID = "#" + this.DestGrid.ClientID;
                this.DestGrid.RowDropSettings.DropTargetID = "#" + this.OrdersGrid.ClientID;
                DestGridID = this.OrdersGrid.ClientID;
            }
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static object Reordering(List<Orders> added, List<Orders> deleted)
        {
            JavaScriptSerializer ser = new JavaScriptSerializer();
            HttpContext context = HttpContext.Current;
            RowDropModel dropDetails = (RowDropModel)ser.Deserialize(context.Request.Headers["rowDropDetails"], typeof(RowDropModel));
            var count = 0;
            var srcData = (List<Orders>)context.Session["DataSource"];
            var destData = (List<Orders>)context.Session["DataSource2"];
            if (dropDetails.SourceID.Contains("DestGrid"))
            {
                srcData = destData;
                destData = (List<Orders>)context.Session["DataSource"];
            }
            if (added != null)
            {
                foreach (var item in added)
                {
                    destData.Insert(dropDetails.DestinationRowIndex + count, item);
                    Orders result = srcData.Where(o => o.OrderID == item.OrderID).FirstOrDefault();
                    srcData.Remove(result);
                    count++;
                }
            }
            return added;
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
            this.OrdersGrid.DataManager = new DataSource() { Json = order, Adaptor = "remoteSaveAdaptor" };
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
    }
}