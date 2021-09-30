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
    public class SelectionData
    {
        public string Continent { get; set; }
        public string Country { get; set; }
        public string State { get; set; }
        public int Population { get; set; }

        public static List<SelectionData> GetSelectionDataList()
        {
            List<SelectionData> data = new List<SelectionData>();
            data.Add(new SelectionData() { Continent = "North America", Country = "Canada", State = "Ontario", Population = 13210600 });
            data.Add(new SelectionData() { Continent = "North America", Country = "United States", State = "New York", Population = 19378102 });
            data.Add(new SelectionData() { Continent = "North America", Country = "United States", State = "Pennsylvania", Population = 12702379 });
            data.Add(new SelectionData() { Continent = "North America", Country = "United States", State = "Ohio", Population = 11536504 });
                        
            data.Add(new SelectionData() { Continent = "South America", Country = "Argentina", State = "Buenos Aires", Population = 15594428 });
            data.Add(new SelectionData() { Continent = "South America", Country = "Brazil", State = "Minas Gerais", Population = 20593366 });
            data.Add(new SelectionData() { Continent = "South America", Country = "Brazil", State = "Rio de Janeiro", Population = 16369178 });
            data.Add(new SelectionData() { Continent = "South America", Country = "Brazil", State = "Bahia", Population = 15044127 });
            data.Add(new SelectionData() { Continent = "South America", Country = "Brazil", State = "Rio Grande do Sul", Population = 11164050 });
            data.Add(new SelectionData() { Continent = "South America", Country = "Brazil", State = "Parana", Population = 10997462 });
                        
            data.Add(new SelectionData() { Continent = "Asia", Country = "Bangladesh", State = "Chittagong", Population = 28079000 });
            data.Add(new SelectionData() { Continent = "Asia", Country = "Bangladesh", State = "Rajshahi", Population = 18329000 });
            data.Add(new SelectionData() { Continent = "Asia", Country = "Bangladesh", State = "Khulna", Population = 15563000 });
            data.Add(new SelectionData() { Continent = "Asia", Country = "China", State = "Liaoning", Population = 43746323 });
            data.Add(new SelectionData() { Continent = "Asia", Country = "China", State = "Shaanxi", Population = 37327378 });
            data.Add(new SelectionData() { Continent = "Asia", Country = "China", State = "Fujian", Population = 36894216 });
            data.Add(new SelectionData() { Continent = "Asia", Country = "China", State = "Shanxi", Population = 35712111 });
            data.Add(new SelectionData() { Continent = "Asia", Country = "India", State = "Kerala", Population = 33387677 });
            data.Add(new SelectionData() { Continent = "Asia", Country = "India", State = "Punjab", Population = 27704236 });
            data.Add(new SelectionData() { Continent = "Asia", Country = "India", State = "Haryana", Population = 25353081 });
            data.Add(new SelectionData() { Continent = "Asia", Country = "India", State = "Delhi", Population = 16753235 });
            data.Add(new SelectionData() { Continent = "Asia", Country = "India", State = "Jammu", Population = 12548926 });
            data.Add(new SelectionData() { Continent = "Asia", Country = "Indonesia", State = "West Java", Population = 43021826 });
            data.Add(new SelectionData() { Continent = "Asia", Country = "Indonesia", State = "East Java", Population = 37476011 });
            data.Add(new SelectionData() { Continent = "Asia", Country = "Indonesia", State = "Banten", Population = 10644030 });
            data.Add(new SelectionData() { Continent = "Asia", Country = "Indonesia", State = "Jakarta", Population = 10187595 });
                         
            data.Add(new SelectionData() { Continent = "Africa", Country = "Ethiopia", State = "Tianjin", Population = 24000200 });
            data.Add(new SelectionData() { Continent = "Africa", Country = "Ethiopia", State = "Tianjin", Population = 15042531 });
            data.Add(new SelectionData() { Continent = "Africa", Country = "Kenya", State = "Rift Valley", Population = 10006805 });
            data.Add(new SelectionData() { Continent = "Africa", Country = "Nigeria", State = "Lagos", Population = 10006805 });
            data.Add(new SelectionData() { Continent = "Africa", Country = "Nigeria", State = "Kano", Population = 10006805 });
            data.Add(new SelectionData() { Continent = "Africa", Country = "South Africa", State = "Gauteng", Population = 12728400 });
            data.Add(new SelectionData() { Continent = "Africa", Country = "South Africa", State = "KwaZulu-Natal", Population = 10456900 });
                        
            data.Add(new SelectionData() { Continent = "Europe", Country = "France", State = "Ile-de- France", Population = 11694000 });
            data.Add(new SelectionData() { Continent = "Europe", Country = "Germany", State = "North Rhine-Westphalia", Population = 17872863 });
            data.Add(new SelectionData() { Continent = "Europe", Country = "Germany", State = "Bavaria", Population = 12510331 });
            data.Add(new SelectionData() { Continent = "Europe", Country = "Germany", State = "NBaden-Wurttemberg", Population = 10747479 });
            data.Add(new SelectionData() { Continent = "Europe", Country = "United Kingdom", State = "England", Population = 51446600 });

            return data;
        }
    }