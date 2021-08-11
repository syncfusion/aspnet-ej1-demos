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
    public partial class FlightRoutes : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            (this.flightRoute.Layers[0] as ShapeLayer).ShapeData = GetWorldMap();
            ((this.flightRoute.Layers[0] as ShapeLayer).SubLayers[0] as ShapeLayer).DataSource = World_FlightData.GetFlightRoutes_Data();
            ((this.flightRoute.Layers[0] as ShapeLayer).SubLayers[0] as ShapeLayer).ShapeData = GetFlightRoute();
            ((this.flightRoute.Layers[0] as ShapeLayer).SubLayers[1] as ShapeLayer).DataSource = World_FlightData.GetAirportData();
            ((this.flightRoute.Layers[0] as ShapeLayer).SubLayers[1] as ShapeLayer).ShapeData= GetAirports();
            ((this.flightRoute.Layers[0] as ShapeLayer).SubLayers[2] as ShapeLayer).DataSource = World_FlightData.GetIntermediateStops1_Data();
            ((this.flightRoute.Layers[0] as ShapeLayer).SubLayers[2] as ShapeLayer).ShapeData= GetAirportStops1();
            ((this.flightRoute.Layers[0] as ShapeLayer).SubLayers[3] as ShapeLayer).DataSource = World_FlightData.GetIntermediateStops2_Data();
            ((this.flightRoute.Layers[0] as ShapeLayer).SubLayers[3] as ShapeLayer).ShapeData = GetAirportStops2();
        }
        public object GetAirports()
        {
            string allText = System.IO.File.ReadAllText(Server.MapPath("~/App_Data/airports.json"));
            JavaScriptSerializer ser = new JavaScriptSerializer();
            ser.MaxJsonLength = int.MaxValue;
            return new MapData(allText);
        }

        public object GetAirportStops1()
        {
            string allText = System.IO.File.ReadAllText(Server.MapPath("~/App_Data/airportstops1.json"));
            JavaScriptSerializer ser = new JavaScriptSerializer();
            ser.MaxJsonLength = int.MaxValue;
            return new MapData(allText);
        }

        public object GetAirportStops2()
        {
            string allText = System.IO.File.ReadAllText(Server.MapPath("~/App_Data/airportstops2.json"));
            JavaScriptSerializer ser = new JavaScriptSerializer();
            ser.MaxJsonLength = int.MaxValue;
            return new MapData(allText);
        }

        public object GetWorldMap()
        {
            string allText = System.IO.File.ReadAllText(Server.MapPath("~/App_Data/WorldMap.json"));
            JavaScriptSerializer ser = new JavaScriptSerializer();
            ser.MaxJsonLength = int.MaxValue;
            return new MapData(allText);
        }

        public object GetFlightRoute()
        { 
            string allText = System.IO.File.ReadAllText(Server.MapPath("~/App_Data/flightRoutes.json"));
            JavaScriptSerializer ser = new JavaScriptSerializer();
            ser.MaxJsonLength = int.MaxValue;
            return new MapData(allText);
        }
    }

    [Serializable]
    public class World_FlightData
    {
        public static List<FlightData> GetAirportData()
        {
            List<FlightData> airportData = new List<FlightData>
            {
                new FlightData { Name = "Durham Int'l Airport", From = "Raleigh", To = "Chennai", Abbrev = "RDU", Departure = "RDU", Arrival = "MAA", Route1_Stop1 = "IAD", Route1_Stop2 = "FRA", Route2_Stop1 = "JFK", Route2_Stop2 = "DXB", Route3_Stop1 = "ATL", Route3_Stop2 = "DXB"},
                new FlightData { Name = "Chennai Int' Airport", From = "Chennai", To = "Raleigh", Abbrev = "MAA", Departure = "MAA", Arrival = "RDU", Route1_Stop1 = "FRA", Route1_Stop2 = "IAD", Route2_Stop1 = "DXB", Route2_Stop2 = "JFK", Route3_Stop1 = "DXB", Route3_Stop2 = "ATL"}
            };
            return airportData;
        }

        public static List<FlightData> GetIntermediateStops1_Data()
        {
            List<FlightData> intermediatestops1_data = new List<FlightData>
            {
                new FlightData {Name = "Dulles Int'l Airport", From = "Raleigh", To = "Chennai", Intermediate =  "Washington", Abbrev =  "IAD", Departure = "RDU", Arrival = "MAA", Route1_Stop1 = "IAD", Route1_Stop2 = "FRA" },
                new FlightData {Name = "Frankfurt Int'l Airport", From = "Chennai", To = "Raleigh", Intermediate =  "Frankfurt", Abbrev =  "FRA", Departure = "MAA", Arrival = "RDU", Route1_Stop1 = "FRA", Route1_Stop2 = "IAD" },
                new FlightData { Name = "Atlanta Int'l Airport", From = "Raleigh", To = "Chennai", Intermediate =  "Atlanta", Abbrev =  "ATL", Departure = "RDU", Arrival = "MAA", Route1_Stop1 = "ATL", Route1_Stop2 = "DXB" },
                new FlightData { Name = "John F Kennedy Int'l Airport", From = "Raleigh", To = "Chennai", Intermediate =  "Newyork", Abbrev =  "JFK", Departure = "RDU", Arrival = "MAA", Route1_Stop1 = "JFK", Route1_Stop2 = "DXB" }
            };
            return intermediatestops1_data;
        }

        public static List<FlightData> GetIntermediateStops2_Data()
        {
            List<FlightData> intermediatestops2_data = new List<FlightData>
            {
                new FlightData { Name = "Dubai Int'l Airport", From = "Chennai", To = "Raleigh", Intermediate =  "Dubai", Abbrev =  "DXB", Departure = "MAA", Arrival = "RDU", Route1_Stop1 = "DXB", Route1_Stop2 = "JFK", Route2_Stop1 = "DXB", Route2_Stop2 = "ATL" }
            };
            return intermediatestops2_data;
        }

        public static List<FlightData> GetFlightRoutes_Data()
        {
            List<FlightData> flightroutes_data = new List<FlightData>
            {
                new FlightData { Name = "Route4", Abbrev =  "RDU", From = "Raleigh", To = "Chennai", Departure = "RDU", Arrival = "MAA", Route1_Stop1 = "ATL", Route1_Stop2 = "DXB" },
                new FlightData { Name = "Route5", Abbrev =  "RDU", From = "Raleigh", To = "Chennai", Departure = "RDU", Arrival = "MAA", Route1_Stop1 = "ATL", Route1_Stop2 = "DXB" },
                new FlightData { Name = "Route6", Abbrev =  "RDU", From = "Raleigh", To = "Chennai", Departure = "RDU", Arrival = "MAA", Route1_Stop1 = "ATL", Route1_Stop2 = "DXB" },
                new FlightData { Name = "Route7", Abbrev =  "RDU", From = "Raleigh", To = "Chennai", Departure = "RDU", Arrival = "MAA", Route1_Stop1 = "JFK", Route1_Stop2 = "DXB" },
                new FlightData { Name = "Route8", Abbrev =  "RDU", From = "Raleigh", To = "Chennai", Departure = "RDU", Arrival = "MAA", Route1_Stop1 = "JFK", Route1_Stop2 = "DXB" },
                new FlightData { Name = "Route9", Abbrev =  "RDU", From = "Raleigh", To = "Chennai", Departure = "RDU", Arrival = "MAA", Route1_Stop1 = "JFK", Route1_Stop2 = "DXB" },
                new FlightData { Name = "Route10", Abbrev =  "MAA", From = "Chennai", To = "Raleigh", Departure = "MAA", Arrival = "RDU", Route1_Stop1 = "FRA", Route1_Stop2 = "IAD" },
                new FlightData { Name = "Route11", Abbrev =  "MAA", From = "Chennai", To = "Raleigh", Departure = "MAA", Arrival = "RDU", Route1_Stop1 = "FRA", Route1_Stop2 = "IAD" },
                new FlightData { Name = "Route12", Abbrev =  "MAA", From = "Chennai", To = "Raleigh", Departure = "MAA", Arrival = "RDU", Route1_Stop1 = "FRA", Route1_Stop2 = "IAD" }

            };
            return flightroutes_data;
        }
    }

    [Serializable]
    public class FlightData
    {
        private string name;
        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        private string from;

        public string From
        {
            get { return from; }
            set { from = value; }
        }

        private string to;

        public string To
        {
            get { return to; }
            set { to = value; }
        }

        private string abbrev;

        public string Abbrev
        {
            get { return abbrev; }
            set { abbrev = value; }
        }

        private string departure;

        public string Departure
        {
            get { return departure; }
            set { departure = value; }
        }

        private string arrival;

        public string Arrival
        {
            get { return arrival; }
            set { arrival = value; }
        }

        private string route1_stop1;

        public string Route1_Stop1
        {
            get { return route1_stop1; }
            set { route1_stop1 = value; }
        }

        private string route1_stop2;

        public string Route1_Stop2
        {
            get { return route1_stop2; }
            set { route1_stop2 = value; }
        }

        private string route2_stop1;

        public string Route2_Stop1
        {
            get { return route2_stop1; }
            set { route2_stop1 = value; }
        }

        private string route2_stop2;

        public string Route2_Stop2
        {
            get { return route2_stop2; }
            set { route2_stop2 = value; }
        }

        private string route3_stop1;

        public string Route3_Stop1
        {
            get { return route3_stop1; }
            set { route3_stop1 = value; }
        }

        private string route3_stop2;

        public string Route3_Stop2
        {
            get { return route3_stop2; }
            set { route3_stop2 = value; }
        }
        private string intermediate;

        public string Intermediate
        {
            get { return intermediate; }
            set { intermediate = value; }
        }
    }
}