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

using Syncfusion.DocIO;
using Syncfusion.DocIO.DLS;
using System.ComponentModel;
using System.Drawing;

namespace WebSampleBrowser.DocIO
{
    public partial class DocumentSettings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        # region Events
        /// <summary>
        /// Updates the template document with the information given by the user and opens it for the user.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {

            //A new document is created.
            WordDocument document = new WordDocument();

            //Adding a section to the document.
            IWSection section = document.AddSection();

            //Adding a paragraph to the section.            
            IWParagraph paragraph = section.AddParagraph();

            #region DocVariable
            string name = "John Smith";
            string address = "Cary, NC";
            //Get the variables in the existing document
            DocVariables dVariable = document.Variables;
            //Add doc variables
            dVariable.Add("Customer Name", name);
            dVariable.Add("Customer Address", address);
            #endregion DocVariable

            #region Document Properties
            //Setting document Properties
            document.BuiltinDocumentProperties.Author = "Essential DocIO";
            document.BuiltinDocumentProperties.ApplicationName = "Essential DocIO";
            document.BuiltinDocumentProperties.Category = "Document Generator";
            document.BuiltinDocumentProperties.Comments = "This document was generated using Essential DocIO";
            document.BuiltinDocumentProperties.Company = "Syncfusion Inc";
            document.BuiltinDocumentProperties.Subject = "Native Word Generator";
            document.BuiltinDocumentProperties.Keywords = "Syncfusion";
            document.BuiltinDocumentProperties.Manager = "Sync Manager";
            document.BuiltinDocumentProperties.Title = "Essential DocIO";

            // Add a custom document Property
            document.CustomDocumentProperties.Add("My_Doc_Date", DateTime.Today);
            document.CustomDocumentProperties.Add("My_Doc", true);
            document.CustomDocumentProperties.Add("My_ID", 1031);
            document.CustomDocumentProperties.Add("My_Comment", "Essential DocIO");
            //Remove a custome property
            document.CustomDocumentProperties.Remove("My_Doc");

            #endregion

            IWTextRange text = paragraph.AppendText("");
            text.CharacterFormat.FontName = "Calibri";
            text.CharacterFormat.FontSize = 13;
            text = paragraph.AppendText("This document is created with various Document Properties Summary Information and page settings information \n\n You can view Document Properties through: File -> Properties -> Summary/Custom.");
            text.CharacterFormat.FontName = "Calibri";
            text.CharacterFormat.FontSize = 13;

            #region Page setup

            // Write section properties
            section.PageSetup.PageSize = new SizeF(500, 750);
            section.PageSetup.Orientation = PageOrientation.Landscape;
            section.PageSetup.Margins.Bottom = 100;
            section.PageSetup.Margins.Top = 100;
            section.PageSetup.Margins.Left = 50;
            section.PageSetup.Margins.Right = 50;
            section.PageSetup.PageBordersApplyType = PageBordersApplyType.AllPages;
            section.PageSetup.Borders.BorderType = Syncfusion.DocIO.DLS.BorderStyle.DoubleWave;
            section.PageSetup.Borders.Color = System.Drawing.Color.DarkBlue;
            section.PageSetup.VerticalAlignment = PageAlignment.Middle;

            #endregion

            paragraph = section.AddParagraph();
            text = paragraph.AppendText("");
            text.CharacterFormat.FontName = "Calibri";
            text.CharacterFormat.FontSize = 13;

            text = paragraph.AppendText("\n\n You can view Page setup options through File -> PageSetup.");
            text.CharacterFormat.FontName = "Calibri";
            text.CharacterFormat.FontSize = 13;

            #region Get document variables
            paragraph = document.LastSection.AddParagraph();
            dVariable = document.Variables;
            text = paragraph.AppendText("\n\n Document Variables\n");
            text.CharacterFormat.FontName = "Calibri";
            text.CharacterFormat.FontSize = 13;
            text.CharacterFormat.Bold = true;
            text = paragraph.AppendText("\n" + dVariable.GetNameByIndex(1) + ": " + dVariable.GetValueByIndex(1));
            text.CharacterFormat.FontName = "Calibri";
            text.CharacterFormat.FontSize = 13;
            //Display the current variable count
            text = paragraph.AppendText("\n\nDocument Variables Count: " + dVariable.Count);
            text.CharacterFormat.FontName = "Calibri";
            text.CharacterFormat.FontSize = 13;

            #endregion Get document variables

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
            //Save as .xml(WordML) format
            else if (rdButtonWordML.Checked)
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
            # endregion
        }
        # endregion
    }
}