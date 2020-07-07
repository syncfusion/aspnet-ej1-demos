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
using Syncfusion.Pdf.Interactive;
using Syncfusion.Pdf.Grid;

namespace WebSampleBrowser.Pdf
{
    public partial class TableFeatures : System.Web.UI.Page
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
        PdfPen borderPen;
        PdfPen transparentPen;
        float cellSpacing = 7f;
        float margin = 40f;
        PdfFont smallFont;
        # endregion
        # region Events
        /// <summary>
        /// Creates PDF document
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            # region Field Definitions
            PdfStandardFont font = new PdfStandardFont(PdfFontFamily.TimesRoman, 8f);
            smallFont = new PdfStandardFont(font, 5f);
            PdfFont bigFont = new PdfStandardFont(font, 16f);
            PdfBrush orangeBrush = new PdfSolidBrush(new PdfColor(247, 148, 29));
            PdfBrush grayBrush = new PdfSolidBrush(new PdfColor(170, 171, 171));

            borderPen = new PdfPen(new PdfColor(System.Drawing.Color.FromArgb(Color.DarkGray.A, Color.DarkGray.R, Color.DarkGray.G, Color.DarkGray.B)), .3f);
            borderPen.LineCap = PdfLineCap.Square;
            transparentPen = new PdfPen(new PdfColor(System.Drawing.Color.FromArgb(Color.Transparent.A, Color.Transparent.R, Color.Transparent.G, Color.Transparent.B)), .3f);
            transparentPen.LineCap = PdfLineCap.Square;
            # endregion

            PdfDocument document = new PdfDocument();
            document.PageSettings.Margins.All = 0;

            # region Footer
            PdfPageTemplateElement footer = new PdfPageTemplateElement(new RectangleF(new PointF(0, document.PageSettings.Height - 40), new SizeF(document.PageSettings.Width, 40)));
            footer.Graphics.DrawRectangle(new PdfSolidBrush(new PdfColor(77, 77, 77)), footer.Bounds);
            footer.Graphics.DrawString("//www.syncfusion.com", font, grayBrush, new PointF(footer.Width - (footer.Width / 4), 15));
            footer.Graphics.DrawString("Copyright © 2001 - 2015 Syncfusion Inc.", font, grayBrush, new PointF(0, 15));
            document.Template.Bottom = footer;
            # endregion

            PdfPage page = document.Pages.Add();

            page.Graphics.DrawRectangle(orangeBrush, new RectangleF(PointF.Empty, new SizeF(page.Graphics.ClientSize.Width, margin)));
            page.Graphics.DrawString("Essential Studio Reporting Edition", bigFont, PdfBrushes.White, new PointF(10, 10));

            # region PdfLightTable
            PdfLightTable pdfLightTable = new PdfLightTable();
            pdfLightTable.DataSource = GetProductsDataSet();
            pdfLightTable.Style.DefaultStyle.BorderPen = transparentPen;

            for (int i = 0; i < pdfLightTable.Columns.Count; i++)
            {
                if (i % 2 == 0)
                    pdfLightTable.Columns[i].Width = 16.5f;
            }

            pdfLightTable.Style.CellSpacing = cellSpacing;
            pdfLightTable.BeginRowLayout += new BeginRowLayoutEventHandler(pdfLightTable_BeginRowLayout);
            pdfLightTable.BeginCellLayout += new BeginCellLayoutEventHandler(pdfLightTable_BeginCellLayout);
            pdfLightTable.Style.DefaultStyle.Font = font;
            PdfLayoutResult result = pdfLightTable.Draw(page, new RectangleF(new PointF(margin, 70), new SizeF(page.Graphics.ClientSize.Width - (2 * margin), page.Graphics.ClientSize.Height - margin)));

            # endregion

            page.Graphics.DrawString("What You Get with Syncfusion", bigFont, orangeBrush, new PointF(margin, result.Bounds.Bottom + 50));

            # region PdfGrid
            PdfGrid pdfGrid = new PdfGrid();
            pdfGrid.DataSource = GetReportsDataSet();
            pdfGrid.Headers.Clear();
            pdfGrid.Columns[0].Width = 80;
            pdfGrid.Style.Font = font;
            pdfGrid.Style.CellSpacing = 15f;

            for (int i = 0; i < pdfGrid.Rows.Count; i++)
            {
                if (i % 2 == 0)
                {
                    PdfGridCell cell = pdfGrid.Rows[i].Cells[0];
                    cell.RowSpan = 2;

                    cell.Style.BackgroundImage = new PdfBitmap(ResolveApplicationDataPath(string.Format("{0}.jpg", cell.Value.ToString().ToLower())));
                    cell.Value = "";

                    cell = pdfGrid.Rows[i].Cells[1];
                    cell.Style.Font = bigFont;
                }
                for (int j = 0; j < pdfGrid.Columns.Count; j++)
                {
                    pdfGrid.Rows[i].Cells[j].Style.Borders.All = transparentPen;
                }
            }

            PdfGridLayoutFormat gridLayoutFormat = new PdfGridLayoutFormat();
            gridLayoutFormat.Layout = PdfLayoutType.Paginate;

            pdfGrid.Draw(page, new RectangleF(new PointF(margin, result.Bounds.Bottom + 75), new SizeF(page.Graphics.ClientSize.Width - (2 * margin), page.Graphics.ClientSize.Height - margin)), gridLayoutFormat);

            # endregion
            //Stream the output to the browser.	
            if (this.CheckBox1.Checked)
                document.Save("Sample.pdf", Response, HttpReadType.Open);
            else
                document.Save("Sample.pdf", Response, HttpReadType.Save);
        }

        /// <summary>
        /// Returns dataset.
        /// </summary>
        private DataSet GetProductsDataSet()
        {
            DataSet dataSet = new DataSet();
            dataSet.ReadXml(ResolveApplicationDataPath1("Products.xml"));
            return dataSet;
        }
        /// <summary>
        /// Returns dataset.
        /// </summary>
        private DataSet GetReportsDataSet()
        {
            DataSet dataSet = new DataSet();
            dataSet.ReadXml(ResolveApplicationDataPath1("Report.xml"));
            return dataSet;
        }
        /// <summary>
        /// Draws ellipse inside the cell using cell bounds.
        /// </summary>
        void table_StartCellLayout(object sender, BeginCellLayoutEventArgs args)
        {
            int rowIndex = args.RowIndex;
            int cellIndex = args.CellIndex;

            if (rowIndex < 30 && rowIndex >= 0 && (rowIndex & 1) == 0)
            {
                PdfGraphics g = args.Graphics;
                g.DrawEllipse(PdfBrushes.LightBlue, args.Bounds);
            }
        }
        # region PdfLightTable Events

        void pdfLightTable_BeginRowLayout(object sender, BeginRowLayoutEventArgs args)
        {
            if (args.RowIndex % 2 == 0)
                args.MinimalHeight = 20;
            else
                args.MinimalHeight = 30;
        }

        void pdfLightTable_BeginCellLayout(object sender, BeginCellLayoutEventArgs args)
        {
            if (args.RowIndex > -1 && args.CellIndex > -1)
            {
                float x = args.Bounds.X;
                float y = args.Bounds.Y;
                float width = args.Bounds.Right;
                float height = args.Bounds.Bottom;

                if (args.Value == "dummy")
                {
                    args.Skip = true;
                    return;
                }

                if (args.CellIndex % 2 == 0 && !string.IsNullOrEmpty(args.Value))
                {
                    args.Skip = true;
                    PdfBitmap img = new PdfBitmap(ResolveApplicationDataPath(string.Format("{0}.jpg", args.Value.ToString().ToLower())));
                    RectangleF rect = args.Bounds;
                    args.Graphics.DrawImage(img, new RectangleF(rect.X + 2, rect.Y + 2, rect.Width - 2, rect.Height - 2));
                }

                if (args.Value.Contains("http"))
                {
                    args.Skip = true;

                    // Create the Text Web Link
                    PdfTextWebLink textLink = new PdfTextWebLink();
                    textLink.Url = args.Value;
                    textLink.Text = "Know more...";
                    textLink.Brush = PdfBrushes.Black;
                    textLink.Font = smallFont;
                    textLink.DrawTextWebLink(args.Graphics, new PointF(args.Bounds.X + 2 * args.Bounds.Width / 3, args.Bounds.Y));
                }

                # region Draw manual borders
                if (args.RowIndex % 3 == 0)//top
                {
                    if (args.CellIndex % 2 == 0)
                        width += cellSpacing;
                    args.Graphics.DrawLine(borderPen, new PointF(x, y), new PointF(width, y));
                }
                else if (args.RowIndex % 3 == 2)//bottom
                {
                    if (args.CellIndex % 2 == 0)
                        width += cellSpacing;
                    args.Graphics.DrawLine(borderPen, new PointF(x, height), new PointF(width, height));
                }

                if (args.CellIndex % 2 == 0)//left
                {
                    if (args.RowIndex % 3 != 2)
                        height += cellSpacing;
                    args.Graphics.DrawLine(borderPen, new PointF(x, y), new PointF(x, height));
                }
                else if (args.CellIndex % 2 != 0)//right
                {
                    if (args.RowIndex % 3 != 2)
                        height += cellSpacing;
                    args.Graphics.DrawLine(borderPen, new PointF(width, y), new PointF(width, height));
                }
                # endregion
            }
        }

        # endregion


        # endregion       

        # region Helpher Methods

        /// <summary>
        /// Data folder path is resolved from requested page physical path
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        protected string ResolveApplicationDataPath(string fileName)
        {
            string dataPath = new System.IO.DirectoryInfo(Server.MapPath("~\\Content") + "\\PDF").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
        /// <summary>
        /// Data folder path is resolved from requested page physical path
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        protected string ResolveApplicationDataPath1(string fileName)
        {
            string dataPath = new System.IO.DirectoryInfo(Server.MapPath("~\\App_Data") + "\\PDF").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
        # endregion
    }
}