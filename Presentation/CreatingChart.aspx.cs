#region Copyright Syncfusion Inc. 2001 - 2020
// Copyright Syncfusion Inc. 2001 - 2020. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.IO;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;
using Syncfusion.Presentation;
using Syncfusion.OfficeChart;
using System.Collections.Generic;

namespace WebSampleBrowser.PPTX
{
    public partial class CreatingChart : System.Web.UI.Page
    {
        # region Page Load
        /// <summary>
        /// Handles page load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        # endregion

        # region Events
        /// <summary>
        /// Creates Presentation
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            //Opens the existing presentation stream.
            using (IPresentation presentation = Presentation.Create())
            {
                ISlide slide = presentation.Slides.Add(SlideLayoutType.TitleOnly);
                IParagraph paragraph = ((IShape)slide.Shapes[0]).TextBody.Paragraphs.Add();
                //Apply center alignment to the paragraph
                paragraph.HorizontalAlignment = HorizontalAlignmentType.Center;
                //Add slide title
                ITextPart textPart = paragraph.AddTextPart("Northwind Management Report");
                textPart.Font.Color = ColorObject.FromArgb(46, 116, 181);
                //Get chart data from xml file
                DataSet dataSet = new DataSet();
                dataSet.ReadXml(ResolveApplicationDataPath("Products.xml"));
                //Add a new chart to the presentation slide
                IPresentationChart chart = slide.Charts.AddChart(44.64, 133.2, 870.48, 380.16);
                //Set chart type
                chart.ChartType = OfficeChartType.Pie;
                //Set chart title
                chart.ChartTitle = "Best Selling Products";
                //Set chart properties font name and size
                chart.ChartTitleArea.FontName = "Calibri (Body)";
                chart.ChartTitleArea.Size = 14;
                for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                {
                    chart.ChartData.SetValue(i + 2, 1, dataSet.Tables[0].Rows[i].ItemArray[1]);
                    chart.ChartData.SetValue(i + 2, 2, dataSet.Tables[0].Rows[i].ItemArray[2]);
                }
                //Create a new chart series with the name �Sales�
                AddSeriesForChart(chart);
                //Setting the font size of the legend.
                chart.Legend.TextArea.Size = 14;
                //Setting background color
                chart.ChartArea.Fill.ForeColor = System.Drawing.Color.FromArgb(242, 242, 242);
                chart.PlotArea.Fill.ForeColor = System.Drawing.Color.FromArgb(242, 242, 242);
                chart.ChartArea.Border.LinePattern = OfficeChartLinePattern.None;
                chart.PrimaryCategoryAxis.CategoryLabels = chart.ChartData[2, 1, 11, 1];
                presentation.Save("Chart.pptx", FormatType.Pptx, Response);
            }
        }
        #endregion

        #region Helper Methods
        /// <summary>
        /// Adds the series for the chart.
        /// </summary>
        /// <param name="chart">Represents the chart instance from the presentation.</param>
        private void AddSeriesForChart(IPresentationChart chart)
        {
            //Add a series for the chart.
            IOfficeChartSerie series = chart.Series.Add("Sales");
            series.Values = chart.ChartData[2, 2, 11, 2];
            //Setting data label
            series.DataPoints.DefaultDataPoint.DataLabels.IsValue = true;
            series.DataPoints.DefaultDataPoint.DataLabels.Position = OfficeDataLabelPosition.Outside;
            series.DataPoints.DefaultDataPoint.DataLabels.Size = 14;
        }

        protected string ResolveApplicationDataPath(string fileName)
        {
            string dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\App_Data\\Presentation").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }

        #endregion HelperMethods
    }

    #region Helper class
    /// <summary>
    /// Specifies the Product details
    /// </summary>
    public class ProductDetails
    {
        #region fields

        private int m_serialNo;
        private string m_productName;
        private decimal m_sum;

        #endregion

        #region properties

        /// <summary>
        /// Gets or sets the serial number of the product.
        /// </summary>
        public int SNO
        {
            get { return m_serialNo; }
            set { m_serialNo = value; }
        }

        /// <summary>
        /// Gets or sets the name of the product.
        /// </summary>
        public string ProductName
        {
            get { return m_productName; }
            set { m_productName = value; }
        }

        /// <summary>
        /// Gets or sets the sum value of the product.
        /// </summary>
        public decimal Sum
        {
            get { return m_sum; }
            set { m_sum = value; }
        }

        #endregion

        #region Constructor

        /// <summary>
        /// Constructor for the ProductDetails to create a new instance.
        /// </summary>
        /// <param name="serialNumber">Represents the serial number of the product.</param>
        /// <param name="productName">Represents the product name.</param>
        /// <param name="sum">Represents the sum value of the product.</param>
        public ProductDetails(int serialNumber, string productName, decimal sum)
        {
            SNO = serialNumber;
            ProductName = productName;
            Sum = Math.Round(sum, 3);
        }

        #endregion
    }
    #endregion
}