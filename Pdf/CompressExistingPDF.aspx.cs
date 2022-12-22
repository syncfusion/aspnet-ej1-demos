#region Copyright Syncfusion Inc. 2001 - 2022
// Copyright Syncfusion Inc. 2001 - 2022. All rights reserved.
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
using System.Drawing;
using Syncfusion.Pdf;
using Syncfusion.Pdf.Graphics;
using System.IO;
using Syncfusion.Pdf.Parsing;

namespace WebSampleBrowser.Pdf
{
    public partial class CompressExistingPDF : System.Web.UI.Page
    {
        #region Events
        /// <summary>
        /// Creates PDF
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            string dataPath1 = File1.ResolveClientUrl(File1.Value);
            if (System.IO.Path.GetExtension(dataPath1).Equals(".pdf"))
            {
                Stream stream1 = File1.PostedFile.InputStream;

                //Load a existing PDF document
                PdfLoadedDocument ldoc = new PdfLoadedDocument(stream1);

                //Create a new PDF compression options
                PdfCompressionOptions options = new PdfCompressionOptions();

                if (this.compressImage.Checked)
                {
                    //Compress image.
                    options.CompressImages = true;
                    options.ImageQuality = int.Parse(this.imageQuality.SelectedValue);
                }
                else
                {
                    options.CompressImages = false;
                }
                //Compress the font data
                if (this.optFont.Checked)
                {
                    options.OptimizeFont = true;
                }
                else
                {
                    options.OptimizeFont = false;
                }
                //Compress the page contents
                if (this.optPageContents.Checked)
                {
                    options.OptimizePageContents = true;
                }
                else
                {
                    options.OptimizePageContents = false;
                }
                //Remove the metadata information.    
                if (this.removeMetadata.Checked)
                {
                    options.RemoveMetadata = true;
                }
                else
                {
                    options.RemoveMetadata = false;
                }

                //Set the options to loaded PDF document
                ldoc.CompressionOptions = options;

                //Save to disk
                if (this.CheckBox1.Checked)
                {
                    ldoc.Save("Document1.pdf", Response, HttpReadType.Open);
                }
                else
                {
                    ldoc.Save("Document1.pdf", Response, HttpReadType.Save);
                }
            }
        }
        # endregion     

        protected void compressImage_CheckedChanged(object sender, EventArgs e)
        {
            if (this.compressImage.Checked == true)
                this.imageQuality.Enabled = true;
            else
                this.imageQuality.Enabled = false;
        }
    }
}