#region Copyright Syncfusion Inc. 2001-2022.
// Copyright Syncfusion Inc. 2001-2022. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.DocIO;
using Syncfusion.DocIO.DLS;
using Syncfusion.OfficeChart;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.DocIO
{
    public partial class PieChart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        # region Helpher Methods
        /// <summary>
        /// Helps to identify the path of the data folder
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        protected string ResolveApplicationDataPath(string fileName)
        {
            string dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\App_Data\\DocIO").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
        # endregion

        # region Events
        protected void Button1_Click(object sender, EventArgs e)
        {
            //A new document is created.
            WordDocument document = new WordDocument(ResolveApplicationDataPath("PieChart.docx"));
            //Get chart data from xml file
            DataSet ds = new DataSet();
            ds.ReadXml(ResolveApplicationDataPath("Products.xml"));
            //Merge the product table in the Word document
            document.MailMerge.ExecuteGroup(ds.Tables["Product"]);
            //Find the Placeholder of Pie chart to insert
            TextSelection selection = document.Find("<Pie Chart>", false, false);
            WParagraph paragraph = selection.GetAsOneRange().OwnerParagraph;
            paragraph.ChildEntities.Clear();
            //Create and Append chart to the paragraph
            WChart pieChart = paragraph.AppendChart(446, 270);
            //Set chart data
            pieChart.ChartType = OfficeChartType.Pie;
            pieChart.ChartTitle = "Best Selling Products";
            pieChart.ChartTitleArea.FontName = "Calibri (Body)";
            pieChart.ChartTitleArea.Size = 14;
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                pieChart.ChartData.SetValue(i + 2, 1, ds.Tables[0].Rows[i].ItemArray[1]);
                pieChart.ChartData.SetValue(i + 2, 2, ds.Tables[0].Rows[i].ItemArray[2]);
            }
            //Create a new chart series with the name “Sales”
            IOfficeChartSerie pieSeries = pieChart.Series.Add("Sales");
            pieSeries.Values = pieChart.ChartData[2, 2, 11, 2];
            //Setting data label
            pieSeries.DataPoints.DefaultDataPoint.DataLabels.IsPercentage  = true;
            pieSeries.DataPoints.DefaultDataPoint.DataLabels.Position = OfficeDataLabelPosition.Outside;
            //Setting background color
            pieChart.ChartArea.Fill.ForeColor = Color.FromArgb(242, 242, 242);
            pieChart.PlotArea.Fill.ForeColor = Color.FromArgb(242, 242, 242);
            pieChart.ChartArea.Border.LinePattern = OfficeChartLinePattern.None;
            pieChart.PrimaryCategoryAxis.CategoryLabels = pieChart.ChartData[2, 1, 11, 1];

            # region Save Document
            //Save as .docx format
            if (rdButtonDocx.Checked)
            {
                try
                {
                    document.Save("Sample.docx", FormatType.Docx, Response, HttpContentDisposition.Attachment);
                }
                catch (Win32Exception ex)
                {
                    Response.Write("Microsoft Word Viewer or Microsoft Word is not installed in this system");
                    Console.WriteLine(ex.ToString());
                }
            }
            //Save as WordML(.xml) format
            else if (rdButtonWordML.Checked)
            {
                try
                {
                    document.Save("Sample.xml", FormatType.WordML, Response, HttpContentDisposition.Attachment);
                }
                catch (Win32Exception ex)
                {
                    Response.Write("Microsoft Word Viewer or Microsoft Word is not installed in this system");
                    Console.WriteLine(ex.ToString());
                }
            }
            # endregion
        }
        #endregion
    }
}