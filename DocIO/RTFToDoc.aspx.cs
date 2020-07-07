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

using Syncfusion.DocIO.DLS;
using System.ComponentModel;
using Syncfusion.DocIO;
using System.IO;

namespace WebSampleBrowser.DocIO
{
    public partial class RTFToDoc : System.Web.UI.Page
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
        protected void btnRTFToDoc_Click(object sender, EventArgs e)
        {
            if (this.FileUpload1.HasFile)
            {
                string ext = System.IO.Path.GetExtension(this.FileUpload1.PostedFile.FileName).ToLower();
                if (ext == ".rtf")
                {
                    //Convert the input RTF document to Word document.
                    # region Convert RTF to Word
                    try
                    {
                        WordDocument document = null;
                        if (ext == ".rtf")
                            document = new WordDocument(this.FileUpload1.PostedFile.InputStream, FormatType.Rtf);

                        if (rdButtonDoc.Checked)
                        {
                            //Save as .doc format
                            document.Save("Sample.doc", FormatType.Doc, Response, HttpContentDisposition.Attachment);
                        }
                        //Save as .docx format
                        else if (rdButtonDocx.Checked)
                        {
                            document.Save("Sample.docx", FormatType.Docx, Response, HttpContentDisposition.Attachment);
                        }
                        //Save as WordML(.xml) format
                        else if (rdButtonWordML.Checked)
                        {
                            document.Save("Sample.xml", FormatType.WordML, Response, HttpContentDisposition.Attachment);
                        }
                        this.label1.Text = "";
                    }
                    catch
                    {
                        this.label1.Text = "The input document could not be processed, Could you please email the document to support@syncfusion.com for troubleshooting";
                    }
                    # endregion
                }
                else
                {
                    this.label1.Text = "Please choose RTF document to convert to Word Document";
                }
            }
            else
            {
                this.label1.Text = "Browse a RTF document and then click the button to convert as a Word document";
            }
        }
        # endregion
    }
}