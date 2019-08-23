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
using System.Drawing;
using System.IO;
using Syncfusion.DocToPDFConverter;
using Syncfusion.Pdf;


namespace WebSampleBrowser.DocIO
{
    public partial class GroupShapes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        # region Events
        /// <summary>
        /// Creates spreadsheet
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            //Initialize Word document
            WordDocument doc = new WordDocument();
            //Ensure Minimum
            doc.EnsureMinimal();
            //Set margins for page.
            doc.LastSection.PageSetup.Margins.All = 72;
            //Create new group shape
            GroupShape groupShape = new GroupShape(doc);

            //Append AutoShape
            Shape shape = new Shape(doc, AutoShapeType.RoundedRectangle);
            shape.Width = 130;
            shape.Height = 45;
            //Set horizontal origin
            shape.HorizontalOrigin = HorizontalOrigin.Page;
            //Set vertical origin
            shape.VerticalOrigin = VerticalOrigin.Page;
            //Set vertical position
            shape.VerticalPosition = 122;
            //Set horizontal position
            shape.HorizontalPosition = 220;
            //Set AllowOverlap to true for overlapping shapes
            shape.WrapFormat.AllowOverlap = true;
            //Set Fill Color
            shape.FillFormat.Color = Color.Blue;
            //Set Content vertical alignment
            shape.TextFrame.TextVerticalAlignment = Syncfusion.DocIO.DLS.VerticalAlignment.Middle;
            //Add Texbody contents to Shape
            IWParagraph para = shape.TextBody.AddParagraph();
            para.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Center;
            para.AppendText("Requirement").ApplyCharacterFormat(new WCharacterFormat(doc) { Bold = true, TextColor = Color.White, FontSize = 12, FontName = "Verdana" });
            groupShape.Add(shape);

            shape = new Shape(doc, AutoShapeType.DownArrow);
            shape.Width = 45;
            shape.Height = 45;
            shape.HorizontalOrigin = HorizontalOrigin.Page;
            shape.VerticalOrigin = VerticalOrigin.Page;
            shape.VerticalPosition = 167;
            //Set horizontal position
            shape.HorizontalPosition = 265;
            shape.WrapFormat.AllowOverlap = true;
            groupShape.Add(shape);

            shape = new Shape(doc, AutoShapeType.RoundedRectangle);
            shape.Width = 130;
            shape.Height = 45;
            shape.HorizontalOrigin = HorizontalOrigin.Page;
            shape.VerticalOrigin = VerticalOrigin.Page;
            shape.VerticalPosition = 212;
            //Set horizontal position
            shape.HorizontalPosition = 220;
            shape.WrapFormat.AllowOverlap = true;
            shape.FillFormat.Color = Color.Orange;
            shape.TextFrame.TextVerticalAlignment = VerticalAlignment.Middle;
            para = shape.TextBody.AddParagraph();
            para.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Center;
            para.AppendText("Design").ApplyCharacterFormat(new WCharacterFormat(doc) { Bold = true, TextColor = Color.White, FontSize = 12, FontName = "Verdana" });
            groupShape.Add(shape);

            shape = new Shape(doc, AutoShapeType.DownArrow);
            shape.Width = 45;
            shape.Height = 45;
            shape.HorizontalOrigin = HorizontalOrigin.Page;
            shape.VerticalOrigin = VerticalOrigin.Page;
            shape.VerticalPosition = 257;
            //Set horizontal position
            shape.HorizontalPosition = 265;
            shape.WrapFormat.AllowOverlap = true;
            groupShape.Add(shape);

            shape = new Shape(doc, AutoShapeType.RoundedRectangle);
            shape.Width = 130;
            shape.Height = 45;
            shape.HorizontalOrigin = HorizontalOrigin.Page;
            shape.VerticalOrigin = VerticalOrigin.Page;
            shape.VerticalPosition = 302;
            //Set horizontal position
            shape.HorizontalPosition = 220;
            shape.WrapFormat.AllowOverlap = true;
            shape.FillFormat.Color = Color.Blue;
            shape.TextFrame.TextVerticalAlignment = VerticalAlignment.Middle;
            para = shape.TextBody.AddParagraph();
            para.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Center;
            para.AppendText("Execution").ApplyCharacterFormat(new WCharacterFormat(doc) { Bold = true, TextColor = Color.White, FontSize = 12, FontName = "Verdana" });
            groupShape.Add(shape);

            shape = new Shape(doc, AutoShapeType.DownArrow);
            shape.Width = 45;
            shape.Height = 45;
            shape.HorizontalOrigin = HorizontalOrigin.Page;
            shape.VerticalOrigin = VerticalOrigin.Page;
            shape.VerticalPosition = 347;
            //Set horizontal position
            shape.HorizontalPosition = 265;
            shape.WrapFormat.AllowOverlap = true;
            groupShape.Add(shape);

            shape = new Shape(doc, AutoShapeType.RoundedRectangle);
            shape.Width = 130;
            shape.Height = 45;
            shape.HorizontalOrigin = HorizontalOrigin.Page;
            shape.VerticalOrigin = VerticalOrigin.Page;
            shape.VerticalPosition = 392;
            //Set horizontal position
            shape.HorizontalPosition = 220;
            shape.WrapFormat.AllowOverlap = true;
            shape.FillFormat.Color = Color.Violet;
            shape.TextFrame.TextVerticalAlignment = VerticalAlignment.Middle;
            para = shape.TextBody.AddParagraph();
            para.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Center;
            para.AppendText("Testing").ApplyCharacterFormat(new WCharacterFormat(doc) { Bold = true, TextColor = Color.White, FontSize = 12, FontName = "Verdana" });
            groupShape.Add(shape);


            shape = new Shape(doc, AutoShapeType.DownArrow);
            shape.Width = 45;
            shape.Height = 45;
            shape.HorizontalOrigin = HorizontalOrigin.Page;
            shape.VerticalOrigin = VerticalOrigin.Page;
            shape.VerticalPosition = 437;
            //Set horizontal position
            shape.HorizontalPosition = 265;
            shape.WrapFormat.AllowOverlap = true;
            groupShape.Add(shape);


            shape = new Shape(doc, AutoShapeType.RoundedRectangle);
            shape.Width = 130;
            shape.Height = 45;
            shape.HorizontalOrigin = HorizontalOrigin.Page;
            shape.VerticalOrigin = VerticalOrigin.Page;
            shape.VerticalPosition = 482;
            //Set horizontal position
            shape.HorizontalPosition = 220;
            shape.WrapFormat.AllowOverlap = true;
            shape.FillFormat.Color = Color.PaleVioletRed;
            shape.TextFrame.TextVerticalAlignment = VerticalAlignment.Middle;
            para = shape.TextBody.AddParagraph();
            para.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Center;
            para.AppendText("Release").ApplyCharacterFormat(new WCharacterFormat(doc) { Bold = true, TextColor = Color.White, FontSize = 12, FontName = "Verdana" });
            groupShape.Add(shape);
            doc.LastParagraph.ChildEntities.Add(groupShape);


            # region save document
            //Save as .docx format
            if (rdButtonDocx.Checked)
            {
                try
                {
                    doc.Save("GroupShapes.docx", FormatType.Docx, Response, HttpContentDisposition.Attachment);
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
                    doc.Save("GroupShapes.xml", FormatType.WordML, Response, HttpContentDisposition.Attachment);
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
                PdfDocument pdfDoc = converter.ConvertToPDF(doc);

                pdfDoc.Save("GroupShapes.pdf", Response, HttpReadType.Save);
            }
            #endregion
        }
        # endregion
        #region Helpher Methods
        /// <summary>
        /// Data folder path is resolved from requested page physical path
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        protected string ResolveApplicationDataPath()
        {
            //Data folder path is resolved from requested page physical path.
            string dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\Content\\DocIO\\").FullName;
            return string.Format("{0}", dataPath);
        }
        # endregion
   }
}
