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
    public class MergeData
    {
        public string name { get; set; }
        public string style1 { get; set; }
        public string style2 { get; set; }
        public string style3 { get; set; }
        public string style4 { get; set; }
        public string style5 { get; set; }
        public static List<MergeData> GetMergeDetails
        {
            get
            {
                List<MergeData> formats = new List<MergeData>();

                formats.Add(new MergeData() { name = "Book Name", style1 = "Author Name", style2 = "Price Detail", style4 = "Profit(%)", style5 = "Buying Date" });
                formats.Add(new MergeData() { style2 = "Buying Price", style3 = "Selling Price" });
                formats.Add(new MergeData() { name = "All the King's Men", style1 = "Robert Penn Warren", style2 = "25", style3 = "27", style4 = "12", style5 = "7/28/2014" });
                formats.Add(new MergeData() { name = "Amar Kosh", style1 = "Amar Singh", style2 = "35", style3 = "36", style4 = "7", style5 = "7/28/2014" });
                formats.Add(new MergeData() { name = "American Capitalism", style1 = "J.K. Galbraith", style2 = "22", style3 = "26", style4 = "13", style5 = "02/18/2014" });
                formats.Add(new MergeData() { name = "Ambassador's Journal", style1 = "J.K. Galbraith", style2 = "19", style3 = "22", style4 = "12", style5 = "03/21/2014" });
                formats.Add(new MergeData() { name = "Affluent Society", style1 = "J.K. Galbraith", style2 = "26", style3 = "27", style4 = "5", style5 = "07/15/2014" });
                formats.Add(new MergeData() { name = "Arms and the Man", style1 = "G.B.Shaw", style2 = "31", style3 = "32", style4 = "4", style5 = "03/12/2014" });
                formats.Add(new MergeData() { name = "Treasure Island", style1 = "R.L.Stevenson", style2 = "20", style3 = "25", style4 = "22", style5 = "03/12/2014" });
                formats.Add(new MergeData() { name = "Adventures of Huckleberry Finn", style1 = "Mark Twain", style2 = "23", style3 = "24", style4 = "7", style5 = "12/24/2014" });
                formats.Add(new MergeData() { name = "Adventures of Tom Sawyer", style1 = "Mark Twain", style2 = "31", style3 = "34", style4 = "12", style5 = "10/31/2014" });
                formats.Add(new MergeData());
                formats.Add(new MergeData() { name = "Total", style2 = "212", style3 = "233" });

                return formats;
            }
        }
    }
}