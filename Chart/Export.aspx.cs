#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.XlsIO;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Syncfusion.JavaScript.DataVisualization;
using Syncfusion.JavaScript.DataVisualization.Models;
using Syncfusion.EJ.Export;
using Syncfusion.DocIO.DLS;
using System.Reflection;
using System.Web.Script.Serialization;
using System.Drawing.Imaging;
using System.IO;
using Syncfusion.Pdf;
using Syncfusion.Pdf.Graphics;
using Syncfusion.Pdf.Interactive;
using System.Drawing;
using System.Xml;

namespace WebSampleBrowser.Chart
{
    public partial class Export : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            //Setting Range for PrimaryYAxis
            this.Chart1.PrimaryYAxis.Range.Min = 0;
            this.Chart1.PrimaryYAxis.Range.Max = 20000;
            this.Chart1.PrimaryYAxis.Range.Interval = 2000;

            List<ExportChartData> data = new List<ExportChartData>();

            data.Add(new ExportChartData("John", 10000));
            data.Add(new ExportChartData("Jake", 12000));
            data.Add(new ExportChartData("Peter", 18000));
            data.Add(new ExportChartData("James", 11000));
            data.Add(new ExportChartData("Mary", 9700));

            //Binding DataSource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();

            this.Chart1.DataSource = data;
            this.Chart1.DataBind();
        }
        protected void ExportChart(object sender, Syncfusion.JavaScript.Web.ChartEventArgs e)
        {
            string Format = e.Arguments["Format"].ToString();
            string FileName = e.Arguments["FileName"].ToString();
            string DataURL = e.Arguments["Data"].ToString();
            string Orientation = e.Arguments["Orientation"].ToString();
            
            if (Format == "svg")       // for svg export
            {
                StringWriter oStringWriter = new StringWriter();
                oStringWriter.WriteLine(System.Uri.UnescapeDataString(DataURL));
                Response.ContentType = "text/plain";
                Response.AddHeader("Content-Disposition", String.Format("attachment;filename={0}", ("Chart.svg")));
                Response.Clear();
                using (StreamWriter writer = new StreamWriter(Response.OutputStream))
                {
                    writer.Write(oStringWriter.ToString());
                }
                Response.End();
            }

            else if (Format == "xlsx")   // to export as excel     
            {
                ExcelExport exp = new ExcelExport();
                exp.Export(this.Chart1.Model, (IEnumerable)Chart1.DataSource,  FileName + ".xlsx", ExcelVersion.Excel2010, null, null);
            }

            else
            {
               DataURL = DataURL.Remove(0, DataURL.IndexOf(',') + 1);
               MemoryStream stream = new MemoryStream(Convert.FromBase64String(DataURL));

                if (Format == "docx")     // to export as word document
                {
                    WordDocument document = new WordDocument();
                    IWSection section = document.AddSection();
                    IWParagraph paragraph = section.AddParagraph();
                    //Set orientation based on chart width
                    System.Drawing.Image img = System.Drawing.Image.FromStream(stream);
                    if (Orientation == "landscape" || section.PageSetup.ClientWidth < img.Width)
                        section.PageSetup.Orientation = PageOrientation.Landscape;
                    else
                        section.PageSetup.Orientation = PageOrientation.Portrait;
                    paragraph.AppendPicture(img);
                    img.Dispose();
                    document.Save(FileName + ".doc", Syncfusion.DocIO.FormatType.Doc, Response, Syncfusion.DocIO.HttpContentDisposition.Attachment);
                }
                else if (Format == "pdf")    // to export as PDF
                {
                    PdfDocument pdfDoc = new PdfDocument();
                    pdfDoc.Pages.Add();

                    //Set chart width as pdf page width
                    System.Drawing.Image img = System.Drawing.Image.FromStream(stream);
                    pdfDoc.Pages[0].Section.PageSettings.Width = img.Width;
                    img.Dispose();

                    if (Orientation == "landscape")
                        pdfDoc.Pages[0].Section.PageSettings.Orientation = PdfPageOrientation.Landscape;
                    else
                        pdfDoc.Pages[0].Section.PageSettings.Orientation = PdfPageOrientation.Portrait;
                    pdfDoc.Pages[0].Graphics.DrawImage(PdfImage.FromStream(stream), new PointF(10, 30));
                    pdfDoc.Save(FileName + ".pdf", Response, HttpReadType.Save);
                    pdfDoc.Close();
                }
                else                        // to export as image
                {
                    stream.WriteTo(Response.OutputStream);
                    Response.ContentType = "application/octet-stream";
                    Response.AddHeader("Content-Disposition", String.Format("attachment;filename={0}", FileName + "." + Format));
                    Response.Flush();
                    stream.Close();
                    stream.Dispose();
                }
            }
        }
    }
    [Serializable]
    public class ExportChartData
    {
        public ExportChartData(string xval, double yvalue1)
        {
            this.Xvalue = xval;
            this.YValue1 = yvalue1;
        }
        public string Xvalue
        {
            get;
            set;
        }
        public double YValue1
        {
            get;
            set;
        }


    }
}