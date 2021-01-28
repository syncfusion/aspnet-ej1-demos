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
using System.ComponentModel;
using Syncfusion.DocToPDFConverter;
using Syncfusion.Pdf;

namespace WebSampleBrowser.DocIO
{
    public partial class CloneAndMerge : System.Web.UI.Page
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
            string basePath = ResolveApplicationDataPath(" ");
            string sourceFileName = basePath + "Adventure.docx";
            // Opens a source document.
            WordDocument doc = new WordDocument(basePath + "Northwind.docx");

            if (rdButtonImport.Checked)
            {
                doc.ImportContent(new WordDocument(sourceFileName), GetImportOption(comboBoxImportOptions.SelectedValue));
            }
            else
            {
                // Read the source template document
                WordDocument document1 = new WordDocument(sourceFileName);
                // Enumerate all the sections from the source document.
                foreach (IWSection sec in document1.Sections)
                {
                    // Cloning all the sections one by one and merging it to the destination document.
                    doc.Sections.Add(sec.Clone());
                    // Setting section break code to be the same as the template.
                    doc.LastSection.BreakCode = sec.BreakCode;
                }
            }
            
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
            //Save as .xml(WordML) format
            else if (rdButtonWordML.Checked)
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
        # endregion

        # region Helpher Methods
        /// <summary>
        /// Data folder path is resolved from requested page physical path
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        protected string ResolveApplicationDataPath(string fileName)
        {
            return new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\App_Data\\DocIO\\").FullName;
        }
        protected void rdButtonImport_CheckedChanged(object sender, EventArgs e)
        {
            if ((sender as RadioButton).Checked)
            {
                this.comboBoxImportOptions.Enabled = true;
                this.label3.Enabled = true;
            }
        }
        /// <summary>
        /// Returns the ImportOption.
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        private ImportOptions GetImportOption(string value)
        {
            switch (value)
            {
                case "KeepSourceFormatting":
                    return ImportOptions.KeepSourceFormatting;
                case "MergeFormatting":
                    return ImportOptions.MergeFormatting;
                case "KeepTextOnly":
                    return ImportOptions.KeepTextOnly;
                case "UseDestinationStyles":
                    return ImportOptions.UseDestinationStyles;
                case "ListContinueNumbering":
                    return ImportOptions.ListContinueNumbering;
                case "ListRestartNumbering":
                    return ImportOptions.ListRestartNumbering;
            }
            return ImportOptions.UseDestinationStyles;
        }
        # endregion
        protected void rdButtonClone_CheckedChanged(object sender, EventArgs e)
        {
            if ((sender as RadioButton).Checked)
            {
                this.comboBoxImportOptions.Enabled = false;
                this.label3.Enabled = false;
            }
        }
    }
}