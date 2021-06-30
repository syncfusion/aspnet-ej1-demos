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
    public partial class WeatherAnalysis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //this.HourChart.CanResize = true;
            //RowDefinitions rd=  new RowDefinitions();
            //rd.RowHeight = 25;
            //rd.LineColor = "transparent";
            //rd.Unit = "percentage";
            //this.HourChart.RowDefinitions.Add(rd);
            //RowDefinitions rd1 = new RowDefinitions();
            //rd1.RowHeight = 25;
            //rd1.LineColor = "transparent";
            //rd1.Unit = "percentage";
            //this.HourChart.RowDefinitions.Add(rd1);
            //RowDefinitions rd2 = new RowDefinitions();
            //rd2.RowHeight = 50;
            //rd2.LineColor = "transparent";
            //rd2.Unit = "percentage";
            //this.HourChart.RowDefinitions.Add(rd2);
            

            //this.HourChart.PrimaryXAxis.MinorGridLines.Visible = false;
            //this.HourChart.PrimaryXAxis.AxisLine.Visible = false;
            //this.HourChart.PrimaryXAxis.ValueType = AxisValueType.Datetime;
            //this.HourChart.PrimaryXAxis.LabelFormat = "hh:mm tt";
            //this.HourChart.PrimaryXAxis.IntervalType = ChartIntervalType.Hours;
            this.HourChart.PrimaryXAxis.Range.Interval = 4;

            //this.HourChart.PrimaryYAxis.LabelFormat = "{value}";
            //this.HourChart.PrimaryYAxis.MajorTickLines.Visible = false;
            //this.HourChart.PrimaryYAxis.RangePadding = ChartRangePadding.None;
            //this.HourChart.PrimaryYAxis.AxisLine.Visible = false;
            //this.HourChart.PrimaryYAxis.MajorGridLines.Visible = false;
            //this.HourChart.PrimaryYAxis.HidePartialLabels = true;
            //this.HourChart.PrimaryYAxis.Font.Color = "transparent";
            this.HourChart.PrimaryYAxis.Range.Min = -10;
            this.HourChart.PrimaryYAxis.Range.Max = 45;
            this.HourChart.PrimaryYAxis.Range.Interval = 15;
            //this.HourChart.PrimaryYAxis.Visible = false;
     
            //Axis axis1 = new Axis();
            //axis1.MajorGridLines.Visible = false;
            //axis1.MajorTickLines.Visible = false;
            //axis1.Orientation = "vertical";
            //axis1.RowIndex = 1;
            //axis1.OpposedPosition = false;
            //axis1.AxisName = "yAxis1";
            //axis1.HidePartialLabels = true;
            //axis1.Font.Color = "transparent";
            //axis1.Range.Min = -10;
            //axis1.Range.Max = 50;
            //axis1.Range.Interval = 15;
            //axis1.AxisLine.Visible = false;
            //this.HourChart.Axes.Add(axis1);

            // Axis axis2 = new Axis();
            //axis2.MajorGridLines.Visible = false;
            //axis2.MajorTickLines.Visible = false;
            //axis2.Orientation = "vertical";
            //axis2.RowIndex = 2;
            //axis2.OpposedPosition = false;
            //axis2.AxisName = "yAxis2";
            //axis2.HidePartialLabels = true;
            //axis2.Font.Color = "transparent";
            //axis2.Range.Min = -10;
            //axis2.Range.Max = 80;
            //axis2.Range.Interval = 15;
            //axis2.AxisLine.Visible = false;
            //this.HourChart.Axes.Add(axis2);
    
            // Axis axis3 = new Axis();
            //axis3.MajorGridLines.Visible = false;
            //axis3.MajorTickLines.Visible = false;
            //axis3.Orientation = "vertical";
            //axis3.RowIndex = 2;
            //axis3.OpposedPosition = false;
            //axis3.AxisName = "yAxis3";
            //axis3.HidePartialLabels = true;
            //axis3.Font.Color = "transparent";
            //axis3.Range.Min = -10;
            //axis3.Range.Max = 80;
            //axis3.Range.Interval = 5;
            //axis3.AxisLine.Visible = false;
            //this.HourChart.Axes.Add(axis3);

           
     //this.HourChart.CommonSeriesOptions.Type = SeriesType.Line;
     //       this.HourChart.CommonSeriesOptions.EnableAnimation = true;
     //       this.HourChart.CommonSeriesOptions.Marker.Shape = ChartShape.Circle;
     //       this.HourChart.CommonSeriesOptions.Marker.Size.Height = 6;
     //       this.HourChart.CommonSeriesOptions.Marker.Size.Width = 6;
     //       this.HourChart.CommonSeriesOptions.Marker.Border.Color = "white";
     //       this.HourChart.CommonSeriesOptions.Marker.Border.Width = 3;
           // ChartSeries series = new ChartSeries();
           // series.Name = "Temperature";
           // series.Fill = "#A0C037";
           // series.Tooltip.Visible = true;
           // series.Tooltip.Format = "#series.name#: #point.y# c";
           // series.Marker.Visible = true;
           //// series.YAxisName = "yAxis1";
           // this.HourChart.Series.Add(series);

            //ChartSeries series1 = new ChartSeries();
            //series1.Name = "FeelsLike";
            //series1.Fill = "#369E45";
            //series1.Tooltip.Visible = true;
            //series1.Tooltip.Format = "#series.name#: #point.y# c";
            //series1.Marker.Visible = true;
            //series1.YAxisName = "yAxis1";
            //this.HourChart.Series.Add(series1);
            //ChartSeries series2 = new ChartSeries();
            //series2.Name = "Humidity";
            //series2.Fill = "#9F5123";
            //series2.Tooltip.Visible = true;
            //series2.Tooltip.Format = "#series.name#: #point.y# %";
            //series2.Marker.Visible = true;
            //series2.YAxisName = "yAxis2";
            //this.HourChart.Series.Add(series2);
            //ChartSeries series3 = new ChartSeries();
            //series3.Name = "Wind";
            //series3.Fill = "#2DA2D8";
            //series3.Tooltip.Visible = true;
            //series3.Tooltip.Format = "#series.name#: #point.y# MPH";
            //series3.Marker.Visible = true;
            //series3.YAxisName = "yAxis3";
            //this.HourChart.Series.Add(series3);

            //this.HourChart.CrossHair.Visible = true;
            //this.HourChart.CrossHair.Type = CrosshairType.Trackball;
            //this.HourChart.CrossHair.Line.Width = 2;
            //this.HourChart.CrossHair.Line.Color = "#F2B16D";
            //this.HourChart.CrossHair.Marker.Shape = ChartShape.Circle;
            //this.HourChart.CrossHair.Marker.Size.Height = 9;
            //this.HourChart.CrossHair.Marker.Size.Width = 9;
            //this.HourChart.CrossHair.Marker.Visible = true;
            //this.HourChart.OnClientLoad = "hourChartLoad";
            //this.HourChart.OnClientSeriesRendering = "renderSeries";
            //this.HourChart.Background = "white";
            //this.HourChart.Size.Height = "500";
            //this.HourChart.ChartArea.Border.Color = "transparent";
            //this.HourChart.Margin.Left =20;
            //this.HourChart.Margin.Top =20;
            //this.HourChart.Legend.Visible = true;
            //this.HourChart.Legend.Shape = ChartShape.Circle;
            //this.HourChart.Legend.Position = LegendPosition.Bottom;
            //this.HourChart.Legend.ItemSize.Width = 10;
            //this.HourChart.Legend.ItemSize.Height = 10;

     

            //this.AverageChart.CanResize = true;
            //this.AverageChart.PrimaryXAxis.OpposedPosition = true;
            //this.AverageChart.PrimaryXAxis.AxisLine.Visible = false;
            //this.AverageChart.PrimaryXAxis.MajorGridLines.Visible = false;
            //this.AverageChart.PrimaryXAxis.MajorTickLines.Visible = false;
            this.AverageChart.PrimaryYAxis.Range.Min = 0;
            this.AverageChart.PrimaryYAxis.Range.Max = 150;
            this.AverageChart.PrimaryYAxis.Range.Interval = 25;
            //this.AverageChart.PrimaryYAxis.RangePadding = ChartRangePadding.None;
            //this.AverageChart.PrimaryYAxis.LabelFormat = "{value} mm";
            //this.AverageChart.PrimaryYAxis.AxisLine.Visible = false;
            //Axis axis = new Axis();
            //axis.MajorGridLines.Visible = false;
            //axis.Orientation ="Vertical";
            //axis.RowIndex = 0;
            //axis.OpposedPosition = true;
            //axis.AxisLine.Visible = false;
            //axis.Range.Min = 0;
            //axis.Range.Max = 15;
            //axis.Range.Interval = 2.5;
            //axis.RangePadding = ChartRangePadding.None;
            //axis.AxisName = "yAxis";
            //axis.LabelFormat = "{value} hrs";
            //this.AverageChart.Axes.Add(axis);
            //ChartSeries precipitation = new ChartSeries();
            //precipitation.Name = "Average Precipitaition";
            //precipitation.Type = SeriesType.Column;
            //precipitation.EnableAnimation = true;
            //precipitation.Fill = "#84C865";
            //this.AverageChart.Series.Add(precipitation);
            //ChartSeries sunlight = new ChartSeries();
            //sunlight.Name = "Average Sunlight";
            //sunlight.Type = SeriesType.Column;
            //sunlight.EnableAnimation = true;
            //sunlight.Fill = "#E94649";
            //this.AverageChart.Series.Add(sunlight);
            //this.AverageChart.OnClientLoad = "averageChartLoad";
            //this.AverageChart.Background = "white";
            //this.AverageChart.Size.Height = "500";
            //this.AverageChart.Legend.Visible = true;
            //this.AverageChart.Legend.Shape = ChartShape.Circle;
            //this.AverageChart.Legend.Position = LegendPosition.Bottom;
            //this.AverageChart.Legend.ItemSize.Height = 10;
            //this.AverageChart.Legend.ItemSize.Width = 10;
        }
    }
}