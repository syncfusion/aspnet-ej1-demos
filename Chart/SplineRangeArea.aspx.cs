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
    public partial class SplineRangeArea : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<SplineRangeAreaChartData> data = new List<SplineRangeAreaChartData>();

            data.Add(new SplineRangeAreaChartData("Jan", 28, 8, 58, 38));
            data.Add(new SplineRangeAreaChartData("Feb", 35, 15, 65, 45));
            data.Add(new SplineRangeAreaChartData("Mar", 42, 22, 72, 52));
            data.Add(new SplineRangeAreaChartData("Apr", 45, 25, 75, 55));
            data.Add(new SplineRangeAreaChartData("May", 42, 22, 72, 52));
            data.Add(new SplineRangeAreaChartData("Jun", 35, 15, 65, 45));
            data.Add(new SplineRangeAreaChartData("Jul", 30, 10, 60, 40));
            data.Add(new SplineRangeAreaChartData("Aug", 33, 13, 63, 43));
            data.Add(new SplineRangeAreaChartData("Sep", 40, 20, 70, 50));
            data.Add(new SplineRangeAreaChartData("Oct", 45, 25, 75, 55));
            data.Add(new SplineRangeAreaChartData("Nov", 40, 20, 70, 50));
            data.Add(new SplineRangeAreaChartData("Dec", 33, 13, 63, 43));

            //Binding DataSource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();
        }
    }
}