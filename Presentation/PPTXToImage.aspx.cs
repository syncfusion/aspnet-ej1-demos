#region Copyright Syncfusion Inc. 2001 - 2020
// Copyright Syncfusion Inc. 2001 - 2020. All rights reserved.
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
using System.IO;
using System.Drawing;
using System.Web.UI.WebControls;
using Syncfusion.Presentation;
using Syncfusion.OfficeChartToImageConverter;
using System.Net;
using System.Drawing.Imaging;

namespace WebSampleBrowser.PPTX
{
    public partial class PPTXToImage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.label1.Text = " ";
        }

        protected void btnDocToImage_Click(object sender, EventArgs e)
        {
            if (this.FileUpload1.HasFile)
            {
                string ext = System.IO.Path.GetExtension(this.FileUpload1.PostedFile.FileName).ToLower();
                if (ext == ".pptx")
                {
                    //Convert the input powerpoint document to a PDF file

                    Stream readFile = this.FileUpload1.PostedFile.InputStream;
                    try
                    { //Opens the specified presentation
                        readFile.Position = 0;
                        IPresentation presentation = Presentation.Open(readFile);
                        presentation.ChartToImageConverter = new ChartToImageConverter();
                        presentation.ChartToImageConverter.ScalingMode = Syncfusion.OfficeChart.ScalingMode.Best;
                                               
                        //Gets all the slides in presentation and manipulates one by one
                        System.Drawing.Image img = presentation.Slides[0].ConvertToImage(Syncfusion.Drawing.ImageType.Metafile);
                        img.Save(Server.MapPath("Sample.png"), ImageFormat.Png);

                        ClientScript.RegisterClientScriptBlock(this.GetType(), "open", "window.open('Sample.png','_blank');", true);
                    }
                    catch (Exception)
                    {
                        this.label1.Text = "The input document could not be processed, Could you please email the document to support@syncfusion.com for troubleshooting";
                    }
                }
                else
                {
                    this.label1.Text = "Please choose pptx file to convert to image";
                }

            }
            else
            {
                this.label1.Text = "Browse a PowerPoint document and then click the button to convert as a image";
            }
        }
    }
}
   
               
             
      