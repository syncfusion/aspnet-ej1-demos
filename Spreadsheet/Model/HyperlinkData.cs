#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
namespace WebSampleBrowser.SpreadsheetASP.Model
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.ComponentModel;

    public class HyperlinkData
    {
        public string ItemName { get; set; }
        public DateTime Date { get; set; }
        public DateTime Time { get; set; }
        public int Quantity { get; set; }
        public int Price { get; set; }
        public int Amount { get; set; }
        public int Discount { get; set; }
        public int Profit { get; set; }
        public string StockDetail { get; set; }
        public string Website { get; set; }
        public static IEnumerable<object> GetHyperlinkDetails
        {
            get
            {
                List<HyperlinkData> formats = new List<HyperlinkData>();

                formats.Add(new HyperlinkData() { ItemName = "Casual Shoes", Quantity = 10, Price = 20, Amount = 200, StockDetail = "OUT OF STOCK", Website = "Amazon" });
                formats.Add(new HyperlinkData() { ItemName = "Sports Shoes", Quantity = 20, Price = 30, Amount = 600, StockDetail = "IN STOCK", Website = "" });
                formats.Add(new HyperlinkData() { ItemName = "Formal Shoes", Quantity = 20, Price = 15, Amount = 300, StockDetail = "IN STOCK", Website = "AliExpress" });
                formats.Add(new HyperlinkData() { ItemName = "Sandals & Floaters", Quantity = 15, Price = 20, Amount = 300, StockDetail = "OUT OF STOCK", Website = "AliBaba" });
                formats.Add(new HyperlinkData() { ItemName = "Flip-Flops & Slippers", Quantity = 30, Price = 10, Amount = 300, StockDetail = "IN STOCK", Website = "" });
                formats.Add(new HyperlinkData() { ItemName = "Sneakers", Quantity = 40, Price = 20, Amount = 800, StockDetail = "OUT OF STOCK", Website = "" });
                formats.Add(new HyperlinkData() { ItemName = "Running Shoes", Quantity = 20, Price = 10, Amount = 200, StockDetail = "IN STOCK", Website = "Ebay" });
                formats.Add(new HyperlinkData() { ItemName = "Loafers", Quantity = 31, Price = 10, Amount = 310, StockDetail = "IN STOCK", Website = "" });
                formats.Add(new HyperlinkData() { ItemName = "Cricket Shoes", Quantity = 41, Price = 30, Amount = 1210, StockDetail = "IN STOCK", Website = "" });
                formats.Add(new HyperlinkData() { ItemName = "T-Shirts", Quantity = 50, Price = 10, Amount = 500, StockDetail = "IN STOCK", Website = "" });

                var formatData =
                from format in formats
                select new { format.ItemName, format.Quantity, format.Price, format.Amount, format.StockDetail, format.Website };

                return formatData.ToList();
            }
        }
    }
}