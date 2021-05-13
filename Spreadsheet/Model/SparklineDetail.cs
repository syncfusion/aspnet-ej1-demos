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

    public class SparklineDetail
    {

        public int Discount { get; set; }
        public int Quantity { get; set; }
        public int Profit { get; set; }
        public int Loss { get; set; }
        public static IEnumerable<object> GetSparklineDetails
        {
            get
            {
                List<SparklineDetail> lItems = new List<SparklineDetail>();

                lItems.Add(new SparklineDetail() { Discount = 1, Quantity = 90, Profit = 10, Loss = -10 });
                lItems.Add(new SparklineDetail() { Discount = 5, Quantity = 83, Profit = 50, Loss = -54 });
                lItems.Add(new SparklineDetail() { Discount = 7, Quantity = 80, Profit = 27, Loss = -32 });
                lItems.Add(new SparklineDetail() { Discount = 11, Quantity = 93, Profit = 67, Loss = -43 });
                lItems.Add(new SparklineDetail() { Discount = 10, Quantity = 60, Profit = 70, Loss = -50 });
                lItems.Add(new SparklineDetail() { Discount = 13, Quantity = 71, Profit = 66, Loss = -47 });
                lItems.Add(new SparklineDetail() { Discount = 3, Quantity = 88, Profit = 14, Loss = -30 });
                lItems.Add(new SparklineDetail() { Discount = 6, Quantity = 95, Profit = 29, Loss = -70 });
                lItems.Add(new SparklineDetail() { Discount = 12, Quantity = 69, Profit = 16, Loss = -56 });
                lItems.Add(new SparklineDetail() { Discount = 9, Quantity = 77, Profit = 55, Loss = -67 });

                var itemCol =
                from item in lItems
                select new { item.Discount, item.Quantity, item.Profit, item.Loss };

                return itemCol;
            }
        }
    }
}