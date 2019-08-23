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
using Syncfusion.DocIO.DLS;
using System.ComponentModel;
using Syncfusion.DocIO;
using Syncfusion.DocToPDFConverter;
using Syncfusion.Pdf;


namespace WebSampleBrowser.DocIO
{
    public partial class Bookmarks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        /// <summary>
        /// Creates word document
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            // Creating a new document.
            WordDocument document = new WordDocument();

            // Adding a section to the document.
            IWSection section = document.AddSection();

            // Adding a new paragraph to the section.
            IWParagraph paragraph = section.AddParagraph();

            // Writing text
            paragraph.AppendText("This document demonstrates Essential DocIO's Bookmark functionality.").CharacterFormat.FontSize = 14f;

            // Adding paragraph to the section.
            section.AddParagraph();
            paragraph = section.AddParagraph();
            paragraph.AppendText("1. Inserting Bookmark Text").CharacterFormat.FontSize = 12f;

            // Adding paragraph to the section.
            section.AddParagraph();
            paragraph = section.AddParagraph();

            // BookmarkStart.
            paragraph.AppendBookmarkStart("Bookmark");
            // Write bookmark
            paragraph.AppendText("Bookmark Text");
            // BookmarkEnd.
            paragraph.AppendBookmarkEnd("Bookmark");

            // Adding paragraph to the section.
            section.AddParagraph();
            paragraph = section.AddParagraph();
            // Indicating hidden bookmark text start.
            paragraph.AppendBookmarkStart("_HiddenText");
            // Writing bookmark text
            paragraph.AppendText("2. Hidden Bookmark Text").CharacterFormat.Font = new System.Drawing.Font("Comic Sans MS", 10);
            // Indicating hidden bookmark text end.
            paragraph.AppendBookmarkEnd("_HiddenText");

            section.AddParagraph();
            paragraph = section.AddParagraph();
            paragraph.AppendText("3. Nested Bookmarks").CharacterFormat.FontSize = 12f;

            // Writing nested bookmarks
            section.AddParagraph();
            paragraph = section.AddParagraph();
            paragraph.AppendBookmarkStart("Main");
            paragraph.AppendText(" Main data ");
            paragraph.AppendBookmarkStart("Nested");
            paragraph.AppendText(" Nested data ");
            paragraph.AppendBookmarkStart("NestedNested");
            paragraph.AppendText(" Nested Nested ");
            paragraph.AppendBookmarkEnd("NestedNested");
            paragraph.AppendText(" data Nested ");
            paragraph.AppendBookmarkEnd("Nested");
            paragraph.AppendText(" Data Main ");
            paragraph.AppendBookmarkEnd("Main");


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
            //Save as .xml(WordML) format
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
    }
}