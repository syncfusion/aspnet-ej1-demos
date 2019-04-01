#region Copyright Syncfusion Inc. 2001-2019.
// Copyright Syncfusion Inc. 2001-2019. All rights reserved.
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
using Syncfusion.DocIO.DLS;
using Syncfusion.Pdf;
using Syncfusion.DocToPDFConverter;
using System.IO;
using Syncfusion.OfficeChart;
using Syncfusion.OfficeChartToImageConverter;

namespace WebSampleBrowser.Pdf
{
    public partial class DocToPdf : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnDocToRTF_Click(object sender, EventArgs e)
        {
            if (this.FileUpload1.HasFile)
            {
                string ext = System.IO.Path.GetExtension(this.FileUpload1.PostedFile.FileName).ToLower();
                if (ext == ".doc" || ext == ".docx")
                {
                    //Convert the input word document to a PDF file
                    # region Convert Doc to PDF
                    Stream readFile = this.FileUpload1.PostedFile.InputStream;
                    try
                    {
                        WordDocument wordDoc = null;
                        if (ext == ".doc")
                            wordDoc = new WordDocument(readFile, Syncfusion.DocIO.FormatType.Doc);
                        else if (ext == ".docx")
                            wordDoc = new WordDocument(readFile, Syncfusion.DocIO.FormatType.Docx);
				        
						//Initialize chart to image converter for converting charts in word to pdf conversion
                        wordDoc.ChartToImageConverter = new ChartToImageConverter();
                        wordDoc.ChartToImageConverter.ScalingMode = Syncfusion.OfficeChart.ScalingMode.Normal;


                        DocToPDFConverter converter = new DocToPDFConverter();
                        //Convert word document into PDF document
                        PdfDocument pdfDoc = converter.ConvertToPDF(wordDoc);

                        //Save the pdf file            
                        if (this.CheckBox1.Checked)
                        {
                            pdfDoc.Save("DoctoPDF.pdf", Response, HttpReadType.Open);
                        }
                        else
                        {
                            pdfDoc.Save("DoctoPDF.pdf", Response, HttpReadType.Save);
                        }

                        readFile.Close();
                        this.label1.Text = "";
                    }
                    catch (Exception)
                    {
                        this.label1.Text = "The input document could not be processed, Could you please email the document to support@syncfusion.com for troubleshooting";
                    }
                    # endregion
                }
                else
                {
                    this.label1.Text = "Please choose doc or docx file to convert to PDF";
                }

            }
            else
            {
                this.label1.Text = "Browse a word document and then click the button to convert as a PDF document";
            }
        }
    }
}