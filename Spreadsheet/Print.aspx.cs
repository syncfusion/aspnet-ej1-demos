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
using WebSampleBrowser.SpreadsheetASP.Model;

namespace WebSampleBrowser.SpreadsheetASP
{
    public partial class Print : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataSource();
        }

        private void BindDataSource()
        {            
            List<Orders> order = new List<Orders>();

            for (int i = 1; i <= 40; i++)
            {
                order.Add(new Orders("Hanari Carnes", "Hauptstr. 31", "Germany", "05454-876"));
                order.Add(new Orders("Victuailles en stock", "2, rue du Commerce", "Brazil", "B-6000"));
                order.Add(new Orders("Richter Supermarkt", "Sierras de Granada 9993", "France", "02389-673"));
                order.Add(new Orders("Ernst Handel", "Vins et alcools Chevalier", "Charleroi", "50739"));
                order.Add(new Orders("Wellington Importadora", "Boulevard Tirou, 255", "Strasbourg", "S-844 67"));
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
            public Orders(string ShipName, string ShipAddress, string ShipCity, string ShipPostalCode)
            {
                this.ShipName = ShipName;
                this.ShipAddress = ShipAddress;
                this.ShipCity = ShipCity;
                this.ShipPostalCode = ShipPostalCode;
            }
            public string ShipName { get; set; }
            public string ShipAddress { get; set; }
            public string ShipCity { get; set; }
            public string ShipPostalCode { get; set; }
        }
    }
}