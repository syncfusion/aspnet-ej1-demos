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
    public partial class RangeColumn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<RangeColumnChartData> data = new List<RangeColumnChartData>();

            data.Add(new RangeColumnChartData("Jan", 6.1, 0.7, 7.1, 1.7));
            data.Add(new RangeColumnChartData("Feb", 6.3, 1.3, 7.7, 1.9));
            data.Add(new RangeColumnChartData("Mar", 8.5, 1.9, 7.5, 1.2));
            data.Add(new RangeColumnChartData("Apr", 10.8, 3.1, 9.8, 2.5));
            data.Add(new RangeColumnChartData("May", 14.4, 5.7, 11.4, 4.7));
            data.Add(new RangeColumnChartData("Jun", 16.9, 8.4, 14.4, 6.4));
            data.Add(new RangeColumnChartData("Jul", 19.2, 10.6, 17.2, 9.6));
            data.Add(new RangeColumnChartData("Aug", 18.9, 10.5, 17.9, 10.7));
            data.Add(new RangeColumnChartData("Sep", 16.1, 8.5, 15.1, 7.5));
            data.Add(new RangeColumnChartData("Oct", 6.0, 12.5, 3.0, 10.5));
            data.Add(new RangeColumnChartData("Nov", 1.5, 6.9, 1.2, 7.9));
            data.Add(new RangeColumnChartData("Dec", 5.1, 12.1, 4.1, 9.1));

            //Binding Datasource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();

        }
    }
    
}

         
