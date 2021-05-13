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
    public partial class Trim : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //Setting Range for PrimaryYAxis
            this.Chart1.PrimaryYAxis.Range.Min = 0;
            this.Chart1.PrimaryYAxis.Range.Max = 40;
            this.Chart1.PrimaryYAxis.Range.Interval = 5;
            List<TrimAxisData> data = new List<TrimAxisData>();


            data.Add(new TrimAxisData("Germany", 35.5));
            data.Add(new TrimAxisData("China", 18.3));
            data.Add(new TrimAxisData("Italy", 17.6));
            data.Add(new TrimAxisData("Japan", 13.6));
            data.Add(new TrimAxisData("US", 12));
            data.Add(new TrimAxisData("Spain", 5.6));
            data.Add(new TrimAxisData("France", 4.6));
            data.Add(new TrimAxisData("Australia", 3.3));
            data.Add(new TrimAxisData("Belgium", 3));
            data.Add(new TrimAxisData("UK", 2.9));
          
            //Binding DataSource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();

        }
    }
 
}