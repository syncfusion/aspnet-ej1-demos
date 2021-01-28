#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
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
using System.IO;

namespace WebSampleBrowser.DocIO
{
    public partial class BarChart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        # region Events

        protected void Button1_Click(object sender, EventArgs e)
        {
            //A new document is created.
            WordDocument document = new WordDocument();
            //Add new section to the Word document
            IWSection section = document.AddSection();
            //Set page margins of the section
            section.PageSetup.Margins.All = 72;
            //Add new paragraph to the section
            IWParagraph paragraph = section.AddParagraph();
            //Apply heading style to the title paragraph
            paragraph.ApplyStyle(BuiltinStyle.Heading1);
            //Apply center alignment to the paragraph
            paragraph.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Center;
            //Append text to the paragraph
            paragraph.AppendText("Northwind Management Report").CharacterFormat.TextColor = Color.FromArgb(46, 116, 181);
            //Add new paragraph
            paragraph = section.AddParagraph();
            //Set before spacing to the paragraph
            paragraph.ParagraphFormat.BeforeSpacing = 20;
            //Load the excel template as stream
            Stream excelStream = File.OpenRead(ResolveApplicationDataPath("Excel_Template.xlsx"));

            //Create and Append chart to the paragraph with excel stream as parameter
            WChart barChart = paragraph.AppendChart(excelStream, 1, "B2:C6", 470, 300);
            //Set chart data
            barChart.ChartType = OfficeChartType.Bar_Clustered;
            barChart.ChartTitle = "Purchase Details";
            barChart.ChartTitleArea.FontName = "Calibri (Body)";
            barChart.ChartTitleArea.Size = 14;
            //Set name to chart series            
            barChart.Series[0].Name = "Sum of Purchases";
            barChart.Series[1].Name = "Sum of Future Expenses";
            //Set Chart Data table
            barChart.HasDataTable = true;
            barChart.DataTable.HasBorders = true;
            barChart.DataTable.HasHorzBorder = true;
            barChart.DataTable.HasVertBorder = true;
            barChart.DataTable.ShowSeriesKeys = true;
            barChart.HasLegend = false;
            //Setting background color
            barChart.ChartArea.Fill.ForeColor = Color.FromArgb(208, 206, 206);
            barChart.PlotArea.Fill.ForeColor = Color.FromArgb(208, 206, 206);
            //Setting line pattern to the chart area
            barChart.PrimaryCategoryAxis.Border.LinePattern = OfficeChartLinePattern.None;
            barChart.PrimaryValueAxis.Border.LinePattern = OfficeChartLinePattern.None;
            barChart.ChartArea.Border.LinePattern = OfficeChartLinePattern.None;
            barChart.PrimaryValueAxis.MajorGridLines.Border.LineColor = Color.FromArgb(175, 171, 171);
            //Set label for primary catagory axis
            barChart.PrimaryCategoryAxis.CategoryLabels = barChart.ChartData[2, 1, 6, 1];

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
        # region Helpher Methods
        /// <summary>
        /// Data folder path is resolved from requested page physical path
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        protected string ResolveApplicationDataPath(string fileName)
        {
            string dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\App_Data\\DocIO").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
        #endregion
    }
}