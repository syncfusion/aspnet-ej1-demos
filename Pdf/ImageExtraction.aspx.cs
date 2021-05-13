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
using Syncfusion.Pdf.Graphics;
using Syncfusion.Pdf.Interactive;
using Syncfusion.Pdf.Parsing;
using System.Drawing.Imaging;
using System.IO;
using System.Diagnostics;


namespace WebSampleBrowser.Pdf
{
    public partial class ImageExtraction : System.Web.UI.Page
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
        PdfLoadedDocument loadedDocument;
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
            loadedDocument = new PdfLoadedDocument(ResolveApplicationDataPath("Brochure.pdf", false));

            //Load first page.
            PdfPageBase pageBase = loadedDocument.Pages[0];

            //Extract images from first page.            
            System.Drawing.Image[] extractedImages = pageBase.ExtractImages();

            //Stream the output to the browser.	
            if (this.CheckBox1.Checked)
                ExportAsImage(extractedImages[0], "sample.jpeg", ImageFormat.Jpeg, Response, HttpReadType.Open);

            else
                ExportAsImage(extractedImages[0], "sample.jpeg", ImageFormat.Jpeg, Response, HttpReadType.Save);

            //close the document.
            loadedDocument.Close(true);          
        }

        /// <summary>
        /// Opens the template document
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnViewTemplate_Click(object sender, EventArgs e)
        {
            string dataPath = ResolveApplicationDataPath("Brochure.pdf", false);

            Stream file2 = new FileStream(dataPath, FileMode.Open, FileAccess.Read, FileShare.Read);

            //Load the template document
            PdfLoadedDocument doc = new PdfLoadedDocument(file2);
            doc.Save("InputTemplate.pdf", Response, HttpReadType.Open);

            //Close the pdf and the stream instances
            file2.Dispose();
            doc.Close(true);
            doc.Dispose();
        }

        protected void ExportAsImage(System.Drawing.Image image, string fileName, ImageFormat imageFormat, HttpResponse response, HttpReadType type)
        {
            string disposition = "content-disposition";
            if (type == HttpReadType.Open)
            {
                response.AddHeader(disposition, "inline; filename=" + fileName);
            }
            else if (type == HttpReadType.Save)
            {
                response.AddHeader(disposition, "attachment; filename=\"" + fileName + "\"");
            }
            image.Save(Response.OutputStream, imageFormat);

            response.End();
        }   

       protected string ResolveApplicationDataPath(string fileName, bool type)
        {
            string dataPath;
            if (type)
                dataPath = new System.IO.DirectoryInfo(Server.MapPath("~\\Content") + "\\PDF").FullName;
           
            else
                dataPath = new System.IO.DirectoryInfo(Server.MapPath("~\\App_Data") + "\\PDF").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
        # endregion
    }
}