#region Copyright Syncfusion Inc. 2001-2018.
// Copyright Syncfusion Inc. 2001-2018. All rights reserved.
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
    public partial class Cloning : System.Web.UI.Page
    {
         protected void Page_Load(object sender, EventArgs e)
        {
            this.label1.Text = " ";
        }

        protected void btnCloneSlides_Click(object sender, EventArgs e)
        {
            //Opens the specified presentation
            Stream source = new FileStream(ResolveApplicationDataPath("Template.pptx"), FileMode.Open, FileAccess.Read, FileShare.Read);
            IPresentation sourcePresentation = Presentation.Open(source);

            //Opens the specified presentation
            Stream destination = new FileStream(ResolveApplicationDataPath("Essential Presentation.pptx"), FileMode.Open, FileAccess.Read, FileShare.Read);
            IPresentation destinationPresentation = Presentation.Open(destination);

            //Cloning the first slide of the presentation.
            ISlide slide = sourcePresentation.Slides[0].Clone();

            //Clones the first slide
            # region Clones the first slide
           {
                if (this.RadioDestination.Checked == true)
                {
                    //Adding the cloned slide to the Existing presentation.
                    destinationPresentation.Slides.Add(slide, PasteOptions.UseDestinationTheme, sourcePresentation);

                    sourcePresentation.Close();

                    //Saving the presentation.
                    destinationPresentation.Save("CloningDestinationTheme.pptx", FormatType.Pptx, Response);
                }
                else
                {
                    //Adding the cloned slide to the Existing presentation.
                    destinationPresentation.Slides.Add(slide, PasteOptions.SourceFormatting, sourcePresentation);

                    sourcePresentation.Close();

                    //Saving the presentation.
                    destinationPresentation.Save("CloningSourceFormats.pptx", FormatType.Pptx, Response);
                }

            }
            # endregion
        } 
		
		protected string ResolveApplicationDataPath(string fileName)
        {
            string dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\App_Data\\Presentation").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
    }
}
          
           
          
       