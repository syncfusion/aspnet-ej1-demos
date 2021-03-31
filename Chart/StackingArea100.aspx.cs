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

namespace WebSampleBrowser.Chart
{
    public partial class StackingArea100 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<StackingArea100ChartData> data = new List<StackingArea100ChartData>();

            data.Add(new StackingArea100ChartData(2006, 34, 51, 14, 37));
            data.Add(new StackingArea100ChartData(2007, 20, 26, 34, 16));
            data.Add(new StackingArea100ChartData(2008, 40, 37, 73, 53));
            data.Add(new StackingArea100ChartData(2009, 51, 51, 51, 51));
            data.Add(new StackingArea100ChartData(2010, 26, 26, 26, 26));
            data.Add(new StackingArea100ChartData(2011, 37, 37, 37, 37));
            data.Add(new StackingArea100ChartData(2012, 54, 43, 12, 54));
            data.Add(new StackingArea100ChartData(2013, 44, 23,16, 44));
            data.Add(new StackingArea100ChartData(2014, 48, 55, 34, 23));

            //Binding DataSource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();

            //Setting Range for PriamryXAxis
            this.Chart1.PrimaryXAxis.Range.Min = 2006;
            this.Chart1.PrimaryXAxis.Range.Max = 2014;
            this.Chart1.PrimaryXAxis.Range.Interval = 1;

        }
    }
    
}