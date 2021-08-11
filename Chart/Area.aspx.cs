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
    public partial class Area : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           //Setting Range for PrimaryXAxis
            this.Chart1.PrimaryXAxis.Range.Min= 1900;
            this.Chart1.PrimaryXAxis.Range.Max = 2000;
            this.Chart1.PrimaryXAxis.Range.Interval = 10;
           
            //Setting Range for PrimaryYAxis
            this.Chart1.PrimaryYAxis.Range.Min = 2;
            this.Chart1.PrimaryYAxis.Range.Max = 5;
            this.Chart1.PrimaryYAxis.Range.Interval = 0.5;

            List<AreaChartData> data = new List<AreaChartData>();

            data.Add(new AreaChartData(1900, 4, 2.6, 2.8));
            data.Add(new AreaChartData(1920, 3, 2.8, 2.5));
            data.Add(new AreaChartData(1940, 3.8, 2.6, 2.8));
            data.Add(new AreaChartData(1960, 3.4, 3, 3.2));
            data.Add(new AreaChartData(1980, 3.2, 3.6, 2.9));
            data.Add(new AreaChartData(2000, 3.9, 3, 2));

            //Binding Datasource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();

           
        }
    }
   
} 