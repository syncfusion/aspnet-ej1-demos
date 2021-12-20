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
using Newtonsoft.Json;
using Syncfusion.JavaScript.DataVisualization.Maps;
using Syncfusion.JavaScript.Web;
using Syncfusion.JavaScript.DataVisualization.Models;
using Syncfusion.JavaScript.DataVisualization;
using Orientation = Syncfusion.JavaScript.Orientation;

namespace WebSampleBrowser.Map
{
    public partial class DataMarkers : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            (this.dataMarker.Layers[0] as ShapeLayer).ShapeData = GetWorldMap();
            (this.dataMarker.Layers[0] as ShapeLayer).Markers = Syncfusion_LocationData.GetSyncfusionLocationData();
        }

        public object GetWorldMap()
        {
            string allText = System.IO.File.ReadAllText(HttpContext.Current.Server.MapPath("~/App_Data/WorldMap.json"));
            JavaScriptSerializer ser = new JavaScriptSerializer();
            ser.MaxJsonLength = int.MaxValue;
            return new MapData(allText);
        }
    }
    public class Syncfusion_LocationData
    {
        public static List<MapMarker> GetSyncfusionLocationData()
        {
            List<MapMarker> syncfusionLocationData = new List<MapMarker>
            {
                new LocationData {Name = "USA", Latitude =38.8833 , Longitude = -77.0167 },
                new LocationData {Name = "Brazil",Latitude =-15.7833 , Longitude = -47.8667 },
				new LocationData {Name = "India", Latitude =21.0000 , Longitude = 78.0000 },
				new LocationData {Name = "China", Latitude =35.0000 , Longitude = 103.0000 },
				new LocationData {Name = "Indonesia", Latitude =-6.1750 , Longitude = 106.8283 },								 
            };
            return syncfusionLocationData;
        }
    }
    [Serializable]
    public class LocationData : MapMarker
    {
        private string name;
        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        private string country;
        public string Country
        {
            get { return country; }
            set { country = value; }
        }

        private string description;
        public string Description
        {
            get { return description; }
            set { description = value; }
        }
        private string address;
        public string Address
        {
            get { return address; }
            set { address = value; }
        }
    }
}