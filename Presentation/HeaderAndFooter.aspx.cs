#region Copyright Syncfusion Inc. 2001-2021
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
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using Syncfusion.Presentation;

namespace WebSampleBrowser.PPTX
{
    public partial class HeaderAndFooter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
			//Opens an existing PowerPoint presentation.
			Stream file1 = new FileStream(ResolveApplicationDataPath("HeaderFooter.pptx"), FileMode.Open, FileAccess.Read, FileShare.Read);
            IPresentation pptxDoc = Presentation.Open(file1);

            //Add footers into all the PowerPoint slides.
            foreach(ISlide slide in pptxDoc.Slides)
            {
                //Enable a date and time footer in slide.
                slide.HeadersFooters.DateAndTime.Visible = true;
                //Enable a footer in slide.
                slide.HeadersFooters.Footer.Visible = true;
                //Sets the footer text.
                slide.HeadersFooters.Footer.Text = "Footer";
                //Enable a slide number footer in slide.
                slide.HeadersFooters.SlideNumber.Visible = true;
            } 

            //Add header into first slide notes page.
            //Add a notes slide to the slide.
            INotesSlide notesSlide = pptxDoc.Slides[0].AddNotesSlide();
            //Enable a header in notes slide.
            notesSlide.HeadersFooters.Header.Visible = true;
            //Sets the header text.
            notesSlide.HeadersFooters.Header.Text = "Header"; 

            //Saves Presentation with specified file name with extension.
            pptxDoc.Save("HeaderFooterSample.pptx", FormatType.Pptx, Response);
            //Closes the Presentation
            pptxDoc.Close();
        }

        protected string ResolveApplicationDataPath(string fileName)
        {
            string dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\App_Data\\Presentation").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
    }
}