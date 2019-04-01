#region Copyright Syncfusion Inc. 2001 - 2019
//
//  Copyright Syncfusion Inc. 2001 - 2019. All rights reserved.
//
//  Use of this code is subject to the terms of our license.
//  A copy of the current license can be obtained at any time by e-mailing
//  licensing@syncfusion.com. Any infringement will be prosecuted under
//  applicable laws. 
//
#endregion

using System;
using System.IO;
using System.Data;
using System.Drawing;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Syncfusion.DocIO;
using Syncfusion.DocIO.DLS;
using System.ComponentModel;
using Syncfusion.DocToPDFConverter;
using Syncfusion.Pdf;

namespace WebSampleBrowser.DocIO
{
    public partial class ImageInsertion : System.Web.UI.Page
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
        /// Creates word document
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            //Getting Image files path.
            string dataPath = ResolveApplicationDataPath();

            //Create a new document
            WordDocument document = new WordDocument();

            //A section instance is created for document.
            IWSection section = document.AddSection();

            //Adding a paragraph to the section
            IWParagraph paragraph = section.AddParagraph();

            //Writing text.
            paragraph.AppendText("This Document demonstrates Essential DocIO's support for inserting Vector and Scalar images inside a document.");

            //Adding a new paragraph
            paragraph = section.AddParagraph();
            paragraph.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Center;
            //Inserting .gif .
            WPicture picture = (WPicture)paragraph.AppendPicture(System.Drawing.Image.FromFile(dataPath + "yahoo.gif"));
            //Adding Image caption
            picture.AddCaption("Yahoo [.gif Image]", CaptionNumberingFormat.Roman, CaptionPosition.AboveImage);

            paragraph = section.AddParagraph();
            paragraph.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Center;
            //Inserting .bmp
            picture = (WPicture)paragraph.AppendPicture(System.Drawing.Image.FromFile(dataPath + "Reports.bmp"));
            //Adding Image caption
            picture.AddCaption("Reports [.bmp Image]", CaptionNumberingFormat.Roman, CaptionPosition.AboveImage);

            paragraph = section.AddParagraph();
            paragraph.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Center;
            //Inserting .png
            picture = (WPicture)paragraph.AppendPicture(System.Drawing.Image.FromFile(dataPath + "google.PNG"));
            //Adding Image caption
            picture.AddCaption("Google [.png Image]", CaptionNumberingFormat.Roman, CaptionPosition.AboveImage);

            paragraph = section.AddParagraph();
            paragraph.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Center;
            //Inserting .tif 
            picture = (WPicture)paragraph.AppendPicture(System.Drawing.Image.FromFile(dataPath + "Square.tif"));
            //Adding Image caption
            picture.AddCaption("Square [.tif Image]", CaptionNumberingFormat.Roman, CaptionPosition.AboveImage);

            //Adding a new paragraph.
            paragraph = section.AddParagraph();
            //Setting Alignment for the image.
            paragraph.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Center;
            //Inserting .wmf Image to the document.
            WPicture mImage = (WPicture)paragraph.AppendPicture(System.Drawing.Image.FromFile((dataPath + "Ess chart.emf")));
            //Scaling Image
            mImage.HeightScale = 50f;
            mImage.WidthScale = 50f;

            //Adding Image caption
            mImage.AddCaption("Chart Vector Image", CaptionNumberingFormat.Roman, CaptionPosition.AboveImage);

            if (rdButtonDoc.Checked)
            {
                //Save as .doc format
                document.Save("Sample.doc", FormatType.Doc, Response, HttpContentDisposition.Attachment);
            }
            //Save as .docx format
            else if (rdButtonDocx.Checked)
            {
                try
                {
                    document.Save("Sample.docx", FormatType.Docx, Response, HttpContentDisposition.Attachment);
                }
                catch (Win32Exception ex)
                {
                    Response.Write("Microsoft Word Viewer or Microsoft Word is not installed in this system");
                    Console.WriteLine(ex.ToString());
                }
            }
            //Save as WordML(.xml) format
            else if (rdButtonWordML.Checked)
            {
                try
                {
                    document.Save("Sample.xml", FormatType.WordML, Response, HttpContentDisposition.Attachment);
                }
                catch (Win32Exception ex)
                {
                    Response.Write("Microsoft Word Viewer or Microsoft Word is not installed in this system");
                    Console.WriteLine(ex.ToString());
                }
            }
            //Save as .pdf format
            else if (rdButtonPdf.Checked)
            {
                try
                {
                    DocToPDFConverter converter = new DocToPDFConverter();
                    PdfDocument pdfDoc = converter.ConvertToPDF(document);

                    pdfDoc.Save("Sample.pdf", Response, HttpReadType.Save);
                }
                catch (Win32Exception ex)
                {
                    Response.Write("PDF Viewer is not installed in this system");
                    Console.WriteLine(ex.ToString());
                }
            }
        }
        # endregion

        #region Helpher Methods
        /// <summary>
        /// Data folder path is resolved from requested page physical path
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        protected string ResolveApplicationDataPath()
        {
            string dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\Content\\DocIO\\").FullName;
            return string.Format("{0}", dataPath);
        }
        # endregion
    }
}