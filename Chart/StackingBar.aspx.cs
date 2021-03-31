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
    public partial class StackingBar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Setting Range for PriamryXAxis
            this.Chart1.PrimaryXAxis.Range.Max = 2012;
            this.Chart1.PrimaryXAxis.Range.Min = 2005;
            this.Chart1.PrimaryXAxis.Range.Interval = 1;

            //Setting Range for PrimaryYAxis
            this.Chart1.PrimaryYAxis.Range.Max = 100;
            this.Chart1.PrimaryYAxis.Range.Min = -20;
            this.Chart1.PrimaryYAxis.Range.Interval = 20;

            List<StackingBarChartData> data = new List<StackingBarChartData>();

            data.Add(new StackingBarChartData("Jan", 6, 6, -1));
            data.Add(new StackingBarChartData("Feb", 8, 8, -1.5));
            data.Add(new StackingBarChartData("Mar", 12, 11, -1));
            data.Add(new StackingBarChartData("Apr", 15.5, 16, -2.5));
            data.Add(new StackingBarChartData("May", 20, 21, -3));
            data.Add(new StackingBarChartData("Jun", 24, 25, -3.5));
            data.Add(new StackingBarChartData("Jul", 28, 27, -4));
            data.Add(new StackingBarChartData("Aug", 32, 31, -4.5));
            data.Add(new StackingBarChartData("Sep", 33, 34, -5));
            data.Add(new StackingBarChartData("Oct", 35, 34, -5.5));
            data.Add(new StackingBarChartData("Nov", 40, 41, -6));
            data.Add(new StackingBarChartData("Dec", 42, 42, -6.5));

            //Binding DataSource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();
          
        }
    }
   
}
 
  