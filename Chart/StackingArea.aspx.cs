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
    public partial class StackingArea : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<StackingAreaChartData> data = new List<StackingAreaChartData>();

            data.Add(new StackingAreaChartData(2002, 6, 3.5, 8.1, 2.5));
            data.Add(new StackingAreaChartData(2003, 7.5, 4.9, 8.8, 6.1));
            data.Add(new StackingAreaChartData(2004, 6, 3.7, 6.7, 6.2));
            data.Add(new StackingAreaChartData(2005, 6.5, 7.5, 6.4, 1.8));
            data.Add(new StackingAreaChartData(2006, 7.4, 4.8, 4, 4));
            data.Add(new StackingAreaChartData(2007, 7.9, 2.6, 4.8, 6.5));
            data.Add(new StackingAreaChartData(2008, 7.5, 4.7, 7.4, 6.7));
            data.Add(new StackingAreaChartData(2009, 8.5, 3.7, 3.5, 7.2));
            data.Add(new StackingAreaChartData(2010, 4.8, 3.5, 8.3, 8.4));
            data.Add(new StackingAreaChartData(2011, 9.3, 3.6, 4.7, 6.9));

            //Binding DataSource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();

            //Setting Range for PrimaryXAxis
            this.Chart1.PrimaryXAxis.Range.Min = 2002;
            this.Chart1.PrimaryXAxis.Range.Max = 2011;
            this.Chart1.PrimaryXAxis.Range.Interval = 1;

            }
        }
    
    }


