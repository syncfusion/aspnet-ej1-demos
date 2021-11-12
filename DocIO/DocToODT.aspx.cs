#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Syncfusion.DocIO;
using Syncfusion.DocIO.DLS;
using System.IO;

namespace WebSampleBrowser.DocIO
{
    public partial class DocToODT : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDocToODT_Click(object sender, EventArgs e)
        {
		  if (this.FileUpload1.HasFile)
            {
                string ext = System.IO.Path.GetExtension(this.FileUpload1.PostedFile.FileName).ToLower();
                if (ext == ".doc" || ext == ".docx")
                {
                    //Convert the input word document to a ODT file
                    # region Convert Doc to ODT
                    Stream readFile = this.FileUpload1.PostedFile.InputStream;
                    try
                    {
                        WordDocument wordDoc = null;
                        if (ext == ".doc")
                            wordDoc = new WordDocument(readFile, Syncfusion.DocIO.FormatType.Doc);
                        else if (ext == ".docx")
                            wordDoc = new WordDocument(readFile, Syncfusion.DocIO.FormatType.Docx);

                        //Save the odt file 
                        wordDoc.Save("DocToODT.odt", FormatType.Odt, Response, HttpContentDisposition.Attachment);

                        readFile.Close();
                        this.label1.Text = "";

                    }
                    catch (Exception e1)
                    {
                        this.label1.Text = e1.Message;
                    }

                    # endregion

                }
                else
                {
                    this.label1.Text = "Please choose doc or docx file to convert to ODT";
                }
            }

            else
            {
                this.label1.Text = "Browse a word document and then click the button to convert as a ODT document";
            }
        }
    }
}