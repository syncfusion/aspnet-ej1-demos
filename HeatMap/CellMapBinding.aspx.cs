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
using Syncfusion.JavaScript.DataVisualization;
using Syncfusion.JavaScript.DataVisualization.Models;
using Syncfusion.JavaScript.DataVisualization.Models.Collections;
using Syncfusion.JavaScript.DataVisualization.HeatMapEnums;
using Syncfusion.JavaScript.Shared.Serializer;
using System.ComponentModel;

namespace WebSampleBrowser.HeatMap
{
    public partial class CellMapBinding : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CreateHeatmap();

            }
        }
        public void CreateHeatmap()
        {
            heatmap.LegendCollection.Add("heatmapLegend");
            CellMapping CellMapping = new CellMapping();
            CellMapping.Column = new PropertyMapping() { PropertyName = "ProductName", DisplayName = "Product Name" };
            CellMapping.Row = new PropertyMapping() { PropertyName = "Year", DisplayName = "Year" };
            CellMapping.Value = new PropertyMapping() { PropertyName = "Value" };
            Collection columnMapping = new Collection();
            columnMapping.Add(new HeaderMapping() { PropertyName = "Vegie-spread", DisplayName = "Vegie-spread" });
            columnMapping.Add(new HeaderMapping() { PropertyName = "Tofuaa", DisplayName = "Tofuaa" });
            columnMapping.Add(new HeaderMapping() { PropertyName = "Alice Mutton", DisplayName = "Alice Mutton" });
            columnMapping.Add(new HeaderMapping() { PropertyName = "Konbu", DisplayName = "Konbu" });
            columnMapping.Add(new HeaderMapping() { PropertyName = "Fløtemysost", DisplayName = "Fløtemysost" });
            columnMapping.Add(new HeaderMapping() { PropertyName = "Perth Pasties", DisplayName = "Perth Pasties" });
            CellMapping.ColumnMapping = columnMapping;
            HeaderMapping headerMapping = new HeaderMapping() { PropertyName = "Year", DisplayName = "Year", ColumnStyle = new ColumnStyle() { Width = 105, TextAlign = HeatMapTextAlign.Right } };
            CellMapping.HeaderMapping = headerMapping;
            heatmap.ItemsSource = GetCellSource();
            heatmap.ItemsMapping = CellMapping;
        }
        public Collection GetCellSource()
        {
            Collection collection = new Collection();
            string[] name = { "Vegie-spread", "Tofuaa", "Alice Mutton", "Konbu", "Fløtemysost", "Perth Pasties" };
            Random random = new Random();

            foreach (string item in name)
            {
                for (int i = 0; i < 6; i++)
                {
                    double value = random.Next(0, random.Next(0, 100));
                    collection.Add(new SampleCellData() { ProductName = item, Year = "Y" + (2011 + i), Value = value });
                }
            }
            return collection;
        }
    }
    [Serializable]
    public class SampleCellData
    {
        private string productName;

        [JsonProperty("ProductName")]
        [DefaultValue("")]
        public string ProductName
        {
            get { return productName; }
            set { productName = value; }
        }

        private string year;
        [JsonProperty("Year")]
        [DefaultValue("")]
        public string Year
        {
            get { return year; }
            set { year = value; }
        }

        private Double valuex;
        [JsonProperty("Value")]
        [DefaultValue("")]
        public Double Value
        {
            get { return valuex; }
            set { valuex = value; }
        }


    }
}