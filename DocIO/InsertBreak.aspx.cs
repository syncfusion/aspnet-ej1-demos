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
    public partial class InsertBreak : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        # region Events
        /// <summary>
        /// Creates word document
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            // Get Image files Path. 
            string dataPath1 = ResolveApplicationimageDataPath();
            string dataPath = ResolveApplicationDataPath(" ");

            //Creating a new document
            WordDocument document = new WordDocument();
            //Adding a new section.
            IWSection section = document.AddSection();
            IWParagraph paragraph = section.AddParagraph();
            paragraph = section.AddParagraph();
            section.PageSetup.Margins.All = 20f;
            IWTextRange text = paragraph.AppendText("Adventure products");
            //Formatting Text
            text.CharacterFormat.FontName = "Bitstream Vera Sans";
            text.CharacterFormat.FontSize = 12f;
            text.CharacterFormat.Bold = true;
            section.AddParagraph();
            paragraph = section.AddParagraph();
            paragraph.ParagraphFormat.LineSpacing = 20f;
            paragraph.AppendText("Backoffice products allows you to create report of PDF, Doc and Excel format. This package includes Essential PDF,Essential DocIO and Essential XlsIO. Following are the backoffice product with some description on each of them: ");
            paragraph.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Justify;

            #region Line break
            paragraph.AppendBreak(BreakType.LineBreak);
            paragraph.AppendBreak(BreakType.LineBreak);
            #endregion

            section = document.AddSection();

            section.BreakCode = SectionBreakCode.NoBreak;
            section.PageSetup.Margins.All = 20f;
            //Adding three columns to section.
            section.AddColumn(100, 15);
            section.AddColumn(100, 15);
            section.AddColumn(100, 15);
            //Set the columns to be of equal width.
            section.MakeColumnsEqual();

            //Adding a new paragraph to the section.
            paragraph = section.AddParagraph();
            //Adding text.
            text = paragraph.AppendText("Mountain-200");
            //Formatting Text
            text.CharacterFormat.FontName = "Bitstream Vera Sans";
            text.CharacterFormat.FontSize = 12f;
            text.CharacterFormat.Bold = true;
            //Adding a new paragraph to the section.
            section.AddParagraph();
            paragraph = section.AddParagraph();
            //Inserting an Image.
            WPicture picture = paragraph.AppendPicture(new Bitmap(Path.Combine(dataPath1, "Mountain-200.jpg"))) as WPicture;
			picture.Width = 120f;
            picture.Height = 90f;
            //Adding a new paragraph to the section.
            section.AddParagraph();
            paragraph = section.AddParagraph();
            paragraph.ParagraphFormat.LineSpacing = 20f;
            //Adding text.
            paragraph.AppendText(@"Product No:BK-M68B-38" + "\n" + "Size: 38" + "\n" + "Weight: 25\n" + "Price: $2,294.99");
            paragraph.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Justify;

            // Set column break as true. It navigates the cursor position to the next Column.
            paragraph.ParagraphFormat.ColumnBreakAfter = true;

            paragraph = section.AddParagraph();
            text = paragraph.AppendText("Mountain-300");
            text.CharacterFormat.FontName = "Bitstream Vera Sans";
            text.CharacterFormat.FontSize = 12f;
            text.CharacterFormat.Bold = true;

            section.AddParagraph();
            paragraph = section.AddParagraph();
            picture = paragraph.AppendPicture(new Bitmap(Path.Combine(dataPath1, "Mountain-300.jpg"))) as WPicture;
			picture.Width = 120f;
            picture.Height = 90f;
            section.AddParagraph();
            paragraph = section.AddParagraph();
            paragraph.ParagraphFormat.LineSpacing = 20f;
            paragraph.AppendText(@"Product No:BK-M4-38" + "\n" + "Size: 35\n" + "Weight: 22" + "\n" + "Price: $1,079.99");
            paragraph.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Justify;

            paragraph.ParagraphFormat.ColumnBreakAfter = true;

            paragraph = section.AddParagraph();
            text = paragraph.AppendText("Road-150");
            text.CharacterFormat.FontName = "Bitstream Vera Sans";
            text.CharacterFormat.FontSize = 12f;
            text.CharacterFormat.Bold = true;

            section.AddParagraph();
            paragraph = section.AddParagraph();
            picture = paragraph.AppendPicture(new Bitmap(Path.Combine(dataPath1, "Road-550-W.jpg"))) as WPicture;
			picture.Width = 120f;
            picture.Height = 90f;
            section.AddParagraph();
            paragraph = section.AddParagraph();
            paragraph.ParagraphFormat.LineSpacing = 20f;
            paragraph.AppendText(@"Product No: BK-R93R-44" + "\n" + "Size: 44" + "\n" + "Weight: 14" + "\n" + "Price: $3,578.27");
            paragraph.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Justify;


            section = document.AddSection();
            section.BreakCode = SectionBreakCode.NoBreak;
            section.PageSetup.Margins.All = 20f;

            text = section.AddParagraph().AppendText("First Look\n");
            //Formatting Text
            text.CharacterFormat.FontName = "Bitstream Vera Sans";
            text.CharacterFormat.FontSize = 12f;
            text.CharacterFormat.Bold = true;

            paragraph = section.AddParagraph();
            paragraph.ParagraphFormat.LineSpacing = 20f;
            paragraph.AppendText("Adventure Works Cycles, the fictitious company, is a large, multinational manufacturing company. The company manufactures and sells metal and composite bicycles to North American, European and Asian commercial markets. While its base operation is located in Bothell, Washington with 290 employees, several regional sales teams are located throughout their market base.");
            paragraph.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Justify;
	    paragraph.ParagraphFormat.PageBreakAfter = true;


            paragraph = section.AddParagraph();
            text = paragraph.AppendText("Introduction\n");
            //Formatting Text
            text.CharacterFormat.FontName = "Bitstream Vera Sans";
            text.CharacterFormat.FontSize = 12f;
            text.CharacterFormat.Bold = true;
            paragraph = section.AddParagraph();
            paragraph.ParagraphFormat.LineSpacing = 20f;
            paragraph.AppendText("In 2000, Adventure Works Cycles bought a small manufacturing plant, Importadores Neptuno, located in Mexico. Importadores Neptuno manufactures several critical subcomponents for the Adventure Works Cycles product line. These subcomponents are shipped to the Bothell location for final product assembly. In 2001, Importadores Neptuno, became the sole manufacturer and distributor of the touring bicycle product group.");
            paragraph.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Justify;

            //Save as .doc format
            if (rdButtonDoc.Checked)
            {
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

        # region Helpher Methods
        /// <summary>
        /// Data folder path is resolved from requested page physical path
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        protected string ResolveApplicationDataPath(string fileName)
        {
            string dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\App_Data\\").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
        /// <summary>
        /// Data folder path is resolved from requested page physical path
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        protected string ResolveApplicationimageDataPath()
        {
            string dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\Content\\DocIO\\").FullName;
            return string.Format("{0}", dataPath);
        }
        # endregion
    }
}