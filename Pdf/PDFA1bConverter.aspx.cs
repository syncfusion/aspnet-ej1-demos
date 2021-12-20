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
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;
using Syncfusion.Pdf;
using Syncfusion.Pdf.Parsing;
using Syncfusion.Pdf.Graphics;
using System.IO;
using System.Text;

namespace WebSampleBrowser.Pdf
{
    public partial class PDFA1bConverter : System.Web.UI.Page
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

                //Load an existing PDF.
                PdfLoadedDocument doc = new PdfLoadedDocument(stream1);

                //Set the conformance for PDF/A-1b conversion.
                doc.Conformance = PdfConformanceLevel.Pdf_A1B;

                //Stream the output to the browser.	
                if (this.CheckBox1.Checked)
                {
                    doc.Save(System.IO.Path.GetFileNameWithoutExtension(dataPath1) + "_A1b.pdf", Response, HttpReadType.Open);
                }
                else
                {
                    doc.Save(System.IO.Path.GetFileNameWithoutExtension(dataPath1) + "_A1b.pdf", Response, HttpReadType.Save);
                }

                doc.Close(true);
            }
            else
            {
                //Load an existing PDF.
                PdfLoadedDocument doc = new PdfLoadedDocument(ResolveApplicationDataPath("StandardFont.pdf"));

                //Set the conformance for PDF/A-1b conversion.
                doc.Conformance = PdfConformanceLevel.Pdf_A1B;

                //Stream the output to the browser.	
                if (this.CheckBox1.Checked)
                {
                    doc.Save("Sample.pdf", Response, HttpReadType.Open);
                }
                else
                {
                    doc.Save("Sample.pdf", Response, HttpReadType.Save);
                }

                doc.Close(true);
            }
        }
        # endregion

        # region ResolveApplicationDataPath
        /// <summary>
        /// Get the data file
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        public  string ResolveApplicationDataPath(string fileName)
        {
            //Data folder path is resolved from requested page physical path.
            string dataPath = new System.IO.DirectoryInfo(Server.MapPath("~\\App_Data") + "\\PDF").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
        # endregion
    }
}