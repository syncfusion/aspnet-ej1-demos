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

    public class ConditionalFormatData
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
        public static List<ConditionalFormatData> GetCFormatDetails
        {
            get
            {
                List<ConditionalFormatData> formats = new List<ConditionalFormatData>();

                formats.Add(new ConditionalFormatData() { format1 = "Text contains with Loafers", format2 = "Loafers", format4 = "Date occur with 02/04/2014", format5 = "05/03/2013", format7 = "Less than 30", format8 = "5" });
                formats.Add(new ConditionalFormatData() { format2 = "Casual Shoes", format5 = "06/23/2014", format8 = "56" });
                formats.Add(new ConditionalFormatData() { format2 = "Loafers", format5 = "07/22/2014", format8 = "24" });
                formats.Add(new ConditionalFormatData() { format2 = "Formal Shoes", format5 = "02/04/2014", format8 = "12" });
                formats.Add(new ConditionalFormatData() { format2 = "Sandals & Floaters", format5 = "11/30/2014", format8 = "36" });
                formats.Add(new ConditionalFormatData());
                formats.Add(new ConditionalFormatData() { format1 = "Between 400 to 500", format2 = "273", format4 = "Greater than 5000", format5 = "5003", format7 = "Equal to 20", format8 = "21" });
                formats.Add(new ConditionalFormatData() { format2 = "345", format5 = "3434", format8 = "34" });
                formats.Add(new ConditionalFormatData() { format2 = "494", format5 = "7553", format8 = "20" });
                formats.Add(new ConditionalFormatData() { format2 = "506", format5 = "2364", format8 = "20" });
                formats.Add(new ConditionalFormatData() { format2 = "453", format5 = "6788", format8 = "23" });

                return formats;
            }
        }
    }
}