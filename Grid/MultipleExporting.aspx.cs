#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.DocIO.DLS;
using Syncfusion.EJ.Export;
using Syncfusion.Pdf;
using Syncfusion.XlsIO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace WebSampleBrowser.Grid
{
    public partial class MultipleExporting : System.Web.UI.Page
    {
        private List<Orders> order = new List<Orders>();
        private List<Employee> employee = new List<Employee>();
        protected void Page_Load(object sender, EventArgs e)
        {
            OrderDetails();
            EmployeeDetails();
        }
        private void EmployeeDetails()
        {
            employee.Add(new Employee(1, "Nancy", "Davolia", "Sales Representative", new DateTime(1970, 12, 24), "USA"));
            employee.Add(new Employee(2, "Andrew", "Fuller", "Sales Representative", new DateTime(1974, 1, 4), "USA"));
            employee.Add(new Employee(3, "Janet", "Leverling", "Sales Representative", new DateTime(1977, 2, 7), "USA"));
            employee.Add(new Employee(4, "Margaret", "peacock", "Sales Representative", new DateTime(1979, 8, 16), "USA"));
            employee.Add(new Employee(5, "Stevan", "Bhuchanan", "Sales Representative", new DateTime(1980, 5, 20), "USA"));
            this.EmployeesGrid.DataSource = employee;
            this.EmployeesGrid.DataBind();
        }

        private void OrderDetails()
        {
            int orderId = 10000;
                order.Add(new Orders(orderId + 1, "VINET", 1, 32.38, new DateTime(2014, 12, 25), "Reims"));
                order.Add(new Orders(orderId + 2, "TOMSP", 2, 11.61, new DateTime(2014, 12, 21), "Munster"));
                order.Add(new Orders(orderId + 3, "ANATER", 3, 45.34, new DateTime(2014, 10, 18), "Berlin"));
                order.Add(new Orders(orderId + 4, "ALFKI", 4, 37.28, new DateTime(2014, 11, 23), "Mexico"));
                order.Add(new Orders(orderId + 5, "FRGYE", 5, 67.00, new DateTime(2014, 05, 05), "Colchester"));
            this.OrdersGrid.DataSource = order;
            this.OrdersGrid.DataBind();
        }

        [Serializable]
        public class Employee
        {
            public Employee()
            {

            }
            public Employee(int employeeId, string firstName, string lastName, string title, DateTime dob,
                string country)
            {
                this.EmployeeID = employeeId;
                this.FirstName = firstName;
                this.LastName = lastName;
                this.Title = title;
                this.BirthDate = dob;
                this.Country = country;
            }
            public int EmployeeID { get; set; }
            public string FirstName { get; set; }
            public string LastName { get; set; }
            public string Title { get; set; }
            public DateTime BirthDate { get; set; }
            public string Country { get; set; }
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

        protected void EmployeesGrid_ServerExcelExporting(object sender, Syncfusion.JavaScript.Web.GridEventArgs e)
        {
            ExcelExport exp = new ExcelExport();
            IWorkbook workbook = exp.Export(EmployeesGrid.Model,(IEnumerable) EmployeesGrid.DataSource, "Export.xlsx", ExcelVersion.Excel2010, true, true, "flat-lime", true);
            exp.Export(OrdersGrid.Model, (IEnumerable)OrdersGrid.DataSource, "Export.xlsx", ExcelVersion.Excel2010, true, true, "flat-lime",false, workbook, MultipleExportType.AppendToSheet, "Orders Grid");
        }

        protected void EmployeesGrid_ServerWordExporting(object sender, Syncfusion.JavaScript.Web.GridEventArgs e)
        {
            WordExport exp = new WordExport();
            IWordDocument document = exp.Export(EmployeesGrid.Model, (IEnumerable)EmployeesGrid.DataSource, "Export.docx", true, true, "flat-lime", true);
            exp.Export(OrdersGrid.Model, (IEnumerable)OrdersGrid.DataSource, "Export.docx", true, true, "flat-lime", false, document, "Second Grid");
        }

        protected void EmployeesGrid_ServerPdfExporting(object sender, Syncfusion.JavaScript.Web.GridEventArgs e)
        {
            PdfExport exp = new PdfExport();
            PdfDocument document = exp.Export(EmployeesGrid.Model, (IEnumerable)EmployeesGrid.DataSource, "Export.pdf", true, true, "flat-lime", true);
            exp.Export(OrdersGrid.Model, (IEnumerable)OrdersGrid.DataSource, "Export.pdf", true, true, "flat-lime", false, document, "Second Grid");
        }
    }
}