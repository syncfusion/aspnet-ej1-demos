#region Copyright Syncfusion Inc. 2001-2022.
// Copyright Syncfusion Inc. 2001-2022. All rights reserved.
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
using System.Drawing.Imaging;
using System.Drawing;
using Syncfusion.OfficeChart;
using Syncfusion.OfficeChartToImageConverter;

namespace WebSampleBrowser.DocIO
{
    public partial class WordToImage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDocToImage_Click(object sender, EventArgs e)
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
                        //Initializing chart to image convertor
                        wordDoc.ChartToImageConverter = new ChartToImageConverter();
                        wordDoc.ChartToImageConverter.ScalingMode = Syncfusion.OfficeChart.ScalingMode.Normal;

                        // Convert Word Document into image
                        System.Drawing.Image image = wordDoc.RenderAsImages(0, ImageType.Metafile);
                        //Save as Bitmap image
                        if (rdButtonBmp.Checked)
                        {
                            ExportAsImage(image, "WordToImage_1.bmp", ImageFormat.Bmp, Response, HttpReadType.Save);
                        }
                        //Save as PNG image
                        else if (rdButtonPng.Checked)
                        {
                            ExportAsImage(image, "WordToImage_1.png", ImageFormat.Png, Response, HttpReadType.Save);
                        }
                        //Save as JPEG image
                        else if (rdButtonJpeg.Checked)
                        {
                            ExportAsImage(image, "WordToImage_1.jpeg", ImageFormat.Jpeg, Response, HttpReadType.Save);
                        }
                        //Save as EMF image
                        else if (rdButtonEmf.Checked)
                        {
                            MemoryStream stream = (MemoryStream)wordDoc.RenderAsImages(0, ImageFormat.Emf);
                            stream.Position = 0;
                            stream.WriteTo(Response.OutputStream);
                            ExportAsImage(image, "WordToImage_1.emf", ImageFormat.Emf, Response, HttpReadType.Save);
                        }
                        readFile.Close();
                        this.label1.Text = "";

                    }
                    catch
                    {
                        this.label1.Text = "The input document could not be processed, Could you please email the document to support@syncfusion.com for troubleshooting";
                    }

                    # endregion

                }
                else
                {
                    this.label1.Text = "Please choose doc or docx file to convert to Image";
                }
            }

            else
            {
                this.label1.Text = "Browse a word document and then click the button to convert as a Image ";
            }
        }
        protected void ExportAsImage(System.Drawing.Image image, string fileName, ImageFormat imageFormat, HttpResponse response, HttpReadType type)
        {
            string disposition = "content-disposition";
            response.AddHeader(disposition, "attachment; filename=" + fileName);
            if (imageFormat != ImageFormat.Emf)
                image.Save(Response.OutputStream, imageFormat);
            Response.End();
        }
    }
}