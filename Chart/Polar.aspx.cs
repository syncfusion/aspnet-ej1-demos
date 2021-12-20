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
    public partial class Polar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            #region Chart

            //Setting Range for PriamryYAxis
            this.Chart1.PrimaryYAxis.Range.Min = 15;
            this.Chart1.PrimaryYAxis.Range.Max = 90;
            this.Chart1.PrimaryYAxis.Range.Interval = 15;

            List<PolarChartData> data = new List<PolarChartData>();

            data.Add(new PolarChartData("North", 80, 63, 42));
            data.Add(new PolarChartData("NorthEast", 88, 73, 28));
            data.Add(new PolarChartData("East", 79, 58, 40));
            data.Add(new PolarChartData("SouthWest", 83, 65, 45));
            data.Add(new PolarChartData("South", 78, 47, 20));
            data.Add(new PolarChartData("SouthEast", 90, 70, 40));
            data.Add(new PolarChartData("West", 78, 45, 25));
            data.Add(new PolarChartData("NorthWest", 85, 70, 40));

            //Binding DataSource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();

            #endregion
        }
    }
  
}