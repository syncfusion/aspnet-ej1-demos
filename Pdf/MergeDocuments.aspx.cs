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
using System.Drawing;
using System.IO;
using System.Drawing.Imaging;
using Syncfusion.Pdf;
using Syncfusion.Pdf.Graphics;
using Syncfusion.Pdf.Tables;
using Syncfusion.Pdf.Parsing;

namespace WebSampleBrowser.Pdf
{
    public partial class MergeDocuments : System.Web.UI.Page
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
        /// Merges PDF documents
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnMerge_Click(object sender, EventArgs e)
        {
            if (System.IO.Path.GetExtension(File1.PostedFile.FileName).Equals(".pdf") && System.IO.Path.GetExtension(File2.PostedFile.FileName).Equals(".pdf"))
            {
                Stream stream1 = File1.PostedFile.InputStream;
                Stream stream2 = File2.PostedFile.InputStream;

                //Load the documents as streams
                PdfLoadedDocument doc1 = new PdfLoadedDocument(stream1);
                PdfLoadedDocument doc2 = new PdfLoadedDocument(stream2);

                object[] dobj = { doc1, doc2 };
                PdfDocument doc = new PdfDocument();
                PdfDocument.Merge(doc, dobj);

                if (this.CheckBox1.Checked)
                    doc.Save("Sample.pdf", Response, HttpReadType.Open);
                else
                    doc.Save("Sample.pdf", Response, HttpReadType.Save);
            }
            else
            {
                lb_error.Visible = true;
                lb_error.Text = "Invalid file type. Please select a PDF file.";
            }
        }
        # endregion
    }
}