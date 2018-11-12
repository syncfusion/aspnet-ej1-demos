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
using Syncfusion.Pdf.Security;
using Syncfusion.Pdf.Interactive;

namespace WebSampleBrowser.Pdf
{
    public partial class EncryptionSupport : System.Web.UI.Page
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
        /// Creates Pdf document
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            PdfDocument document = new PdfDocument();
            PdfPage page = document.Pages.Add();
            PdfGraphics graphics = page.Graphics;

            PdfStandardFont font = new PdfStandardFont(PdfFontFamily.TimesRoman, 14f, PdfFontStyle.Bold);
            PdfBrush brush = PdfBrushes.Black;
            PdfForm form = document.Form;

            //Document security
            PdfSecurity security = document.Security;

            //Specify key size and encryption algorithm
            if (rdButtonKeySizeList.SelectedValue == "40 Bit")
            {
                //use 40 bits key in RC4 mode
                security.KeySize = PdfEncryptionKeySize.Key40Bit;
            }
            else if (rdButtonKeySizeList.SelectedValue == "128 Bit")
            {

                security.KeySize = PdfEncryptionKeySize.Key128Bit;
                if (rdButtonAlgorithmList.SelectedValue == "RC4")
                {
                    //use 128 bits key in RC4 mode
                    security.Algorithm = PdfEncryptionAlgorithm.RC4;
                }
                else if (rdButtonAlgorithmList.SelectedValue == "AES")
                {
                    //use 128 bits key in AES mode
                    security.Algorithm = PdfEncryptionAlgorithm.AES;
                }
            }
            else if (rdButtonKeySizeList.SelectedValue == "256 Bit")
            {
                //use 256 bits key in AES mode
                security.KeySize = PdfEncryptionKeySize.Key256Bit;
                security.Algorithm = PdfEncryptionAlgorithm.AES;
            }
            else if (rdButtonKeySizeList.SelectedValue == "256 Bit Revision 6")
            {
                //use 256 bit key in AES mode with revision 6 for PDF 2.0 security.
                security.KeySize = PdfEncryptionKeySize.Key256BitRevision6;
                security.Algorithm = PdfEncryptionAlgorithm.AES;
            }

            security.OwnerPassword = "syncfusion";
            security.Permissions = PdfPermissionsFlags.Print | PdfPermissionsFlags.FullQualityPrint;
            security.UserPassword = "password";

            string text = "Security options:\n\n" + String.Format("KeySize: {0}\n\nEncryption Algorithm: {4}\n\nOwner Password: {1}\n\nPermissions: {2}\n\n" +
                "UserPassword: {3}", security.KeySize, security.OwnerPassword, security.Permissions, security.UserPassword, security.Algorithm);
            if (rdButtonKeySizeList.SelectedValue == "256 Bit Revision 6")
            {
                text += String.Format("\n\nRevision: {0}", "Revision 6");
            }
            else if (rdButtonKeySizeList.SelectedValue == "256 Bit")
            {
                text += String.Format("\n\nRevision: {0}", "Revision 5");
            }
            graphics.DrawString("Document is Encrypted with following settings", font, brush, PointF.Empty);
            font = new PdfStandardFont(PdfFontFamily.TimesRoman, 11f, PdfFontStyle.Bold);
            graphics.DrawString(text, font, brush, new PointF(0, 40));

            //Stream the output to the browser.	
            if (this.CheckBox1.Checked)
                document.Save("Sample.pdf", Response, HttpReadType.Open);
            else
                document.Save("Sample.pdf", Response, HttpReadType.Save);
        }

        protected void rdButtonKeySizeList_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (this.rdButtonKeySizeList.SelectedValue == "40 Bit")
            {
                this.rdButtonAlgorithmList.Items[0].Enabled = true;
                this.rdButtonAlgorithmList.SelectedIndex = 0;
                this.rdButtonAlgorithmList.Items[1].Enabled = false;

            }
            else if (this.rdButtonKeySizeList.SelectedValue == "256 Bit")
            {
                this.rdButtonAlgorithmList.Items[1].Enabled = true;
                this.rdButtonAlgorithmList.SelectedIndex = 1;
                this.rdButtonAlgorithmList.Items[0].Enabled = false;
            }
            else if (this.rdButtonKeySizeList.SelectedValue == "256 Bit Revision 6")
            {
                this.rdButtonAlgorithmList.Items[1].Enabled = true;
                this.rdButtonAlgorithmList.SelectedIndex = 1;
                this.rdButtonAlgorithmList.Items[0].Enabled = false;
            }
            else
            {
                this.rdButtonAlgorithmList.Items[1].Enabled = true;
                this.rdButtonAlgorithmList.Items[0].Enabled = true;
            }


        }
        # endregion
    }
}