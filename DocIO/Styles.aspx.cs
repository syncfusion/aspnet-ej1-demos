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
    public partial class Styles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        # region Events
        protected void Button1_Click(object sender, EventArgs e)
        {
            WordDocument document = new WordDocument();
            WSection section = document.AddSection() as WSection;
            //Set Margin of the section
            WParagraph para = section.AddParagraph() as WParagraph;

            section.AddColumn(100, 100);
            section.AddColumn(100, 100);
            section.MakeColumnsEqual();

            #region Built-in styles
            # region List Style
            //List
            //para = section.AddParagraph() as WParagraph;
            para.AppendText("This para is written with style List").CharacterFormat.UnderlineStyle = UnderlineStyle.Double;
            para = section.AddParagraph() as WParagraph;
            para.ApplyStyle(BuiltinStyle.List);
            para.AppendText("Google Chrome\n");
            para.AppendText("Mozilla Firefox\n");
            para.AppendText("Internet Explorer");

            //List5 style
            para = section.AddParagraph() as WParagraph;
            para.AppendText("\nThis para is written with style List5").CharacterFormat.UnderlineStyle = UnderlineStyle.Double;
            para = section.AddParagraph() as WParagraph;
            para.ApplyStyle(BuiltinStyle.List5);
            para.AppendText("Google Chrome\n");
            para.AppendText("Mozilla Firefox\n");
            para.AppendText("Internet Explorer");
            # endregion

            # region ListNumber Style
            //List Number style
            para = section.AddParagraph() as WParagraph;
            para.AppendText("\nThis para is written with style ListNumber").CharacterFormat.UnderlineStyle = UnderlineStyle.Double;
            para = section.AddParagraph() as WParagraph;
            para.ApplyStyle(BuiltinStyle.ListNumber);
            para.AppendText("Google Chrome\n");
            para.AppendText("Mozilla Firefox\n");
            para.AppendText("Internet Explorer");

            //List Number5 style
            para = section.AddParagraph() as WParagraph;
            para.AppendText("\nThis para is written with style ListNumber5").CharacterFormat.UnderlineStyle = UnderlineStyle.Double;
            para = section.AddParagraph() as WParagraph;
            para.ApplyStyle(BuiltinStyle.ListNumber5);
            para.AppendText("Google Chrome\n");
            para.AppendText("Mozilla Firefox\n");
            para.AppendText("Internet Explorer");
            # endregion

            # region TOA Heading Style
            //TOA Heading
            para = section.AddParagraph() as WParagraph;
            para.ParagraphFormat.AfterSpacing = 10;
            para.AppendText("\nThis para is written with style TOA Heading").CharacterFormat.UnderlineStyle = UnderlineStyle.Double;
            para = section.AddParagraph() as WParagraph;
            para.ApplyStyle(BuiltinStyle.ToaHeading);
            para.AppendText("Google Chrome\n");
            para.AppendText("Mozilla Firefox\n");
            para.AppendText("Internet Explorer");
            # endregion

            section.BreakCode = SectionBreakCode.NewColumn;

            # region ListBullet Style
            //ListBullet
            para = section.AddParagraph() as WParagraph;
            para.AppendText("\nThis para is written with style ListBullet").CharacterFormat.UnderlineStyle = UnderlineStyle.Double;
            para = section.AddParagraph() as WParagraph;
            para.ApplyStyle(BuiltinStyle.ListBullet);
            para.AppendText("Google Chrome\n");
            para.AppendText("Mozilla Firefox\n");
            para.AppendText("Internet Explorer");

            //ListBullet5
            para = section.AddParagraph() as WParagraph;
            para.AppendText("\nThis para is written with style ListBullet5").CharacterFormat.UnderlineStyle = UnderlineStyle.Double;
            para = section.AddParagraph() as WParagraph;
            para.ApplyStyle(BuiltinStyle.ListBullet5);
            para.AppendText("Google Chrome\n");
            para.AppendText("Mozilla Firefox\n");
            para.AppendText("Internet Explorer");
            # endregion

            # region List Continue Style
            //ListContinue
            para = section.AddParagraph() as WParagraph;
            para.AppendText("\nThis para is written with style ListContinue").CharacterFormat.UnderlineStyle = UnderlineStyle.Double;
            para = section.AddParagraph() as WParagraph;
            para.ApplyStyle(BuiltinStyle.ListContinue);
            para.AppendText("Google Chrome\n");
            para.AppendText("Mozilla Firefox\n");
            para.AppendText("Internet Explorer");

            //ListContinue5
            para = section.AddParagraph() as WParagraph;
            para.AppendText("\nThis para is written with style ListContinue5").CharacterFormat.UnderlineStyle = UnderlineStyle.Double;
            para = section.AddParagraph() as WParagraph;
            para.ApplyStyle(BuiltinStyle.ListContinue5);
            para.AppendText("Google Chrome\n");
            para.AppendText("Mozilla Firefox\n");
            para.AppendText("Internet Explorer");
            # endregion

            # region HTMLSample Style
            //HtmlSample
            para = section.AddParagraph() as WParagraph;
            para.AppendText("\nThis para is written with style HtmlSample").CharacterFormat.UnderlineStyle = UnderlineStyle.Double;
            para = section.AddParagraph() as WParagraph;
            para.ApplyStyle(BuiltinStyle.HtmlSample);
            para.AppendText("Google Chrome\n");
            para.AppendText("Mozilla Firefox\n");
            para.AppendText("Internet Explorer");
            # endregion

            section = document.AddSection() as WSection;
            section.BreakCode = SectionBreakCode.NoBreak;

            # region Document Map Style
            //Docuemnt Map
            para = section.AddParagraph() as WParagraph;
            para.AppendText("This para is written with style DocumentMap\n").CharacterFormat.UnderlineStyle = UnderlineStyle.Double;
            para = section.AddParagraph() as WParagraph;
            para.ApplyStyle(BuiltinStyle.DocumentMap);
            para.AppendText("Google Chrome\n").CharacterFormat.TextColor = System.Drawing.Color.White;
            para.AppendText("Mozilla Firefox\n").CharacterFormat.TextColor = System.Drawing.Color.White;
            para.AppendText("Internet Explorer").CharacterFormat.TextColor = System.Drawing.Color.White;
            #endregion

            # region Heading Styles
            //Heading Styles
            para = section.AddParagraph() as WParagraph;
            para.ApplyStyle(BuiltinStyle.Heading1);
            para.AppendText("Hello World. This para is written with style " + para.StyleName.ToString());

            para = section.AddParagraph() as WParagraph;
            para.ApplyStyle(BuiltinStyle.Heading2);
            para.AppendText("Hello World. This para is written with style " + para.StyleName.ToString());

            para = section.AddParagraph() as WParagraph;
            para.ApplyStyle(BuiltinStyle.Heading3);
            para.AppendText("Hello World. This para is written with style " + para.StyleName.ToString());

            para = section.AddParagraph() as WParagraph;
            para.ApplyStyle(BuiltinStyle.Heading4);
            para.AppendText("Hello World. This para is written with style " + para.StyleName.ToString());

            para = section.AddParagraph() as WParagraph;
            para.ApplyStyle(BuiltinStyle.Heading5);
            para.AppendText("Hello World. This para is written with style " + para.StyleName.ToString());

            para = section.AddParagraph() as WParagraph;
            para.ApplyStyle(BuiltinStyle.Heading6);
            para.AppendText("Hello World. This para is written with style " + para.StyleName.ToString());

            para = section.AddParagraph() as WParagraph;
            para.ApplyStyle(BuiltinStyle.Heading7);
            para.AppendText("Hello World. This para is written with style " + para.StyleName.ToString());

            para = section.AddParagraph() as WParagraph;
            para.ApplyStyle(BuiltinStyle.Heading8);
            para.AppendText("Hello World. This para is written with style " + para.StyleName.ToString());

            para = section.AddParagraph() as WParagraph;
            para.ApplyStyle(BuiltinStyle.Heading9);
            para.AppendText("Hello World. This para is written with style " + para.StyleName.ToString());
            # endregion

            # region MessageHeaderStyle
            //MessageHeader
            para = section.AddParagraph() as WParagraph;
            para = section.AddParagraph() as WParagraph;
            para.AppendText("This para is written with style MessageHeader\n").CharacterFormat.UnderlineStyle = UnderlineStyle.Double;
            para = section.AddParagraph() as WParagraph;
            para.ApplyStyle(BuiltinStyle.MessageHeader);
            para.AppendText("Google Chrome\n");
            para.AppendText("Mozilla Firefox\n");
            para.AppendText("Internet Explorer");
            # endregion
            #endregion

            # region Save Document
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
            if (rdButtonWordML.Checked)
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
                DocToPDFConverter converter = new DocToPDFConverter();
                PdfDocument pdfDoc = converter.ConvertToPDF(document);

                pdfDoc.Save("Sample.pdf", Response, HttpReadType.Save);
            }
            # endregion
        }
        # endregion
        protected void Button2_Click(object sender, EventArgs e)
        {
            #region Custom styles
            WordDocument document = new WordDocument();
            IWParagraphStyle style = null;
            // Adding a new section to the document.
            WSection section = document.AddSection() as WSection;
            //Set Margin of the section
            section.PageSetup.Margins.All = 72;
            IWParagraph par = document.LastSection.AddParagraph();
            WTextRange range = par.AppendText("Using CustomStyles") as WTextRange;
            range.CharacterFormat.TextBackgroundColor = System.Drawing.Color.Red;
            range.CharacterFormat.TextColor = System.Drawing.Color.White;
            range.CharacterFormat.FontSize = 18f;
            document.LastParagraph.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Center;
            // Create Paragraph styles
            style = document.AddParagraphStyle("MyStyle_Normal");
            style.CharacterFormat.FontName = "Bitstream Vera Serif";
            style.CharacterFormat.FontSize = 10f;
            style.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Justify;
            style.CharacterFormat.TextColor = System.Drawing.Color.FromArgb(0, 21, 84);

            style = document.AddParagraphStyle("MyStyle_Low");
            style.CharacterFormat.FontName = "Times New Roman";
            style.CharacterFormat.FontSize = 16f;
            style.CharacterFormat.Bold = true;

            style = document.AddParagraphStyle("MyStyle_Medium");
            style.CharacterFormat.FontName = "Monotype Corsiva";
            style.CharacterFormat.FontSize = 18f;
            style.CharacterFormat.Bold = true;
            style.CharacterFormat.TextColor = System.Drawing.Color.FromArgb(51, 66, 125);

            style = document.AddParagraphStyle("Mystyle_High");
            style.CharacterFormat.FontName = "Bitstream Vera Serif";
            style.CharacterFormat.FontSize = 20f;
            style.CharacterFormat.Bold = true;
            style.CharacterFormat.TextColor = System.Drawing.Color.FromArgb(242, 151, 50);

            IWParagraph paragraph = null;
            for (int i = 0; i < document.Styles.Count; i++)
            {
                //Skip to apply the document default styles and also paragraph style. 
                if (document.Styles[i].Name == "Normal" || document.Styles[i].Name == "Default Paragraph Font"
                   || document.Styles[i].StyleType != StyleType.ParagraphStyle)
                    continue;
                // Getting styles from Document.
                style = (IWParagraphStyle)document.Styles[i];
                // Adding a new paragraph
                section.AddParagraph();
                paragraph = section.AddParagraph();
                // Applying styles to the current paragraph.
                paragraph.ApplyStyle(style.Name);
                // Writing Text with the current style and formatting.
                paragraph.AppendText("Northwind Database with [" + style.Name + "] Style");
                // Adding a new paragraph
                section.AddParagraph();
                paragraph = section.AddParagraph();
                // Applying another style to the current paragraph.
                paragraph.ApplyStyle("MyStyle_Normal");
                // Writing text with current style.
                paragraph.AppendText("The Northwind sample database (Northwind.mdb) is included with all versions of Access. It provides data you can experiment with and database objects that demonstrate features you might want to implement in your own databases. Using Northwind, you can become familiar with how a relational database is structured and how the database objects work together to help you enter, store, manipulate, and print your data.");
            }
            #endregion Custom styles

            # region Save Document
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
            if (rdButtonWordML.Checked)
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
                DocToPDFConverter converter = new DocToPDFConverter();
                PdfDocument pdfDoc = converter.ConvertToPDF(document);

                pdfDoc.Save("Sample.pdf", Response, HttpReadType.Save);
            }
            # endregion
        }
    }
}