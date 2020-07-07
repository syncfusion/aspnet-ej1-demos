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
using Syncfusion.Pdf.Barcode;

namespace WebSampleBrowser.Pdf
{
    public partial class Barcode : System.Web.UI.Page
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
            //Create a new instance of PdfDocument class.
            PdfDocument document = new PdfDocument();

            //Add a new page to the document.
            PdfPage page = document.Pages.Add();

            //Create Pdf graphics for the page
            PdfGraphics g = page.Graphics;

            //Create a solid brush
            PdfBrush brush = PdfBrushes.Black;

            # region 2D Barcode

            //Set the font
            PdfFont font = new PdfStandardFont(PdfFontFamily.Helvetica, 15f, PdfFontStyle.Bold);

            PdfPen pen = new PdfPen(brush, 0.5f);
            float width = page.GetClientSize().Width;

            float xPos = page.GetClientSize().Width / 2;


            PdfStringFormat format = new PdfStringFormat();
            format.Alignment = PdfTextAlignment.Center;

            // Draw String
            g.DrawString("2D Barcodes", font, brush, new PointF(xPos, 10), format);

            #region QR Barcode
            font = new PdfStandardFont(PdfFontFamily.Helvetica, 12f, PdfFontStyle.Bold);
            g.DrawString("QR Barcode", font, brush, new PointF(10, 90));

            PdfQRBarcode qrBarcode = new PdfQRBarcode();

            // Sets the Input mode to Binary mode
            qrBarcode.InputMode = InputMode.BinaryMode;

            // Automatically select the Version
            qrBarcode.Version = QRCodeVersion.Auto;

            // Set the Error correction level to high
            qrBarcode.ErrorCorrectionLevel = PdfErrorCorrectionLevel.High;

            // Set dimension for each block
            qrBarcode.XDimension = 4;
            qrBarcode.Text = "Syncfusion Essential Studio Enterprise edition $995";

            // Draw the QR barcode
            qrBarcode.Draw(page, new PointF(25, 120));

            font = new PdfStandardFont(PdfFontFamily.TimesRoman, 9, PdfFontStyle.Regular);

            g.DrawString("Input Type :   Eight Bit Binary", font, brush, new PointF(250, 160));
            g.DrawString("Encoded Data : Syncfusion Essential Studio Enterprise edition $995", font, brush, new PointF(250, 180));

            g.DrawLine(pen, new PointF(0, 320), new PointF(width, 320));

            #endregion

            #region Datamatrix
            font = new PdfStandardFont(PdfFontFamily.Helvetica, 12f, PdfFontStyle.Bold);
            g.DrawString("DataMatrix Barcode", font, brush, new PointF(10, 340));

            PdfDataMatrixBarcode dataMatrixBarcode = new PdfDataMatrixBarcode("5575235 Win7 4GB 64bit 7Jun2010");

            // Set dimension for each block
            dataMatrixBarcode.XDimension = 4;

            // Draw the barcode
            dataMatrixBarcode.Draw(page, new PointF(25, 540));

            font = new PdfStandardFont(PdfFontFamily.TimesRoman, 9, PdfFontStyle.Regular);

            g.DrawString("Symbol Type : Square", font, brush, new PointF(250, 590));
            g.DrawString("Encoded Data : 5575235 Win7 4GB 64bit 7Jun2010", font, brush, new PointF(250, 610));

            pen = new PdfPen(brush, 0.5f);
            g.DrawLine(pen, new PointF(0, 700), new PointF(width, 700));

            string text = "TYPE 3523 - ETWS/N FE- SDFHW 06/08";

            dataMatrixBarcode = new PdfDataMatrixBarcode(text);

            // rectangular matrix
            dataMatrixBarcode.Size = PdfDataMatrixSize.Size16x48;

            dataMatrixBarcode.XDimension = 4;

            dataMatrixBarcode.Draw(page, new PointF(25, 400));

            g.DrawString("Symbol Type : Rectangle", font, brush, new PointF(250, 420));
            g.DrawString("Encoded Data : " + text, font, brush, new PointF(250, 440));

            pen = new PdfPen(brush, 0.5f);
            #endregion
            # endregion

            # region 1D Barcode

            page = document.Pages.Add();
            g = page.Graphics;

            //Set the font
            font = new PdfStandardFont(PdfFontFamily.Helvetica, 15f, PdfFontStyle.Bold);

            // Draw String
            g.DrawString("1D/Linear Barcodes", font, brush, new PointF(150, 10));

            // Set string format.
            format = new PdfStringFormat();
            format.WordWrap = PdfWordWrapType.Word;

            #region Code39
            // Drawing Code39 barcode
            PdfCode39Barcode barcode = new PdfCode39Barcode();

            // Setting height of the barcode
            barcode.BarHeight = 45;
            barcode.Text = "CODE39$";

            //Printing barcode on to the Pdf.
            barcode.Draw(page, new PointF(25, 70));

            font = new PdfStandardFont(PdfFontFamily.TimesRoman, 9, PdfFontStyle.Regular);

            g.DrawString("Type : Code39", font, brush, new PointF(215, 80));
            g.DrawString("Allowed Characters : 0-9, A-Z,a dash(-),a dot(.),$,/,+,%, SPACE", font, brush, new PointF(215, 100));

            g.DrawLine(pen, new PointF(0, 150), new PointF(width, 150));
            #endregion

            #region Code39Extended
            // Drawing Code39Extended barcode
            PdfCode39ExtendedBarcode barcodeExt = new PdfCode39ExtendedBarcode();

            // Setting height of the barcode
            barcodeExt.BarHeight = 45;
            barcodeExt.Text = "CODE39Ext";

            //Printing barcode on to the Pdf.
            barcodeExt.Draw(page, new PointF(25, 200));

            font = new PdfStandardFont(PdfFontFamily.TimesRoman, 9, PdfFontStyle.Regular);

            g.DrawString("Type : Code39Ext", font, brush, new PointF(215, 210));
            g.DrawString("Allowed Characters : 0-9 A-Z a-z ", font, brush, new PointF(215, 230));

            g.DrawLine(pen, new PointF(0, 270), new PointF(width, 270));
            #endregion

            #region Code11Barcode
            // Drawing Code11  barcode
            PdfCode11Barcode barcode11 = new PdfCode11Barcode();

            // Setting height of the barcode
            barcode11.BarHeight = 45;
            barcode11.Text = "012345678";
            barcode11.EncodeStartStopSymbols = true;

            //Printing barcode on to the Pdf.
            barcode11.Draw(page, new PointF(25, 300));

            font = new PdfStandardFont(PdfFontFamily.TimesRoman, 9, PdfFontStyle.Regular);

            g.DrawString("Type : Code 11", font, brush, new PointF(215, 310));
            g.DrawString("Allowed Characters : 0-9, a dash(-) ", font, brush, new PointF(215, 330));

            g.DrawLine(pen, new PointF(0, 370), new PointF(width, 370));
            #endregion

            #region Codabar
            // Drawing CodaBarcode
            PdfCodabarBarcode codabar = new PdfCodabarBarcode();

            // Setting height of the barcode
            codabar.BarHeight = 45;
            codabar.Text = "0123";

            //Printing barcode on to the Pdf.
            codabar.Draw(page, new PointF(25, 400));

            font = new PdfStandardFont(PdfFontFamily.TimesRoman, 9, PdfFontStyle.Regular);

            g.DrawString("Type : Codabar", font, brush, new PointF(215, 410));
            g.DrawString("Allowed Characters : A,B,C,D,0-9,-$,:,/,a dot(.),+ ", font, brush, new PointF(215, 430));

            g.DrawLine(pen, new PointF(0, 470), new PointF(width, 470));
            #endregion

            #region Code32
            PdfCode32Barcode code32 = new PdfCode32Barcode();

            code32.Font = font;

            // Setting height of the barcode
            code32.BarHeight = 45;
            code32.Text = "01234567";
            code32.TextDisplayLocation = TextLocation.Bottom;
            code32.EnableCheckDigit = true;
            code32.ShowCheckDigit = true;

            //Printing barcode on to the Pdf.
            code32.Draw(page, new PointF(25, 500));

            g.DrawString("Type : Code32", font, brush, new PointF(215, 500));
            g.DrawString("Allowed Characters : 1 2 3 4 5 6 7 8 9 0 ", font, brush, new PointF(215, 520));

            g.DrawLine(pen, new PointF(0, 580), new PointF(width, 580));

            #endregion

            #region Code93
            PdfCode93Barcode code93 = new PdfCode93Barcode();

            // Setting height of the barcode
            code93.BarHeight = 45;
            code93.Text = "ABC 123456789";

            //Printing barcode on to the Pdf.
            code93.Draw(page, new PointF(25, 600));

            g.DrawString("Type : Code93", font, brush, new PointF(215, 600));
            g.DrawString("Allowed Characters : 1 2 3 4 5 6 7 8 9 0 A B C D E F G H I J K L M N O P Q R S T U V W X Y Z - . $ / + % SPACE ", font, brush, new RectangleF(215, 620, 300, 200), format);

            g.DrawLine(pen, new PointF(0, 680), new PointF(width, 680));
            #endregion

            #region Code93Extended
            PdfCode93ExtendedBarcode code93ext = new PdfCode93ExtendedBarcode();

            //Setting height of the barcode
            code93ext.BarHeight = 45;
            code93ext.EncodeStartStopSymbols = true;
            code93ext.Text = "(abc) 123456";

            //Printing barcode on to the Pdf.
            page = document.Pages.Add();
            code93ext.Draw(page, new PointF(25, 50));

            g = page.Graphics;
            g.DrawString("Type : Code93 Extended", font, brush, new PointF(200, 50));
            g.DrawString("Allowed Characters : All 128 ASCII characters ", font, brush, new PointF(200, 70));

            g.DrawLine(pen, new PointF(0, 120), new PointF(width, 120));
            #endregion

            #region Code128
            PdfCode128ABarcode barcode128A = new PdfCode128ABarcode();

            // Setting height of the barcode
            barcode128A.BarHeight = 45;
            barcode128A.Text = "ABCD 12345";
            barcode128A.EnableCheckDigit = true;
            barcode128A.EncodeStartStopSymbols = true;
            barcode128A.ShowCheckDigit = true;

            //Printing barcode on to the Pdf.
            barcode128A.Draw(page, new PointF(25, 135));

            g.DrawString("Type : Code128 A", font, brush, new PointF(200, 135));
            g.DrawString("Allowed Characters : NUL (0x00) SOH (0x01) STX (0x02) ETX (0x03) EOT (0x04) ENQ (0x05) ACK (0x06) BEL (0x07) BS (0x08) HT (0x09) LF (0x0A) VT (0x0B) FF (0x0C) CR (0x0D) SO (0x0E) SI (0x0F) DLE (0x10) DC1 (0x11) DC2 (0x12) DC3 (0x13) DC4 (0x14) NAK (0x15) SYN (0x16) ETB (0x17) CAN (0x18) EM (0x19) SUB (0x1A) ESC (0x1B) FS (0x1C) GS (0x1D) RS (0x1E) US (0x1F) SPACE (0x20) \" ! # $ % & ' ( ) * + , - . / 0 1 2 3 4 5 6 7 8 9 : ; < = > ? @ A B C D E F G H I J K L M N O P Q R S T U V W X Y Z [ / ]^ _  ", font, brush, new RectangleF(200, 155, 300, 200), format);

            g.DrawLine(pen, new PointF(0, 250), new PointF(width, 250));

            PdfCode128BBarcode barcode128B = new PdfCode128BBarcode();

            // Setting height of the barcode
            barcode128B.BarHeight = 45;
            barcode128B.Text = "12345 abcd";
            barcode128B.EnableCheckDigit = true;
            barcode128B.EncodeStartStopSymbols = true;
            barcode128B.ShowCheckDigit = true;

            //Printing barcode on to the Pdf.
            barcode128B.Draw(page, new PointF(25, 280));

            g.DrawString("Type : Code128 B", font, brush, new PointF(200, 280));
            g.DrawString("Allowed Characters : SPACE (0x20) !  \" # $ % & ' ( ) * + , - . / 0 1 2 3 4 5 6 7 8 9 : ; < = > ? @ A B C D E F G H I J K L M N O P Q R S T U V W X Y Z [ / ]^ _ ` a b c d e f g h i j k l m n o p q r s t u v w x y z { | } ~ DEL (\x7F)  ", font, brush, new RectangleF(200, 300, 300, 200), format);

            g.DrawLine(pen, new PointF(0, 350), new PointF(width, 350));

            PdfCode128CBarcode barcode128C = new PdfCode128CBarcode();

            // Setting height of the barcode
            barcode128C.BarHeight = 45;
            barcode128C.Text = "001122334455";
            barcode128C.EnableCheckDigit = true;
            barcode128C.EncodeStartStopSymbols = true;
            barcode128C.ShowCheckDigit = true;

            //Printing barcode on to the Pdf.
            barcode128C.Draw(page, new PointF(25, 370));

            g.DrawString("Type : Code128 C", font, brush, new PointF(200, 370));
            g.DrawString("Allowed Characters : 0 1 2 3 4 5 6 7 8 9 ", font, brush, new PointF(200, 390));

            g.DrawLine(pen, new PointF(0, 440), new PointF(width, 440));

            #endregion

            # endregion

            #region GS1Code128
            PdfGS1Code128Barcode gs1Code128 = new PdfGS1Code128Barcode();
            gs1Code128.Text = "(01)12345678901234";
            //Drawing in PDF page
            gs1Code128.Draw(page, new PointF(25, 460));
            page.Graphics.DrawString("Type : GS1Code128", font, brush, new PointF(200, 460));
            page.Graphics.DrawString("Allowed Characters : SPACE (0x20)  0 1 2 3 4 5 6 7 8 9 A B C D E F G H I J K L M N O P Q R S T U V W X Y Z  a b c d e f g h i j k l m n o p q r s t u v w x y z", font, brush, new RectangleF(200, 490, 300, 200));
            g.DrawLine(pen, new PointF(0, 560), new PointF(width, 560));
            #endregion

			#region UPC-A
            // Drawing UPC-A barcode
            PdfCodeUpcBarcode upcBarcode = new PdfCodeUpcBarcode();

            // Setting height of the barcode
            upcBarcode.BarHeight = 45;
            upcBarcode.Text = "01234567890";

            //Printing barcode on to the Pdf.
            upcBarcode.Draw(page, new PointF(25, 570));

            font = new PdfStandardFont(PdfFontFamily.TimesRoman, 9, PdfFontStyle.Regular);

            g.DrawString("Type : UPC-A", font, brush, new PointF(200, 570));
            g.DrawString("Allowed Characters : 0-9", font, brush, new PointF(200, 592));

            g.DrawLine(pen, new PointF(0, 630), new PointF(width, 630));
            #endregion
			
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
