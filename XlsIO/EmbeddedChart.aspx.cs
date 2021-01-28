#region Copyright Syncfusion Inc. 2001 - 2021
//
//  Copyright Syncfusion Inc. 2001 - 2021. All rights reserved.
//
//  Use of this code is subject to the terms of our license.
//  A copy of the current license can be obtained at any time by e-mailing
//  licensing@syncfusion.com. Any infringement will be prosecuted under
//  applicable laws. 
//
#endregion

using System;
using System.Drawing;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Syncfusion.XlsIO;

namespace WebSampleBrowser.XlsIO
{
    public partial class EmbeddedChart : System.Web.UI.Page
    {
        # region Page Load
        /// <summary>
        /// Handles the page load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        # endregion

        # region Events
        /// <summary>
        /// Creates spreadsheet
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            //Instantiate the spreadsheet creation engine.
            ExcelEngine excelEngine = new ExcelEngine();
            IApplication application = excelEngine.Excel;
            //A new workbook is created.[Equivalent to creating a new workbook in Microsoft Excel]
            //Open workbook with Data
            IWorkbook workbook = application.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath("EmbeddedChart.xlsx", Request));

            // Default version is set as Excel 2007
           
            //The first worksheet object in the worksheets collection is accessed.
            IWorksheet worksheet = workbook.Worksheets[0];
            worksheet.Name = "EmbeddedChart";

            // Adding a New chart to the Existing Worksheet   
            IChartShape chart = workbook.Worksheets[0].Charts.Add();


            chart.DataRange = worksheet.Range["A3:C15"];
            chart.ChartTitle = "Crescent City, CA";
            chart.IsSeriesInRows = false;

            chart.PrimaryValueAxis.Title = "Precipitation,in.";
            chart.PrimaryValueAxis.TitleArea.TextRotationAngle = 90;
            chart.PrimaryValueAxis.MaximumValue = 14.0;
            chart.PrimaryValueAxis.NumberFormat = "0.0";

            chart.PrimaryCategoryAxis.Title = "Month";

            IChartSerie serieOne = chart.Series[0];

            //set the Chart Type
            chart.ChartType = ExcelChartType.Column_Clustered_3D;

            //set the Backwall fill option
            chart.BackWall.Fill.FillType = ExcelFillType.Gradient;

            //set the Texture Type
            chart.BackWall.Fill.GradientColorType = ExcelGradientColor.TwoColor;
            chart.BackWall.Fill.GradientStyle = ExcelGradientStyle.Diagonl_Down;
            chart.BackWall.Fill.ForeColor = System.Drawing.Color.WhiteSmoke;
            chart.BackWall.Fill.BackColor = System.Drawing.Color.LightBlue;

            //set the Border Linecolor 
            chart.BackWall.Border.LineColor = System.Drawing.Color.Wheat;

            //set the Picture Type     
            chart.BackWall.PictureUnit = ExcelChartPictureType.stretch;

            //set the Backwall thickness
            chart.BackWall.Thickness = 10;

            //set the sidewall fill option
            chart.SideWall.Fill.FillType = ExcelFillType.SolidColor;

            //set the sidewall foreground and backcolor
            chart.SideWall.Fill.BackColor = System.Drawing.Color.White;
            chart.SideWall.Fill.ForeColor = System.Drawing.Color.White;

            //set the side wall Border color
            chart.SideWall.Border.LineColor = System.Drawing.Color.Beige;

            //set floor fill option
            chart.Floor.Fill.FillType = ExcelFillType.Pattern;

            //set the floor pattern Type
            chart.Floor.Fill.Pattern = ExcelGradientPattern.Pat_Divot;

            //Set the floor fore and Back ground color
            chart.Floor.Fill.ForeColor = System.Drawing.Color.Blue;
            chart.Floor.Fill.BackColor = System.Drawing.Color.White;

            //set the floor thickness
            chart.Floor.Thickness = 3;

            IChartSerie serieTwo = chart.Series[1];
            //Show value as data labels
            serieOne.DataPoints.DefaultDataPoint.DataLabels.IsValue = true;
            serieTwo.DataPoints.DefaultDataPoint.DataLabels.IsValue = true;

            //Embedded Chart Position
            chart.TopRow = 2;
            chart.BottomRow = 30;
            chart.LeftColumn = 5;
            chart.RightColumn = 18;
            serieTwo.Name = "Temperature,deg.F";

            // Legend setting
            chart.Legend.Position = ExcelLegendPosition.Right;
            chart.Legend.IsVerticalLegend = false;
            //chart filter enabled for 2013
            if (this.rBtnXlsx.Checked)
            {
                chart.Series[0].IsFiltered = true;
                chart.Categories[0].IsFiltered = true;
                chart.Categories[1].IsFiltered = true;
            }


            //Saving the workbook to disk.
            if (this.rBtnXls.Checked == true)
            {
                workbook.Version = ExcelVersion.Excel97to2003;
                workbook.SaveAs("Sample.xls", Response, ExcelDownloadType.PromptDialog);
            }            
            else
            {
                workbook.Version = ExcelVersion.Excel2016;
                workbook.SaveAs("Sample.xlsx", Response, ExcelDownloadType.PromptDialog, ExcelHttpContentType.Excel2016);
            }
            //No exception will be thrown if there are unsaved workbooks.
            excelEngine.ThrowNotSavedOnDestroy = false;
            excelEngine.Dispose();
        }
        # endregion
    }

}