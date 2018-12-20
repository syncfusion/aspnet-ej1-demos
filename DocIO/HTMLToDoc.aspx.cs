#region Copyright Syncfusion Inc. 2001-2018.
// Copyright Syncfusion Inc. 2001-2018. All rights reserved.
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
    public partial class HTMLToDoc : System.Web.UI.Page
    {
        # region Private Members
        string errorMessage = "";
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region Convert HTML file into Word Document
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                WordDocument document = new WordDocument();
                IWSection section = document.AddSection();
                // Set Margin of the document
                section.PageSetup.Margins.All = 72;
                IWParagraph para = section.AddParagraph();
                StreamReader read = new StreamReader(this.FileUpload1.PostedFile.InputStream);
                string htmlText = read.ReadToEnd();
                // This manual validation check is optional. We do this here only for instructional purpose.
                bool valid = section.Body.IsValidXHTML(htmlText, XHTMLValidationType.Transitional, out errorMessage);
                if (!valid)
                {
                    this.label1.Text = "Content is not a well formatted XHTML content \nError message:\n" + errorMessage;

                }
                else
                {
                    // By default, the input html will be validated for XHTML format. This will provide you understandable error messages, if the format is invalid.
                    // However, if you are sure that the input html is valid, then you can skip the validation step to improve performance. However, any error messages 
                    // you might get here will not be very useful as to where exactly in your html, the issue is.
                    document.XHTMLValidateOption = XHTMLValidationType.Transitional;
                    section.Body.InsertXHTML(htmlText);
                    //Save as .doc format
                    if (rdButtonDoc.Checked)
                    {
                        document.Save("Sample.doc", FormatType.Doc, Response, HttpContentDisposition.InBrowser);
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
                    //Save as WordML(.xml) format
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
            }
            else
            {
                this.label1.Text = "Browse a HTML document and then click the button to convert as a Word document";
            }
        }
        #endregion
    }
}