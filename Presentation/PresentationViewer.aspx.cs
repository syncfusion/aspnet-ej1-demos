#region Copyright Syncfusion Inc. 2001-2021
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
using System.IO;
using Syncfusion.Presentation;
using Syncfusion.PresentationToPdfConverter;
using Syncfusion.Pdf;
using Syncfusion.OfficeChartToImageConverter;
using System.Drawing;

namespace WebSampleBrowser.PPTX
{
    public partial class PresentationViewer : System.Web.UI.Page
    {

        List<string> pptxFiles = new List<string>(2) { "NewCharts.pptx", "Syncfusion Presentation.pptx" };

        public string PathName
        {
            get
            {
                if (this.ViewState["pptToPdf"] == null)
                    return pptxFiles[0];

                return (string)this.ViewState["pptToPdf"];
            }
            set { this.ViewState["pptToPdf"] = value; }
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                slide2.BorderWidth = 0;
                slide4.BorderWidth = 0;
                string filename = pptxFiles[0];
                IPresentation presentation = Presentation.Open(ResolvePath(filename));
                presentation.ChartToImageConverter = new ChartToImageConverter();
                ConvertToImages(presentation, filename);
            }

        }
     
        protected void PdfExport_Click(object sender, ImageClickEventArgs e)
        {           
            string filename = this.PathName;
            Stream file = ResolvePath(filename);

            IPresentation presentation = Presentation.Open(file);
            presentation.ChartToImageConverter = new ChartToImageConverter();

            //To set each slide in a pdf page.
            PresentationToPdfConverterSettings settings = new PresentationToPdfConverterSettings();

            settings.ShowHiddenSlides = true;

            //Instance to create pdf document from presentation
            PdfDocument doc = PresentationToPdfConverter.Convert(presentation, settings);

            string path = Path.GetFileNameWithoutExtension(filename).Replace(" ", "_");

            //Saves the pdf document
            doc.Save(path+".pdf", Response, HttpReadType.Save);
        }
        protected void Print_Click(object sender, ImageClickEventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Print", "printing()", true);
        }
        protected void Slide2_Click(object sender, ImageClickEventArgs e)
        {
            slide2.BorderWidth = 3;
            slide2.BorderColor = Color.Red;
            slide4.BorderWidth = 0;
            string filename = pptxFiles[0];
            OpenPresentation(filename);
        }
        protected void Slide4_Click(object sender, ImageClickEventArgs e)
        {
            slide4.BorderWidth = 3;
            slide4.BorderColor = Color.Red;
            slide2.BorderWidth = 0;
            string filename = pptxFiles[1];
            OpenPresentation(filename);
        }
       
        private void OpenPresentation(string filename)
        {
            Stream file = ResolvePath(filename);
            IPresentation presentation = Presentation.Open(file);
            presentation.ChartToImageConverter = new ChartToImageConverter();
            ConvertToImages(presentation, filename);
            this.PathName = filename;
        }

        private void ConvertToImages(IPresentation presentation,string filename)
        {
            int i = 1;
            (this.sliderContent as Syncfusion.JavaScript.Web.Rotator).Items.Clear();
           
            List<string> urls = new List<string>(4);
            string name = null;
            string itemPath = "../Content/images/presentation/";
            foreach (ISlide slide in presentation.Slides)
            {
                //Converts slide to image
                System.Drawing.Image image = System.Drawing.Image.FromStream(slide.ConvertToImage(Syncfusion.Drawing.ImageFormat.Emf));
                System.Drawing.Image.GetThumbnailImageAbort myCallback =
                                    new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback);
                System.Drawing.Image newImage = image.GetThumbnailImage(690, 400, myCallback, System.IntPtr.Zero);
                name = Path.GetFileNameWithoutExtension(filename);
                string dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..").FullName + "\\Content\\images\\presentation\\";
                
                string fileName = Path.GetFullPath(dataPath) + name;
                Directory.CreateDirectory(fileName);
                urls.Add(itemPath + name + "/" + name + i+".jpg");
                fileName = fileName + "\\" + name + i++ + ".jpg";

                //Saves the image
                newImage.Save(fileName);
               
            }
            foreach (string url in urls)
            {
                    Syncfusion.JavaScript.Web.RotatorItem rotatorItem = new Syncfusion.JavaScript.Web.RotatorItem();
                    rotatorItem.Url = url;
                    rotatorItem.Caption = name + ".pptx";
                    (this.sliderContent as Syncfusion.JavaScript.Web.Rotator).Items.Add(rotatorItem);
            }
        }

        public bool ThumbnailCallback()
        {
            return false;
        }
        public Stream ResolvePath(string fileName)
        {
            string dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\App_Data\\Presentation").FullName;
            dataPath = string.Format("{0}\\{1}", dataPath, fileName);
            Stream file1 = new FileStream(dataPath, FileMode.Open, FileAccess.Read, FileShare.Read);
            return file1;
           
        }
    }
}
                                

      