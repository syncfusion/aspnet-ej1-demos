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
using Syncfusion.JavaScript.DataVisualization.Maps;
using Syncfusion.JavaScript.Web;
using Syncfusion.JavaScript.DataVisualization.Models;
using Syncfusion.JavaScript.DataVisualization;

namespace WebSampleBrowser.Map
{
    public partial class Selection : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            (this.selection.Layers[0] as ShapeLayer).DataSource = Election_Result.GetElectionResults();
            (this.selection.Layers[0] as ShapeLayer).ShapeData = GetUSA();  
        }
        public object GetUSA()
        {
            string allText = System.IO.File.ReadAllText(Server.MapPath("~/App_Data/USA.json"));
            JavaScriptSerializer ser = new JavaScriptSerializer();
            ser.MaxJsonLength = int.MaxValue;
            return new MapData(allText);
        }
      
    }

    [Serializable]
    public class Election_Result
    {
        public static List<ElectionData> GetElectionResults()
        {
            List<ElectionData> electionResults = new List<ElectionData>
            {
                  
                new ElectionData {State = "Alabama", Candidate = "Romney", Electors = 9 },
                new ElectionData { State = "Alaska", Candidate = "Romney", Electors = 3 },
                new ElectionData { State = "Arizona", Candidate = "Romney", Electors = 11 },
                new ElectionData { State = "Arkansas", Candidate = "Romney", Electors = 6 },
                new ElectionData { State = "California", Candidate = "Obama", Electors = 55 },
                new ElectionData { State = "Colorado", Candidate = "Obama", Electors = 9 },
                new ElectionData { State = "Connecticut", Candidate = "Obama", Electors = 7 },
                new ElectionData { State = "Delaware", Candidate = "Obama", Electors = 3 },
                new ElectionData { State = "District of Columbia", Candidate = "Obama", Electors = 3 },
                new ElectionData { State = "Florida", Candidate = "Obama", Electors = 29 },
                new ElectionData { State = "Georgia", Candidate = "Romney", Electors = 16 },
                new ElectionData { State = "Hawaii", Candidate = "Obama", Electors = 4 },
                new ElectionData { State = "Idaho", Candidate = "Romney", Electors = 4 },
                new ElectionData { State = "Illinois", Candidate = "Obama", Electors = 20 },
                new ElectionData { State = "Indiana", Candidate = "Romney", Electors = 11 },
                new ElectionData { State = "Iowa", Candidate = "Obama", Electors = 6 },
                new ElectionData { State = "Kansas", Candidate = "Romney", Electors = 6 },
                new ElectionData { State = "Kentucky", Candidate = "Romney", Electors = 8 },
                new ElectionData { State = "Louisiana", Candidate = "Romney", Electors = 8 },
                new ElectionData { State = "Maine", Candidate = "Obama", Electors = 4 },
                new ElectionData { State = "Maryland", Candidate = "Obama", Electors = 10 },
                new ElectionData { State = "Massachusetts", Candidate = "Obama", Electors = 11 },
                new ElectionData { State = "Michigan", Candidate = "Obama", Electors = 16 },
                new ElectionData { State = "Minnesota", Candidate = "Obama", Electors = 10 },
                new ElectionData { State = "Mississippi", Candidate = "Romney", Electors = 6 },
                new ElectionData { State = "Missouri", Candidate = "Romney", Electors = 10 },
                new ElectionData { State = "Montana", Candidate = "Romney", Electors = 3 },
                new ElectionData { State = "Nebraska", Candidate = "Romney", Electors = 5 },
                new ElectionData { State = "Nevada", Candidate = "Obama", Electors = 6 },
                new ElectionData { State = "New Hampshire", Candidate = "Obama", Electors = 4 },
                new ElectionData { State = "New Jersey", Candidate = "Obama", Electors = 14 },
                new ElectionData { State = "New Mexico", Candidate = "Obama", Electors = 5 },
                new ElectionData { State = "New York", Candidate = "Obama", Electors = 29 },
                new ElectionData { State = "North Carolina", Candidate = "Romney", Electors = 15 },
                new ElectionData { State = "North Dakota", Candidate = "Romney", Electors = 3 },
                new ElectionData { State = "Ohio", Candidate = "Obama", Electors = 18 },
                new ElectionData { State = "Oklahoma", Candidate = "Romney", Electors = 7 },
                new ElectionData { State = "Oregon", Candidate = "Obama", Electors = 7 },
                new ElectionData { State = "Pennsylvania", Candidate = "Obama", Electors = 20 },
                new ElectionData { State = "Rhode Island", Candidate = "Obama", Electors = 4 },
                new ElectionData { State = "South Carolina", Candidate = "Romney", Electors = 9 },
                new ElectionData { State = "South Dakota", Candidate = "Romney", Electors = 3 },
                new ElectionData { State = "Tennessee", Candidate = "Romney", Electors = 11 },
                new ElectionData { State = "Texas", Candidate = "Romney", Electors = 38 },
                new ElectionData { State = "Utah", Candidate = "Romney", Electors = 6 },
                new ElectionData { State = "Vermont", Candidate = "Obama", Electors = 3 },
                new ElectionData { State = "Virginia", Candidate = "Obama", Electors = 13 },
                new ElectionData { State = "Washington", Candidate = "Obama", Electors = 12 },
                new ElectionData { State = "West Virginia", Candidate = "Romney", Electors = 5 },
                new ElectionData { State = "Wisconsin", Candidate = "Obama", Electors = 10 },
                new ElectionData { State = "Wyoming", Candidate = "Romney", Electors = 3 }
            };
            return electionResults;
        }

        public static List<CountyPopulationData> GetUSPopulationData()
        {
            List<CountyPopulationData> populationData = new List<CountyPopulationData>
            {
                new CountyPopulationData(){ Name= "California", Population=38332521},
new CountyPopulationData(){ Name= "Texas", Population=26448193},
new CountyPopulationData(){ Name= "New York", Population=19651127},
new CountyPopulationData(){ Name= "Florida", Population=19552860},
new CountyPopulationData(){ Name= "Illinois", Population=12882135},
new CountyPopulationData(){ Name= "Pennsylvania", Population=12773801},
new CountyPopulationData(){ Name= "Ohio", Population=11570808},
new CountyPopulationData(){ Name= "Georgia", Population=9992167},
new CountyPopulationData(){ Name= "Michigan", Population=9895622},
new CountyPopulationData(){ Name= "North Carolina", Population=9848060},
new CountyPopulationData(){ Name= "New Jersey", Population=8899339},
new CountyPopulationData(){ Name= "Virginia", Population=8260405},
new CountyPopulationData(){ Name= "Washington", Population=6971406},
new CountyPopulationData(){ Name= "Massachusetts", Population=6692824},
new CountyPopulationData(){ Name= "Arizona", Population=6626624},
new CountyPopulationData(){ Name= "Indiana", Population=6570902},
new CountyPopulationData(){ Name= "Tennessee", Population=6495978},
new CountyPopulationData(){ Name= "Missouri", Population=6044171},
new CountyPopulationData(){ Name= "Maryland", Population=5928814},
new CountyPopulationData(){ Name= "Wisconsin", Population=5742713},
new CountyPopulationData(){ Name= "Minnesota", Population=5420380},
new CountyPopulationData(){ Name= "Colorado", Population=5268367},
new CountyPopulationData(){ Name= "Alabama", Population=4833722},
new CountyPopulationData(){ Name= "South Carolina", Population=4774839},
new CountyPopulationData(){ Name= "Louisiana", Population=4625470},
new CountyPopulationData(){ Name= "Kentucky", Population=4395295},
new CountyPopulationData(){ Name= "Oregon", Population=3930065},
new CountyPopulationData(){ Name= "Oklahoma", Population=3850568},
new CountyPopulationData(){ Name= "Puerto Rico", Population=3615086},
new CountyPopulationData(){ Name= "Connecticut", Population=3596080},
new CountyPopulationData(){ Name= "Iowa", Population=3090416},
new CountyPopulationData(){ Name= "Mississippi", Population=2991207},
new CountyPopulationData(){ Name= "Arkansas", Population=2959373},
new CountyPopulationData(){ Name= "Utah", Population=2900872},
new CountyPopulationData(){ Name= "Kansas", Population=2893957},
new CountyPopulationData(){ Name= "Nevada", Population=2790136},
new CountyPopulationData(){ Name= "New Mexico", Population=2085287},
new CountyPopulationData(){ Name= "Nebraska", Population=1868516},
new CountyPopulationData(){ Name= "West Virginia", Population=1854304},
new CountyPopulationData(){ Name= "Idaho", Population=1612136},
new CountyPopulationData(){ Name= "Hawaii", Population=1404054},
new CountyPopulationData(){ Name= "Maine", Population=1328302},
new CountyPopulationData(){ Name= "New Hampshire", Population=1323459},
new CountyPopulationData(){ Name= "Rhode Island", Population=1051511},
new CountyPopulationData(){ Name= "Montana", Population=1015165},
new CountyPopulationData(){ Name= "Delaware", Population=925749},
new CountyPopulationData(){ Name= "South Dakota", Population=844877},
new CountyPopulationData(){ Name= "Alaska", Population=735132},
new CountyPopulationData(){ Name= "North Dakota", Population=723393},
new CountyPopulationData(){ Name= "District of Columbia", Population=646449},
new CountyPopulationData(){ Name= "Vermont", Population=626630},
new CountyPopulationData(){ Name= "Wyoming", Population=582658}
            };
            return populationData;
        }
    }

    [Serializable]
    public class ElectionData
    {
        private string state;
        public string State
        {
            get { return state; }
            set { state = value; }
        }

        public string candidate;
        public string Candidate
        {
            get { return candidate; }
            set { candidate = value; }
        }

        private double electors;
        public double Electors
        {
            get { return electors; }
            set { electors = value; }
        }
    }

    [Serializable]
    public class CountyPopulationData
    {
        public string name;
        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        public double population;

        public double Population
        {
            get { return population; }
            set { population = value; }
        }
    }
}