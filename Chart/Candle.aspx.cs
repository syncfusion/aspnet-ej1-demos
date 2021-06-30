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
    public partial class Candle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            //Setting Range for PrimaryXAxis
            this.Chart1.PrimaryXAxis.Range.Min =new DateTime(1949, 1, 1);
            this.Chart1.PrimaryXAxis.Range.Max = new DateTime(2009, 1, 1);
            this.Chart1.PrimaryXAxis.Range.Interval = 20;

            //Setting Range for PrimaryYAxis
            this.Chart1.PrimaryYAxis.Range.Min = 0;
            this.Chart1.PrimaryYAxis.Range.Max = 250;
            this.Chart1.PrimaryYAxis.Range.Interval = 50;

            List<CandleChartData> data = new List<CandleChartData>();

            data.Add(new CandleChartData(new DateTime(1950, 1, 12),125,70,115,90));
            data.Add(new CandleChartData(new DateTime(1953, 1, 12),150, 60,120,70 ));
            data.Add(new CandleChartData(new DateTime(1956, 1, 12), 200, 140,160,190));
            data.Add(new CandleChartData(new DateTime(1959, 1, 12),160,90,140,110));
            data.Add(new CandleChartData(new DateTime(1962, 1, 12), 200,100,180,120));
            data.Add(new CandleChartData(new DateTime(1965, 1, 12), 100,45,70,50));
            data.Add(new CandleChartData(new DateTime(1968, 1, 12), 150,70,140,130));
            data.Add(new CandleChartData(new DateTime(1971, 1, 12), 90,60,65,80));
            data.Add(new CandleChartData(new DateTime(1974, 1, 12), 225,170,175,220));
            data.Add(new CandleChartData(new DateTime(1977, 1, 12), 250,180,223,190));
            data.Add(new CandleChartData(new DateTime(1980, 1, 12), 200,140,160,190));
            data.Add(new CandleChartData(new DateTime(1983, 1, 12), 160,90,140,110));
            data.Add(new CandleChartData(new DateTime(1986, 1, 12), 200,100,180,120));
            data.Add(new CandleChartData(new DateTime(1989, 1, 1), 130,95,120,100));
            data.Add(new CandleChartData(new DateTime(1991, 1, 12), 100,70,92,75));
            data.Add(new CandleChartData(new DateTime(1994, 1, 12), 50,85,65,80));
            data.Add(new CandleChartData(new DateTime(1997, 1, 12), 185,110,130,170));
            data.Add(new CandleChartData(new DateTime(2000, 1, 12), 90,30,80,50));
            data.Add(new CandleChartData(new DateTime(2003, 1, 12), 200,140,160,190));
            data.Add(new CandleChartData(new DateTime(2006, 1, 12),170,90,140,110));
            data.Add(new CandleChartData(new DateTime(2008, 1, 12), 200,100,180,120));

            //Binding Datasource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();
           
        }
    }
   
}
  