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
    public partial class Attachments : System.Web.UI.Page
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
        PdfDocument doc=null;
        PdfPage page=null;
        PdfFont font = null;
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
            doc = new PdfDocument();

            //Add a page.
            page = doc.Pages.Add();

            //Set the font.
            font = new PdfStandardFont(PdfFontFamily.Helvetica, 18f, PdfFontStyle.Bold);

            System.Drawing.Color orangeColor = System.Drawing.Color.FromArgb(255, 255, 167, 73);

            //Draw the text.
            page.Graphics.DrawString("Attachments", font, PdfBrushes.Black, new RectangleF(0, 0, page.GetClientSize().Width, page.GetClientSize().Height), new PdfStringFormat(PdfTextAlignment.Center));

            //Change Font.
            font = new PdfStandardFont(PdfFontFamily.Helvetica, 10f, PdfFontStyle.Regular);

            page.Graphics.DrawString("This PDF document contains image and text file as attachment.", font, PdfBrushes.Black, new PointF(0, 30));

            font = new PdfStandardFont(PdfFontFamily.Helvetica, 8f, PdfFontStyle.Regular);

            page.Graphics.DrawString("Click to open the attachment:", font, PdfBrushes.Black, new PointF(0, 50));

            page.Graphics.DrawString("Click to open the attachment:", font, PdfBrushes.Black, new PointF(0, 70));                      

            //Creates an attachment.
            PdfAttachment attachment = new PdfAttachment(ResolveApplicationDataPath("Text1.txt", false));

            attachment.ModificationDate = DateTime.Now;

            attachment.Description = "About Syncfusion";

            attachment.MimeType = "application/txt";

            //Adds the attachment to the document.
            doc.Attachments.Add(attachment);

            attachment = new PdfAttachment(ResolveApplicationDataPath("Autumn Leaves.jpg", true));

            attachment.ModificationDate = DateTime.Now;

            attachment.Description = "Autumn Leaves Image";

            attachment.MimeType = "application/jpg";

            //Adds the attachment to the document.
            doc.Attachments.Add(attachment);
         
            attachment = new PdfAttachment(ResolveApplicationDataPath("Text2.txt", false));

            attachment.ModificationDate = DateTime.Now;

            attachment.Description = "List of Syncfusion Control";

            attachment.MimeType = "application/txt";

            //Adds the attachment to the document.
            doc.Attachments.Add(attachment);

            //Set ViewerPreference.
            doc.ViewerPreferences.HideWindowUI = false;
            doc.ViewerPreferences.HideMenubar = false;
            doc.ViewerPreferences.HideToolbar = false;
            doc.ViewerPreferences.FitWindow = false;
            doc.ViewerPreferences.DisplayTitle = false;
            doc.ViewerPreferences.PageMode = PdfPageMode.UseAttachments;
			
			//Disable the default appearance.
            doc.Form.SetDefaultAppearance(false);

            //Create PdfButtonField
            PdfButtonField openSpecificationButton = new PdfButtonField(page, "openSpecification");
            openSpecificationButton.Bounds = new RectangleF(105, 50, 62, 10);
            openSpecificationButton.TextAlignment = PdfTextAlignment.Left;
            openSpecificationButton.Font = new PdfStandardFont(PdfFontFamily.Helvetica, 7);
            openSpecificationButton.BorderStyle = PdfBorderStyle.Underline;
            openSpecificationButton.BorderColor = orangeColor;
            openSpecificationButton.BackColor = new PdfColor(255, 255, 255);
            openSpecificationButton.ForeColor = orangeColor;
            openSpecificationButton.Text = "Autumn Leaves.jpg";
            openSpecificationButton.Actions.MouseUp = new PdfJavaScriptAction("this.exportDataObject({ cName: 'Autumn Leaves.jpg', nLaunch: 2 });");
            doc.Form.Fields.Add(openSpecificationButton);           

            openSpecificationButton = new PdfButtonField(page, "openSpecification");
            openSpecificationButton.Bounds = new RectangleF(105, 70, 30, 10);
            openSpecificationButton.TextAlignment = PdfTextAlignment.Left;
            openSpecificationButton.Font = new PdfStandardFont(PdfFontFamily.Helvetica, 7);
            openSpecificationButton.BorderStyle = PdfBorderStyle.Underline;
            openSpecificationButton.BorderColor = orangeColor;
            openSpecificationButton.BackColor = new PdfColor(255, 255, 255);
            openSpecificationButton.ForeColor = orangeColor;
            openSpecificationButton.Text = "Text1.txt";
            openSpecificationButton.Actions.MouseUp = new PdfJavaScriptAction("this.exportDataObject({ cName: 'Text1.txt', nLaunch: 2 });");
            doc.Form.Fields.Add(openSpecificationButton);           

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