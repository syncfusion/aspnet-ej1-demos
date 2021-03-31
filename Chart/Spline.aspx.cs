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

namespace WebSampleBrowser.Chart
{
    public partial class Spline : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<SplineChartData> data = new List<SplineChartData>();

            data.Add(new SplineChartData("Jan", -1, 3, 7));
            data.Add(new SplineChartData("Feb", -1, 3.5, 8));
            data.Add(new SplineChartData("Mar", 2, 7, 12));
            data.Add(new SplineChartData("Apr", 8, 13.5, 19));
            data.Add(new SplineChartData("May", 13, 19, 25));
            data.Add(new SplineChartData("Jun", 18, 23.5, 29));
            data.Add(new SplineChartData("Jul", 21, 26, 31));
            data.Add(new SplineChartData("Aug", 20, 25, 30));
            data.Add(new SplineChartData("Sep", 16, 21, 26));
            data.Add(new SplineChartData("Oct", 10, 15, 20));
            data.Add(new SplineChartData("Nov", 4, 9, 14));
            data.Add(new SplineChartData("Dec", 0, 3.5, 8));

            //Binding DataSource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();
           
            //Setting Range for PrimaryYAxis
            this.Chart1.PrimaryYAxis.Range.Min = -5;
            this.Chart1.PrimaryYAxis.Range.Max = 35;
            this.Chart1.PrimaryYAxis.Range.Interval = 5;
           
        }
    }
    
}
        

       
