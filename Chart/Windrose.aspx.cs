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
    public partial class Windrose : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            #region Chart
           
            //Setting Range for PrimaryYAxis
            this.Chart1.PrimaryYAxis.Range.Min = 0;
            this.Chart1.PrimaryYAxis.Range.Max = 12;
            this.Chart1.PrimaryYAxis.Range.Interval = 2;


            List<WindRoseChartData> data = new List<WindRoseChartData>();

            data.Add(new WindRoseChartData("N", 0.1, 0.8, 1, 0.8, 0.8, 0.3, 0.2, 0.2));
            data.Add(new WindRoseChartData("NNE", 0.1, 0.7, 0.9, 0.7, 0.7, 0.3, 0.2, 0.2));
            data.Add(new WindRoseChartData("NE", 0.1, 0.8, 0.7 , 0.8, 0.5, 1.1, 1.2, 0.5));
            data.Add(new WindRoseChartData("ENE", 0.1, 0.6, 0.9,1 , 0.4, 0.9, 1, 0.4));
            data.Add(new WindRoseChartData("E", 0.1, 0.7, 0.9, 0.6 , 0.9, 0.5, 0.7, 0.4));
            data.Add(new WindRoseChartData("ESE", 0.1, 0.6, 0.8, 0.5 , 0.7, 0.3, 0.8, 0.3));
            data.Add(new WindRoseChartData("SE", 0.1, 0.5, 0.7, 0.4, 0.6, 0.5, 0.5, 0.3));
            data.Add(new WindRoseChartData("SSE", 0.1, 0.7, 1.4, 0.4 , 0.5, 0.4, 0.6, 0.2));
            data.Add(new WindRoseChartData("S", 0.1, 0.9, 2, 1.2, 0.6, 06, 0.4, 0.4));
            data.Add(new WindRoseChartData("SSW", 0.1, 1.9, 2, 0.5, 2,1, 0.5, 0.3));
            data.Add(new WindRoseChartData("SW", 0.1, 1.9, 2.2,2, 1.8,1, 0.4, 0.2));
            data.Add(new WindRoseChartData("WSW", 0.1, 0.9, 1.8, 1.1, 0.8, 0.1, 0.4, 0.2));
            data.Add(new WindRoseChartData("W", 0.1, 1.8, 1.6, 1.8, 2.1, 1, 1.1, 0.4));
            data.Add(new WindRoseChartData("WNE", 0.1, 1.9, 1.2, 1.2, 1.5, 1.3, 1.1, 1.2));
            data.Add(new WindRoseChartData("NW", 0.1, 1.4, 2, 2.5, 2, 1, 0.3, 0.7));
            data.Add(new WindRoseChartData("NNW", 0.1, 0.9, 1.8, 1.1, 0.8, 0.1, 0.4, 0.2));

            //Binding DataSource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();
           
            #endregion
        }
    }
  
}