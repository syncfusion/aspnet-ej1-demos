#region Copyright Syncfusion Inc. 2001 - 2020
//
//  Copyright Syncfusion Inc. 2001 - 2020. All rights reserved.
//
//  Use of this code is subject to the terms of our license.
//  A copy of the current license can be obtained at any time by e-mailing
//  licensing@syncfusion.com. Any infringement will be prosecuted under
//  applicable laws. 
//
#endregion

using System;
using System.IO;
using System.Drawing;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Syncfusion.DocIO;
using Syncfusion.DocIO.DLS;
using Syncfusion.DocToPDFConverter;
using Syncfusion.Pdf;

namespace WebSampleBrowser.DocIO
{
    public partial class HeaderandFooter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region Events

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Creating a new document.
            WordDocument doc = new WordDocument();

            // Add a new section to the document.
            IWSection section1 = doc.AddSection();

            //Add different header and footer for first and other pages
            if (CheckBox2.Checked && CheckBox3.Checked)
            {
                // Set the header/footer setup.
                section1.PageSetup.DifferentFirstPage = true;
                //Inserts Header Footer for first page
                InsertFirstPageHeader(doc, section1);
                //Inserts Header Footer for all pages
                InsertPageHeader(doc, section1);
            }
            //Add first page header and footer
            if (CheckBox2.Checked && !CheckBox3.Checked)
            {
                // Set the header/footer setup.
                section1.PageSetup.DifferentFirstPage = true;
                //Inserts Header Footer for first page
                InsertFirstPageHeader(doc, section1);
            }
            //Add header and footer for all the pages
            if (CheckBox3.Checked && !CheckBox2.Checked)
            {
                //Inserts Header Footer for all pages
                InsertPageHeader(doc, section1);
            }

            // Add text to the document body section.
            IWParagraph par;
            par = section1.AddParagraph();
            //Insert Text into the word Document.
            StreamReader reader = new StreamReader(ResolveApplicationDataPath_Data("WinFAQ.txt"), System.Text.Encoding.ASCII);
            string text = reader.ReadToEnd();
            par.AppendText(text);

            if (rdButtonDoc.Checked)
            {
                //Save as .doc format
                doc.Save("Sample.doc", FormatType.Doc, Response, HttpContentDisposition.Attachment);
            }
            //Save as .docx format
            else if (rdButtonDocx.Checked)
            {
                doc.Save("Sample.docx", FormatType.Docx, Response, HttpContentDisposition.Attachment);
            }
            //Save as WordML(.xml) format
            else if (rdButtonWordML.Checked)
            {
                doc.Save("Sample.xml", FormatType.WordML, Response, HttpContentDisposition.Attachment);
            }
            //Save as .pdf format
            else if (rdButtonPdf.Checked)
            {

                DocToPDFConverter converter = new DocToPDFConverter();
                PdfDocument pdfDoc = converter.ConvertToPDF(doc);

                pdfDoc.Save("Sample.pdf", Response, HttpReadType.Save);
            }
			
        }

        #endregion

        #region Helper Methods
        #region ResolveApplicationDataPath

        protected string ResolveApplicationDataPath(string fileName)
        {
            //Data folder path is resolved from requested page physical path.
            string dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\Content\\DocIO\\").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }

        protected string ResolveApplicationDataPath_Data(string fileName)
        {
            //Data folder path is resolved from requested page physical path.
            string dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\App_Data\\DocIO\\").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
        #endregion

        #region InsertFirstPageHeader


        private void InsertFirstPageHeader(WordDocument doc, IWSection section)
        {
            // Add a new paragraph for header to the document.
            IWParagraph headerPar = new WParagraph(doc);

            // Add a new table to the header.
            IWTable table = section.HeadersFooters.FirstPageHeader.AddTable();

            RowFormat format = new RowFormat();

            // Setting cleared table border style.
            format.Borders.BorderType = Syncfusion.DocIO.DLS.BorderStyle.Cleared;

            // Inserting table with a row and two columns.
            table.ResetCells(1, 2, format, 265);

            // Inserting logo image to the table first cell.
            headerPar = table[0, 0].AddParagraph() as WParagraph;
            headerPar.AppendPicture(System.Drawing.Image.FromFile(ResolveApplicationDataPath("Northwind_logo.png")));
            //Set Image size
            (headerPar.Items[0] as WPicture).Width = 232.5f;
            (headerPar.Items[0] as WPicture).Height = 54.75f;
            // Inserting text to the table second cell.
            headerPar = table[0, 1].AddParagraph() as WParagraph;
            IWTextRange txt = headerPar.AppendText("Company Headquarters,\n2501 Aerial Center Parkway,\nSuite 110, Morrisville, NC 27560,\nTEL 1-888-936-8638.");
            txt.CharacterFormat.FontSize = 12;
            txt.CharacterFormat.CharacterSpacing = 1.7f;
            headerPar.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Right;
            // Add a new paragraph to the header with address text.
            headerPar = new WParagraph(doc);
            headerPar.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Center;
            txt = headerPar.AppendText("\nFirst Page Header");
            txt.CharacterFormat.CharacterSpacing = 1.7f;
            section.HeadersFooters.FirstPageHeader.Paragraphs.Add(headerPar);

            // Add a footer paragraph text to the document.
            WParagraph footerPar = new WParagraph(doc);
            footerPar.ParagraphFormat.Tabs.AddTab(523f, TabJustification.Right, TabLeader.NoLeader);
            // Add text.
            footerPar.AppendText("Copyright Northwind Inc. 2001 - 2017");
            // Add page and Number of pages field to the document.
            footerPar.AppendText("\tFirst Page ");
            footerPar.AppendField("Page", FieldType.FieldPage);
            section.HeadersFooters.FirstPageFooter.Paragraphs.Add(footerPar);

            #region Page Number Settings
            section.PageSetup.RestartPageNumbering = true;
            section.PageSetup.PageStartingNumber = Convert.ToInt32(this.DropDownList2.Text);
            section.PageSetup.PageNumberStyle = (PageNumberStyle)Enum.Parse(typeof(PageNumberStyle), this.DropDownList1.SelectedItem.ToString(), true);
            #endregion
        }

        #endregion

        #region InsertPageHeader
        private void InsertPageHeader(WordDocument doc, IWSection section1)
        {

            // Add a new paragraph for header to the document.
            IWParagraph headerPar = new WParagraph(doc);

            // Add a new table to the header
            IWTable table = section1.HeadersFooters.Header.AddTable();

            RowFormat format = new RowFormat();

            // Setting cleared table border style.
            format.Borders.BorderType = Syncfusion.DocIO.DLS.BorderStyle.Single;

            // Inserting table with a row and two columns.
            table.ResetCells(1, 2, format, 265);

            // Inserting logo image to the table first cell.
            headerPar = table[0, 0].AddParagraph() as WParagraph;
            headerPar.AppendPicture(System.Drawing.Image.FromFile(ResolveApplicationDataPath("Northwind_logo.png")));
            //Set Image size.
            (headerPar.Items[0] as WPicture).Width = 232.5f;
            (headerPar.Items[0] as WPicture).Height = 54.75f;
            // Inserting text to the table second cell.
            headerPar = table[0, 1].AddParagraph() as WParagraph;
            IWTextRange txt = headerPar.AppendText("Company Headquarters,\n2501 Aerial Center Parkway,\nSuite 110, Morrisville, NC 27560,\nTEL 1-888-936-8638.");
            txt.CharacterFormat.FontSize = 12;
            txt.CharacterFormat.CharacterSpacing = 1.7f;
            headerPar.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Right;

            // Add a footer paragraph text to the document.
            WParagraph footerPar = new WParagraph(doc);
            footerPar.ParagraphFormat.Tabs.AddTab(523f, TabJustification.Right, TabLeader.NoLeader);
            // Add text.
            footerPar.AppendText("Copyright Northwind Inc. 2001 - 2017");
            // Add page and Number of pages field to the document.
            footerPar.AppendText("\tPage ");
            IWField ff = footerPar.AppendField("Page", FieldType.FieldPage);

            section1.HeadersFooters.Footer.Paragraphs.Add(footerPar);

            section1.HeadersFooters.Footer.Paragraphs.Add(footerPar);
            #region Page Number Settings
            section1.PageSetup.RestartPageNumbering = true;
            section1.PageSetup.PageStartingNumber = Convert.ToInt32(this.DropDownList2.Text);
            section1.PageSetup.PageNumberStyle = (PageNumberStyle)Enum.Parse(typeof(PageNumberStyle), this.DropDownList1.SelectedItem.ToString(), true);
            #endregion
        }

        #endregion

        #endregion 
    }
}