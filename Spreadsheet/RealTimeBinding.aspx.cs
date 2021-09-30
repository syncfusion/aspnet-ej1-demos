#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSampleBrowser.SpreadsheetASP.Model;

namespace WebSampleBrowser.SpreadsheetASP
{
    public partial class RealTimeBinding : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataSource();
        }

        private void BindDataSource()
        {
            List<Orders> order = new List<Orders>();

            for (int i = 1; i <= 20; i++)
            {
                order.Add(new Orders("VINET", "Hanari Carnes", "Hauptstr. 31", "Germany", "France"));
                order.Add(new Orders("TOMSP", "Victuailles en stock", "2, rue du Commerce", "Brazil", "Germany"));
                order.Add(new Orders("HANAR", "Richter Supermarkt", "Sierras de Granada 9993", "France", "Brazil"));
                order.Add(new Orders("VICTE", "Ernst Handel", "Vins et alcools Chevalier", "Charleroi", "Belgium"));
                order.Add(new Orders("SUPRD", "Wellington Importadora", "Boulevard Tirou, 255", "Strasbourg", "Switzerland"));
            }
            this.FlatSpreadsheet.Sheets.Add(new Syncfusion.JavaScript.Models.Sheet()
            {
                Datasource = order
            });
        }

        [Serializable]
        public class Orders
        {
            public Orders()
            {

            }
            public Orders(string CustomerID, string ShipName, string ShipAddress, string ShipCity, string ShipCountry)
            {
                this.CustomerID = CustomerID;
                this.ShipName = ShipName;
                this.ShipAddress = ShipAddress;
                this.ShipCity = ShipCity;
                this.ShipCountry = ShipCountry;
            }
            public string CustomerID { get; set; }
            public string ShipName { get; set; }
            public string ShipAddress { get; set; }
            public string ShipCity { get; set; }
            public string ShipCountry { get; set; }
        }

    }
}