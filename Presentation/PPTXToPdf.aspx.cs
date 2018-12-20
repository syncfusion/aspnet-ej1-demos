#region Copyright Syncfusion Inc. 2001 - 2018
// Copyright Syncfusion Inc. 2001 - 2018. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using Syncfusion.Presentation;
using Syncfusion.PresentationToPdfConverter;
using Syncfusion.Pdf;
using Syncfusion.OfficeChartToImageConverter;

namespace WebSampleBrowser.PPTX
{
    public partial class PPTXToPdf : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.label1.Text = " ";
        }

        protected void btnDocToPdf_Click(object sender, EventArgs e)
        {

            if (this.FileUpload1.HasFile)
            {
                string fileName = Path.GetFileNameWithoutExtension(this.FileUpload1.PostedFile.FileName);
                string ext = Path.GetExtension(this.FileUpload1.PostedFile.FileName).ToLower();
                if (ext == ".pptx")
                {
                    //Convert the input powerpoint document to a PDF file
                    # region Convert PPTX to PDF
                    Stream readFile = this.FileUpload1.PostedFile.InputStream;
                    try
                    {
                        //Opens the specified presentation
                        IPresentation presentation = Presentation.Open(readFile);
                        presentation.ChartToImageConverter = new ChartToImageConverter();
                        presentation.ChartToImageConverter.ScalingMode = Syncfusion.OfficeChart.ScalingMode.Best;

                        //To set each slide in a pdf page.
                        PresentationToPdfConverterSettings settings = new PresentationToPdfConverterSettings();

                        settings.ShowHiddenSlides = true;

                        //Instance to create pdf document from presentation
                      //  presentation.ChartToImageConverter = new ChartToImageConverter();
                        PdfDocument doc = PresentationToPdfConverter.Convert(presentation, settings);

                        //Saves the pdf document
                        if (this.CheckBox1.Checked)
                        {
                            doc.Save(fileName + ".pdf", Response, HttpReadType.Open);
                        }
                        else
                        {
                            doc.Save(fileName + ".pdf", Response, HttpReadType.Save);
                        }
                        readFile.Close();
                    }
                    catch (Exception)
                    {
                        this.label1.Text = "The input document could not be processed, Could you please email the document to support@syncfusion.com for troubleshooting";
                    }
                    # endregion
                }
                else
                {
                    this.label1.Text = "Please choose pptx file to convert to PDF";
                }

            }
            else
            {
                this.label1.Text = "Browse a powerpoint document and then click the button to convert as a PDF document";
            }
        }
      
    }
}