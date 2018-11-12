using System;
using System.Data;
using System.Text;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Syncfusion.Pdf;
using Syncfusion.Pdf.Graphics;
using Syncfusion.Pdf.Interactive;
using Syncfusion.HtmlConverter;
using Syncfusion.Pdf.HtmlToPdf;
using System.Threading;

namespace WebSampleBrowser.Pdf
{
    public partial class HtmlToPdf : System.Web.UI.Page
    {
        PdfDocument doc;

        # region Page Load
        /// <summary>
        /// Handles the page load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                for (int i = 0; i <= 50; i++)
                    this.DropDownList1.Items.Add(i.ToString());
                this.DropDownList1.SelectedIndex = 0;
                this.RadioButtonList2.SelectedIndex = 0;
            }
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
            Thread thread = new Thread(ConvertHtmlToPdf);
            thread.SetApartmentState(ApartmentState.STA);
            thread.Start();
            thread.Join();

            if (this.CheckBox1.Checked)
            {
                // Save PDF document
                doc.Save("Sample.pdf", Response, HttpReadType.Open);
            }
            else
            {
                doc.Save("Sample.pdf", Response, HttpReadType.Save);
            }
        }
        private void ConvertHtmlToPdf()
        {

            if (this.chkPDFA.Checked)
            {
                //Create a PDF document in PDF_A1B standard
                doc = new PdfDocument(PdfConformanceLevel.Pdf_A1B);
            }
            else
            {
                //Create a PDF document
                doc = new PdfDocument();
            }

            //Set page margins
            doc.PageSettings.SetMargins(float.Parse(this.DropDownList1.SelectedValue));

            //Set page orientation
            if (this.RadioButtonList2.SelectedIndex == 0)
                doc.PageSettings.Orientation = PdfPageOrientation.Portrait;
            else
                doc.PageSettings.Orientation = PdfPageOrientation.Landscape;

            //Set rotation
            doc.PageSettings.Rotate = (PdfPageRotateAngle)Enum.Parse(typeof(PdfPageRotateAngle), this.DropDownList2.SelectedItem.ToString());

            PdfPage page = null;
            SizeF pageSize = SizeF.Empty;
            PdfUnitConvertor convertor = new PdfUnitConvertor();
            float width = -1;
            float height = -1;

            if (!chkTag.Checked)
            {
                page = doc.Pages.Add();

                pageSize = page.GetClientSize();

                width = convertor.ConvertToPixels(page.GetClientSize().Width, PdfGraphicsUnit.Point);
            }
            else
            {
                width = convertor.ConvertToPixels(doc.PageSettings.Width, PdfGraphicsUnit.Point);
                height = convertor.ConvertToPixels(doc.PageSettings.Height, PdfGraphicsUnit.Point);
            }

            //Adding Header
            if (CheckBox2.Checked)
                this.AddHeader(doc, "Syncfusion Essential PDF", " ");

            //Adding Footer
            if (CheckBox3.Checked)
                this.AddFooter(doc, "@Copyright 2008");

            using (HtmlConverter html = new HtmlConverter())
            {
                // setting Javascript
                html.EnableJavaScript = this.chkJavaScript.Checked;
                // Setting Pagebreak
                html.AutoDetectPageBreak = this.chkPageBreak.Checked;
                // set hyperlink
                html.EnableHyperlinks = this.chkHyperlink.Checked;

                if (this.RadioButtonList1.Items[0].Selected && !chkTag.Checked)
                {
                    HtmlToPdfResult result = html.Convert(this.TextBox1.Text, ImageType.Metafile, (int)width, (int)height, AspectRatio.KeepWidth);

                    if (result != null)
                    {
                        PdfMetafile mf = new PdfMetafile(result.RenderedImage as Metafile);
                        mf.Quality = 100;

                        PdfMetafileLayoutFormat format = new PdfMetafileLayoutFormat();
                        format.Break = PdfLayoutBreakType.FitPage;
                        format.Layout = PdfLayoutType.Paginate;
                        doc.PageSettings.Height = result.RenderedImage.Size.Height;
                        format.SplitTextLines = this.chktextBreak.Checked;
                        format.SplitImages = this.chkImageBreak.Checked;

                        result.Render(page, format);
                    }
                    else
                        Response.Write("Warning ! Please check the HTML link");
                }
                else if (this.RadioButtonList1.Items[1].Selected)
                {
                    using (System.Drawing.Image img = html.ConvertToImage(this.TextBox1.Text, ImageType.Bitmap, (int)width, -1, AspectRatio.KeepWidth))
                    {
                        if (img != null)
                        {
                            PdfImage image = new PdfBitmap(img);
                            PdfLayoutFormat format = new PdfLayoutFormat();
                            format.Break = PdfLayoutBreakType.FitPage;
                            format.Layout = PdfLayoutType.Paginate;
                            if (img.Size.Width > pageSize.Width)
                            {
                                //Bitmap
                                image.Draw(page, new RectangleF(0, 0, pageSize.Width, pageSize.Height), format);
                            }
                            else
                            {
                                //Bitmap
                                image.Draw(page, new RectangleF(0, 0, img.Width, img.Height), format);
                            }
                        }
                        else
                            Response.Write("Warning ! Please check the HTML link");
                    }
                }
                else if (chkTag.Checked)
                {
                    // Convert to Tagged PDF.
                    html.ConvertToTaggedPDF(doc, TextBox1.Text);
                }
            }

            
        }

        /// <summary>
        /// PageBreak option work only with Metafile ImageType. Page-break will not be recognized if we try convert it to Bitmap.\n\nPlease select Metafile ImageType.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.RadioButtonList1.SelectedValue == "Metafile")
            {
                this.chkPageBreak.Enabled = true;
                this.chkImageBreak.Enabled = true;
                this.chktextBreak.Enabled = true;
                this.chkPDFA.Enabled = true;
                this.chkHyperlink.Enabled = true;
                this.chkPDFA.Checked = true;
                this.chkHyperlink.Checked = true;
                this.chkTag.Enabled = true;
            }
            else
            {
                this.chkPageBreak.Enabled = false;
                this.chkPageBreak.Checked = false;
                this.chkImageBreak.Enabled = false;
                this.chktextBreak.Enabled = false;
                this.chkPDFA.Enabled = false;
                this.chkHyperlink.Enabled = false;
                this.chkPDFA.Checked = false;
                this.chkHyperlink.Checked = false;
                this.chkTag.Enabled = false;
                this.chkTag.Checked = false;
            }
        }

        protected void chkTag_CheckedChanged(object sender, EventArgs e)
        {
            if (chkTag.Checked)
                this.chkHyperlink.Enabled = false;
            else
                this.chkHyperlink.Enabled = true;
        }
        # endregion

        # region Helpher Methods
        /// <summary>
        /// Adds header to the document
        /// </summary>
        /// <param name="doc"></param>
        /// <param name="title"></param>
        /// <param name="description"></param>
        private void AddHeader(PdfDocument doc, string title, string description)
        {
            RectangleF rect = new RectangleF(0, 0, doc.PageSettings.Width, 50);

            Font f = new Font("Helvetica", 24, FontStyle.Regular);

            //Create page template
            PdfPageTemplateElement header = new PdfPageTemplateElement(rect);
            PdfFont font = new PdfTrueTypeFont(f, true);
            float doubleHeight = font.Height * 2;
            Color activeColor = Color.FromArgb(44, 71, 120);
            SizeF imageSize = new SizeF(110f, 35f);
            //Locating the logo on the right corner of the Drawing Surface
            PointF imageLocation = new PointF(doc.PageSettings.Width - imageSize.Width - 20, 5);

            PdfImage img = new PdfBitmap(ResolveApplicationDataPath("logo.png"));

            //Draw the image in the Header.
            header.Graphics.DrawImage(img, imageLocation, imageSize);

            PdfSolidBrush brush = new PdfSolidBrush(activeColor);

            PdfPen pen = new PdfPen(Color.DarkBlue, 3f);
            f = new Font("Helvetica", 16, FontStyle.Bold);
            font = new PdfTrueTypeFont(f, true);
            //font = new PdfStandardFont(PdfFontFamily.Helvetica, 16, PdfFontStyle.Bold);

            //Set formattings for the text
            PdfStringFormat format = new PdfStringFormat();
            format.Alignment = PdfTextAlignment.Center;
            format.LineAlignment = PdfVerticalAlignment.Middle;

            //Draw title
            header.Graphics.DrawString(title, font, brush, new RectangleF(0, 0, header.Width, header.Height), format);
            brush = new PdfSolidBrush(Color.Gray);
            f = new Font("Helvetica", 6, FontStyle.Bold);
            font = new PdfTrueTypeFont(f, true);

            format = new PdfStringFormat();
            format.Alignment = PdfTextAlignment.Left;
            format.LineAlignment = PdfVerticalAlignment.Bottom;

            //Draw description
            header.Graphics.DrawString(description, font, brush, new RectangleF(0, 0, header.Width, header.Height - 8), format);

            //Draw some lines in the header
            pen = new PdfPen(Color.DarkBlue, 0.7f);
            header.Graphics.DrawLine(pen, 0, 0, header.Width, 0);
            pen = new PdfPen(Color.DarkBlue, 2f);
            header.Graphics.DrawLine(pen, 0, 03, header.Width + 3, 03);
            pen = new PdfPen(Color.DarkBlue, 2f);
            header.Graphics.DrawLine(pen, 0, header.Height - 3, header.Width, header.Height - 3);
            header.Graphics.DrawLine(pen, 0, header.Height, header.Width, header.Height);

            //Add header template at the top.
            doc.Template.Top = header;
        }

        /// <summary>
        /// Adds footer to the document
        /// </summary>
        /// <param name="doc"></param>
        /// <param name="footerText"></param>
        private void AddFooter(PdfDocument doc, string footerText)
        {
            RectangleF rect = new RectangleF(0, 0, doc.PageSettings.Width, 50);

            //Create a page template
            PdfPageTemplateElement footer = new PdfPageTemplateElement(rect);

            Font f = new Font("Helvetica", 8, FontStyle.Regular);
            PdfFont font = new PdfTrueTypeFont(f, true);

            PdfSolidBrush brush = new PdfSolidBrush(Color.Gray);

            PdfPen pen = new PdfPen(Color.DarkBlue, 3f);
            f = new Font("Helvetica", 6, FontStyle.Bold);
            font = new PdfTrueTypeFont(f, true);

            PdfStringFormat format = new PdfStringFormat();
            format.Alignment = PdfTextAlignment.Center;
            format.LineAlignment = PdfVerticalAlignment.Middle;
            footer.Graphics.DrawString(footerText, font, brush, new RectangleF(0, 18, footer.Width, footer.Height), format);

            format = new PdfStringFormat();
            format.Alignment = PdfTextAlignment.Right;
            format.LineAlignment = PdfVerticalAlignment.Bottom;

            //Create page number field
            PdfPageNumberField pageNumber = new PdfPageNumberField(font, brush);

            //Create page count field
            PdfPageCountField count = new PdfPageCountField(font, brush);

            PdfCompositeField compositeField = new PdfCompositeField(font, brush, "Page {0} of {1}", pageNumber, count);
            compositeField.Bounds = footer.Bounds;
            compositeField.Draw(footer.Graphics, new PointF(470, 40));

            //Add the footer template at the bottom
            doc.Template.Bottom = footer;
        }

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

        # endregion
    }
}