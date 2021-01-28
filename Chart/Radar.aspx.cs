#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.JavaScript.DataVisualization;
using Syncfusion.JavaScript.DataVisualization.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.Chart
{
    public partial class Radar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            #region Chart

            //Setting Range for PrimaryYAxis
            this.Chart1.PrimaryYAxis.Range.Min = 15;
            this.Chart1.PrimaryYAxis.Range.Max = 90;
            this.Chart1.PrimaryYAxis.Range.Interval = 15;


            List<RadarChartData> data = new List<RadarChartData>();

            data.Add(new RadarChartData("North", 80, 63, 42));
            data.Add(new RadarChartData("NorthEast", 88, 73, 28));
            data.Add(new RadarChartData("East", 79, 58, 40));
            data.Add(new RadarChartData("SouthWest", 83, 65, 45));
            data.Add(new RadarChartData("South", 78, 47, 20));
            data.Add(new RadarChartData("SouthEast", 90, 70, 40));
            data.Add(new RadarChartData("West", 78, 45, 25));
            data.Add(new RadarChartData("NorthWest", 85, 70, 40));

            //Binding DataSource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();


            #endregion

        }
    }

}