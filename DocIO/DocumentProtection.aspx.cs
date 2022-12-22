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

namespace WebSampleBrowser.DocIO
{
    public partial class DocumentProtection : System.Web.UI.Page
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
            WordDocument document;
            ProtectionType protectionType;

            //Loads the template document.
            if (comboBox1.SelectedIndex == 0)
            {
                document = new WordDocument(Path.Combine(ResolveApplicationDataPath(string.Empty), @"TemplateFormFields.doc"));
                // Sets the protection type as allow only Form Fields.
                protectionType = ProtectionType.AllowOnlyFormFields;
            }
            else if (comboBox1.SelectedIndex == 1)
            {
                document = new WordDocument(Path.Combine(ResolveApplicationDataPath(string.Empty), @"TemplateComments.doc"));
                // Sets the protection type as allow only Comments.
                protectionType = ProtectionType.AllowOnlyComments;
            }
            else if (comboBox1.SelectedIndex == 2)
            {
                document = new WordDocument(Path.Combine(ResolveApplicationDataPath(string.Empty), @"TemplateRevisions.doc"));
                // Enables track changes in the document.
                document.TrackChanges = true;
                // Sets the protection type as allow only Revisions.
                protectionType = ProtectionType.AllowOnlyRevisions;
            }
            else
            {
                document = new WordDocument(Path.Combine(ResolveApplicationDataPath(string.Empty), @"Essential DocIO.doc"));
                // Sets the protection type as allow only Reading.
                protectionType = ProtectionType.AllowOnlyReading;
            }

            // Enforces protection of the document.
            if (string.IsNullOrEmpty(textBox1.Text))
                document.Protect(protectionType);
            else
                document.Protect(protectionType, textBox1.Text);


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