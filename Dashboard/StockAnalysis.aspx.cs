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

namespace WebSampleBrowser.Dashboard
{
    public partial class StockAnalysis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            this.hiloOpenClose.PrimaryYAxis.Range.Min = 0;
            this.hiloOpenClose.PrimaryYAxis.Range.Max = 800;
            this.hiloOpenClose.PrimaryYAxis.Range.Interval = 200;

            //ChartSeries india = new ChartSeries();
            //india.Name = "Bank";
            //india.Type = SeriesType.HiloOpenClose;
            //india.Border.Width = 1;
            //india.Tooltip.Template = "Tooltip";
            //this.hiloOpenClose.Series.Add(india);

            //this.hiloOpenClose.Background = "transparent";
            //this.hiloOpenClose.CanResize = true;
            //this.hiloOpenClose.Title.Text = "GOOG";
            //this.hiloOpenClose.Title.Font.FontSize = "45px";
            //this.hiloOpenClose.Title.Font.Color = "B9CFE7";
            //this.hiloOpenClose.Title.Font.FontWeight = ChartFontWeight.Lighter;
            //this.hiloOpenClose.Title.TextAlignment = TextAlignment.Far;
            //this.hiloOpenClose.OnClientLoad = "chartload";
            //this.hiloOpenClose.Size.Height = "300";
            //this.hiloOpenClose.Legend.Visible = false;
            //this.hiloOpenClose.Margin.Right = 20;

            //this.colChart.PrimaryXAxis.Range.Min = new DateTime(2008, 2, 1);
            //this.colChart.PrimaryXAxis.Range.Max = new DateTime(2013, 01, 1);
            //this.colChart.PrimaryXAxis.Range.Interval = 1;
            // this.colChart.PrimaryXAxis.IntervalType = ChartIntervalType.Years;
            //this.colChart.PrimaryXAxis.LabelFormat = "yyyy";
            //this.colChart.PrimaryXAxis.MajorGridLines.Visible = false;
            //this.colChart.PrimaryXAxis.MajorTickLines.Visible = false;
            this.colChart.PrimaryYAxis.Range.Min = 100;
            this.colChart.PrimaryYAxis.Range.Max = 800;
            this.colChart.PrimaryYAxis.Range.Interval = 100;
            //this.colChart.PrimaryYAxis.AxisLine.Visible = false;
            //this.colChart.PrimaryYAxis.MajorTickLines.Visible = false;
            //this.colChart.PrimaryYAxis.RangePadding = ChartRangePadding.None;
            //this.colChart.PrimaryYAxis.Font.Color = "transparent";
           
            //ChartSeries Gold = new ChartSeries();
            //Gold.Name = "Gold";
            //Gold.Type = SeriesType.Column;
            //Gold.EnableAnimation = true;
            //Gold.Fill = "#BA4558";
            //this.colChart.Series.Add(Gold);
            //ChartSeries Silver = new ChartSeries();
           // Silver.Name = "Silver";
           // Silver.Type = SeriesType.Column;
           // Silver.EnableAnimation = true;
           // Silver.Fill = "#1D9059";
           //this.colChart.Series.Add(Silver);
            //this.colChart.OnClientLoad = "onchartload";
            //this.colChart.CanResize = true;
            //this.colChart.CanResize = true;
            //this.colChart.Background = "transparent";
            //this.colChart.Size.Height = "450";
            //this.colChart.Legend.Visible = false;
           

        }
    }
}