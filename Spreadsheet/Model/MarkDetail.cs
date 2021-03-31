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
    public class MarkDetail
    {
        public string Name { get; set; }
        public int Average { get; set; }
        public string Grade { get; set; }
        public static List<MarkDetail> GetAllMarkList
        {
            get
            {
                List<MarkDetail> lItems = new List<MarkDetail>();

                lItems.Add(new MarkDetail() { Name = "VINET", Average = 90, Grade = "S" });
                lItems.Add(new MarkDetail() { Name = "TOMSP", Average = 83, Grade = "A" });
                lItems.Add(new MarkDetail() { Name = "HANAR", Average = 80, Grade = "A" });
                lItems.Add(new MarkDetail() { Name = "VICTE", Average = 93, Grade = "S" });
                lItems.Add(new MarkDetail() { Name = "SUPRD", Average = 60, Grade = "D" });
                lItems.Add(new MarkDetail() { Name = "CHOPS", Average = 71, Grade = "C" });
                lItems.Add(new MarkDetail() { Name = "WELLI", Average = 88, Grade = "A" });
                lItems.Add(new MarkDetail() { Name = "HILLA", Average = 95, Grade = "S" });
                lItems.Add(new MarkDetail() { Name = "ERNSH", Average = 69, Grade = "D" });
                lItems.Add(new MarkDetail() { Name = "CENTC", Average = 77, Grade = "C" });
                lItems.Add(new MarkDetail() { Name = "OTTIK", Average = 95, Grade = "S" });
                lItems.Add(new MarkDetail() { Name = "RATTC", Average = 85, Grade = "A" });
                lItems.Add(new MarkDetail() { Name = "FOLKO", Average = 90, Grade = "A" });
                lItems.Add(new MarkDetail() { Name = "BLONP", Average = 97, Grade = "S" });

                return lItems;
            }
        }
    }
}