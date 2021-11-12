#region Copyright Syncfusion Inc. 2001-2021
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
using Syncfusion.JavaScript.DataVisualization.Maps;
using Syncfusion.JavaScript.Web;
using Syncfusion.JavaScript.DataVisualization.Models;
using Syncfusion.JavaScript.DataVisualization;

namespace WebSampleBrowser.Map
{
    public partial class DrillDown : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            (this.drillDown.Layers[0] as ShapeLayer).DataSource=Continent_CountriesDatas.GetContinentCountriesData();
            (this.drillDown.Layers[0] as ShapeLayer).ShapeData = GetContinentMap();
            ((this.drillDown.Layers[0] as ShapeLayer).SubLayers[0] as ShapeLayer).DataSource = Countries_RandomData.GetCountriesRandomData();
            ((this.drillDown.Layers[0] as ShapeLayer).SubLayers[0] as ShapeLayer).ShapeData = GetContinentSalesMap();
            (this.drillDown.Layers[1] as ShapeLayer).ShapeData = GetAfricaMap();
            (this.drillDown.Layers[2] as ShapeLayer).ShapeData = GetAsiaMap();
            (this.drillDown.Layers[3] as ShapeLayer).ShapeData = GetEuropeMap();
            (this.drillDown.Layers[4] as ShapeLayer).ShapeData = GetNorthAmericaMap();
            (this.drillDown.Layers[5] as ShapeLayer).ShapeData = GetOceaniaMap();
            (this.drillDown.Layers[6] as ShapeLayer).ShapeData = GetSouthAmericaMap();
        }

        public object GetSalesCountryData()
        {
            string allText = System.IO.File.ReadAllText(Server.MapPath("~/App_Data/salesCountry.json"));
            JavaScriptSerializer ser = new JavaScriptSerializer();
            ser.MaxJsonLength = int.MaxValue;
            return new MapData(allText);
        }

        public object GetContinentSalesMap()
        {
            string allText = System.IO.File.ReadAllText(Server.MapPath("~/App_Data/ContinentSales.json"));
            JavaScriptSerializer ser = new JavaScriptSerializer();
            ser.MaxJsonLength = int.MaxValue;
            return new MapData(allText);
        }

        public object GetContinentMap()
        {
            string allText = System.IO.File.ReadAllText(Server.MapPath("~/App_Data/WorldMap.json"));
            JavaScriptSerializer ser = new JavaScriptSerializer();
            ser.MaxJsonLength = int.MaxValue;
            return new MapData(allText);
        }

        public object Continent_CountriesData()
        {
            string allText = System.IO.File.ReadAllText(Server.MapPath("~/App_Data/Continent_CountriesData.json"));
            JavaScriptSerializer ser = new JavaScriptSerializer();
            ser.MaxJsonLength = int.MaxValue;
            return new MapData(allText);
        }


        public object GetAfricaMap()
        {
            string allText = System.IO.File.ReadAllText(Server.MapPath("~/App_Data/Africa.json"));
            JavaScriptSerializer ser = new JavaScriptSerializer();
            ser.MaxJsonLength = int.MaxValue;
            return new MapData(allText);
        }

        public object GetAsiaMap()
        {
            string allText = System.IO.File.ReadAllText(Server.MapPath("~/App_Data/Asia.json"));
            JavaScriptSerializer ser = new JavaScriptSerializer();
            ser.MaxJsonLength = int.MaxValue;
            return new MapData(allText);
        }

        public object GetEuropeMap()
        {
            string allText = System.IO.File.ReadAllText(Server.MapPath("~/App_Data/Europe.json"));
            JavaScriptSerializer ser = new JavaScriptSerializer();
            ser.MaxJsonLength = int.MaxValue;
            return new MapData(allText);
        }

        public object GetNorthAmericaMap()
        {
            string allText = System.IO.File.ReadAllText(Server.MapPath("~/App_Data/NorthAmerica.json"));
            JavaScriptSerializer ser = new JavaScriptSerializer();
            ser.MaxJsonLength = int.MaxValue;
            return new MapData(allText);
        }

        public object GetOceaniaMap()
        {
            string allText = System.IO.File.ReadAllText(Server.MapPath("~/App_Data/Oceania.json"));
            JavaScriptSerializer ser = new JavaScriptSerializer();
            ser.MaxJsonLength = int.MaxValue;
            return new MapData(allText);
        }

        public object GetSouthAmericaMap()
        {
            string allText = System.IO.File.ReadAllText(Server.MapPath("~/App_Data/SouthAmerica.json"));
            JavaScriptSerializer ser = new JavaScriptSerializer();
            ser.MaxJsonLength = int.MaxValue;
            return new MapData(allText);
        }         
    }
    public class Continent_CountriesDatas
    {
        public static List<CountriesData> GetContinentCountriesData()
        {
            List<CountriesData> continentCountriesData = new List<CountriesData>
            {
                new CountriesData {Name = "Aruba", Continent =  "North America" },
                new CountriesData {Name = "Afghanistan", Continent =  "Asia" },
                new CountriesData {Name = "Angola", Continent =  "Africa" },
                new CountriesData {Name = "Anguilla", Continent =  "North America" },
                new CountriesData {Name = "Albania", Continent =  "Europe" },
                new CountriesData {Name = "Aland", Continent =  "Europe" },
                new CountriesData {Name = "Andorra", Continent =  "Europe" },
                new CountriesData {Name = "United Arab Emirates", Continent =  "Asia" },
                new CountriesData {Name = "Argentina", Continent =  "South America" },
                new CountriesData {Name = "Armenia", Continent =  "Asia" },
                new CountriesData {Name = "American Samoa", Continent =  "Oceania" },
                new CountriesData {Name = "Antarctica", Continent =  "Antarctica" },
                new CountriesData {Name = "Fr. S. Antarctic Lands", Continent =  "Seven seas (open ocean)" },
                new CountriesData {Name = "Antigua and Barb.", Continent =  "North America" },
                new CountriesData {Name = "Australia", Continent =  "Oceania" },
                new CountriesData {Name = "Austria", Continent =  "Europe" },
                new CountriesData {Name = "Azerbaijan", Continent =  "Asia" },
                new CountriesData {Name = "Burundi", Continent =  "Africa" },
                new CountriesData {Name = "Belgium", Continent =  "Europe" },
                new CountriesData {Name = "Benin", Continent =  "Africa" },
                new CountriesData {Name = "Burkina Faso", Continent =  "Africa" },
                new CountriesData {Name = "Bangladesh", Continent =  "Asia" },
                new CountriesData {Name = "Bulgaria", Continent =  "Europe" },
                new CountriesData {Name = "Bahrain", Continent =  "Asia" },
                new CountriesData {Name = "Bahamas", Continent =  "North America" },
                new CountriesData {Name = "Bosnia and Herz.", Continent =  "Europe" },
                new CountriesData {Name = "Bajo Nuevo Bank (Petrel Is.)", Continent =  "North America" },
                new CountriesData {Name = "St-Barthélemy", Continent =  "North America" },
                new CountriesData {Name = "Belarus", Continent =  "Europe" },
                new CountriesData {Name = "Belize", Continent =  "North America" },
                new CountriesData {Name = "Bermuda", Continent =  "North America" },
                new CountriesData {Name = "Bolivia", Continent =  "South America" },
                new CountriesData {Name = "Brazil", Continent =  "South America" },
                new CountriesData {Name = "Barbados", Continent =  "North America" },
                new CountriesData {Name = "Brunei", Continent =  "Asia" },
                new CountriesData {Name = "Bhutan", Continent =  "Asia" },
                new CountriesData {Name = "Botswana", Continent =  "Africa" },
                new CountriesData {Name = "Central African Rep.", Continent =  "Africa" },
                new CountriesData {Name = "Canada", Continent =  "North America" },
                new CountriesData {Name = "Switzerland", Continent =  "Europe" },
                new CountriesData {Name = "Chile", Continent =  "South America" },
                new CountriesData {Name = "China", Continent =  "Asia" },
                new CountriesData {Name = "Côte d'Ivoire", Continent =  "Africa" },
                new CountriesData {Name = "Clipperton I.", Continent =  "Seven seas (open ocean)" },
                new CountriesData {Name = "Cameroon", Continent =  "Africa" },
                new CountriesData {Name = "Cyprus U.N. Buffer Zone", Continent =  "Asia" },
                new CountriesData {Name = "Dem. Rep. Congo", Continent =  "Africa" },
                new CountriesData {Name = "Congo", Continent =  "Africa" },
                new CountriesData {Name = "Cook Is.", Continent =  "Oceania" },
                new CountriesData {Name = "Colombia", Continent =  "South America" },
                new CountriesData {Name = "Comoros", Continent =  "Africa" },
                new CountriesData {Name = "Cape Verde", Continent =  "Africa" },
                new CountriesData {Name = "Costa Rica", Continent =  "North America" },
                new CountriesData {Name = "Coral Sea Is.", Continent =  "Oceania" },
                new CountriesData {Name = "Cuba", Continent =  "North America" },
                new CountriesData {Name = "Curaçao", Continent =  "North America" },
                new CountriesData {Name = "Cayman Is.", Continent =  "North America" },
                new CountriesData {Name = "N. Cyprus", Continent =  "Asia" },
                new CountriesData {Name = "Cyprus", Continent =  "Asia" },
                new CountriesData {Name = "Czech Rep.", Continent =  "Europe" },
                new CountriesData {Name = "Germany", Continent =  "Europe" },
                new CountriesData {Name = "Djibouti", Continent =  "Africa" },
                new CountriesData {Name = "Dominica", Continent =  "North America" },
                new CountriesData {Name = "Denmark", Continent =  "Europe" },
                new CountriesData {Name = "Dominican Rep.", Continent =  "North America" },
                new CountriesData {Name = "Algeria", Continent =  "Africa" },
                new CountriesData {Name = "Ecuador", Continent =  "South America" },
                new CountriesData {Name = "Egypt", Continent =  "Africa" },
                new CountriesData {Name = "Eritrea", Continent =  "Africa" },
                new CountriesData {Name = "Dhekelia", Continent =  "Asia" },
                new CountriesData {Name = "Spain", Continent =  "Europe" },
                new CountriesData {Name = "Estonia", Continent =  "Europe" },
                new CountriesData {Name = "Ethiopia", Continent =  "Africa" },
                new CountriesData {Name = "Finland", Continent =  "Europe" },
                new CountriesData {Name = "Fiji", Continent =  "Oceania" },
                new CountriesData {Name = "Falkland Is.", Continent =  "South America" },
                new CountriesData {Name = "France", Continent =  "Europe" },
                new CountriesData {Name = "Faeroe Is.", Continent =  "Europe" },
                new CountriesData {Name = "Micronesia", Continent =  "Oceania" },
                new CountriesData {Name = "Gabon", Continent =  "Africa" },
                new CountriesData {Name = "United Kingdom", Continent =  "Europe" },
                new CountriesData {Name = "Georgia", Continent =  "Asia" },
                new CountriesData {Name = "Guernsey", Continent =  "Europe" },
                new CountriesData {Name = "Ghana", Continent =  "Africa" },
                new CountriesData {Name = "Gibraltar", Continent =  "Europe" },
                new CountriesData {Name = "Guinea", Continent =  "Africa" },
                new CountriesData {Name = "Gambia", Continent =  "Africa" },
                new CountriesData {Name = "Guinea-Bissau", Continent =  "Africa" },
                new CountriesData {Name = "Eq. Guinea", Continent =  "Africa" },
                new CountriesData {Name = "Greece", Continent =  "Europe" },
                new CountriesData {Name = "Grenada", Continent =  "North America" },
                new CountriesData {Name = "Greenland", Continent =  "North America" },
                new CountriesData {Name = "Guatemala", Continent =  "North America" },
                new CountriesData {Name = "Guam", Continent =  "Oceania" },
                new CountriesData {Name = "Guyana", Continent =  "South America" },
                new CountriesData {Name = "Hong Kong", Continent =  "Asia" },
                new CountriesData {Name = "Heard I. and McDonald Is.", Continent =  "Seven seas (open ocean)" },
                new CountriesData {Name = "Honduras", Continent =  "North America" },
                new CountriesData {Name = "Croatia", Continent =  "Europe" },
                new CountriesData {Name = "Haiti", Continent =  "North America" },
                new CountriesData {Name = "Hungary", Continent =  "Europe" },
                new CountriesData {Name = "Indonesia", Continent =  "Asia" },
                new CountriesData {Name = "Isle of Man", Continent =  "Europe" },
                new CountriesData {Name = "India", Continent =  "Asia" },
                new CountriesData {Name = "Indian Ocean Ter.", Continent =  "Asia" },
                new CountriesData {Name = "Br. Indian Ocean Ter.", Continent =  "Seven seas (open ocean)" },
                new CountriesData {Name = "Ireland", Continent =  "Europe" },
                new CountriesData {Name = "Iran", Continent =  "Asia" },
                new CountriesData {Name = "Iraq", Continent =  "Asia" },
                new CountriesData {Name = "Iceland", Continent =  "Europe" },
                new CountriesData {Name = "Israel", Continent =  "Asia" },
                new CountriesData {Name = "Italy", Continent =  "Europe" },
                new CountriesData {Name = "Jamaica", Continent =  "North America" },
                new CountriesData {Name = "Jersey", Continent =  "Europe" },
                new CountriesData {Name = "Jordan", Continent =  "Asia" },
                new CountriesData {Name = "Japan", Continent =  "Asia" },
                new CountriesData {Name = "Baikonur", Continent =  "Asia" },
                new CountriesData {Name = "Siachen Glacier", Continent =  "Asia" },
                new CountriesData {Name = "Kazakhstan", Continent =  "Asia" },
                new CountriesData {Name = "Kenya", Continent =  "Africa" },
                new CountriesData {Name = "Kyrgyzstan", Continent =  "Asia" },
                new CountriesData {Name = "Cambodia", Continent =  "Asia" },
                new CountriesData {Name = "Kiribati", Continent =  "Oceania" },
                new CountriesData {Name = "St. Kitts and Nevis", Continent =  "North America" },
                new CountriesData {Name = "Korea", Continent =  "Asia" },
                new CountriesData {Name = "Kosovo", Continent =  "Europe" },
                new CountriesData {Name = "Kuwait", Continent =  "Asia" },
                new CountriesData {Name = "Lao PDR", Continent =  "Asia" },
                new CountriesData {Name = "Lebanon", Continent =  "Asia" },
                new CountriesData {Name = "Liberia", Continent =  "Africa" },
                new CountriesData {Name = "Libya", Continent =  "Africa" },
                new CountriesData {Name = "Saint Lucia", Continent =  "North America" },
                new CountriesData {Name = "Liechtenstein", Continent =  "Europe" },
                new CountriesData {Name = "Sri Lanka", Continent =  "Asia" },
                new CountriesData {Name = "Lesotho", Continent =  "Africa" },
                new CountriesData {Name = "Lithuania", Continent =  "Europe" },
                new CountriesData {Name = "Luxembourg", Continent =  "Europe" },
                new CountriesData {Name = "Latvia", Continent =  "Europe" },
                new CountriesData {Name = "Macao", Continent =  "Asia" },
                new CountriesData {Name = "St-Martin", Continent =  "North America" },
                new CountriesData {Name = "Morocco", Continent =  "Africa" },
                new CountriesData {Name = "Monaco", Continent =  "Europe" },
                new CountriesData {Name = "Moldova", Continent =  "Europe" },
                new CountriesData {Name = "Madagascar", Continent =  "Africa" },
                new CountriesData {Name = "Maldives", Continent =  "Seven seas (open ocean)" },
                new CountriesData {Name = "Mexico", Continent =  "North America" },
                new CountriesData {Name = "Marshall Is.", Continent =  "Oceania" },
                new CountriesData {Name = "Macedonia", Continent =  "Europe" },
                new CountriesData {Name = "Mali", Continent =  "Africa" },
                new CountriesData {Name = "Malta", Continent =  "Europe" },
                new CountriesData {Name = "Myanmar", Continent =  "Asia" },
                new CountriesData {Name = "Montenegro", Continent =  "Europe" },
                new CountriesData {Name = "Mongolia", Continent =  "Asia" },
                new CountriesData {Name = "N. Mariana Is.", Continent =  "Oceania" },
                new CountriesData {Name = "Mozambique", Continent =  "Africa" },
                new CountriesData {Name = "Mauritania", Continent =  "Africa" },
                new CountriesData {Name = "Montserrat", Continent =  "North America" },
                new CountriesData {Name = "Mauritius", Continent =  "Seven seas (open ocean)" },
                new CountriesData {Name = "Malawi", Continent =  "Africa" },
                new CountriesData {Name = "Malaysia", Continent =  "Asia" },
                new CountriesData {Name = "Namibia", Continent =  "Africa" },
                new CountriesData {Name = "New Caledonia", Continent =  "Oceania" },
                new CountriesData {Name = "Niger", Continent =  "Africa" },
                new CountriesData {Name = "Norfolk Island", Continent =  "Oceania" },
                new CountriesData {Name = "Nigeria", Continent =  "Africa" },
                new CountriesData {Name = "Nicaragua", Continent =  "North America" },
                new CountriesData {Name = "Niue", Continent =  "Oceania" },
                new CountriesData {Name = "Netherlands", Continent =  "Europe" },
                new CountriesData {Name = "Norway", Continent =  "Europe" },
                new CountriesData {Name = "Nepal", Continent =  "Asia" },
                new CountriesData {Name = "Nauru", Continent =  "Oceania" },
                new CountriesData {Name = "New Zealand", Continent =  "Oceania" },
                new CountriesData {Name = "Oman", Continent =  "Asia" },
                new CountriesData {Name = "Pakistan", Continent =  "Asia" },
                new CountriesData {Name = "Panama", Continent =  "North America" },
                new CountriesData {Name = "Pitcairn Is.", Continent =  "Oceania" },
                new CountriesData {Name = "Peru", Continent =  "South America" },
                new CountriesData {Name = "Spratly Is.", Continent =  "Asia" },
                new CountriesData {Name = "Philippines", Continent =  "Asia" },
                new CountriesData {Name = "Palau", Continent =  "Oceania" },
                new CountriesData {Name = "Papua New Guinea", Continent =  "Oceania" },
                new CountriesData {Name = "Poland", Continent =  "Europe" },
                new CountriesData {Name = "Puerto Rico", Continent =  "North America" },
                new CountriesData {Name = "Dem. Rep. Korea", Continent =  "Asia" },
                new CountriesData {Name = "Portugal", Continent =  "Europe" },
                new CountriesData {Name = "Paraguay", Continent =  "South America" },
                new CountriesData {Name = "Palestine", Continent =  "Asia" },
                new CountriesData {Name = "Fr. Polynesia", Continent =  "Oceania" },
                new CountriesData {Name = "Qatar", Continent =  "Asia" },
                new CountriesData {Name = "Romania", Continent =  "Europe" },
                new CountriesData {Name = "Russia", Continent =  "Europe" },
                new CountriesData {Name = "Rwanda", Continent =  "Africa" },
                new CountriesData {Name = "W. Sahara", Continent =  "Africa" },
                new CountriesData {Name = "Saudi Arabia", Continent =  "Asia" },
                new CountriesData {Name = "Scarborough Reef", Continent =  "Asia" },
                new CountriesData {Name = "Sudan", Continent =  "Africa" },
                new CountriesData {Name = "S. Sudan", Continent =  "Africa" },
                new CountriesData {Name = "Senegal", Continent =  "Africa" },
                new CountriesData {Name = "Serranilla Bank", Continent =  "North America" },
                new CountriesData {Name = "Singapore", Continent =  "Asia" },
                new CountriesData {Name = "S. Geo. and S. Sandw. Is.", Continent =  "Seven seas (open ocean)" },
                new CountriesData {Name = "Saint Helena", Continent =  "Seven seas (open ocean)" },
                new CountriesData {Name = "Solomon Is.", Continent =  "Oceania" },
                new CountriesData {Name = "Sierra Leone", Continent =  "Africa" },
                new CountriesData {Name = "El Salvador", Continent =  "North America" },
                new CountriesData {Name = "San Marino", Continent =  "Europe" },
                new CountriesData {Name = "Somaliland", Continent =  "Africa" },
                new CountriesData {Name = "Somalia", Continent =  "Africa" },
                new CountriesData {Name = "St. Pierre and Miquelon", Continent =  "North America" },
                new CountriesData {Name = "Serbia", Continent =  "Europe" },
                new CountriesData {Name = "São Tomé and Principe", Continent =  "Africa" },
                new CountriesData {Name = "Suriname", Continent =  "South America" },
                new CountriesData {Name = "Slovakia", Continent =  "Europe" },
                new CountriesData {Name = "Slovenia", Continent =  "Europe" },
                new CountriesData {Name = "Sweden", Continent =  "Europe" },
                new CountriesData {Name = "Swaziland", Continent =  "Africa" },
                new CountriesData {Name = "Sint Maarten", Continent =  "North America" },
                new CountriesData {Name = "Seychelles", Continent =  "Seven seas (open ocean)" },
                new CountriesData {Name = "Syria", Continent =  "Asia" },
                new CountriesData {Name = "Turks and Caicos Is.", Continent =  "North America" },
                new CountriesData {Name = "Chad", Continent =  "Africa" },
                new CountriesData {Name = "Togo", Continent =  "Africa" },
                new CountriesData {Name = "Thailand", Continent =  "Asia" },
                new CountriesData {Name = "Tajikistan", Continent =  "Asia" },
                new CountriesData {Name = "Turkmenistan", Continent =  "Asia" },
                new CountriesData {Name = "Timor-Leste", Continent =  "Asia" },
                new CountriesData {Name = "Tonga", Continent =  "Oceania" },
                new CountriesData {Name = "Trinidad and Tobago", Continent =  "North America" },
                new CountriesData {Name = "Tunisia", Continent =  "Africa" },
                new CountriesData {Name = "Turkey", Continent =  "Asia" },
                new CountriesData {Name = "Tuvalu", Continent =  "Oceania" },
                new CountriesData {Name = "Taiwan", Continent =  "Asia" },
                new CountriesData {Name = "Tanzania", Continent =  "Africa" },
                new CountriesData {Name = "Uganda", Continent =  "Africa" },
                new CountriesData {Name = "Ukraine", Continent =  "Europe" },
                new CountriesData {Name = "U.S. Minor Outlying Is.", Continent =  "North America" },
                new CountriesData {Name = "Uruguay", Continent =  "South America" },
                new CountriesData {Name = "United States", Continent =  "North America" },
                new CountriesData {Name = "USNB Guantanamo Bay", Continent =  "North America" },
                new CountriesData {Name = "Uzbekistan", Continent =  "Asia" },
                new CountriesData {Name = "Vatican", Continent =  "Europe" },
                new CountriesData {Name = "St. Vin. and Gren.", Continent =  "North America" },
                new CountriesData {Name = "Venezuela", Continent =  "South America" },
                new CountriesData {Name = "British Virgin Is.", Continent =  "North America" },
                new CountriesData {Name = "U.S. Virgin Is.", Continent =  "North America" },
                new CountriesData {Name = "Vietnam", Continent =  "Asia" },
                new CountriesData {Name = "Vanuatu", Continent =  "Oceania" },
                new CountriesData {Name = "Wallis and Futuna Is.", Continent =  "Oceania" },
                new CountriesData {Name = "Akrotiri", Continent =  "Asia" },
                new CountriesData {Name = "Samoa", Continent =  "Oceania" },
                new CountriesData {Name = "Yemen", Continent =  "Asia" },
                new CountriesData {Name = "South Africa", Continent =  "Africa" },
                new CountriesData {Name = "Zambia", Continent =  "Africa" },
                new CountriesData {Name = "Zimbabwe", Continent =  "Africa" },
            };

            return continentCountriesData;
        }
    }
    [Serializable]
    public class CountriesData
    {
        public string name;
        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        public string continent;

        public string Continent
        {
            get { return continent; }
            set { continent = value; }
        }

    }

    public class Countries_RandomData
    {
        public static List<RandomData> GetCountriesRandomData()
        {
            List<RandomData> CountriesRandomData = new List<RandomData>
            {
                new RandomData { Country = "RUS", Continent = "Europe", CategoryName =  "Books", Sales =  3746 },
                 new RandomData { Country ="IND", Continent = "Asia", CategoryName =  "Books", Sales =  10688 },
                 new RandomData { Country ="CAN", Continent = "North America", CategoryName =  "Books", Sales =  10882 },
                 new RandomData { Country ="BRA", Continent = "South America", CategoryName =  "Books", Sales =  13776 },
                 new RandomData { Country ="JPN", Continent = "Asia", CategoryName =  "Books", Sales =  19390 },
                 new RandomData { Country ="AUS", Continent = "Oceania",  CategoryName =  "Books", Sales =  30716 },
                 new RandomData { Country ="CAF", Continent = "Africa", CategoryName =  "Books", Sales =  18718.0 }
            };
            return CountriesRandomData;
        }
    }
    [Serializable]
    public class RandomData
    {
        public string country;

        public string Country
        {
            get { return country; }
            set { country = value; }
        }

        public string continent;

        public string Continent
        {
            get { return continent; }
            set { continent = value; }
        }
        public string categoryName;

        public string CategoryName
        {
            get { return categoryName; }
            set { categoryName = value; }
        }
        public double sales;

        public double Sales
        {
            get { return sales; }
            set { sales = value; }
        }
    }
}