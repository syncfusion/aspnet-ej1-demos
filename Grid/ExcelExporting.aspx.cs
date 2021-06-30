#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.EJ.Export;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Syncfusion.XlsIO;
using System.Collections;

namespace WebSampleBrowser.Grid
{
    public partial class ExcelExporting : System.Web.UI.Page
    {
        List<Orders> order = new List<Orders>();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataSource();
        }
        private void BindDataSource()
        {
            int code = 10000;
            for (int i = 1; i < 10; i++)
            {
                order.Add(new Orders(code + 1, new DateTime(1991, 05, 15), 2.3 * i, "Vins et alcoos Chevalier", "Berlin", "Argentina"));
                order.Add(new Orders(code + 2, new DateTime(1990, 04, 04), 3.3 * i, "Toms spezialitatean", "Madrid", "Autria"));
                order.Add(new Orders(code + 3, new DateTime(1957, 11, 30), 4.3 * i, "Hanari Carnes", "Cholchester", "Austria"));
                order.Add(new Orders(code + 4, new DateTime(1930, 10, 22), 5.3 * i, "Victuailles en stock" , "Marseille", "Argentina"));
                order.Add(new Orders(code + 5, new DateTime(1953, 02, 18), 6.3 * i, "Supremes delices", "Tsawassen", "Argentina"));
                code += 5;
            }
            this.FlatGrid.DataSource = order;
            this.FlatGrid.DataBind();
        }

        [Serializable]
        public class Orders
        {
            public Orders()
            {

            }
           public Orders(long OrderId, DateTime OrderDate, double Freight, string ShipName, string ShipCity, string ShipCountry)
            {
                 this.OrderID = OrderId;
                this.OrderDate = OrderDate;
                this.Freight = Freight;
                this.ShipName = ShipName;
                this.ShipCity = ShipCity;
				this.ShipCountry = ShipCountry;
            }
            public long OrderID { get; set; }
            public DateTime OrderDate { get; set; }
            public double Freight { get; set; }
            public string ShipName { get; set; }
            public string ShipCity { get; set; }
            public string ShipCountry { get; set; }
        }

        protected void FlatGrid_ServerExcelExporting(object sender, Syncfusion.JavaScript.Web.GridEventArgs e)
        {
            ExcelExport exp = new ExcelExport();
            exp.Export(FlatGrid.Model, (IEnumerable)FlatGrid.DataSource, "Export.xlsx", ExcelVersion.Excel2010, true, true, "flat-lime");
        }

        protected void FlatGrid_ServerWordExporting(object sender, Syncfusion.JavaScript.Web.GridEventArgs e)
        {
            WordExport exp = new WordExport();
            exp.Export(FlatGrid.Model, (IEnumerable)FlatGrid.DataSource, "Export.docx", true, true, "flat-lime");
        }

        protected void FlatGrid_ServerPdfExporting(object sender, Syncfusion.JavaScript.Web.GridEventArgs e)
        {
            PdfExport exp = new PdfExport();
            exp.Export(FlatGrid.Model, (IEnumerable)FlatGrid.DataSource, "Export.pdf", true, true, "flat-lime");
        }
    }
}