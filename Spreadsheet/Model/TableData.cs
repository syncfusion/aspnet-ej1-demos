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

    public class TableData
    {
        public string format1 { get; set; }
        public string format2 { get; set; }
        public string format3 { get; set; }
        public string format4 { get; set; }
        public string format5 { get; set; }
        public string format6 { get; set; }
        public string format7 { get; set; }
        public string format8 { get; set; }
        public string format9 { get; set; }
        public string format10 { get; set; }
        public string format11 { get; set; }
        public static List<TableData> GetTableDetails
        {
            get
            {
                List<TableData> formats = new List<TableData>();

                formats.Add(new TableData() { format1 = "Item Name", format2 = "Quantity", format4 = "Item Name", format5 = "Quantity", format7 = "Item Name", format8 = "Quantity" });
                formats.Add(new TableData() { format1 = "Casual Shoes", format2 = "10", format4 = "Sandals & Floaters", format5 = "200", format7 = "Running Shoes", format8 = "198" });
                formats.Add(new TableData() { format1 = "Sports Shoes", format2 = "20", format4 = "Flip- Flops", format5 = "600", format7 = "Loafers", format8 = "570" });
                formats.Add(new TableData() { format1 = "Formal Shoes", format2 = "20", format4 = "Sneakers", format5 = "300", format7 = "T-Shirts", format8 = "279" });
                formats.Add(new TableData());
                formats.Add(new TableData());
                formats.Add(new TableData());
                formats.Add(new TableData() { format1 = "Item Name", format2 = "Quantity", format4 = "Item Name", format5 = "Quantity", format7 = "Item Name", format8 = "Quantity" });
                formats.Add(new TableData() { format1 = "Casual Shoes", format2 = "10", format4 = "Sandals & Floaters", format5 = "200", format7 = "Running Shoes", format8 = "198" });
                formats.Add(new TableData() { format1 = "Sports Shoes", format2 = "20", format4 = "Flip- Flops", format5 = "600", format7 = "Loafers", format8 = "570" });
                formats.Add(new TableData() { format1 = "Formal Shoes", format2 = "20", format4 = "Sneakers", format5 = "300", format7 = "T-Shirts", format8 = "279" });

                return formats;
            }
        }
    }
}