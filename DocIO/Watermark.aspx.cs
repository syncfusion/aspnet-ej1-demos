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
    public partial class Watermark : System.Web.UI.Page
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

            //Data folder path is resolved from requested page physical path.
            string dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\App_Data\\DocIO\\").FullName;
            string dataPath1 = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\Content\\DocIO\\").FullName;

            //Open an existing word document 
            WordDocument doc = new WordDocument(Path.Combine(dataPath, "Watermark.doc"));

            if (rdButtonText.Checked)
            {
                //Add text watermark.
                TextWatermark textWatermark = new TextWatermark();
                doc.Watermark = textWatermark;

                //Set the text for the watermark.
                textWatermark.Text = "Demo";

                //Set the color for the watermark text.
                textWatermark.Color = Color.Gray;

                //Set the size.
                textWatermark.Size = 120;
            }
            else if (rdButtonPicture.Checked)
            {
                //Add Picture watermark to the word document.
                PictureWatermark picWatermark = new PictureWatermark();
                doc.Watermark = picWatermark;

                //Set the picture.
                picWatermark.Picture = System.Drawing.Image.FromFile(Path.Combine(dataPath1, "Northwind_logo.png"));

                //Set the properties for the watermark.
                picWatermark.Scaling = 100.0f;
                picWatermark.Washout = false;
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
    }
}