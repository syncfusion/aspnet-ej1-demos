#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.JavaScript.DataVisualization.Models.Diagram;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Syncfusion.JavaScript.DataVisualization.DiagramEnums;

namespace WebSampleBrowser.Dashboard
{
    public partial class AirlineReservation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<String> citiesDataSource = GetCities();
            fromCityName.DataSource = citiesDataSource;
            toCityName.DataSource = citiesDataSource;

            String date = DateTime.Today.Date.ToString("MM/dd/yyyy").Replace('-', '/');
            //depatureDatePicker.Value = date;
            //returnDatePicker.Value = date;

            InitializeDiagram();
            BindGridDataSource();
        }

        private void InitializeDiagram()
        {
            diagramContent.SnapSettings.SnapConstraints = Syncfusion.JavaScript.DataVisualization.DiagramEnums.SnapConstraints.None;
            diagramContent.PageSettings.ShowPageBreak = false;
            diagramContent.PageSettings.MultiplePage = false;
            diagramContent.PageSettings.PageBackgroundColor = "transparent";
            diagramContent.PageSettings.PageBorderWidth = 0;
            diagramContent.PageSettings.PageOrientation = PageOrientation.Landscape;
            diagramContent.PageSettings.PageWidth = 625;
            diagramContent.PageSettings.PageHeight = 347;
            diagramContent.Height = "347px";
            diagramContent.Width = "625px";
            diagramContent.OnClientClick = "onNodeClick";
            diagramContent.OnClientDrop = "onItemDrop";
            diagramContent.OnClientDrag = "nodedragging";
            diagramContent.OnClientMouseEnter = "nodemouseenter";
            diagramContent.OnClientMouseLeave = "nodemouseleave";
            diagramContent.Model.BackgroundImage.Source = "../Content/AirlineReservation/images/plane-image.png";
            diagramContent.Model.BackgroundImage.Scale = ScaleConstraints.None;
            diagramContent.Model.BackgroundImage.Alignment = ImageAlignment.None;
            diagramContent.Model.Constraints = diagramContent.Model.Constraints ^ DiagramConstraints.Zoomable;
            diagramContent.Model.Nodes.Add(CreateNode("seatD1", 160, 85, 26, 23, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatD2", 200, 85, 26, 23, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatD3", 240, 85, 26, 23, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatD4", 280, 85, 26, 23, "booked"));
            diagramContent.Model.Nodes.Add(CreateNode("seatD5_1", 375, 79, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatD5_2", 375, 96, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatD6_1", 415, 79, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatD6_2", 415, 96, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatD7_1", 494, 79, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatD7_2", 494, 96, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatD8_1", 532, 79, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatD8_2", 532, 96, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatD9_1", 570, 79, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatD9_2", 570, 96, 20, 18, ""));

            diagramContent.Model.Nodes.Add(CreateNode("seatC1", 170, 141, 26, 23, "booked"));
            diagramContent.Model.Nodes.Add(CreateNode("seatC2", 210, 141, 26, 23, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatC3", 255, 141, 26, 23, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatC4_1", 375, 131, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatC4_2", 375, 148, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatC5_1", 415, 131, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatC5-2", 415, 148, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatC6_1", 494, 131, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatC6_2", 494, 148, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatC7_1", 532, 131, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatC7_2", 532, 148, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatC8_1", 570, 131, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatC8_2", 570, 148, 20, 18, ""));

            diagramContent.Model.Nodes.Add(CreateNode("seatB1", 170, 170, 26, 23, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatB2", 210, 170, 26, 23, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatB3", 255, 170, 26, 23, "booked"));
            diagramContent.Model.Nodes.Add(CreateNode("seatB4_1", 375, 165, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatB4_2", 375, 183, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatB5_1", 415, 165, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatB5_2", 415, 183, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatB6_1", 494, 165, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatB6_2", 494, 183, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatB7_1", 532, 165, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatB7_2", 532, 183, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatB8_1", 570, 165, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatB8_2", 570, 183, 20, 18, ""));


            diagramContent.Model.Nodes.Add(CreateNode("seatA1", 154, 227, 26, 23, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatA2", 190, 227, 26, 23, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatA3", 230, 227, 26, 23, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatA4", 270, 227, 26, 23, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatA5_1", 375, 217, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatA5_2", 375, 235, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatA6_1", 415, 217, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatA6_2", 415, 235, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatA7_1", 494, 217, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatA7_2", 494, 235, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatA8_1", 532, 217, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatA8_2", 532, 235, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatA9_1", 570, 217, 20, 18, ""));
            diagramContent.Model.Nodes.Add(CreateNode("seatA9_2", 570, 235, 20, 18, ""));
        }

        private Node CreateNode(string nodeName, double x, double y, double width, double height, string addInfo)
        {
            BasicShape node = new BasicShape();
            node.Name = nodeName;
            node.Width = width;
            node.Height = height;
            node.OffsetX = x;
            node.OffsetY = y + 5;

            if (addInfo == "booked")
            {
                node.FillColor = "red";
                Dictionary<string, object> addInfo1 = new Dictionary<string, object>();
                addInfo1.Add("type", addInfo as object);
                node.AddInfo = addInfo1;
            }
            else
            {
                node.AddInfo = null;
            }
            return node;
        }

        private void BindGridDataSource()
        {
            List<AirLineDetails> dataArray = new List<AirLineDetails>();

            List<String> airwaysProvidersList = GetAirwaysProviders();
            List<String> citiesList = GetCities();
            Random rand = new Random();

            for (int cnt = 0; cnt < airwaysProvidersList.Count; cnt++)
            {
                int fromIndex = rand.Next(citiesList.Count - 1);
                int toIndex = rand.Next(citiesList.Count - 1);
                if (fromIndex == toIndex)
                    toIndex = (toIndex + 1) > citiesList.Count - 1 ? 0 : toIndex + 1;

                String airline = airwaysProvidersList[cnt];
                String from = citiesList[fromIndex];
                String to = citiesList[toIndex];
                Double depart = GetTime(rand);
                Double arrive = GetTime(rand);
                int price = rand.Next(5000 - 400 + 1) + 400;
                int rating = rand.Next(1, 5);
                dataArray.Add(new AirLineDetails()
                {
                    Airline = airline,
                    From = from,
                    To = to,
                    Depart = depart,
                    Arrive = arrive,
                    Price = price,
                    Rating = rating
                });
            }
            FlightTicketBooking.DataSource = dataArray;
            FlightTicketBooking.DataBind();
        }

        private List<String> GetCities()
        {
            return new List<string>()
            {
                "Atlanta", "London", "Los Angeles", "Dallas", "Alexandria", "Paris", "Amsterdam", "Danver", "Madrid", "Houston", "HongKong", 
                "Minneapolis", "Detroit", "Bangkok", "SanFransisco", "Bandon", "Miami", "New york", "Singapore", "Tokyo", "Beijing", "Seattle",
                "Belize City", "Orlando", "Berlin", "Bishop", "Toronto", "Brownwood", "Saint Louis", "Chicago", "FrankFurt", "Madrid", "Las Vegas",
                "Phoenix", "Delhi", "Dubai", "Newark", "ROME", "Charlotte", "Munich", "Guangzhou", "Eureka", "Sydney", "Jakarta", "Philadelphia",
                "Barcelona", "Incheon", "Istanbul", "Shangai", "Kuala Lumpur", "Mexico", "Boston", "Melbourne", "Mumbai", "Dublin", "Palma De Mallorca",
                "Fort Lauderdale", "Zurich", "Manaila", "Taipei", "Copenhagen", "Manchester", "Shenzhen", "Sao paulo", "Baltimore MD", "Salt Lake City",
                "Moscow", "Vienna", "Oslo", "Millan", "Brisbane", "Antalya", "Honolulu", "Johannesburg", "Brussels", "Tampa FL", "Stockholm",
                "Dusseldorf","San Diego CA", "Vancouver", "Sapporo", "Washington", "Fukuoka", "Chengdu", "Athens", "Osaka", "Jeddah", "Naha",
                "St Louis MO", "Cairo", "Portland", "Seoul", "CinCinnati OH", "Lisbon", "Bogota", "Helsinki", "Hall Beach", "Eagle", "Easton", "Elkedra",
                "Finke", "Florenceh", "Franklin", "Fuyang", "Gangaw", "Gangneung", "Goa", "Greenville", "Indiana", "Inverway", "Itumbiara",
                "Kalgoorlieh", "Kambuaya", "Kasba Lake", "Kenora", "Kingston", "Queretaro", "Qiemo", "Quillayute", "Queenstown", "Quanduc", "Rafha",
                "Rajshahi", "Ramadan", "Ranong", "Redencao", "Richmond", "Ube", "Udine", "Union City", "Ulusaba", "Upland", "Valentine", "Vaasa",
                "Vadodara", "Varanasi", "Vejle", "Xiangfan", "Xingcheng", "Xining", "Xinguara", "Xayabury", "Yaroslavl", "Yeovilton", "Yonago",
                "Yorketown", "Zambezi", "Zahedan", "Zacatecas", "Zephyrhills", "Chennai"
            };
        }

        public List<String> GetAirwaysProviders()
        {
            return new List<string>()
            {
                "Aero Flot", "Aero Mexico", "Air NewZealand", "AirBerlin", "AirCanada", "AirFrance", "AirIndia", "AirMadagascar",
                "AirPhilipines", "AirTran", "AlaskaAirlines", "Alitalia", "Austrian", "Avianca", "British Airways", "Brussels Airlines",
                "CathayPacific", "China Airlines", "Continental Airlines", "Croatia Airlines", "Dragonair", "Delta", "Elal", "Emirates",
                "Ethiopian", "Garuda Indonesia", "Hawaiian", "Iberia", "IceLandAir", "Jal", "KLM", "KoreanAir", "Lan", "Lot", "Lufthansa",
                "Malaysia", "MidWest Airlines", "NWA", "Oceanic Airlines", "Qantas", "Sabena", "Singapore Airlines", "SouthAfrican Airways",
                "Spirit Airlines", "SriLankan Airlines", "SwissAir", "Tap", "Thai", "Turkish AirLines", "United Airlines", "Varig",
                "Vietnam Airlines", "Wideroe"
            };
        }

        private double GetTime(Random rand)
        {
            double time = rand.Next(23) + 1;
            double minutes = rand.Next(59) + 1;
            return time + (minutes / 100);
        }

        public class AirLineDetails
        {
            public string Airline { get; set; }
            public string From { get; set; }
            public string To { get; set; }
            public double Depart { get; set; }
            public double Arrive { get; set; }
            public double Price { get; set; }
            public int Rating { get; set; }
        }
    }
}