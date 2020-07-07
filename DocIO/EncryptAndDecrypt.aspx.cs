#region Copyright Syncfusion Inc. 2001-2020.
// Copyright Syncfusion Inc. 2001-2020. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.IO;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.ComponentModel;
using Syncfusion.DocIO;
using Syncfusion.DocIO.DLS;

namespace WebSampleBrowser.DocIO
{
    public partial class EncryptAndDecrypt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ClickToEncrypt_Click(object sender, EventArgs e)
        {
            if (this.FileUpload1.HasFile && System.IO.Path.GetExtension(this.FileUpload1.PostedFile.FileName).StartsWith(".doc"))
            {
                Stream readFile = this.FileUpload1.PostedFile.InputStream;

                //Open the document
                WordDocument document = new WordDocument(readFile);
                // Getting last section of the document.
                IWSection section = document.LastSection;

                // Adding a paragraph to the section.
                IWParagraph paragraph = section.AddParagraph();

                // Writing text
                IWTextRange text = paragraph.AppendText("This document was encrypted with password");
                text.CharacterFormat.FontSize = 16f;
                text.CharacterFormat.FontName = "Bitstream Vera Serif";

                // Encrypt the document by giving password
                document.EncryptDocument(txtEnOpen.Text);

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
                # endregion
            }

        }
        protected void ClickToDecrypt_Click(object sender, EventArgs e)
        {
            if (this.FileUpload2.HasFile && System.IO.Path.GetExtension(this.FileUpload2.PostedFile.FileName).StartsWith(".doc"))
            {
                Stream readFile = this.FileUpload2.PostedFile.InputStream;

                try
                {
                    //Open the encrypted document
                    WordDocument document = new WordDocument(readFile, txtDeOpen.Text);

                    // Getting last section of the document.
                    IWSection section = document.LastSection;

                    // Adding a paragraph to the section.
                    IWParagraph paragraph = section.AddParagraph();

                    // Writing text
                    IWTextRange text = paragraph.AppendText("\nDemo For Document Decryption with Essential DocIO");
                    text.CharacterFormat.FontSize = 16f;
                    text.CharacterFormat.FontName = "Bitstream Vera Serif";

                    text = paragraph.AppendText("\nThis document is Decrypted");
                    text.CharacterFormat.FontSize = 16f;
                    text.CharacterFormat.FontName = "Bitstream Vera Serif";

                    # region Save Document

                    if (rdButtonDecryptDoc.Checked)
                    {
                        //Save as .doc format
                        document.Save("Sample.doc", FormatType.Doc, Response, HttpContentDisposition.Attachment);
                    }
                    //Save as .docx format
                    else if (rdButtonDecryptDocx.Checked)
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
                    # endregion
                }
                catch (Exception)
                {
                    this.label1.Text = "Given password is incorrect";

                }
            }
        }
    }
}