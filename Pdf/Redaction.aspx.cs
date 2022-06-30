#region Copyright Syncfusion Inc. 2001-2022.
// Copyright Syncfusion Inc. 2001-2022. All rights reserved.
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
using Syncfusion.Pdf.Redaction;
using System.IO;

namespace WebSampleBrowser.Pdf
{
    public partial class Redaction : System.Web.UI.Page
    {
        #region Page Load
        /// <summary>
        /// Handles page load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        #endregion

        #region Events
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

                //Load a PDF document
                PdfLoadedDocument ldoc = new PdfLoadedDocument(stream1);

                //Get first page from document
                PdfLoadedPage lpage = ldoc.Pages[0] as PdfLoadedPage;

                if (x.Text != "" && y.Text != "" && width.Text != "" && height.Text != "")
                {
                    float x1 = float.Parse(x.Text);
                    float y1 = float.Parse(y.Text);
                    float width1 = float.Parse(width.Text);
                    float height1 = float.Parse(height.Text);

		    //Create PDF redaction for the page
		    PdfRedaction redaction = new PdfRedaction(new RectangleF(x1, y1, width1, height1), Color.Black);

		    //Adds the redaction to loaded page
		    lpage.Redactions.Add(redaction);

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
                else
                {
                    lb_error.Visible = true;
                    lb_error.Text = "Note: Fill all the fields then redact";
                }
            }
            else
            {
                lb_error.Visible = true;
                lb_error.Text = "Invalid file type. Please select a PDF file";
            }
        }
        #endregion
    }
}