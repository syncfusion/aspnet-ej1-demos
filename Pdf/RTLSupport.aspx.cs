#region Copyright Syncfusion Inc. 2001-2018.
// Copyright Syncfusion Inc. 2001-2018. All rights reserved.
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
    public partial class RTLSupport : System.Web.UI.Page
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
            //Create a new PDF document
            PdfDocument doc = new PdfDocument();

            //Add a page
            PdfPage page = doc.Pages.Add();

            //Create font
            Font f = new Font("Arial", 14);
            PdfFont font = new PdfTrueTypeFont(f, true);
            string path = ResolveApplicationDataPath("arabic.txt");

            //Read the text from text file
            StreamReader reader = new StreamReader(path, Encoding.Unicode);
            string text = reader.ReadToEnd();
            reader.Close();

            //Create a brush
            PdfBrush brush = new PdfSolidBrush(Color.Black);
            PdfPen pen = new PdfPen(Color.Black);
            SizeF clipBounds = page.Graphics.ClientSize;
            RectangleF rect = new RectangleF(0, 0, clipBounds.Width / 2f, clipBounds.Height / 3f);

            //Set the property for RTL text
            PdfStringFormat format = new PdfStringFormat();
            format.TextDirection = PdfTextDirection.RightToLeft;
            format.Alignment = PdfTextAlignment.Right;
            format.ParagraphIndent = 35f;

            page.Graphics.DrawString(text, font, brush, rect, format);
            page.Graphics.DrawRectangle(pen, rect);

            //Set the alignment
            format.Alignment = PdfTextAlignment.Center;
            rect.Offset(rect.Width, 0);
            page.Graphics.DrawString(text, font, brush, rect, format);
            page.Graphics.DrawRectangle(pen, rect);

            format.Alignment = PdfTextAlignment.Right;
            rect.Offset(-rect.Width, rect.Height);
            page.Graphics.DrawString(text, font, brush, rect, format);
            page.Graphics.DrawRectangle(pen, rect);

            format.Alignment = PdfTextAlignment.Justify;
            format.LineAlignment = PdfVerticalAlignment.Middle;
            rect.Offset(rect.Width, 0);
            page.Graphics.DrawString(text, font, brush, rect, format);
            page.Graphics.DrawRectangle(pen, rect);

            //Stream the output to the browser.	
            if (this.CheckBox1.Checked)
            {
                doc.Save("Sample.pdf", Response, HttpReadType.Open);
            }
            else
            {
                doc.Save("Sample.pdf", Response, HttpReadType.Save);
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