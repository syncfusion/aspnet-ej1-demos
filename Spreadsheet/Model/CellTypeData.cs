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

    public class CellTypeData
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
        public static IEnumerable<object> GetItemDetails
        {
            get
            {
                List<CellTypeData> lItems = new List<CellTypeData>();

                lItems.Add(new CellTypeData() { ItemName = "Casual Shoes", Amount = 200 });
                lItems.Add(new CellTypeData() { ItemName = "Sports Shoes", Amount = 600 });
                lItems.Add(new CellTypeData() { ItemName = "Formal Shoes", Amount = 300 });
                lItems.Add(new CellTypeData() { ItemName = "Sandals & Floaters", Amount = 300 });
                lItems.Add(new CellTypeData() { ItemName = "Flip- Flops & Slippers", Amount = 300 });
                lItems.Add(new CellTypeData() { ItemName = "Sneakers", Amount = 800 });
                lItems.Add(new CellTypeData() { ItemName = "Running Shoes", Amount = 200 });
                lItems.Add(new CellTypeData() { ItemName = "Loafers", Amount = 310 });
                lItems.Add(new CellTypeData() { ItemName = "Cricket Shoes", Amount = 1210 });
                lItems.Add(new CellTypeData() { ItemName = "T-Shirts", Amount = 500 });

                var itemCol =
                from item in lItems
                select new { item.ItemName, item.Amount };

                return itemCol;
            }
        }
    }
}