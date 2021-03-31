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
    public partial class HeatMap : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            (this.heatMap.Layers[0] as ShapeLayer).ShapeSettings.ColorMappings = new ColorMapping() {
                MappingCollection = new List<object>()
                {
                    new RangeColorMapping() { From = 10000001, To = 40000000, Color =  "#F1ECD8" },
                    new RangeColorMapping() { From = 5000001, To = 10000000, Color =  "#DEE2B9" },
                    new RangeColorMapping() { From = 1000001, To = 5000000, Color =  "#CBD89A" },
					new RangeColorMapping() { From = 500000, To = 1000000, Color = "#B8CE7B"}
                }
            };
            (this.heatMap.Layers[0] as ShapeLayer).DataSource = Election_Result.GetUSPopulationData();
            (this.heatMap.Layers[0] as ShapeLayer).ShapeData = this.GetUSA();
        }

        public object GetUSA()
        {
            string allText = System.IO.File.ReadAllText(Server.MapPath("~/App_Data/USA.json"));
            JavaScriptSerializer ser = new JavaScriptSerializer();
            ser.MaxJsonLength = int.MaxValue;
            return new MapData(allText);
        }
    }
}