#region Copyright Syncfusion Inc. 2001 - 2021
//
//  Copyright Syncfusion Inc. 2001 - 2021. All rights reserved.
//
//  Use of this code is subject to the terms of our license.
//  A copy of the current license can be obtained at any time by e-mailing
//  licensing@syncfusion.com. Any infringement will be prosecuted under
//  applicable laws. 
//
#endregion

using System;
using System.IO;
using System.Text.RegularExpressions;
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
    public partial class ReplaceWithFormating : System.Web.UI.Page
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
            if (RadioButton1.Checked)
            {
                // Get Template files path.
                string dataPath = ResolveApplicationDataPath(String.Empty);

                // Creating new documents.
                WordDocument docSource1 = new WordDocument();
                WordDocument docSource2 = new WordDocument();
                WordDocument docMaster = new WordDocument();

                // Load Templates.
                docSource1.Open((Path.Combine(dataPath, "TemplateSource1.doc")), FormatType.Doc);
                docSource2.Open((Path.Combine(dataPath, "TemplateSource2.doc")), FormatType.Doc);
                docMaster.Open((Path.Combine(dataPath, "TemplateMaster.doc")), FormatType.Doc);

                // Search for a string and store in TextRangesHolder
                //The TextRangesHolder copies a text segment with formatting.
                TextSelection rangesHolder1 = docSource1.Find("PlaceHolder text is replaced with this formatted animated text", false, false);

                // Search for a string and store in TextRangesHolder
                TextSelection rangesHolder2 = docSource2.Find(new Regex("This is the second Sentence"));

                // Replacing the placeholder inside Master Template with matches found while
                //search the two template documents. In other words, two formatted text segments are 
                //copied from the two template documents and then pasted inside the Master Template 
                //with formatting.
                docMaster.Replace(new Regex("PlaceHolder1"), rangesHolder1);
                docMaster.Replace(new Regex("PlaceHolder2"), rangesHolder2);

                if (rdButtonDoc.Checked)
                {
                    //Save as .doc format
                    docMaster.Save("Sample.doc", FormatType.Doc, Response, HttpContentDisposition.Attachment);
                }
                //Save as .docx format
                else if (rdButtonDocx.Checked)
                {
                    docMaster.Save("Sample.docx", FormatType.Docx, Response, HttpContentDisposition.Attachment);
                }
                //Save as WordML(.xml) format
                else if (rdButtonWordML.Checked)
                {
                    docMaster.Save("Sample.xml", FormatType.WordML, Response, HttpContentDisposition.Attachment);
                }
                //Save as .pdf format
                else if (rdButtonPdf.Checked)
                {
                    DocToPDFConverter converter = new DocToPDFConverter();
                    PdfDocument pdfDoc = converter.ConvertToPDF(docMaster);

                    pdfDoc.Save("Sample.pdf", Response, HttpReadType.Save);
                }
            }
            else
            {
                // Get Template files path.
                string dataPath = ResolveApplicationDataPath(String.Empty);

                // Creating new documents.
                WordDocument doc = new WordDocument();
                WordDocument replaceDoc = new WordDocument();

                // Load Templates.
                doc.Open((Path.Combine(dataPath, "Original.doc")), FormatType.Doc);
                replaceDoc.Open((Path.Combine(dataPath, "Replace.doc")), FormatType.Doc);

                //Select a table and add it to TextBodyPart
                TextBodyPart replacePart = new TextBodyPart(replaceDoc);
                replacePart.BodyItems.Add(replaceDoc.Sections[0].Body.Tables[0] as WTable);

                //Replace Text with table
                doc.Replace("INSERT TABLE", replacePart, true, true);

                //Select text and image
                replacePart = new TextBodyPart(replaceDoc);
                TextBodySelection textSel = new TextBodySelection(replaceDoc.LastSection.Body, 0, replaceDoc.LastSection.Paragraphs.Count, 0, 1);
                replacePart.Copy(textSel);

                //Replace Text with image and text.
                doc.Replace("INSERT PARAGRAPH ITEMS", replacePart, false, true);

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
            string dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\App_Data\\DocIO\\").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
        # endregion
    }
}