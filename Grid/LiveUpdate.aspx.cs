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

namespace WebSampleBrowser.Grid
{
    public partial class LiveUpdate : System.Web.UI.Page
    {
        List<Product> order = new List<Product>();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataSource();

        }

        private void BindDataSource()
        {
            order.Add(new Product(1, "Chang", 6.00, 27, 45));
            order.Add(new Product(2, "Aniseed Syrup,Chef Anton's Cajun Seasoning", 17.00, 84, 140));
            order.Add(new Product(3, "hef Anton's Gumbo Mix", 6.00, 27, 45));
            order.Add(new Product(4, "Grandma's Boysenberry Spread", 14.00, 60, 100));
            order.Add(new Product(5, "Uncle Bob's Organic Dried Pears", 15.00, 57, 90));
            order.Add(new Product(6, "Northwoods Cranberry Sauce", 8.00, 12, 20));
            order.Add(new Product(7, "Mishi Kobe Niku", 19.00, 72, 120));
            order.Add(new Product(8, "Ikura", 22.00, 87, 140));
            order.Add(new Product(9, "Queso Cabrales", 10.00, 9, 15));
            order.Add(new Product(10, "Queso Cabrales", 24.00, 87, 145));
            this.ProductsGrid.DataSource = order;
            this.ProductsGrid.DataBind();
        }

        [Serializable]
        public class Product
        {
            public Product()
            {
                
            }
            public Product(int productId, string productName, double unitPrice, int unitInStock, int unitOnOrder)
            {
                this.ProductID = productId;
                this.ProductName = productName;
                this.UnitPrice = unitPrice;
                this.UnitInStock = unitInStock;
                this.UnitOnOrder = unitOnOrder;
            }
            public int ProductID { get; set; }
            public string ProductName { get; set; }
            public double UnitPrice { get; set; }
            public int UnitInStock { get; set; }
            public int UnitOnOrder { get; set; }
        }
    }
}