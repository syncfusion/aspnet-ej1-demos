#region Copyright Syncfusion Inc. 2001-2021
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.JavaScript.DataVisualization;
using Syncfusion.JavaScript.DataVisualization.Maps;
using Syncfusion.JavaScript.DataVisualization.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.Map
{
    public partial class Zooming : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            (this.zooming.Layers[0] as ShapeLayer).DataSource = Country_LatLongPoints.GetCountryLatLongPoints();
            (this.zooming.Layers[0] as ShapeLayer).ShapeData = this.GetWorldMap();
        }

        public object GetWorldMap()
        {
            string allText = System.IO.File.ReadAllText(HttpContext.Current.Server.MapPath("~/App_Data/WorldMap.json"));
            JavaScriptSerializer ser = new JavaScriptSerializer();
            ser.MaxJsonLength = int.MaxValue;
            return new MapData(allText);
        }
    }

    [Serializable]
    public class Country_LatLongPoints
    {
        public static List<LatLongPoints> GetCountryLatLongPoints()
        {
            List<LatLongPoints> countryLatLongPoints = new List<LatLongPoints>
            {
                new LatLongPoints {Name = "Afghanistan", Latitude = 33, Longitude = 65 },
                new LatLongPoints {Name = "Albania", Latitude = 41, Longitude = 20 },
                new LatLongPoints {Name = "Algeria", Latitude = 28, Longitude = 3 },
                new LatLongPoints {Name = "Angola", Latitude = -12.5, Longitude = 18.5 },
                new LatLongPoints {Name = "Anguilla", Latitude = 18.25, Longitude = -63.1667 },
                new LatLongPoints {Name = "Argentina", Latitude = -34, Longitude = -64 },
                new LatLongPoints {Name = "Armenia", Latitude = 40, Longitude = 45 },
                new LatLongPoints {Name = "Australia", Latitude = -27, Longitude = 133 },
                new LatLongPoints {Name = "Austria", Latitude = 47.3333, Longitude = 13.3333 },
                new LatLongPoints {Name = "Azerbaijan", Latitude = 40.5, Longitude = 47.5 },
                new LatLongPoints {Name = "Bahamas", Latitude = 24.25, Longitude = -76 },
                new LatLongPoints {Name = "Bangladesh", Latitude = 24, Longitude = 90 },
                new LatLongPoints {Name = "Belarus", Latitude = 53, Longitude = 28 },
                new LatLongPoints {Name = "Belgium", Latitude = 50.8333, Longitude = 4 },
                new LatLongPoints {Name = "Belize", Latitude = 17.25, Longitude = -88.75 },
                new LatLongPoints {Name = "Benin", Latitude = 9.5, Longitude = 2.25 },
                new LatLongPoints {Name = "Bhutan", Latitude = 27.5, Longitude = 90.5 },
                new LatLongPoints {Name = "Bolivia", Latitude = -17, Longitude = -65 },
                new LatLongPoints {Name = "Bosnia and Herzegovina", Latitude = 44, Longitude = 18 },
                new LatLongPoints {Name = "Botswana", Latitude = -22, Longitude = 24 },
                new LatLongPoints {Name = "Brazil", Latitude = -10, Longitude = -55 },
                new LatLongPoints {Name = "Brunei", Latitude = 4.5, Longitude = 114.6667 },
                new LatLongPoints {Name = "Bulgaria", Latitude = 43, Longitude = 25 },
                new LatLongPoints {Name = "Burkina Faso", Latitude = 13, Longitude = -2 },
                new LatLongPoints {Name = "Burundi", Latitude = -3.5, Longitude = 30 },
                new LatLongPoints {Name = "Cambodia", Latitude = 13, Longitude = 105 },
                new LatLongPoints {Name = "Cameroon", Latitude = 6, Longitude = 12 },
                new LatLongPoints {Name = "Canada", Latitude = 60, Longitude = -95 },
                new LatLongPoints {Name = "Central African Republic", Latitude = 7, Longitude = 21 },
                new LatLongPoints {Name = "Chad", Latitude = 15, Longitude = 19 },
                new LatLongPoints {Name = "Chile", Latitude = -30, Longitude = -71 },
                new LatLongPoints {Name = "China", Latitude = 35, Longitude = 105 },
                new LatLongPoints {Name = "Cocos (Keeling) Islands", Latitude = -12.5, Longitude = 96.8333 },
                new LatLongPoints {Name = "Colombia", Latitude = 4, Longitude = -72 },
                new LatLongPoints {Name = "Congo", Latitude = -1, Longitude = 15 },
                new LatLongPoints {Name = "Costa Rica", Latitude = 10, Longitude = -84 },
                new LatLongPoints {Name = "Cuba", Latitude = 21.5, Longitude = -80 },
                new LatLongPoints {Name = "Czech Republic", Latitude = 49.75, Longitude = 15.5 },
                new LatLongPoints {Name = "Denmark", Latitude = 56, Longitude = 10 },
                new LatLongPoints {Name = "Djibouti", Latitude = 11.5, Longitude = 43 },
                new LatLongPoints {Name =  "Dominica", Latitude = 15.4167, Longitude = -61.3333 },
                new LatLongPoints {Name = "Ecuador", Latitude = -2, Longitude = -77.5 },
                new LatLongPoints {Name = "Egypt", Latitude = 27, Longitude = 30 },
                new LatLongPoints {Name = "El Salvador", Latitude = 13.8333, Longitude = -88.9167 },
                new LatLongPoints {Name = "Equatorial Guinea", Latitude = 2, Longitude = 10 },
                new LatLongPoints {Name = "Eritrea", Latitude = 15, Longitude = 39 },
                new LatLongPoints {Name = "Estonia", Latitude = 59, Longitude = 26 },
                new LatLongPoints {Name = "Ethiopia", Latitude = 8, Longitude = 38 },
                new LatLongPoints {Name = "Fiji", Latitude = -18, Longitude = 175 },
                new LatLongPoints {Name = "Finland", Latitude = 64, Longitude = 26 },
                new LatLongPoints {Name = "France", Latitude = 46, Longitude = 2 },
                new LatLongPoints {Name = "French Guiana", Latitude = 4, Longitude = -53 },
                new LatLongPoints {Name = "French Polynesia", Latitude = -15, Longitude = -140 },
                new LatLongPoints {Name = "Gabon", Latitude = -1, Longitude = 11.75 },
                new LatLongPoints {Name = "Georgia", Latitude = 42, Longitude = 43.5 },
                new LatLongPoints {Name = "Germany", Latitude = 51, Longitude = 9 },
                new LatLongPoints {Name = "Ghana", Latitude = 8, Longitude = -2 },
                new LatLongPoints {Name = "Greece", Latitude = 39, Longitude = 22 },
                new LatLongPoints {Name = "Greenland", Latitude = 72, Longitude = -40 },
                new LatLongPoints {Name = "Guatemala", Latitude = 15.5, Longitude = -90.25 },
                new LatLongPoints {Name = "Guinea", Latitude = 11, Longitude = -10 },
                new LatLongPoints {Name = "Guinea-Bissau", Latitude = 12, Longitude = -15 },
                new LatLongPoints {Name = "Guyana", Latitude = 5, Longitude = -59 },
                new LatLongPoints {Name = "Haiti", Latitude = 19, Longitude = -72.4167 },
                new LatLongPoints {Name = "Honduras", Latitude = 15, Longitude = -86.5 },
                new LatLongPoints {Name = "Hungary", Latitude = 47, Longitude = 20 },
                new LatLongPoints {Name = "Iceland", Latitude = 65, Longitude = -18 },
                new LatLongPoints {Name = "India", Latitude = 20, Longitude = 77 },
                new LatLongPoints {Name = "Indonesia", Latitude = -5, Longitude = 120 },
                new LatLongPoints {Name = "Iran", Latitude = 32, Longitude = 53 },
                new LatLongPoints {Name = "Iraq", Latitude = 33, Longitude = 44 },
                new LatLongPoints {Name = "Ireland", Latitude = 53, Longitude = -8 },
                new LatLongPoints {Name = "Israel", Latitude = 31.5, Longitude = 34.75 },
                new LatLongPoints {Name = "Italy", Latitude = 42.8333, Longitude = 12.8333 },
                new LatLongPoints {Name = "Jamaica", Latitude = 18.25, Longitude = -77.5 },
                new LatLongPoints {Name = "Japan", Latitude = 36, Longitude = 138 },
                new LatLongPoints {Name = "Jordan", Latitude = 31, Longitude = 36 },
                new LatLongPoints {Name = "Kazakhstan", Latitude = 48, Longitude = 68 },
                new LatLongPoints {Name = "Kenya", Latitude = 1, Longitude = 38 },
                new LatLongPoints {Name =  "Kiribati", Latitude = 1.4167, Longitude = 173 },
                new LatLongPoints {Name = "Kuwait", Latitude = 29.3375, Longitude = 47.6581 },
                new LatLongPoints {Name = "Kyrgyzstan", Latitude = 41, Longitude = 75 },
                new LatLongPoints {Name = "Latvia", Latitude = 57, Longitude = 25 },
                new LatLongPoints {Name = "Lebanon", Latitude = 33.8333, Longitude = 35.8333 },
                new LatLongPoints {Name = "Lesotho", Latitude = -29.5, Longitude = 28.5 },
                new LatLongPoints {Name = "Liberia", Latitude = 6.5, Longitude = -9.5 },
                new LatLongPoints {Name = "Lithuania", Latitude = 56, Longitude = 24 },
                new LatLongPoints {Name = "Macedonia", Latitude = 41.8333, Longitude = 22 },
                new LatLongPoints {Name = "Madagascar", Latitude = -20, Longitude = 47 },
                new LatLongPoints {Name = "Malawi", Latitude = -13.5, Longitude = 34 },
                new LatLongPoints {Name = "Malaysia", Latitude = 2.5, Longitude = 112.5 },
                new LatLongPoints {Name = "Maldives", Latitude = 3.25, Longitude = 73 },
                new LatLongPoints {Name = "Mali", Latitude = 17, Longitude = -4 },
                new LatLongPoints {Name = "Martinique", Latitude = 14.6667, Longitude = -61 },
                new LatLongPoints {Name = "Mauritania", Latitude = 20, Longitude = -12 },
                new LatLongPoints {Name = "Mexico", Latitude = 23, Longitude = -102 },
                new LatLongPoints {Name = "Moldova", Latitude = 47, Longitude = 29 },
                new LatLongPoints {Name = "Mongolia", Latitude = 46, Longitude = 105 },
                new LatLongPoints {Name = "Morocco", Latitude = 32, Longitude = -5 },
                new LatLongPoints {Name = "Mozambique", Latitude = -18.25, Longitude = 35 },
                new LatLongPoints {Name = "Myanmar", Latitude = 22, Longitude = 98 },
                new LatLongPoints {Name = "Namibia", Latitude = -22, Longitude = 17 },
                new LatLongPoints {Name = "Nepal", Latitude = 28, Longitude = 84 },
                new LatLongPoints {Name = "Netherlands", Latitude = 52.5, Longitude = 5.75 },
                new LatLongPoints {Name = "New Caledonia", Latitude = -21.5, Longitude = 165.5 },
                new LatLongPoints {Name = "New Zealand", Latitude = -41, Longitude = 174 },
                new LatLongPoints {Name = "Nicaragua", Latitude = 13, Longitude = -85 },
                new LatLongPoints {Name = "Niger", Latitude = 16, Longitude = 8 },
                new LatLongPoints {Name = "Nigeria", Latitude = 10, Longitude = 8 },
                new LatLongPoints {Name = "Norway", Latitude = 62, Longitude = 10 },
                new LatLongPoints {Name = "Oman", Latitude = 21, Longitude = 57 },
                new LatLongPoints {Name = "Pakistan", Latitude = 30, Longitude = 70 },
                new LatLongPoints {Name = "Panama", Latitude = 9, Longitude = -80 },
                new LatLongPoints {Name = "Papua New Guinea", Latitude = -6, Longitude = 147 },
                new LatLongPoints {Name = "Paraguay", Latitude = -23, Longitude = -58 },
                new LatLongPoints {Name = "Philippines", Latitude = 13, Longitude = 122 },
                new LatLongPoints {Name = "Poland", Latitude = 52, Longitude = 20 },
                new LatLongPoints {Name = "Portugal", Latitude = 39.5, Longitude = -8 },
                new LatLongPoints {Name = "Puerto Rico", Latitude = 18.25, Longitude = -66.5 },
                new LatLongPoints {Name = "Qatar", Latitude = 25.5, Longitude = 51.25 },
                new LatLongPoints {Name = "Romania", Latitude = 46, Longitude = 25 },
                new LatLongPoints {Name =  "Russian Federation", Latitude = 60, Longitude = 100 },
                new LatLongPoints {Name = "Rwanda", Latitude = -2, Longitude = 30 },
                new LatLongPoints {Name = "Sao Tome and Principe", Latitude = 1, Longitude = 7 },
                new LatLongPoints {Name = "Saudi Arabia", Latitude = 25, Longitude = 45 },
                new LatLongPoints {Name = "Senegal", Latitude = 14, Longitude = -14 },
                new LatLongPoints {Name = "Slovenia", Latitude = 46, Longitude = 15 },
                new LatLongPoints {Name = "Somalia", Latitude = 10, Longitude = 49 },
                new LatLongPoints {Name = "South Africa", Latitude = -29, Longitude = 24 },
                new LatLongPoints {Name = "Spain", Latitude = 40, Longitude = -4 },
                new LatLongPoints {Name = "Sri Lanka", Latitude = 7, Longitude = 81 },
                new LatLongPoints {Name = "Sudan", Latitude = 15, Longitude = 30 },
                new LatLongPoints {Name = "Suriname", Latitude = 4, Longitude = -56 },
                new LatLongPoints {Name = "Swaziland", Latitude = -26.5, Longitude = 31.5 },
                new LatLongPoints {Name = "Sweden", Latitude = 62, Longitude = 15 },
                new LatLongPoints {Name = "Switzerland", Latitude = 47, Longitude = 8 },
                new LatLongPoints {Name = "Syria", Latitude = 35, Longitude = 38 },
                new LatLongPoints {Name = "Taiwan", Latitude = 23.5, Longitude = 121 },
                new LatLongPoints {Name = "Tajikistan", Latitude = 39, Longitude = 71 },
                new LatLongPoints {Name = "Tanzania", Latitude = -6, Longitude = 35 },
                new LatLongPoints {Name = "Thailand", Latitude = 15, Longitude = 100 },
                new LatLongPoints {Name = "Togo", Latitude = 8, Longitude = 1.1667 },
                new LatLongPoints {Name = "Trinidad and Tobago", Latitude = 11, Longitude = -61 },
                new LatLongPoints {Name = "Tunisia", Latitude = 34, Longitude = 9 },
                new LatLongPoints {Name = "Turkey", Latitude = 39, Longitude = 35 },
                new LatLongPoints {Name = "Turkmenistan", Latitude = 40, Longitude = 60 },
                new LatLongPoints {Name = "Ukraine", Latitude = 49, Longitude = 32 },
                new LatLongPoints {Name = "United Arab Emirates", Latitude = 24, Longitude = 54 },
                new LatLongPoints {Name = "United Kingdom", Latitude = 54, Longitude = -2 },
                new LatLongPoints {Name =  "United States of America", Latitude = 38, Longitude = -97 },
                new LatLongPoints {Name = "Uruguay", Latitude = -33, Longitude = -56 },
                new LatLongPoints {Name = "Uzbekistan", Latitude = 41, Longitude = 64 },
                new LatLongPoints {Name = "Vanuatu", Latitude = -16, Longitude = 167 },
                new LatLongPoints {Name = "Vatican City", Latitude = 41.9, Longitude = 12.45 },
                new LatLongPoints {Name = "Vietnam", Latitude = 16, Longitude = 106 },
                new LatLongPoints {Name = "Yemen", Latitude = 15, Longitude = 48 },
                new LatLongPoints {Name =  "Yugoslavia", Latitude = 0, Longitude = 0 },
                new LatLongPoints {Name = "Zaire", Latitude = -20, Longitude = 30 }
            };
            return countryLatLongPoints;
        }
    }

    [Serializable]
    public class LatLongPoints
    {
        private string name;
        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        public double latitude;

        public double Latitude
        {
            get { return latitude; }
            set { latitude = value; }
        }

        public double longitude;

        public double Longitude
        {
            get { return longitude; }
            set { longitude = value; }
        }

    }
}