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
using System.Diagnostics;
using System.IO;


namespace WebSampleBrowser.Pdf
{
    public partial class ExportasImage : System.Web.UI.Page
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
        PdfLoadedDocument loadeddocument;
        #endregion
        # region Events
        /// <summary>
        /// Creates PDF
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            //Load the PDF document.
            loadeddocument = new PdfLoadedDocument(ResolveApplicationDataPath("MultiColumnReports.pdf", false));

            //Exporting as image for the specify page index.
            Bitmap image= loadeddocument.ExportAsImage(0);

            //Stream the output to the browser.	
            if (this.CheckBox1.Checked)
                ExportAsImage(image, "sample.jpeg", ImageFormat.Jpeg, Response, HttpReadType.Open);

            else
                ExportAsImage(image, "sample.jpeg", ImageFormat.Jpeg, Response, HttpReadType.Save);
        }

        /// <summary>
        /// Opens the template document
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnViewTemplate_Click(object sender, EventArgs e)
        {
            string dataPath = ResolveApplicationDataPath("MultiColumnReports.pdf", false);

            Stream file2 = new FileStream(dataPath, FileMode.Open, FileAccess.Read, FileShare.Read);

            //Load the template document.
            PdfLoadedDocument doc = new PdfLoadedDocument(file2);
            doc.Save("InputTemplate.pdf", Response, HttpReadType.Open);

            //Close the pdf and the stream instances.
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
            Response.End();
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