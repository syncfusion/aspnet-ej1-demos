using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Drawing;
using System.Drawing.Imaging;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Syncfusion.Pdf;
using Syncfusion.Pdf.Security;
using Syncfusion.Pdf.Graphics;
using System.IO;
using Syncfusion.Pdf.Parsing;

namespace WebSampleBrowser.Pdf
{
    public partial class DigitalSignature : System.Web.UI.Page
    {
        # region Private Members
        PdfLoadedDocument doc;
        PdfSignature signature;
        PdfBitmap bmp;
        PdfGraphics g;
        PdfCertificate pdfCert;
        Stream sfile1;
        # endregion

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
        /// Creates a new PDF and signs it
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnNewPDF_Click(object sender, EventArgs e)
        {
            PdfDocument doc = new PdfDocument();
            PdfPage page = doc.Pages.Add();
            PdfSolidBrush brush = new PdfSolidBrush(Color.Black);
            PdfPen pen = new PdfPen(brush, 0.2f);
            PdfFont font = new PdfStandardFont(PdfFontFamily.Courier, 12, PdfFontStyle.Regular);

            try
            {
                pdfCert = new PdfCertificate(ResolveApplicationDataPath("PDF.pfx", false), "syncfusion");
                signature = new PdfSignature(page, pdfCert, "Signature");
                bmp = new PdfBitmap(ResolveApplicationDataPath("syncfusion_logo.gif", true));

                signature.Bounds = new RectangleF(new PointF(5, 5), page.Size);
                signature.ContactInfo = "johndoe@owned.us";
                signature.LocationInfo = "Honolulu, Hawaii";
                signature.Reason = "I am author of this document.";

                if (radioAuthor.Checked)
                    signature.Certificated = true;
                else
                    signature.Certificated = false;
                g = signature.Appearence.Normal.Graphics;
            }
            catch (Exception)
            {
                g = signature.Appearence.Normal.Graphics;

                Response.Write("Warning Certificate not found \"Cannot sign This Document\"");

                //Draw the Text at specified location.
                g.DrawString("Warning this document is not signed", font, brush, new PointF(0, 20));
                g.DrawString("Create a self signed Digital ID to sign this document", font, brush, new PointF(20, 40));
                g.DrawLine(pen, new PointF(0, 100), new PointF(page.GetClientSize().Width, 200));
                g.DrawLine(pen, new PointF(0, 200), new PointF(page.GetClientSize().Width, 100));
            }

            string validto = "Valid To: " + signature.Certificate.ValidTo.ToString();
            string validfrom = "Valid From: " + signature.Certificate.ValidFrom.ToString();

            g.DrawImage(bmp, 0, 0);

            doc.Pages[0].Graphics.DrawString(validfrom, font, pen, brush, 0, 90);
            doc.Pages[0].Graphics.DrawString(validto, font, pen, brush, 0, 110);

            doc.Pages[0].Graphics.DrawString(" Protected Document. Digitally signed Document.", font, pen, brush, 0, 130);
            doc.Pages[0].Graphics.DrawString("* To validate Signature click on the signature on this page \n * To check Document Status \n click document status icon on the bottom left of the acrobat reader.", font, pen, brush, 0, 150);

            // Save the pdf document to the Stream.
            MemoryStream stream = new MemoryStream();
            doc.Save(stream);
            Response.ClearContent();
            Response.Expires = 0;
            Response.Buffer = true;

            string disposition = "content-disposition";
            Response.AddHeader(disposition, "attachment; filename=Sample.pdf");
            Response.AddHeader("Content-Type", "application/pdf");
            Response.Clear();
            stream.WriteTo(Response.OutputStream);
            Response.End();

            doc.Close();
        }

        /// <summary>
        /// Opens the existing PDF and signs it
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnOldPDF_Click(object sender, EventArgs e)
        {
            try
            {
                if (textBoxPassword.Text != String.Empty && System.IO.Path.GetExtension(File1.PostedFile.FileName).Equals(".pdf"))
                {
                    sfile1 = File1.PostedFile.InputStream;
                    doc = new PdfLoadedDocument(sfile1);


                    PdfPageBase page = doc.Pages[0];

                    string fileName = Path.GetTempFileName();
                    fileName = fileName.Remove(fileName.Length - 4, 4);
                    fileName += ".pfx";
                    File2.PostedFile.SaveAs(fileName);

                    if (System.IO.Path.GetExtension(File2.PostedFile.FileName).Equals(".pfx") && textBoxPassword.Text != String.Empty)
                        pdfCert = new PdfCertificate(fileName, textBoxPassword.Text);
                    bmp = new PdfBitmap(new MemoryStream(Convert.FromBase64String(myHiddenInput.Value.Substring(22))));
                    page.Graphics.DrawImage(bmp, new PointF(page.Graphics.ClientSize.Width - 105, page.Graphics.ClientSize.Height - 80), new SizeF(100, 75));
                    signature = new PdfSignature(doc, page, pdfCert, "Signature");

                    signature.Bounds = new RectangleF(new PointF(page.Graphics.ClientSize.Width - 105, page.Graphics.ClientSize.Height - 80), new SizeF(100, 75));
                    string validto = "Valid To: " + signature.Certificate.ValidTo.ToString();
                    string validfrom = "Valid From: " + signature.Certificate.ValidFrom.ToString();

                    // Save the pdf document to the Stream.
                    MemoryStream stream = new MemoryStream();
                    doc.Save(stream);
                    if (File.Exists(fileName))
                    {
                        File.Delete(fileName);
                    }
                    Response.ClearContent();
                    Response.Expires = 0;
                    Response.Buffer = true;

                    string disposition = "content-disposition";
                    Response.AddHeader(disposition, "attachment; filename=Sample.pdf");
                    Response.AddHeader("Content-Type", "application/pdf");
                    Response.Clear();
                    stream.WriteTo(Response.OutputStream);
                    Response.End();

                    sfile1.Close();

                    doc.Close();
                }
                else
                    this.label.Text = "<font color=red>NOTE: Fill all fields and then create PDF</font>";
            }
            catch (Exception ex)
            {
                this.label.Text = "<font color=red>" + ex.ToString() + "</font>";
            }
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