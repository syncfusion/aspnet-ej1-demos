#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Syncfusion.DocIO;
using Syncfusion.DocIO.DLS;
using System.Web.Http;
using System.Collections.Generic;
using Syncfusion.EJ.Export;
using Syncfusion.DocToPDFConverter;
using Syncfusion.Pdf;

namespace WebSampleBrowser.RichTextEditor
{
    public partial class ImportExport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string exportDoc = "ImportExport.aspx/ExportToWord",  exportPdf = "ImportExport.aspx/ExportToPDF";
            string RequestURL = HttpContext.Current.Request.Url.ToString();           
            if (RequestURL.Contains(exportDoc)) ExportToWord();
            else if (RequestURL.Contains(exportPdf)) ExportToPDF();
        }
      
        public void ExportToWord()
        {

            string RTEID = HttpContext.Current.Request.QueryString["rteid"];
            string FileName = HttpContext.Current.Request.Params[RTEID + "_inputFile"];
            string htmlText = HttpContext.Current.Request.Params[RTEID + "_inputVal"];
            WordDocument document = GetDocument(htmlText);
            document.Save(FileName + ".docx", FormatType.Docx, HttpContext.Current.Response, HttpContentDisposition.Attachment);
        }

     
        public void ExportToPDF()
        {
            string RTEID = HttpContext.Current.Request.QueryString["rteid"];
            string FileName = HttpContext.Current.Request.Params[RTEID + "_inputFile"];
            string htmlText = HttpContext.Current.Request.Params[RTEID + "_inputVal"];
            WordDocument document = GetDocument(htmlText);
            DocToPDFConverter converter = new DocToPDFConverter();
            PdfDocument pdfDocument = converter.ConvertToPDF(document);
            pdfDocument.Save(FileName + ".pdf", HttpContext.Current.Response, HttpReadType.Save);
        }


        public  WordDocument GetDocument(string htmlText)
        {
            WordDocument document = null;
            MemoryStream stream = new MemoryStream();
            StreamWriter writer = new StreamWriter(stream, System.Text.Encoding.Default);
            htmlText = htmlText.Replace("\"", "'");
            XmlConversion XmlText = new XmlConversion(htmlText);
            XhtmlConversion XhtmlText = new XhtmlConversion(XmlText);
            writer.Write(XhtmlText.ToString());
            writer.Flush();
            stream.Position = 0;
            document = new WordDocument(stream, FormatType.Html, XHTMLValidationType.None);
            return document;
        }
    }
}