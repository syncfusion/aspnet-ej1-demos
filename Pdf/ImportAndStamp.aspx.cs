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
    public partial class ImportAndStamp : System.Web.UI.Page
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
        /// Imports and creates a PDF document
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnImport_Click(object sender, EventArgs e)
        {
            string dataPath1 = File1.ResolveClientUrl(File1.Value);
            if (System.IO.Path.GetExtension(dataPath1).Equals(".pdf"))
            {
                Stream stream1 = File1.PostedFile.InputStream;
                PdfLoadedDocument ldoc = new PdfLoadedDocument(stream1);

                PdfFont font = new PdfStandardFont(PdfFontFamily.Helvetica, 36f);

                foreach (PdfPageBase lPage in ldoc.Pages)
                {
                    PdfGraphics g = lPage.Graphics;
                    PdfGraphicsState state = g.Save();
                    g.SetTransparency(0.25f);
                    g.RotateTransform(-40);
                    g.DrawString(txtStamp.Text, font, PdfPens.Red, PdfBrushes.Red, new PointF(-150, 450));
                    g.Restore(state);
                }

                //Save to disk
                if (this.CheckBox1.Checked)
                {
                    ldoc.Save("Sample.pdf", Response, HttpReadType.Open);
                }
                else
                {
                    ldoc.Save("Sample.pdf", Response, HttpReadType.Save);
                }
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