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
using System.Drawing.Imaging;
using Syncfusion.Pdf;
using Syncfusion.Pdf.Graphics;
using Syncfusion.Pdf.Tables;
using System.Data.OleDb;
using Syncfusion.Pdf.Parsing;
using System.IO;

namespace WebSampleBrowser.Pdf
{
    public partial class SplitPDF : System.Web.UI.Page
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
        /// Splits and creates a new PDF document
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSplit_Click(object sender, EventArgs e)
        {
            string dataPath1 = File1.ResolveClientUrl(File1.Value);
            if (System.IO.Path.GetExtension(dataPath1).Equals(".pdf"))
            {
                Stream stream1 = File1.PostedFile.InputStream;
                PdfLoadedDocument ldoc = new PdfLoadedDocument(stream1);

                int splitAtPage = int.Parse(txtSplitAtPage.Text);
                if (splitAtPage <= ldoc.Pages.Count)
                {
                    //Create two pdf documents
                    PdfDocument doc1 = new PdfDocument();
                    PdfDocument doc2 = new PdfDocument();

                    //Split the source document into two based on the page to split-at page.

                    for (int i = 0; i < splitAtPage; i++)
                        doc1.ImportPage(ldoc, i);

                    for (int j = splitAtPage; j < ldoc.Pages.Count; j++)
                        doc2.ImportPage(ldoc, j);

                    //Save to disk
                    if (this.CheckBox1.Checked)
                    {
                        doc1.Save("Document1.pdf", Response, HttpReadType.Open);
                        doc2.Save("Document2.pdf", Response, HttpReadType.Open);
                    }
                    else
                    {
                        doc1.Save("Document1.pdf", Response, HttpReadType.Save);
                        doc2.Save("Document2.pdf", Response, HttpReadType.Save);
                    }
                }
                else
                {
                    lb_error.Visible = true;
                    lb_error.Text = "Invalid Page Number.";

                }
            }
            else
            {
                lb_error.Visible = true;
                lb_error.Text = "Invalid file type. Please select a PDF file";
            }
        }
        # endregion
    }
}