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
using Syncfusion.Pdf;
using Syncfusion.Pdf.Graphics;
using System.IO;
using System.Text;
using System.Drawing;


namespace WebSampleBrowser.Pdf
{
    public partial class OpenTypeFont : System.Web.UI.Page
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
        /// Creates PDF document
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            string inputText = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

			string path = ResolveApplicationDataPath("NotoSerif-Black.otf");
			
            //Create a new PdfDocument.
            PdfDocument document = new PdfDocument();

            //Add a new page to the document.
            PdfPage page = document.Pages.Add();

            //Create font.
			Stream fontStream = System.IO.File.OpenRead(path);
            PdfFont font = new PdfTrueTypeFont(fontStream, 14);

            //Create brush.
            PdfBrush brush = new PdfSolidBrush(Color.Black);

            //Get page client size.          
            SizeF clipBounds = page.Graphics.ClientSize;

            RectangleF rect = new RectangleF(0, 0, clipBounds.Width, clipBounds.Height);            

            //Draw the text.
            page.Graphics.DrawString(inputText, font, brush, rect);

            //Stream the output to the browser.	
            if (this.CheckBox1.Checked)
            {
                document.Save("Sample.pdf", Response, HttpReadType.Open);
            }
            else
            {
                document.Save("Sample.pdf", Response, HttpReadType.Save);
            }
        }
        # endregion

        # region Helpher Methods
        /// <summary>
        /// Data folder path is resolved from requested page physical path
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        protected string ResolveApplicationDataPath(string fileName)
        {
            string dataPath = new System.IO.DirectoryInfo(Server.MapPath("~\\App_Data") + "\\PDF").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
        # endregion
    }
}