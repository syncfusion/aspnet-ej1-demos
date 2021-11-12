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
    public partial class Column : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<ColumnChartData> data = new List<ColumnChartData>();

            data.Add(new ColumnChartData("USA", 50, 70, 45));
            data.Add(new ColumnChartData("China", 40, 60, 55));
            data.Add(new ColumnChartData("Japan", 70, 60, 50));
            data.Add(new ColumnChartData("Australia", 60, 56, 40));
            data.Add(new ColumnChartData("France", 50, 45, 35));
            data.Add(new ColumnChartData("Germany", 40, 30, 22));
            data.Add(new ColumnChartData("Italy", 40, 35, 37));
            data.Add(new ColumnChartData("Sweden", 30, 25, 27));

            //Binding Datasource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();

            //Setting Range for PrimaryYAxis
            this.Chart1.PrimaryYAxis.Range.Min = 0;
            this.Chart1.PrimaryYAxis.Range.Max = 70;
            this.Chart1.PrimaryYAxis.Range.Interval = 10;

        }
    }
   
}
 
       