#region Copyright Syncfusion Inc. 2001-2020.
// Copyright Syncfusion Inc. 2001-2020. All rights reserved.
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
    public partial class DefaultFunctionalities : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<LineChartData> data = new List<LineChartData>();

            data.Add(new LineChartData(2005, 28, 31, 36, 39));
            data.Add(new LineChartData(2006, 25, 28, 32, 36));
            data.Add(new LineChartData(2007, 26, 30, 34, 40));
            data.Add(new LineChartData(2008, 27, 36, 41, 44));
            data.Add(new LineChartData(2009, 32, 36, 42, 45));
            data.Add(new LineChartData(2010, 35, 39, 42, 48));
            data.Add(new LineChartData(2011, 30, 37, 43, 46));

            //Binding Datasource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();

            //Setting range for PrimaryXAxis
            this.Chart1.PrimaryXAxis.Range.Min = 2005;
            this.Chart1.PrimaryXAxis.Range.Max = 2011;
            this.Chart1.PrimaryXAxis.Range.Interval = 1;

            //Setting range for PrimaryYAxis
            this.Chart1.PrimaryYAxis.Range.Min = 25;
            this.Chart1.PrimaryYAxis.Range.Max = 50;
            this.Chart1.PrimaryYAxis.Range.Interval = 5;

        }
    }
   
}

      
   
      
      