#region Copyright Syncfusion Inc. 2001-2019.
// Copyright Syncfusion Inc. 2001-2019. All rights reserved.
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
using Syncfusion.Pdf.Interactive;

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
			PdfDocument doc = null;
			if (this.radioButton1.Checked)
            {
                //Create a new document with PDF/A standard.
                doc = new PdfDocument(PdfConformanceLevel.Pdf_A1B);
            }
            else if (this.radioButton2.Checked)
            {
                doc = new PdfDocument(PdfConformanceLevel.Pdf_A2B);
            }
            else if (this.radioButton3.Checked)
            {
                doc = new PdfDocument(PdfConformanceLevel.Pdf_A3B);
                PdfAttachment attachment = new PdfAttachment(ResolveApplicationDataPath("PDF_A.rtf"));
                attachment.Relationship = PdfAttachmentRelationship.Alternative;
                attachment.ModificationDate = DateTime.Now;

                attachment.Description = "PDF_A";

                attachment.MimeType = "application/xml";

                doc.Attachments.Add(attachment);
            }
            else if (this.radioButton4.Checked)
            {
                doc = new PdfDocument(PdfConformanceLevel.Pdf_X1A2001);
            }

            //Add a page
            PdfPage page = doc.Pages.Add();

            //Create Pdf graphics for the page
            PdfGraphics g = page.Graphics;

            string jpgImage = ResolveApplicationDataPathImage("AdventureCycle.jpg");
           PdfImage image = new PdfBitmap(jpgImage);
           
            //Draw the image in the specified location and size.
               g.DrawImage(image, new RectangleF(150, 30, 200, 100));

            PdfFont font = new PdfTrueTypeFont(new Font("Arial", 14));

            PdfTextElement textElement = new PdfTextElement("Adventure Works Cycles, the fictitious company on which the AdventureWorks sample databases are based," +
                                " is a large, multinational manufacturing company. The company manufactures and sells metal and composite bicycles to North American, " +
                                "European and Asian commercial markets. While its base operation is located in Bothell, Washington with 290 employees, several regional" +
                                " sales teams are located throughout their market base.")
            {
                Font = font
            };
            PdfLayoutResult layoutResult = textElement.Draw(page, new RectangleF(0, 150, page.GetClientSize().Width, page.GetClientSize().Height));

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
            //Data folder path is resolved from requested page physical path App_Data.
            string dataPath = new System.IO.DirectoryInfo(Server.MapPath("~\\App_Data") + "\\PDF").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
        public string ResolveApplicationDataPathImage(string fileName)
        {
            //Data folder path is resolved from requested page physical path Content.
            string dataPath = new System.IO.DirectoryInfo(Server.MapPath("~\\Content") + "\\PDF").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
        # endregion
    }
}