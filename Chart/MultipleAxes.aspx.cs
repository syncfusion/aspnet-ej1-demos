#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.JavaScript.DataVisualization;
using Syncfusion.JavaScript.DataVisualization.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.Chart
{
    public partial class MultipleAxes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            //Setting Range for PrimaryYAxis
            this.Chart1.PrimaryYAxis.Range.Min = 0;
            this.Chart1.PrimaryYAxis.Range.Max = 90;
            this.Chart1.PrimaryYAxis.Range.Interval = 10;
            
            //Setting Range for multipleaxes
            this.Chart1.Axes[0].Range.Min = 24;
            this.Chart1.Axes[0].Range.Max = 36;
            this.Chart1.Axes[0].Range.Interval = 2;
            this.Chart1.Axes[1].Range.Min = 24;
            this.Chart1.Axes[1].Range.Max = 30;
            this.Chart1.Axes[1].Range.Interval = 2;

            List<MultiDatta> data = new List<MultiDatta>();

            data.Add(new MultiDatta("Jan", 15, 33, 28));
            data.Add(new MultiDatta("Feb", 20, 31, 28.3));
            data.Add(new MultiDatta("Mar", 35, 30, 28.7));
            data.Add(new MultiDatta("Apr", 40, 28, 29));
            data.Add(new MultiDatta("May", 80, 29, 29.5));
            data.Add(new MultiDatta("June", 70, 30, 29));
            data.Add(new MultiDatta("July", 65, 33, 28.9));
            data.Add(new MultiDatta("Aug", 55, 32, 28.4));
            data.Add(new MultiDatta("Sep", 50, 34, 28.6));
            data.Add(new MultiDatta("Oct", 30, 32, 28));
            data.Add(new MultiDatta("Nov", 35, 32, 28.2));
            data.Add(new MultiDatta("Dec", 35, 31, 28));
           
            //Binding DataSource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();
           
        }
    }

}