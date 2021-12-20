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
    public partial class IsIndexed : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<IsindexedChartData> data = new List<IsindexedChartData>();

            data.Add(new IsindexedChartData("Monday", 50, 60, 40));
            data.Add(new IsindexedChartData("Tuesday", 40, 30, 60));
            data.Add(new IsindexedChartData("Wednesday", 70, 40, 40));
            data.Add(new IsindexedChartData("Thursday", 60, 80, 30));
            data.Add(new IsindexedChartData("Friday", 50, 70, 80));
            data.Add(new IsindexedChartData("Monday", 40, 50, 30));
            data.Add(new IsindexedChartData("Tuesday", 50, 40, 30));
            data.Add(new IsindexedChartData("Wednesday", 30, 50, 60));
            data.Add(new IsindexedChartData("Thursday", 40, 50, 40));
            data.Add(new IsindexedChartData("Friday", 70, 50, 40));
            data.Add(new IsindexedChartData("Monday", 60, 70, 50));
            data.Add(new IsindexedChartData("Tuesday", 30, 50, 20));
            data.Add(new IsindexedChartData("Wednesday", 50, 60, 30));
            data.Add(new IsindexedChartData("Thursday", 50, 30, 70));
            data.Add(new IsindexedChartData("Friday", 40, 60, 60));
            data.Add(new IsindexedChartData("Monday", 30, 40, 20));
            data.Add(new IsindexedChartData("Tuesday", 55, 65, 35));
            data.Add(new IsindexedChartData("Wednesday", 60, 70, 50));
            data.Add(new IsindexedChartData("Thursday", 30, 40, 20));
            data.Add(new IsindexedChartData("Friday", 60, 40, 30));

            //Binding Datasource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();

            //Setting Range for PrimaryXAxis
            this.Chart1.PrimaryXAxis.Visible = true;
            this.Chart1.PrimaryXAxis.IsIndexed = true;
        }
      

    }
}