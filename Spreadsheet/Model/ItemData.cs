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

    public class ItemData
    {
        public string ItemName { get; set; }
        public string Date { get; set; }
        public string Time { get; set; }
        public int Quantity { get; set; }
        public int Price { get; set; }
        public int Amount { get; set; }
        public int Discount { get; set; }
        public int Profit { get; set; }
        public string StockDetail { get; set; }
        public string Website { get; set; }
        public static IEnumerable<object> GetAllItemDetails
        {
            get
            {
                List<ItemData> lItems = new List<ItemData>();

                lItems.Add(new ItemData() { ItemName = "Casual Shoes", Date = "02/14/2014", Time = "11:34:32 AM", Quantity = 10, Price = 20, Amount = 200, Discount = 1, Profit = 10 });
                lItems.Add(new ItemData() { ItemName = "Sports Shoes", Date = "06/11/2014", Time = "05:56:32 AM", Quantity = 20, Price = 30, Amount = 600, Discount = 5, Profit = 50 });
                lItems.Add(new ItemData() { ItemName = "Formal Shoes", Date = "07/27/2014", Time = "03:32:44 AM", Quantity = 20, Price = 15, Amount = 300, Discount = 7, Profit = 27 });
                lItems.Add(new ItemData() { ItemName = "Sandals & Floaters", Date = "11/21/2014", Time = "06:23:54 AM", Quantity = 15, Price = 20, Amount = 300, Discount = 11, Profit = 67 });
                lItems.Add(new ItemData() { ItemName = "Flip- Flops & Slippers", Date = "06/23/2014", Time = "12:43:59 AM", Quantity = 30, Price = 10, Amount = 300, Discount = 10, Profit = 70 });
                lItems.Add(new ItemData() { ItemName = "Sneakers", Date = "07/22/2014", Time = "10:55:53 AM", Quantity = 40, Price = 20, Amount = 800, Discount = 13, Profit = 66 });
                lItems.Add(new ItemData() { ItemName = "Running Shoes", Date = "02/04/2014", Time = "03:44:34 AM", Quantity = 20, Price = 10, Amount = 200, Discount = 3, Profit = 14 });
                lItems.Add(new ItemData() { ItemName = "Loafers", Date = "11/30/2014", Time = "03:12:52 AM", Quantity = 31, Price = 10, Amount = 310, Discount = 6, Profit = 29 });
                lItems.Add(new ItemData() { ItemName = "Cricket Shoes", Date = "07/09/2014", Time = "11:32:14 AM", Quantity = 41, Price = 30, Amount = 1210, Discount = 12, Profit = 166 });
                lItems.Add(new ItemData() { ItemName = "T-Shirts", Date = "10/31/2014", Time = "12:01:44 AM", Quantity = 50, Price = 10, Amount = 500, Discount = 9, Profit = 55 });

                var itemCol =
                from item in lItems
                select new { item.ItemName, item.Date, item.Time, item.Quantity, item.Price, item.Amount, item.Discount, item.Profit };

                return itemCol;
            }
        }
    }
}