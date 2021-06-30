#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using Syncfusion.JavaScript.Web;
using Syncfusion.JavaScript.DataVisualization.Models;
using Syncfusion.JavaScript.DataVisualization;

namespace WebSampleBrowser.TreeMap
{
    public partial class Hierarchical : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.treemap.DataSource = CountrySalesData.GetData();         
        }
    }

    [Serializable]
    public class SalesData
    {
        public double Sales { get; set; }
        public double Expense { get; set; }
    }

    [Serializable]
    public class CitySalesData : SalesData
    {
        public string Name { get; set; }

        public static List<CitySalesData> GetUnitedStatesData()
        {
            List<CitySalesData> data = new List<CitySalesData>();
            data.Add(new CitySalesData() { Name = "New York", Sales = 2353, Expense = 2000 });
            data.Add(new CitySalesData() { Name = "Los Angeles", Sales = 3453, Expense = 3000 });
            data.Add(new CitySalesData() { Name = "San francisco", Sales = 8456, Expense = 8000 });
            data.Add(new CitySalesData() { Name = "Chicago", Sales = 6785, Expense = 7000 });
            data.Add(new CitySalesData() { Name = "Miami", Sales = 7045, Expense = 6000 });
            return data;
        }

        public static List<CitySalesData> GetCanadaData()
        {
            List<CitySalesData> data = new List<CitySalesData>();
            data.Add(new CitySalesData() { Name = "Toronto", Sales = 7045, Expense = 7000 });
            data.Add(new CitySalesData() { Name = "Van couver", Sales = 4352, Expense = 4000 });
            data.Add(new CitySalesData() { Name = "Winnipeg", Sales = 7843, Expense = 7500 });
            return data;
        }

        public static List<CitySalesData> GetMexicoData()
        {
            List<CitySalesData> data = new List<CitySalesData>();
            data.Add(new CitySalesData() { Name = "Mexico city", Sales = 7843, Expense = 6500 });
            data.Add(new CitySalesData() { Name = "Cancun", Sales = 6683, Expense = 6000 });
            data.Add(new CitySalesData() { Name = "Acapulco", Sales = 2454, Expense = 2000 });
            return data;
        }
    }

    [Serializable]
    public class CountrySalesData : SalesData
    {
        public string Name { get; set; }
        public List<CitySalesData> States { get; set; }

        public static List<CountrySalesData> GetData()
        {
            List<CountrySalesData> lt = new List<CountrySalesData>();

            lt.Add(new CountrySalesData() { Name = "United States", States = CitySalesData.GetUnitedStatesData(), Sales = 28092, Expense = 26000 });
            lt.Add(new CountrySalesData() { Name = "Canada", States = CitySalesData.GetCanadaData(), Sales = 19240, Expense = 18500 });
            lt.Add(new CountrySalesData() { Name = "Mexico", States = CitySalesData.GetMexicoData(), Sales = 16980, Expense = 14500 });

            return lt;
        }
    }
}