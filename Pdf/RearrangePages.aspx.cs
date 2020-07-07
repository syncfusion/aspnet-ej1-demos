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
    public partial class RearrangePages : System.Web.UI.Page
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
        PdfLoadedDocument ldoc;
        #endregion
        # region Events
        /// <summary>
        /// Creates PDF
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            //Load the existing PDF document.
            ldoc = new PdfLoadedDocument(ResolveApplicationDataPath("SyncfusionBrochure.pdf", false));

            //Rearrange the page by index.
            ldoc.Pages.ReArrange(new int[] { 2,0,1});                  

            //Stream the output to the browser.	
            if (this.CheckBox1.Checked)
            {
                ldoc.Save("Sample.pdf", Response, HttpReadType.Open);
            }
            else
            {
                ldoc.Save("Sample.pdf", Response, HttpReadType.Save);
            }
        }

        /// <summary>
        /// Opens the template document
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnViewTemplate_Click(object sender, EventArgs e)
        {
            string dataPath = ResolveApplicationDataPath("SyncfusionBrochure.pdf", false);

            Stream file2 = new FileStream(dataPath, FileMode.Open, FileAccess.Read, FileShare.Read);

            //Load the template document.
            PdfLoadedDocument doc = new PdfLoadedDocument(file2);

            doc.Save("InputTemplate.pdf", Response, HttpReadType.Open);

            //Close the pdf and the stream instances.
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