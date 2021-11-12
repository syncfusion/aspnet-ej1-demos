#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.ComponentModel;
using System.Web.Script.Serialization;
using System;

[Serializable]
    public class TreeMapPopulationData
    {
        public string Continent { get; set; }
        public string Country { get; set; }
        public int Growth { get; set; }
        public long Population { get; set; }

        public static List<TreeMapPopulationData> GetData()
        {
            List<TreeMapPopulationData> pop = new List<TreeMapPopulationData>();
            pop.Add(new TreeMapPopulationData() { Continent = "Asia", Country = "Indonesia", Growth = 3, Population = 237641326 });
            pop.Add(new TreeMapPopulationData() { Continent = "Asia", Country = "Russia", Growth = 2, Population = 152518015 });
            pop.Add(new TreeMapPopulationData() { Continent = "Asia", Country = "Mal", Growth = 1, Population = 29672000 });
            pop.Add(new TreeMapPopulationData() { Continent = "North America", Country = "United States", Growth = 4, Population = 315645000 });
            pop.Add(new TreeMapPopulationData() { Continent = "North America", Country = "Mexico", Growth = 2, Population = 112336538 });
            pop.Add(new TreeMapPopulationData() { Continent = "North America", Country = "Canada", Growth = 1, Population = 39056064 });
            pop.Add(new TreeMapPopulationData() { Continent = "South America", Country = "Colombia", Growth = 1, Population = 47000000 });
            pop.Add(new TreeMapPopulationData() { Continent = "South America", Country = "Brazil", Growth = 3, Population = 193946886 });
            pop.Add(new TreeMapPopulationData() { Continent = "Africa", Country = "Nigeria", Growth = 2, Population = 170901000 });
            pop.Add(new TreeMapPopulationData() { Continent = "Africa", Country = "Egypt", Growth = 1, Population = 83661000 });
            pop.Add(new TreeMapPopulationData() { Continent = "Europe", Country = "Germany", Growth = 1, Population = 81993000 });
            pop.Add(new TreeMapPopulationData() { Continent = "Europe", Country = "France", Growth = 1, Population = 65605000 });
            pop.Add(new TreeMapPopulationData() { Continent = "Europe", Country = "UK", Growth = 1, Population = 63181775 });

            return pop;
        }
    }