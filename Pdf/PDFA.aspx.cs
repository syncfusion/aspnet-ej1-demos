#region Copyright Syncfusion Inc. 2001-2018.
// Copyright Syncfusion Inc. 2001-2018. All rights reserved.
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
using System.IO;
using System.Text;

namespace WebSampleBrowser.Pdf
{
    public partial class PDFA : System.Web.UI.Page
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

        # region Events
        /// <summary>
        /// Creates PDF
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            //Create a new document with PDF/A standard.
            PdfDocument doc = new PdfDocument(PdfConformanceLevel.Pdf_A1B);

            //Add a page
            PdfPage page = doc.Pages.Add();

            //Create Pdf graphics for the page
            PdfGraphics g = page.Graphics;

            SizeF bounds = page.GetClientSize();

            //Read the RTF document
            StreamReader reader = new StreamReader(ResolveApplicationDataPath("PDF_A.rtf"), Encoding.ASCII);
            string text = reader.ReadToEnd();
            reader.Close();

            //Convert it as metafile.
            PdfMetafile metafile = (PdfMetafile)PdfImage.FromRtf(text, bounds.Width, PdfImageType.Metafile);
            PdfMetafileLayoutFormat format = new PdfMetafileLayoutFormat();

            //Allow the text to flow multiple pages without any breaks.
            format.SplitTextLines = true;

            //Draw the image.
            metafile.Draw(page, 0, 0, format);


            //Stream the output to the browser.	
            if (this.CheckBox1.Checked)
            {
                doc.Save("Sample.pdf", Response, HttpReadType.Open);
            }
            else
            {
                doc.Save("Sample.pdf", Response, HttpReadType.Save);
            }

            doc.Close(true);
        }
        # endregion

        # region ResolveApplicationDataPath
        /// <summary>
        /// Get the data file
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        public  string ResolveApplicationDataPath(string fileName)
        {
            //Data folder path is resolved from requested page physical path.
            string dataPath = new System.IO.DirectoryInfo(Server.MapPath("~\\App_Data") + "\\PDF").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
        # endregion
    }
}