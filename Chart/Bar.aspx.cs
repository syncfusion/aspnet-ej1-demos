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
    public partial class Bar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Setting Range for PrimaryXAxis
            this.Chart1.PrimaryXAxis.Range.Max = 2012;
            this.Chart1.PrimaryXAxis.Range.Min = 2005;
            this.Chart1.PrimaryXAxis.Range.Interval = 1;

            //Setting Range for PrimaryYAxis
            this.Chart1.PrimaryYAxis.Range.Max = 12;
            this.Chart1.PrimaryYAxis.Range.Min = 3;
            this.Chart1.PrimaryYAxis.Range.Interval = 1;

            List<BarChartData> data = new List<BarChartData>();

            data.Add(new BarChartData(2006, 7.8, 4.8));
            data.Add(new BarChartData(2007, 7.2, 4.6));
            data.Add(new BarChartData(2008, 6.8, 7.2));
            data.Add(new BarChartData(2009, 10.7, 9.3));
            data.Add(new BarChartData(2010, 10.8,9.7));
            data.Add(new BarChartData(2011, 9.8, 9));

            //Binding Datasource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();

        }
    }
   
}

    
      
    