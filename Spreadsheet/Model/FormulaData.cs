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

    public class FormulaData
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
        public static List<FormulaData> GetFormulaDetails
        {
            get
            {
                List<FormulaData> formats = new List<FormulaData>();

                formats.Add(new FormulaData() { format1 = "String Function", format4 = "Information Function", format7 = "Item Name", format8 = "Quantity", format9 = "Price", format10 = "Amount" });
                formats.Add(new FormulaData() { format1 = "'=CONCATENATE(\"one\",\"big\")", format4 = "'=CELL(\"address\", H2)", format7 = "Sports Shoes", format8 = "20", format9 = "30", format10 = "600" });
                formats.Add(new FormulaData() { format1 = "'=LOWER(G2)", format4 = "'=ISBLANK(F2)", format7 = "Formal Shoes", format8 = "20", format9 = "15", format10 = "300" });
                formats.Add(new FormulaData() { format1 = "'=UPPER(G3)", format4 = "'=ISERROR(J4)", format7 = "Sandals & Floaters", format8 = "15", format9 = "20", format10 = "300" });
                formats.Add(new FormulaData() { format1 = "'=FIND(\"E\",\"SPREAD\")", format4 = "'=ISNUMBER(H5)", format7 = "Flip- Flops", format8 = "30", format9 = "10", format10 = "300" });
                formats.Add(new FormulaData() { format1 = "'=REPLACE(H3,3,2,\"10\")", format4 = "'=TYPE(H2)", format7 = "Sneakers", format8 = "40", format9 = "20", format10 = "800" });
                formats.Add(new FormulaData() { format7 = "Running Shoes", format8 = "20", format9 = "10", format10 = "200" });
                formats.Add(new FormulaData() { format7 = "T-Shirts", format8 = "50", format9 = "103", format10 = "3300" });
                formats.Add(new FormulaData() { format1 = "Math Function", format4 = "Statistical and Logical", format7 = "Loafers", format8 = "31", format9 = "10", format10 = "310" });
                formats.Add(new FormulaData() { format1 = "'=SQRT(25)", format4 = "'=AND(TRUE,FALSE)", format7 = "Cricket Shoes", format8 = "41", format9 = "30", format10 = "1210" });
                formats.Add(new FormulaData() { format1 = "'=AVERAGE(J3:J7)", format4 = "'=SUMIF(J2:J13, 3)", format7 = "T-Shirts", format8 = "50", format9 = "10", format10 = "500" });
                formats.Add(new FormulaData() { format1 = "'=SUM(H3:H7)", format4 = "'=MAX(I2:I6)", format7 = "T-Shirts", format8 = "50", format9 = "10", format10 = "500" });
                formats.Add(new FormulaData() { format1 = "'=PRODUCT(H4,H5)", format4 = "'=MIN(J2:J6)", format7 = "Running Shoes", format8 = "20", format9 = "10", format10 = "200" });

                return formats;
            }
        }
    }
}