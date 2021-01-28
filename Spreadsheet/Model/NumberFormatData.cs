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

    public class NumberFormatData
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
        public static List<NumberFormatData> GetNumFormats
        {
            get
            {
                List<NumberFormatData> formats = new List<NumberFormatData>();

                formats.Add(new NumberFormatData() { format1 = "Percentage", format2 = "", format3 = "Number", format4 = "", format5 = "Currency", format6 = "", format7 = "Accounting", format8 = "", format9 = "General" });
                formats.Add(new NumberFormatData() { format1 = "43", format2 = "", format3 = "10", format4 = "", format5 = "10", format6 = "", format7 = "244", format8 = "", format9 = "1" });
                formats.Add(new NumberFormatData() { format1 = "23", format2 = "", format3 = "9", format4 = "", format5 = "13", format6 = "", format7 = "23443", format8 = "", format9 = "2" });
                formats.Add(new NumberFormatData() { format1 = "45", format2 = "", format3 = "15", format4 = "", format5 = "2015", format6 = "", format7 = "53454", format8 = "", format9 = "Three" });
                formats.Add(new NumberFormatData() { format1 = "65", format2 = "", format3 = "18", format4 = "", format5 = "13", format6 = "", format7 = "75656", format8 = "", format9 = "Four" });
                formats.Add(new NumberFormatData());
                formats.Add(new NumberFormatData());
                formats.Add(new NumberFormatData() { format1 = "Short Date", format2 = "", format3 = "Long Date", format4 = "", format5 = "Time", format6 = "", format7 = "Scientific", format8 = "", format9 = "Fraction" });
                formats.Add(new NumberFormatData() { format1 = "12/23/2015", format2 = "", format3 = "06/01/2015", format4 = "", format5 = "10:09:15 AM", format6 = "", format7 = "24562424", format8 = "", format9 = "567.456" });
                formats.Add(new NumberFormatData() { format1 = "09/22/2015", format2 = "", format3 = "04/10/2015", format4 = "", format5 = "03:08:35 PM", format6 = "", format7 = "24465624", format8 = "", format9 = "435.499" });
                formats.Add(new NumberFormatData() { format1 = "07/16/2015", format2 = "", format3 = "03/03/2015", format4 = "", format5 = "11:11:45 PM", format6 = "", format7 = "24906774", format8 = "", format9 = "245.134" });
                formats.Add(new NumberFormatData() { format1 = "04/19/2015", format2 = "", format3 = "05/07/2015", format4 = "", format5 = "05:11:54 AM", format6 = "", format7 = "76753453", format8 = "", format9 = "876.764" });
                formats.Add(new NumberFormatData());
                formats.Add(new NumberFormatData());
                formats.Add(new NumberFormatData() { format1 = "", format2 = "", format3 = "", format4 = "", format5 = "Text", format6 = "", format7 = "", format8 = "", format9 = "" });
                formats.Add(new NumberFormatData() { format1 = "", format2 = "", format3 = "", format4 = "", format5 = "100", format6 = "", format7 = "", format8 = "", format9 = "" });
                formats.Add(new NumberFormatData() { format1 = "", format2 = "", format3 = "", format4 = "", format5 = "Laptop", format6 = "", format7 = "", format8 = "", format9 = "" });
                formats.Add(new NumberFormatData() { format1 = "", format2 = "", format3 = "", format4 = "", format5 = "$10.12", format6 = "", format7 = "", format8 = "", format9 = "" });
                formats.Add(new NumberFormatData() { format1 = "", format2 = "", format3 = "", format4 = "", format5 = "Mobile", format6 = "", format7 = "", format8 = "", format9 = "" });

                return formats;
            }
        }
    }
}