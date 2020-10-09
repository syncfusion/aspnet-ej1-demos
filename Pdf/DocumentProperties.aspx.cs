#region Copyright Syncfusion Inc. 2001-2020.
// Copyright Syncfusion Inc. 2001-2020. All rights reserved.
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
using Syncfusion.Pdf;
using Syncfusion.Pdf.Xmp;
using Syncfusion.Pdf.Graphics;
using System.Drawing;
namespace WebSampleBrowser.Pdf
{
    public partial class DocumentProperties : System.Web.UI.Page
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
        /// Creates Pdf document
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            //Create a new PDF Document. The pdfDoc object represents the PDF document.
            //This document has one page by default and additional pages have to be added.
            PdfDocument pdfDoc = new PdfDocument();
            PdfPage page = pdfDoc.Pages.Add();

            // Get xmp object.
            XmpMetadata xmp = pdfDoc.DocumentInformation.XmpMetadata;

            // XMP Basic Schema.
            BasicSchema basic = xmp.BasicSchema;
            basic.Advisory.Add("advisory");
            basic.BaseURL = new Uri("http://google.com");
            basic.CreateDate = DateTime.Now;
            basic.CreatorTool = "creator tool";
            basic.Identifier.Add("identifier");
            basic.Label = "label";
            basic.MetadataDate = DateTime.Now;
            basic.ModifyDate = DateTime.Now;
            basic.Nickname = "nickname";
            basic.Rating.Add(-25);

            //Setting various Document properties.
            pdfDoc.DocumentInformation.Title = "Document Properties Information";
            pdfDoc.DocumentInformation.Author = "Syncfusion";
            pdfDoc.DocumentInformation.Keywords = "PDF";
            pdfDoc.DocumentInformation.Subject = "PDF demo";
            pdfDoc.DocumentInformation.Producer = "Syncfusion Software";
            pdfDoc.DocumentInformation.CreationDate = DateTime.Now;

            PdfFont font = new PdfStandardFont(PdfFontFamily.Helvetica, 10f);
            PdfFont boldFont = new PdfStandardFont(PdfFontFamily.Helvetica, 12f, PdfFontStyle.Bold);
            PdfBrush brush = PdfBrushes.Black;

            PdfGraphics g = page.Graphics;
            PdfStringFormat format = new PdfStringFormat();
            format.LineSpacing = 10f;

            g.DrawString("Press Ctrl+D to see Document Properties", boldFont, brush, 10, 10);
            g.DrawString("Basic Schema Xml:", boldFont, brush, 10, 50);
            g.DrawString(basic.XmlData.OuterXml, font, brush, new RectangleF(10, 70, 500, 500), format);

            //Defines and set values for Custom metadata and add them to the Pdf document
            CustomSchema custom = new CustomSchema(xmp, "custom", "//www.syncfusion.com/");
            custom["Company"] = "Syncfusion";
            custom["Website"] = "//www.syncfusion.com/";
            custom["Product"] = "Essential PDF";

            //Stream the output to the browser.	
            if (this.CheckBox1.Checked)
                pdfDoc.Save("Sample.pdf", Response, HttpReadType.Open);
            else
                pdfDoc.Save("Sample.pdf", Response, HttpReadType.Save);
        }
        # endregion
    }
}
