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
    public partial class Hilo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            //Setting Range for PrimaryYAxis
            this.Chart1.PrimaryYAxis.Range.Min = 0;
            this.Chart1.PrimaryYAxis.Range.Max = 300;
            this.Chart1.PrimaryYAxis.Range.Interval = 50;

            List<HiloChartData> data = new List<HiloChartData>();

            data.Add(new HiloChartData("India", 100,70));
            data.Add(new HiloChartData("Japan", 170,90));
            data.Add(new HiloChartData("Argentina", 240,170));
            data.Add(new HiloChartData("Australia", 290,200));
            data.Add(new HiloChartData("Canada", 200,110));
            data.Add(new HiloChartData("Poland", 160,70));
            data.Add(new HiloChartData("Russia", 200,100));
            data.Add(new HiloChartData("Mexico", 190,80));
            data.Add(new HiloChartData("Turkey", 150,90));
            data.Add(new HiloChartData("Indonesia", 180,120));
            data.Add(new HiloChartData("Spain", 220, 150));
            data.Add(new HiloChartData("France", 210, 130));
            data.Add(new HiloChartData("Germany", 110, 75));
            
            //Binding the datasource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();

        }
    }
   
}

  
    
