#region Copyright Syncfusion Inc. 2001-2019.
// Copyright Syncfusion Inc. 2001-2019. All rights reserved.
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
using Syncfusion.Pdf.Parsing;
using System.IO;

namespace WebSampleBrowser.Pdf
{
    public partial class OverlayDocuments : System.Web.UI.Page
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
        /// Creates PDF Document
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnMerge_Click(object sender, EventArgs e)
        {
            string dataPath1, dataPath2;

            dataPath1 =Server.MapPath(@"~\App_Data")+@"\PDF\"+txtBorder.Text;
            dataPath2 = File1.ResolveClientUrl(File1.Value);
            if (System.IO.Path.GetExtension(dataPath2).Equals(".pdf"))
            {
                Stream stream1 = File1.PostedFile.InputStream;
                FileStream file = new FileStream(dataPath1, FileMode.Open, FileAccess.Read, FileShare.Read);
                PdfLoadedDocument ldDoc1 = new PdfLoadedDocument(file);
                PdfLoadedDocument ldDoc2 = new PdfLoadedDocument(stream1);
                PdfDocument doc = new PdfDocument();

                for (int i = 0, count = ldDoc2.Pages.Count; i < count; ++i)
                {
                    PdfPage page = doc.Pages.Add();
                    PdfGraphics g = page.Graphics;

                    PdfPageBase lpage = ldDoc2.Pages[i];
                    PdfTemplate template = lpage.CreateTemplate();

                    g.DrawPdfTemplate(template, PointF.Empty, page.GetClientSize());

                    lpage = ldDoc1.Pages[0];
                    template = lpage.CreateTemplate();

                    g.DrawPdfTemplate(template, PointF.Empty, page.GetClientSize());
                }

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