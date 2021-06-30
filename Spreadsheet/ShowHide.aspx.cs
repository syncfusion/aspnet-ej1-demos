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
    public partial class ShowHide : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataSource();
        }

        private void BindDataSource()
        {
            List<Products> product = new List<Products>();
            int code = 1;
            for (int i = 1; i <= 15; i++)
            {
                product.Add(new Products(i, "Chai", i + 0, "10 boxes x 20 bags", i + 15, i + 20));
                product.Add(new Products(i + 1, "Chang", i + 2, "24 - 12 oz bottles", i + 7, i + 17));
                product.Add(new Products(i + 2, "Aniseed Syrup", i + 1, "12 - 550 ml bottles", i + 11.5, i + 9));
                product.Add(new Products(i + 3, "Mishi Kobe Niku", i + 3, "48 - 6 oz jars", i + 8.9, i + 14));
                product.Add(new Products(i + 4, "Konbu", i + 4, "12 - 1 lb pkgs.", i + 12, i + 10));
                code += 5;
            }
            this.FlatSpreadsheet.Sheets[0].RangeSetting[0].Datasource = product;
        }

        [Serializable]
        public class Products
        {
            public Products()
            {

            }
            public Products(long ProductID, string ProductName, int CategoryID, string QuantityPerUnit, double UnitPrice, int UnitsInStock)
            {
                this.ProductID = ProductID;
                this.ProductName = ProductName;
                this.CategoryID = CategoryID;
                this.QuantityPerUnit = QuantityPerUnit;
                this.UnitPrice = UnitPrice;
                this.UnitsInStock = UnitsInStock;
            }
            public long ProductID { get; set; }
            public string ProductName { get; set; }
            public int CategoryID { get; set; }
            public string QuantityPerUnit { get; set; }
            public double UnitPrice { get; set; }
            public int UnitsInStock { get; set; }
        }
    }
}