#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Syncfusion.Pdf;
using Syncfusion.Pdf.Interactive;



namespace WebSampleBrowser.Pdf
{
    public partial class Portfolio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Create a new instance of PdfDocument class.
            PdfDocument document = new PdfDocument();

            //Creating new portfolio
            document.PortfolioInformation = new PdfPortfolioInformation();

            //setting the view mode of the portfolio
            document.PortfolioInformation.ViewMode = PdfPortfolioViewMode.Tile;

            //Creating the attachment
            PdfAttachment pdfFile = new PdfAttachment(ResolveApplicationDataPath("CorporateBrochure.pdf"));
            pdfFile.FileName = "CorporateBrochure.pdf";

            //Creating the attachement
            PdfAttachment wordfile = new PdfAttachment(ResolveApplicationDataPath("Stock.docx"));
            wordfile.FileName = "Stock.docx";

            //Creating the attachement
            PdfAttachment excelfile = new PdfAttachment(ResolveApplicationDataPath("Chart.xlsx"));
            excelfile.FileName = "Chart.xlsx";

            //Setting the startup document to view
            document.PortfolioInformation.StartupDocument = pdfFile;

            //Adding the attachment into document
            document.Attachments.Add(pdfFile);
            document.Attachments.Add(wordfile);
            document.Attachments.Add(excelfile);

            //Adding new page into the document
            document.Pages.Add();
            //save the document
            document.Save("Portfolio.pdf", HttpContext.Current.ApplicationInstance.Context.Response, HttpReadType.Save);

        }

        # region ResolveApplicationDataPath
        /// <summary>
        /// Get the data file
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        protected  string ResolveApplicationDataPath(string fileName)
        {
            string dataPath = new System.IO.DirectoryInfo(Server.MapPath("~\\App_Data") + "\\PDF").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
        #endregion
    }
}