#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.DocIO.DLS;
using Syncfusion.DocToPDFConverter;
using Syncfusion.Drawing;
using Syncfusion.Pdf;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.DocIO
{
    public partial class WordDocumentViewer : System.Web.UI.Page
    {
        List<string> wordDocumentFiles = new List<string>(2) { "DocToImage.docx", "DoctoPDF.docx" };
        string wordToPdf = null;

        public string PathName
        {
            get
            {
                if (this.ViewState["wordToPdf"] == null)
                    return wordDocumentFiles[0];

                return (string)this.ViewState["wordToPdf"];
            }
            set { this.ViewState["wordToPdf"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                slide2.BorderWidth = 0;
                slide4.BorderWidth = 0;
                string filename = wordDocumentFiles[0];
                //Loads the input document
                WordDocument wordDocument = new WordDocument(ResolvePath(filename));
                ConvertToImages(wordDocument, filename);
            }
        }

        protected void PdfExport_Click(object sender, ImageClickEventArgs e)
        {
            string filename = this.PathName;
            string filePath = ResolvePath(filename);

            //Open the word document.
            WordDocument wordDoc = new WordDocument(filePath);

            DocToPDFConverter converter = new DocToPDFConverter();

            //Convert word document into PDF document
            PdfDocument pdfDoc = converter.ConvertToPDF(wordDoc);            
           
            string path = Path.GetFileNameWithoutExtension(filename).Replace(" ", "_");

            //Saves the pdf document
            pdfDoc.Save(path + ".pdf", Response, HttpReadType.Save);
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
            string filename = wordDocumentFiles[0];
            OpenWordDocument(filename);
        }
        protected void Slide4_Click(object sender, ImageClickEventArgs e)
        {
            slide4.BorderWidth = 3;
            slide4.BorderColor = Color.Red;
            slide2.BorderWidth = 0;
            string filename = wordDocumentFiles[1];
            OpenWordDocument(filename);
        }

        private void OpenWordDocument(string filename)
        {
            string filePath = ResolvePath(filename);
            WordDocument wordDocument = new WordDocument(filePath);

            ConvertToImages(wordDocument, filename);
            this.PathName = filename;
        }

        private void ConvertToImages(WordDocument wordDocument, string filename)
        {

            int i = 1;
            (this.sliderContent as Syncfusion.JavaScript.Web.Rotator).Items.Clear();

            List<string> urls = new List<string>(4);
            string name = null;
            string itemPath = "../Content/images/DocIO/";
            //Export the pages of the loaded document as bitmap images
            System.Drawing.Image[] images = wordDocument.RenderAsImages(Syncfusion.DocIO.DLS.ImageType.Metafile);
            
            foreach (System.Drawing.Image image in images)
            {
                //Resize the bitmap images. 
                Bitmap bitmap = null;
                Metafile metafile = image as Metafile;
                //Set image width and height.
                bitmap = new Bitmap(793, 1122);
                bitmap.SetResolution((float)150, (float)150);
                using (Graphics g = Graphics.FromImage(bitmap))
                {
                    g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.AntiAlias;
                    g.DrawImage(metafile, 0, 0, (float)793, (float)1122);
                    g.Dispose();
                }
                
                name = Path.GetFileNameWithoutExtension(filename);
                string dataPath = string.Format("{0}\\..\\..\\..\\Content\\images\\DocIO\\", Request.PhysicalPath.ToLower().Split(new string[] { "\\DocIO" }, StringSplitOptions.None)[0]);
                string fileName = Path.GetFullPath(dataPath) + name;
                Directory.CreateDirectory(fileName);
                urls.Add(itemPath + name + "/" + name + i + ".jpg");
                fileName = fileName + "\\" + name + i++ + ".jpg";

                //Saves the image
                bitmap.Save(fileName,System.Drawing.Imaging.ImageFormat.Jpeg);
                bitmap.Dispose();
            }
            //Add the images into the rotator. 
            foreach (string url in urls)
            {
                Syncfusion.JavaScript.Web.RotatorItem rotatorItem = new Syncfusion.JavaScript.Web.RotatorItem();
                rotatorItem.Url = url;
                rotatorItem.Caption = name + ".docx";
                (this.sliderContent as Syncfusion.JavaScript.Web.Rotator).Items.Add(rotatorItem);
            }
        }

        public bool ThumbnailCallback()
        {
            return false;
        }
        public string ResolvePath(string filename)
        {
            //Data folder path is resolved from requested page physical path.
            string dataPath =  new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\App_Data\\DocIO\\").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
    }
}