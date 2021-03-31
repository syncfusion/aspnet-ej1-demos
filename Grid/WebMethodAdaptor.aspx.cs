#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.JavaScript;
using Syncfusion.JavaScript.DataSources;
using Syncfusion.Linq;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSampleBrowser.PredictiveAnalytics;

namespace WebSampleBrowser.Grid
{

    public partial class WebMethodAdaptor : System.Web.UI.Page
    {
        public static List<Orders> order = null;

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static object UrlDataSource(DataManager value)
        {
            IEnumerable data = BindDataSource();
            DataOperations ds = new DataOperations();

            if (value.Where != null && value.Where.Count > 0) //Filtering
            {
                data = ds.PerformWhereFilter(data, value.Where, value.Where[0].Operator);
            }
            if (value.Search != null && value.Search.Count > 0) // Searching
            {
                data = ds.PerformSearching(data, value.Search);
            }

            var count = data.AsQueryable().Count();
            if (value.Sorted != null && value.Sorted.Count > 0) //Sorting
            {
                data = ds.PerformSorting(data, value.Sorted);
            }
            List<string> str = new List<string>();
            if (value.Aggregates != null)                   // Summary
            {
                for (var i = 0; i < value.Aggregates.Count; i++)
                    str.Add(value.Aggregates[i].Field);
            }
            IEnumerable aggregates = ds.PerformSelect(data, str);

            data = ds.PerformSkip(data, value.Skip);    //Paging
            data = ds.PerformTake(data, value.Take);

            return new { result = data, count = count, aggregate = aggregates };
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static void UrlUpdate(Orders value)
        {
            Orders result = order.Where(o => o.OrderID == value.OrderID).FirstOrDefault();
            if (result != null)
            {
                result.OrderID = value.OrderID;
                result.OrderDate = value.OrderDate;
                result.CustomerID = value.CustomerID;
                result.EmployeeID = value.EmployeeID;
                result.Freight = value.Freight;
                result.ShipCity = value.ShipCity;

            }
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static object UrlInsert(Orders value)
        {
            order.Insert(0, value);
            return order;
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static object UrlDelete(int key)
        {
            Orders result = order.Where(o => o.OrderID == key).FirstOrDefault();
            order.Remove(result);
            return order;
        }
        public static List<Orders> BindDataSource()
        {
            if (order == null)
            {
                order = new List<Orders>();
                int orderId = 10000;
                int empId = 0;
                for (int i = 1; i < 9; i++)
                {
                    order.Add(new Orders(orderId + 1, "VINET", empId + 1, 32.38, new DateTime(2014, 12, 25), "Reims"));
                    order.Add(new Orders(orderId + 2, "TOMSP", empId + 2, 11.61, new DateTime(2014, 12, 21), "Munster"));
                    order.Add(new Orders(orderId + 3, "ANATER", empId + 3, 45.34, new DateTime(2014, 10, 18), "Berlin"));
                    order.Add(new Orders(orderId + 4, "ALFKI", empId + 4, 37.28, new DateTime(2014, 11, 23), "Mexico"));
                    order.Add(new Orders(orderId + 5, "FRGYE", empId + 5, 67.00, new DateTime(2014, 05, 05), "Colchester"));
                    orderId += 5;
                    empId += 5;
                }
            }
            return order;
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
            public int? OrderID { get; set; }
            public string CustomerID { get; set; }
            public int? EmployeeID { get; set; }
            public double? Freight { get; set; }
            public DateTime? OrderDate { get; set; }
            public string ShipCity { get; set; }
        }
    }

}


