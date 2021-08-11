#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
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
using Syncfusion.Pdf;
using Syncfusion.Pdf.Graphics;
using Syncfusion.Pdf.Interactive;


namespace WebSampleBrowser.Pdf
{
    public partial class TIFFtoPDF : System.Web.UI.Page
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
        # region Fields
        PdfDocument doc;
        #endregion
        # region Events
        /// <summary>
        /// Creates PDF
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            //Create a PDF document.
            doc = new PdfDocument();

            //Add a section to the PDF document.
            PdfSection section = doc.Sections.Add();

            //Declare the PDF page.
            PdfPage page;

            //Declare PDF page graphics.
            PdfGraphics graphics;

            //Load Multiframe Tiff image.
            PdfBitmap tiffImage = new PdfBitmap(ResolveApplicationDataPath("image.tiff",true));

            //Get the frame count.
            int frameCount = tiffImage.FrameCount;

            //Access each frame draw into the page.
            for (int i = 0; i < frameCount; i++)
            {
                page = section.Pages.Add();

                section.PageSettings.Margins.All = 0;

                graphics = page.Graphics;

                tiffImage.ActiveFrame = i;

                graphics.DrawImage(tiffImage, 0, 0, page.GetClientSize().Width, page.GetClientSize().Height);

            }          

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
         protected string ResolveApplicationDataPath(string fileName, bool type)
        {
            string dataPath;
            if (type)
                //Data folder path is resolved from requested page physical path.
                dataPath = new System.IO.DirectoryInfo(Server.MapPath("~\\Content") + "\\PDF").FullName;
            else
                //Data folder path is resolved from requested page physical path.
                dataPath = new System.IO.DirectoryInfo(Server.MapPath("~\\App_Data") + "\\PDF").FullName;

            return string.Format("{0}\\{1}", dataPath, fileName);
        }



        # endregion
    }
}