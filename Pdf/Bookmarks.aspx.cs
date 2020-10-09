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


namespace WebSampleBrowser.Pdf
{
    public partial class Bookmarks : System.Web.UI.Page
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
        PdfDocument document = null;
        PdfFont font = null;
        PdfBrush brush = null;
        #endregion

        # region Methods
        public PdfBookmark AddBookmark(PdfPage page, string title, PointF point)
        {
            //Create Pdf graphics for the page
            PdfGraphics graphics = page.Graphics;

            //Add bookmark in PDF document
            PdfBookmark bookmarks = document.Bookmarks.Add(title);

            brush = new PdfSolidBrush(Color.Red);

            //Draw the content in the PDF page
            graphics.DrawString(title, font, brush, new PointF(point.X, point.Y));

            bookmarks.Destination = new PdfDestination(page);
            bookmarks.Destination.Location = point;

            return bookmarks;
        }

        public PdfBookmark AddSection(PdfBookmark bookmark, PdfPage page, string title, PointF point, bool isSubSection)
        {
            //Create Pdf graphics for the page
            PdfGraphics graphics = page.Graphics;

            //Add bookmark in PDF document
            PdfBookmark bookmarks = bookmark.Add(title);

            brush = new PdfSolidBrush(Color.Green);

            if (bookmark.Title.StartsWith("Section"))
            {
                brush = new PdfSolidBrush(Color.Blue);
            }

            //Draw the content in the PDF page
            graphics.DrawString(title, font, brush, new PointF(point.X, point.Y));

            bookmarks.Destination = new PdfDestination(page);
            bookmarks.Destination.Location = point;

            return bookmarks;
        }
        #endregion

        # region Events
        /// <summary>
        /// Creates PDF
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            //Creates a new PDF document.
            document = new PdfDocument();
            
            //Set the Font.
            font = new PdfStandardFont(PdfFontFamily.Helvetica, 10f);

            //Create PdfBrush.
            brush = new PdfSolidBrush(Color.Black);

            for (int i = 1; i <= 3; i++)
            {
                PdfPage pages = document.Pages.Add();

                //Add bookmark in PDF document.
                PdfBookmark bookmark = AddBookmark(pages, "Chapter " + i, new PointF(10, 10));
                bookmark.Color = Color.Red;
                //Add sections to bookmark.
                PdfBookmark section1 = AddSection(bookmark, pages, "Section " + i + ".1", new PointF(30, 30), false);
                section1.Color = Color.Green;
                PdfBookmark section2 = AddSection(bookmark, pages, "Section " + i + ".2", new PointF(30, 400), false);
                section2.Color = Color.Green;
                //Add subsections to section.
                PdfBookmark subsection1 = AddSection(section1, pages, "Paragraph " + i + ".1.1", new PointF(50, 50), true);
                subsection1.Color = Color.Blue;
                PdfBookmark subsection2 = AddSection(section1, pages, "Paragraph " + i + ".1.2", new PointF(50, 150), true);
                subsection2.Color = Color.Blue;
                PdfBookmark subsection3 = AddSection(section1, pages, "Paragraph " + i + ".1.3", new PointF(50, 250), true);
                subsection3.Color = Color.Blue;
                PdfBookmark subsection4 = AddSection(section2, pages, "Paragraph " + i + ".2.1", new PointF(50, 420), true);
                subsection4.Color = Color.Blue;
                PdfBookmark subsection5 = AddSection(section2, pages, "Paragraph " + i + ".2.2", new PointF(50, 560), true);
                subsection5.Color = Color.Blue;
                PdfBookmark subsection6 = AddSection(section2, pages, "Paragraph " + i + ".2.3", new PointF(50, 680), true);
                subsection6.Color = Color.Blue;
            }

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
    }
}