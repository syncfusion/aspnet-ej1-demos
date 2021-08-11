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
using Syncfusion.JavaScript.Models;
using System.Web.Services;
using System.Web.Script.Services;

namespace WebSampleBrowser.Grid
{
    public partial class ForeignKey : System.Web.UI.Page
    {
        public static List<Orders> order = new List<Orders>();
        public List<Employee> foreignData = new List<Employee>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (order.Count == 0)
                BindGridData();
            BindForeignData();
            this.ForeignAdaptor.Json = order;
        }
        private void BindGridData()
        {
            int orderId = 10000;
            for (int i = 1; i < 9; i++)
            {
                order.Add(new Orders(orderId + 1, "VINET", i, 32.38, "Reims", true));
                order.Add(new Orders(orderId + 2, "TOMSP", i, 11.61, "Munster", false));
                order.Add(new Orders(orderId + 3, "ANATER", i, 45.34, "Berlin", true));
                order.Add(new Orders(orderId + 4, "ALFKI", i, 37.28, "Mexico", false));
                order.Add(new Orders(orderId + 5, "FRGYE", i, 67.00, "Colchester", true));
                order.Add(new Orders(orderId + 6, "JGERT", i, 23.32, "Newyork", true));
                orderId += 6;
            }
        }
        public void BindForeignData()
        {
            foreignData.Add(new Employee(1, "Michael"));
            foreignData.Add(new Employee(2, "Anne"));
            foreignData.Add(new Employee(3, "Janet"));
            foreignData.Add(new Employee(4, "Andrew"));
            foreignData.Add(new Employee(5, "Margaret"));
            foreignData.Add(new Employee(6, "Nancy"));
            foreignData.Add(new Employee(7, "Robert"));
            foreignData.Add(new Employee(8, "Laura"));
            foreignData.Add(new Employee(9, "Steven"));
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static object ForeignKeyInsert(Orders value)
        {
            order.Insert(0, value);
            return new { value };
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static object ForeignKeyUpdate(Orders value)
        {
            Orders val = order.Where(ord => ord.OrderID == value.OrderID).FirstOrDefault();
            val.EmployeeID = value.EmployeeID;
            val.CustomerID = value.CustomerID;
            val.Freight = value.Freight;
            val.ShipCity = val.ShipCity;
            val.Verified = val.Verified;
            return new { value };
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static object ForeignKeyDelete(int key)
        {
            Orders val = order.Where(ord => ord.OrderID == key).FirstOrDefault();
            order.Remove(val);
            return new { order };
        }
        [Serializable]
        public class Orders
        {
            public Orders()
            {

            }
            public Orders(int orderId, string customerId, int empId, double? freight, string shipCity, bool verified)
            {
                this.OrderID = orderId;
                this.CustomerID = customerId;
                this.EmployeeID = empId;
                this.Freight = freight;
                this.ShipCity = shipCity;
                this.Verified = verified;
            }
            public int OrderID { get; set; }
            public string CustomerID { get; set; }
            public int EmployeeID { get; set; }
            public double? Freight { get; set; }
            public string ShipCity { get; set; }
            public bool Verified { get; set; }
        }
        [Serializable]
        public class Employee
        {
            public Employee()
            {

            }
            public Employee(int EmployeeId, string FirstName)
            {
                this.EmployeeID = EmployeeId;
                this.FirstName = FirstName;
            }
            public int EmployeeID { get; set; }
            public string FirstName { get; set; }
        }
    }
}