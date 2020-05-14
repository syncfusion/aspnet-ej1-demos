#region Copyright Syncfusion Inc. 2001-2020.
// Copyright Syncfusion Inc. 2001-2020. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;
using System.Drawing.Imaging;
using Syncfusion.Pdf;
using Syncfusion.Pdf.Graphics;

namespace WebSampleBrowser.Pdf
{
    public partial class InsertingImages : System.Web.UI.Page
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

        #region Events
        /// <summary>
        /// Creates PDF document
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            string jpgImage = ResolveApplicationDataPath("Autumn Leaves.jpg");
            string tifImage = ResolveApplicationDataPath("256.tif");
            string bmpImage = ResolveApplicationDataPath("mask2.bmp");
            string pngImage = ResolveApplicationDataPath("design.png");
            string emfImage = ResolveApplicationDataPath("metachart.emf");
            string multiframeImage = ResolveApplicationDataPath("Image.tiff");
            string gifImage = ResolveApplicationDataPath("Ani.gif");

            PdfDocument doc = new PdfDocument();
            doc.ViewerPreferences.PageMode = PdfPageMode.FullScreen;
            PdfTrueTypeFont font = new PdfTrueTypeFont(new Font("Tahoma", 22f, FontStyle.Bold), false);
            PdfSolidBrush brush = new PdfSolidBrush(Color.DarkBlue);

            PdfSection section = doc.Sections.Add();
            PdfPage page = section.Pages.Add();
            PdfGraphics g = page.Graphics;

            //png image
            PdfImage image = new PdfBitmap(pngImage);
            g.DrawImage(image, 0, 0, image.Width, image.Height);
            page.Graphics.DrawString("Png Image", font, brush, new PointF(10, 0));

            page = section.Pages.Add();
            g = page.Graphics;

            //Bitmap with Tiff image mask
            image = new PdfBitmap(tifImage);
            (image as PdfBitmap).Mask = new PdfImageMask(new PdfBitmap(bmpImage));
            page.Graphics.DrawString("Image mask", font, brush, new PointF(10, 0));
            g.DrawImage(image, 80, 40);

            //Metafile
            PdfMetafile metafile;

            page = section.Pages.Add();
            g = page.Graphics;
            metafile = new PdfMetafile(emfImage);
            page.Graphics.DrawString("Metafile", font, brush, new PointF(10, 0));
            g.DrawImage(metafile, new PointF(0, 50));

            //Image pagination -jpg
            image = new PdfBitmap(jpgImage);

            PdfLayoutFormat format = new PdfLayoutFormat();
            format.Layout = PdfLayoutType.Paginate;

            PointF location = new PointF(0, 400);
            SizeF size = new SizeF(400, -1);
            RectangleF rect = new RectangleF(location, size);
            page.Graphics.DrawString("Image Pagination", font, brush, new PointF(10, 360));
            image.Draw(page, rect, format);

            //Multiframe Tiff image
            PdfBitmap tiffImage = new PdfBitmap(multiframeImage);

            int frameCount = tiffImage.FrameCount;

            for (int i = 0; i < frameCount; i++)
            {
                page = section.Pages.Add();
                section.PageSettings.Margins.All = 0;
                g = page.Graphics;
                tiffImage.ActiveFrame = i;
                g.DrawImage(tiffImage, 0, 0, page.GetClientSize().Width, page.GetClientSize().Height);
            }

            page = section.Pages.Add();
            g = page.Graphics;
            image = new PdfBitmap(gifImage);
            g.DrawImage(image, 0, 0, page.Graphics.ClientSize.Width, image.Height);
            page.Graphics.DrawString("Gif Image", font, brush, new PointF(10, 0));

            section.Pages[section.Pages.Count - 3].Graphics.DrawString("Multiframe Tiff Image", font, brush, new PointF(10, 10));
            section.PageSettings.Transition.PageDuration = 1;
            section.PageSettings.Transition.Duration = 1;
            section.PageSettings.Transition.Style = PdfTransitionStyle.Fly;

            //Stream the output to the browser.	
            if (this.CheckBox1.Checked)
            {
                doc.Save("Sample.pdf", Response, HttpReadType.Open);
            }
            else
            {
                doc.Save("Sample.pdf", Response, HttpReadType.Save);
            }
        }
        # endregion

        # region Helpher Methods
        /// <summary>
        /// Data folder path is resolved from requested page physical path
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        protected string ResolveApplicationDataPath(string fileName)
        {
            string dataPath = new System.IO.DirectoryInfo(Server.MapPath("~\\Content") + "\\PDF").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
        # endregion
    }
}