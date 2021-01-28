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
    public partial class SmartAxisLabel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //Setting Range for PrimaryYAxis
            this.Chart1.PrimaryYAxis.Range.Min = 0;
            this.Chart1.PrimaryYAxis.Range.Max = 80;
            this.Chart1.PrimaryYAxis.Range.Interval = 5;

            List<SmartAxisData> data = new List<SmartAxisData>();

              
             data.Add(new SmartAxisData("South Korea", 39.4));
             data.Add(new SmartAxisData("India", 61.3));
             data.Add(new SmartAxisData("Pakistan", 20.4));
             data.Add(new SmartAxisData("Germany", 65.1));
             data.Add(new SmartAxisData("Australia", 15.8));
             data.Add(new SmartAxisData("Italy", 29.2));
             data.Add(new SmartAxisData("France", 44.6));
             data.Add(new SmartAxisData("Saudi Arabia", 9.7));
             data.Add(new SmartAxisData("Russia", 40.8));
             data.Add(new SmartAxisData("Mexico", 31));
             data.Add(new SmartAxisData("Brazil", 75.9));
             data.Add(new SmartAxisData("China", 51.4));

            //Binding DataSource to Chart
             this.Chart1.DataSource = data;
             this.Chart1.DataBind();
               
        }
    }

   
}