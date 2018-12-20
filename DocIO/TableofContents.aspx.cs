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
using Syncfusion.DocIO.DLS;
using Syncfusion.DocIO;
using System.Drawing;
using System.ComponentModel;
using Syncfusion.DocToPDFConverter;
using Syncfusion.Pdf;

namespace WebSampleBrowser.DocIO
{
    public partial class TableofContents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack == false)
            {
                this.DropDownList1.SelectedIndex = 0;
                this.DropDownList2.SelectedIndex = 2;
            }
        }
        #region Button Click
        protected void Button1_Click(object sender, EventArgs e)
        {
            WordDocument doc = new WordDocument();
            doc.EnsureMinimal();

            WParagraph para = doc.LastParagraph;
            para.AppendText("Essential DocIO - Table of Contents");
            para.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Center;
            para.ApplyStyle(BuiltinStyle.Heading4);

            para = doc.LastSection.AddParagraph() as WParagraph;
            para.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Center;
            para.ApplyStyle(BuiltinStyle.Heading4);

            if (!this.CheckBox7.Checked)
                para.AppendText("Select TOC and press F9 to update the Table of Contents").CharacterFormat.HighlightColor = Color.Yellow;

            para = doc.LastSection.AddParagraph() as WParagraph;
            string title = this.TextBox1.Text + "\n";
            para.AppendText(title);
            para.ApplyStyle(BuiltinStyle.Heading4);

            //Insert TOC
            TableOfContent toc = para.AppendTOC(1, 3);

            para.ApplyStyle(BuiltinStyle.Heading4);
            //Apply built-in paragraph formatting
            WSection section = doc.LastSection;
            if (this.RadioButton1.Checked)
            {
                #region Default Styles
                WParagraph newPara = section.AddParagraph() as WParagraph;
                newPara = section.AddParagraph() as WParagraph;
                newPara.AppendBreak(BreakType.PageBreak);
                WTextRange text = newPara.AppendText("Document with Default styles") as WTextRange;
                newPara.ApplyStyle(BuiltinStyle.Heading1);
                newPara = section.AddParagraph() as WParagraph;
                newPara.AppendText("This is the heading1 of built in style. This sample demonstrates the TOC insertion in a word document. Note that DocIO can only insert TOC field in a word document. It can not refresh or create TOC field. MS Word refreshes the TOC field after insertion. Please update the field or press F9 key to refresh the TOC.");

                section.AddParagraph();
                newPara = section.AddParagraph() as WParagraph;
                text = newPara.AppendText("Section1") as WTextRange;
                newPara.ApplyStyle(BuiltinStyle.Heading2);
                newPara = section.AddParagraph() as WParagraph;
                newPara.AppendText("This is the heading2 of built in style. A document can contain any number of sections. Sections are used to apply same formatting for a group of paragraphs. You can insert sections by inserting section breaks.");

                section.AddParagraph();
                newPara = section.AddParagraph() as WParagraph;
                text = newPara.AppendText("Paragraph1") as WTextRange;
                newPara.ApplyStyle(BuiltinStyle.Heading3);
                newPara = section.AddParagraph() as WParagraph;
                newPara.AppendText("This is the heading3 of built in style. Each section contains any number of paragraphs. A paragraph is a set of statements that gives a meaning for the text.");

                section.AddParagraph();
                newPara = section.AddParagraph() as WParagraph;
                text = newPara.AppendText("Paragraph2") as WTextRange;
                newPara.ApplyStyle(BuiltinStyle.Heading3);
                newPara = section.AddParagraph() as WParagraph;
                newPara.AppendText("This is the heading3 of built in style. This demonstrates the paragraphs at the same level and style as that of the previous one. A paragraph can have any number formatting. This can be attained by formatting each text range in the paragraph.");

                section.AddParagraph();
                section = doc.AddSection() as WSection;
                section.BreakCode = SectionBreakCode.NewPage;
                newPara = section.AddParagraph() as WParagraph;
                text = newPara.AppendText("Section2") as WTextRange;
                newPara.ApplyStyle(BuiltinStyle.Heading2);
                newPara = section.AddParagraph() as WParagraph;
                newPara.AppendText("This is the heading2 of built in style. A document can contain any number of sections. Sections are used to apply same formatting for a group of paragraphs. You can insert sections by inserting section breaks.");

                section.AddParagraph();
                newPara = section.AddParagraph() as WParagraph;
                text = newPara.AppendText("Paragraph1") as WTextRange;
                newPara.ApplyStyle(BuiltinStyle.Heading3);
                newPara = section.AddParagraph() as WParagraph;
                newPara.AppendText("This is the heading3 of built in style. Each section contains any number of paragraphs. A paragraph is a set of statements that gives a meaning for the text.");

                section.AddParagraph();
                newPara = section.AddParagraph() as WParagraph;
                text = newPara.AppendText("Paragraph2") as WTextRange;
                newPara.ApplyStyle(BuiltinStyle.Heading3);
                newPara = section.AddParagraph() as WParagraph;
                newPara.AppendText("This is the heading3 of built in style. This demonstrates the paragraphs at the same level and style as that of the previous one. A paragraph can have any number formatting. This can be attained by formatting each text range in the paragraph.");
                #endregion
            }
            else
            {
                #region Custom styles
                //Custom styles.
                WParagraphStyle pStyle1 = (WParagraphStyle)doc.AddParagraphStyle("MyStyle1");
                WParagraphStyle pStyle2 = (WParagraphStyle)doc.AddParagraphStyle("MyStyle2");
                WParagraphStyle pStyle3 = (WParagraphStyle)doc.AddParagraphStyle("MyStyle3");

                //Set the Heading Styles to false in order to define custom levels to TOC.
                toc.UseHeadingStyles = false;

                //Set the TOC level style which determines; based on which the TOC should be created.
                toc.SetTOCLevelStyle(1, "MyStyle1");
                toc.SetTOCLevelStyle(2, "MyStyle2");
                toc.SetTOCLevelStyle(3, "MyStyle3");
                section = doc.AddSection() as WSection;

                pStyle1.CharacterFormat.FontName = "Cambria";
                pStyle1.CharacterFormat.FontSize = 30f;

                para = section.AddParagraph() as WParagraph;

                WTextRange text = para.AppendText("Document with Custom Styles") as WTextRange;
                para.ApplyStyle("MyStyle1");
                para = doc.LastSection.AddParagraph() as WParagraph;
                para.AppendText("This is the heading1 of built in style. This sample demonstrates the TOC insertion in a word document. Note that DocIO can only insert TOC field in a word document. It can not refresh or create TOC field. MS Word refreshes the TOC field after insertion. Please update the field or press F9 key to refresh the TOC.");

                pStyle2.CharacterFormat.FontName = "Cambria";
                pStyle2.CharacterFormat.FontSize = 20f;

                doc.LastSection.AddParagraph();

                para = doc.LastSection.AddParagraph() as WParagraph;
                text = para.AppendText("Section1") as WTextRange;
                para.ApplyStyle("MyStyle2");
                para = doc.LastSection.AddParagraph() as WParagraph;
                para.AppendText("This is the heading2 of built in style. A document can contain any number of sections. Sections are used to apply same formatting for a group of paragraphs. You can insert sections by inserting section breaks.");

                pStyle3.CharacterFormat.FontName = "Cambria";
                pStyle3.CharacterFormat.FontSize = 14f;

                doc.LastSection.AddParagraph();

                para = doc.LastSection.AddParagraph() as WParagraph;
                text = para.AppendText("Section2") as WTextRange;
                para.ApplyStyle("MyStyle3");
                para = doc.LastSection.AddParagraph() as WParagraph;
                para.AppendText("This is the heading2 of built in style. A document can contain any number of sections. Sections are used to apply same formatting for a group of paragraphs. You can insert sections by inserting section breaks.");
                #endregion
            }
            if (Convert.ToInt32(this.DropDownList2.Text) < Convert.ToInt32(this.DropDownList1.Text))
            {
                Response.Write("Not a valid heading level range. UpperHeadingLevel must be greater than LowerHeadingLevel");
            }
            else
            {
                toc.IncludePageNumbers = this.CheckBox2.Checked;
                toc.RightAlignPageNumbers = this.CheckBox3.Checked;
                toc.UseHyperlinks = this.CheckBox4.Checked;
                toc.LowerHeadingLevel = Convert.ToInt32(this.DropDownList1.Text);
                toc.UpperHeadingLevel = Convert.ToInt32(this.DropDownList2.Text);

                //Used to set levels for a word or paragraph through OutLine Levels       
                //Right click text. Select Paragraph option. Set OutlineLevel. Update TOC toc see the text added in TOC.
                toc.UseOutlineLevels = this.CheckBox5.Checked;

                //Used to set levels for a word or paragraph through Table Entry Fields
                //Select the text that should be marked as Table of contents.
                //Press ALT+SHIFT+O. A dialog box will appear with options to enter the text, select the table identifier and level.
                //Choose the table identifier and level for the test and click �Mark�. Update TOC toc see the text added in TOC.
                //Sets the Table Identifier if necessary.
                //toc.TableID = "B";              
                toc.UseTableEntryFields = this.CheckBox6.Checked;
                //Updates the table of contents.
                if (this.CheckBox7.Checked)
                    doc.UpdateTableOfContents();

                if (rdButtonDoc.Checked)
                {
                    //Save as .doc format
                    doc.Save("Sample.doc", FormatType.Doc, Response, HttpContentDisposition.Attachment);
                }
                //Save as .docx format
                else if (rdButtonDocx.Checked)
                {
                    try
                    {
                        doc.Save("Sample.docx", FormatType.Docx, Response, HttpContentDisposition.Attachment);
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
                        doc.Save("Sample.xml", FormatType.WordML, Response, HttpContentDisposition.Attachment);
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
                        PdfDocument pdfDoc = converter.ConvertToPDF(doc);

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
        #endregion
        /// <summary>
        /// Disable the checkbox
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rdButtonCustom_CheckedChanged(object sender, EventArgs e)
        {
            if ((sender as RadioButton).Checked)
            {
                this.CheckBox5.Enabled = false;
            }
        }
        /// <summary>
        /// Disable the checkbox
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rdButtonDefault_CheckedChanged(object sender, EventArgs e)
        {
            if ((sender as RadioButton).Checked)
            {
                this.CheckBox5.Enabled = true;
            }
        }
    }
}