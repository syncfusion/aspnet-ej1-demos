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

    public class PivotData
    {
        public int Amount { get; set; }
        public string State { get; set; }
        public int Quantity { get; set; }
        public string Product { get; set; }
        public string Date { get; set; }
        public string Country { get; set; }
        public static List<PivotData> GetPivotDetails
        {
            get
            {
                List<PivotData> data = new List<PivotData>();

                data.Add(new PivotData() { Amount = 100, Country = "Canada", Date = "FY 2005", Product = "Bike", Quantity = 2, State = "Alberta" });
                data.Add(new PivotData() { Amount = 200, Country = "Canada", Date = "FY 2006", Product = "Van", Quantity = 3, State = "British Columbia" });
                data.Add(new PivotData() { Amount = 300, Country = "Canada", Date = "FY 2007", Product = "Car", Quantity = 4, State = "Brunswick" });
                data.Add(new PivotData() { Amount = 150, Country = "Canada", Date = "FY 2008", Product = "Bike", Quantity = 3, State = "Manitoba" });
                data.Add(new PivotData() { Amount = 200, Country = "Canada", Date = "FY 2006", Product = "Car", Quantity = 4, State = "Ontario" });
                data.Add(new PivotData() { Amount = 100, Country = "Canada", Date = "FY 2007", Product = "Van", Quantity = 1, State = "Quebec" });
                data.Add(new PivotData() { Amount = 200, Country = "France", Date = "FY 2005", Product = "Bike", Quantity = 2, State = "Charente-Maritime" });
                data.Add(new PivotData() { Amount = 250, Country = "France", Date = "FY 2006", Product = "Van", Quantity = 4, State = "Essonne" });
                data.Add(new PivotData() { Amount = 300, Country = "France", Date = "FY 2007", Product = "Car", Quantity = 3, State = "Garonne (Haute)" });
                data.Add(new PivotData() { Amount = 150, Country = "France", Date = "FY 2008", Product = "Van", Quantity = 2, State = "Gers" });
                data.Add(new PivotData() { Amount = 200, Country = "Germany", Date = "FY 2006", Product = "Van", Quantity = 3, State = "Bayern" });
                data.Add(new PivotData() { Amount = 250, Country = "Germany", Date = "FY 2007", Product = "Car", Quantity = 3, State = "Brandenburg" });
                data.Add(new PivotData() { Amount = 150, Country = "Germany", Date = "FY 2008", Product = "Car", Quantity = 4, State = "Hamburg" });
                data.Add(new PivotData() { Amount = 200, Country = "Germany", Date = "FY 2008", Product = "Bike", Quantity = 4, State = "Hessen" });
                data.Add(new PivotData() { Amount = 150, Country = "Germany", Date = "FY 2007", Product = "Van", Quantity = 3, State = "Nordrhein-Westfalen" });
                data.Add(new PivotData() { Amount = 100, Country = "Germany", Date = "FY 2005", Product = "Bike", Quantity = 2, State = "Saarland" });
                data.Add(new PivotData() { Amount = 150, Country = "United Kingdom", Date = "FY 2008", Product = "Bike", Quantity = 5, State = "England" });
                data.Add(new PivotData() { Amount = 250, Country = "United States", Date = "FY 2007", Product = "Car", Quantity = 4, State = "Alabama" });
                data.Add(new PivotData() { Amount = 200, Country = "United States", Date = "FY 2005", Product = "Van", Quantity = 4, State = "California" });
                data.Add(new PivotData() { Amount = 100, Country = "United States", Date = "FY 2006", Product = "Bike", Quantity = 2, State = "Colorado" });
                data.Add(new PivotData() { Amount = 150, Country = "United States", Date = "FY 2008", Product = "Car", Quantity = 3, State = "New Mexico" });
                data.Add(new PivotData() { Amount = 200, Country = "United States", Date = "FY 2005", Product = "Bike", Quantity = 4, State = "New York" });
                data.Add(new PivotData() { Amount = 250, Country = "United States", Date = "FY 2008", Product = "Car", Quantity = 3, State = "North Carolina" });
                data.Add(new PivotData() { Amount = 300, Country = "United States", Date = "FY 2007", Product = "Van", Quantity = 4, State = "South Carolina" });

                return data;
            }
        }
    }
}