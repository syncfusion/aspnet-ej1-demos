#region Copyright Syncfusion Inc. 2001-2018.
// Copyright Syncfusion Inc. 2001-2018. All rights reserved.
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

using Syncfusion.Pdf;
using Syncfusion.XPS;

namespace WebSampleBrowser.Pdf
{
    public partial class XPStoPDF : System.Web.UI.Page
    {
        protected void btnXPStoPDF_Click(object sender, EventArgs e)
        {
            if (this.FileUpload1.HasFile)
            {
                string ext = System.IO.Path.GetExtension(this.FileUpload1.PostedFile.FileName).ToLower();
                if (ext == ".xps")
                {
                    //Convert the input XPS document to a PDF file
                    # region Convert XPS to PDF
                    Stream readFile = this.FileUpload1.PostedFile.InputStream;
                    try
                    {
                        XPSToPdfConverter converter = new XPSToPdfConverter();
                        //Convert XPS document into PDF document
                        PdfDocument document = converter.Convert(readFile);

                        //Save the pdf file            
                        if (this.CheckBox1.Checked)
                        {
                            document.Save("XPStoPDF.pdf", Response, HttpReadType.Open);
                        }
                        else
                        {
                            document.Save("XPStoPDF.pdf", Response, HttpReadType.Save);
                        }

                        readFile.Close();
                        this.label1.Text = "";
                        document.Close(true);
                    }
                    catch (Exception)
                    {
                        this.label1.Text = "The input document could not be processed, Could you please email the document to support@syncfusion.com for troubleshooting?";
                    }
                    # endregion
                }
                else
                {
                    this.label1.Text = "Please choose a XPS file to convert to PDF";
                }

            }
            else
            {
                this.label1.Text = "Browse a XPS document and then click the button to convert as a PDF document";
            }
        }
    }
}