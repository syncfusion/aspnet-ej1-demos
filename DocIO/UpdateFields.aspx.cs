#region Copyright Syncfusion Inc. 2001 - 2022
//
//  Copyright Syncfusion Inc. 2001 - 2022. All rights reserved.
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
using System.IO;
using Syncfusion.DocIO;
using Syncfusion.DocIO.DLS;
using System.ComponentModel;
using Syncfusion.DocToPDFConverter;
using Syncfusion.Pdf;

namespace WebSampleBrowser.DocIO
{
    public partial class UpdateFields : System.Web.UI.Page
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
        /// Creates spreadsheet
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            //Loads the template document.
            WordDocument document = new WordDocument(Path.Combine(ResolveApplicationDataPath(string.Empty), @"TemplateUpdateFields.docx"));

            //Initialize DataSet object.
            DataSet ds = new DataSet();

            //Load data from the xml document.
            ds.ReadXml(Path.Combine(ResolveApplicationDataPath(string.Empty), @"StockDetails.xml"));

            // Execute Mail Merge with groups.
            document.MailMerge.ExecuteGroup(ds.Tables["StockDetails"]);

            //Update fields in the document.
            document.UpdateDocumentFields();

            //Unlink the fields in Word document when UnlinkFields is enable.
            if (UnlinkCheckBox.Checked)
                UnlinkFieldsInDocument(document);

            if (rdButtonDoc.Checked)
            {
                //Save as .doc format
                document.Save("Update Fields.doc", FormatType.Doc, Response, HttpContentDisposition.Attachment);
            }
            //Save as .docx format
            else if (rdButtonDocx.Checked)
            {
                try
                {
                    document.Save("Update Fields.docx", FormatType.Docx, Response, HttpContentDisposition.Attachment);
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
                    document.Save("Update Fields.xml", FormatType.WordML, Response, HttpContentDisposition.Attachment);
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

                pdfDoc.Save("Update Fields.pdf", Response, HttpReadType.Save);
                }
                catch (Win32Exception ex)
                {
                    Response.Write("PDF Viewer is not installed in this system");
                    Console.WriteLine(ex.ToString());
                }
            }
        }
        #region Iterates into document for removing field codes.       
        /// <summary>
        /// Iterates to document elements and get fields.
        /// </summary>
        /// <param name="document">Input Word document.</param>
        /// <param name="fieldType">Type of the field to find in document.</param>
        private void UnlinkFieldsInDocument(WordDocument document)
        {
            //Iterates each section and get the tables.
            foreach (WSection section in document.Sections)
            {
                RemoveFieldCodesInTextBody(section.Body);
            }
        }

        /// <summary>
        /// Iterates into body items.
        /// </summary>
        private void RemoveFieldCodesInTextBody(WTextBody textBody)
        {
            for (int i = 0; i < textBody.ChildEntities.Count; i++)
            {
                //IEntity is the basic unit in DocIO DOM.                 
                IEntity bodyItemEntity = textBody.ChildEntities[i];

                //A Text body has 3 types of elements - Paragraph, Table, and Block Content Control
                //Decides the element type by using EntityType
                switch (bodyItemEntity.EntityType)
                {
                    case EntityType.Paragraph:
                        WParagraph paragraph = bodyItemEntity as WParagraph;
                        //Iterates into paragraph items.
                        RemoveFieldCodesInParagraph(paragraph.Items);
                        break;

                    case EntityType.Table:
                        //Table is a collection of rows and cells
                        //Iterates through table's DOM                        
                        RemoveFieldCodesInTable(bodyItemEntity as WTable);
                        break;

                    case EntityType.BlockContentControl:
                        BlockContentControl blockContentControl = bodyItemEntity as BlockContentControl;
                        //Iterates to the body items of Block Content Control.
                        RemoveFieldCodesInTextBody(blockContentControl.TextBody);
                        break;
                }
            }
        }

        /// <summary>
        /// Iterates into paragraph items.
        /// </summary>
        /// <param name="paragraph">The paragraph.</param>
        /// <param name="fieldType">Type of field.</param>
        private void RemoveFieldCodesInParagraph(ParagraphItemCollection paraItems)
        {
            for (int i = 0; i < paraItems.Count; i++)
            {
                if (paraItems[i] is WField)
                {
                    WField field = paraItems[i] as WField;
                   field.Unlink();
                }
                else if (paraItems[i] is WTextBox)
                {
                    //If paragraph item is textbox, iterates into textbody of textbox.
                    WTextBox textBox = paraItems[i] as WTextBox;
                    RemoveFieldCodesInTextBody(textBox.TextBoxBody);
                }
                else if (paraItems[i] is Shape)
                {
                    //If paragraph item is shape, iterates into textbody of shape.
                    Shape shape = paraItems[i] as Shape;
                    RemoveFieldCodesInTextBody(shape.TextBody);
                }
                else if (paraItems[i] is InlineContentControl)
                {
                    //If paragraph item is inline content control, iterates into its item.
                    InlineContentControl inlineContentControl = paraItems[i] as InlineContentControl;
                    RemoveFieldCodesInParagraph(inlineContentControl.ParagraphItems);
                }
            }
        }
        /// <summary>
        /// Iterates into table.
        /// </summary>
        /// <param name="table">The table.</param>
        /// <param name="fieldType">Type of Field.</param>
        private void RemoveFieldCodesInTable(WTable table)
        {
            //Iterates the row collection in a table
            foreach (WTableRow row in table.Rows)
            {
                //Iterates the cell collection in a table row
                foreach (WTableCell cell in row.Cells)
                {
                    RemoveFieldCodesInTextBody(cell);
                }
            }
        }
        #endregion
        /// <summary>
        /// Handles the Click event of the Button2 control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected void Button2_Click(object sender, EventArgs e)
        {
            string fileName = "Template.docx";
            FileStream fileStream = new FileStream(ResolveApplicationDataPath("TemplateUpdateFields.docx"), FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
            fileStream.Position = 0L;
            Response.Clear();
            Response.AddHeader("Content-Type", fileName.EndsWith("doc") ? "application/msword" : "application/application/vnd.ms-word.document.12");
            Response.AddHeader("Content-Disposition", "attachment;filename=" + fileName + ";");
            fileStream.CopyTo(Response.OutputStream);
            fileStream.Close();
            Response.End();
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
            //Data folder path is resolved from requested page physical path.
            string dataPath = null;
            dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\App_Data\\DocIO\\").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
        # endregion
    }
}