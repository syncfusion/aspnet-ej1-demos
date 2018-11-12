#region Copyright Syncfusion Inc. 2001-2016.
// Copyright Syncfusion Inc. 2001-2016. All rights reserved.
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
using Syncfusion.Pdf.Interactive;
using Syncfusion.Pdf.Parsing;
using System.IO;


namespace WebSampleBrowser.Pdf
{
    public partial class ReplaceFont : System.Web.UI.Page
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
        # region Fields
        PdfDocument doc;
        #endregion

        # region Events
        /// <summary>
        /// Creates PDF
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            //Load an existing PDF.
            PdfLoadedDocument loadedDocument = new PdfLoadedDocument(ResolveApplicationDataPath("ReplaceFont.pdf", false));

            //Replace font 
            loadedDocument.UsedFonts[0].Replace(new PdfTrueTypeFont(new Font("Monotype Corsiva",12,FontStyle.Regular),false));                 

            //Stream the output to the browser.	
            if (this.CheckBox1.Checked)
            {
                loadedDocument.Save("Sample.pdf", Response, HttpReadType.Open);
            }
            else
            {
                loadedDocument.Save("Sample.pdf", Response, HttpReadType.Save);
            }

            loadedDocument.Close(true);
        }

        /// <summary>
        /// Opens the template document
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnViewTemplate_Click(object sender, EventArgs e)
        {
            string dataPath = ResolveApplicationDataPath("ReplaceFont.pdf", false);

            Stream file2 = new FileStream(dataPath, FileMode.Open, FileAccess.Read, FileShare.Read);

            //Load the template document
            PdfLoadedDocument doc = new PdfLoadedDocument(file2);
            doc.Save("InputTemplate.pdf", Response, HttpReadType.Open);

            //Close the pdf and the stream instances
            file2.Dispose();
            doc.Close(true);
            doc.Dispose();
        }

           protected string ResolveApplicationDataPath(string fileName, bool type)
        {
            string dataPath;
            if (type)
                //Data folder path is resolved from requested page physical path.
                dataPath = new System.IO.DirectoryInfo(Server.MapPath("~\\Content") + "\\PDF").FullName;
            else
                //Data folder path is resolved from requested page physical path.
                dataPath = new System.IO.DirectoryInfo(Server.MapPath("~\\App_Data") + "\\PDF").FullName;

            return string.Format("{0}\\{1}", dataPath, fileName);
        }

        # endregion
    }
}