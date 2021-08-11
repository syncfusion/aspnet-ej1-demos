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
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.DropDownList
{
    public partial class Grouping : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            VegetableCollection dataCollection = new VegetableCollection();
            vegetablelist.DataSource = dataCollection.GetDataList();
        }

        public class VegetableCollection
        {
            public string Veg { get; set; }
            public string Group { get; set; }

            private List<VegetableCollection> Data = new List<VegetableCollection>();

            public List<VegetableCollection> GetDataList()
            {
                Data.Add(new VegetableCollection() { Veg = "Cabbage", Group = "Leafy and Salad" });
                Data.Add(new VegetableCollection() { Veg = "Pea", Group = "Leafy and Salad" });
                Data.Add(new VegetableCollection() { Veg = "Spinach", Group = "Leafy and Salad" });
                Data.Add(new VegetableCollection() { Veg = "Wheatgrass", Group = "Leafy and Salad" });
                Data.Add(new VegetableCollection() { Veg = "Yarrow", Group = "Leafy and Salad" });
                Data.Add(new VegetableCollection() { Veg = "Pigeon pea", Group = "Beans" });
                Data.Add(new VegetableCollection() { Veg = "Peanut", Group = "Beans" });
                Data.Add(new VegetableCollection() { Veg = "Garlic", Group = "Bulb and Stem" });
                Data.Add(new VegetableCollection() { Veg = "Garlic Chives", Group = "Bulb and Stem" });
                Data.Add(new VegetableCollection() { Veg = "Lotus root", Group = "Bulb and Stem" });
                Data.Add(new VegetableCollection() { Veg = "Nopal", Group = "Bulb and Stem" });
                Data.Add(new VegetableCollection() { Veg = "Onion", Group = "Bulb and Stem" });
                Data.Add(new VegetableCollection() { Veg = "Shallot", Group = "Bulb and Stem" });
                Data.Add(new VegetableCollection() { Veg = "Beetroot", Group = "Root and Tuberous" });
                Data.Add(new VegetableCollection() { Veg = "Carrot", Group = "Root and Tuberous" });
                Data.Add(new VegetableCollection() { Veg = "Ginger", Group = "Root and Tuberous" });
                Data.Add(new VegetableCollection() { Veg = "Potato", Group = "Root and Tuberous" });
                Data.Add(new VegetableCollection() { Veg = "Radish", Group = "Root and Tuberous" });
                Data.Add(new VegetableCollection() { Veg = "Turmeric", Group = "Root and Tuberous" });
                return Data;
            }
        }
    }
}