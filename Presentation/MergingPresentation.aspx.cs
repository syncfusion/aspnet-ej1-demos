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
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using Syncfusion.Presentation;

namespace WebSampleBrowser.PPTX
{
    public partial class MergingPresentation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.label1.Text = " ";
        }

        protected void btnMergeDocuments_Click(object sender, EventArgs e)
        {
            if (this.FileUpload1.HasFile && this.FileUpload2.HasFile)
            {
                string source = Path.GetFileNameWithoutExtension(this.FileUpload1.PostedFile.FileName);
                string destination = Path.GetFileNameWithoutExtension(this.FileUpload2.PostedFile.FileName);
                string extSource = Path.GetExtension(this.FileUpload1.PostedFile.FileName).ToLower();
                string extDestination = Path.GetExtension(this.FileUpload2.PostedFile.FileName).ToLower();
                if (extSource == ".pptx" && extDestination == ".pptx")
                {
                    //Convert the input powerpoint document to a PDF file
                    # region Clone Slide using Destination Theme
                    Stream readSource = this.FileUpload1.PostedFile.InputStream;
                    Stream readDestination = this.FileUpload2.PostedFile.InputStream;
                    try
                    {
                        //Opens the specified presentation
                        IPresentation sourcePresentation = Presentation.Open(readSource);

                        IPresentation destinationPresentation = Presentation.Open(readDestination);

                        ISlides slides = sourcePresentation.Slides;

                        if (this.RadioDestination.Checked == true)
                        {
                            foreach (ISlide slide in slides)
                            {
                                destinationPresentation.Slides.Add(slide.Clone(), PasteOptions.UseDestinationTheme, sourcePresentation);
                            }

                            //Closing the Source presentation
                            sourcePresentation.Close();

                            readSource.Close();

                            //Saving the Destination presentaiton.
                            destinationPresentation.Save("MergedUsingDestination.pptx", FormatType.Pptx, Response);

                        }
                        else
                        {
                            foreach (ISlide slide in slides)
                            {
                                destinationPresentation.Slides.Add(slide.Clone(), PasteOptions.SourceFormatting, sourcePresentation);
                            }

                            //Closing the Source presentation
                            sourcePresentation.Close();

                            readSource.Close();

                            //Saving the Destination presentaiton.
                            destinationPresentation.Save("MergedUsingSource.pptx", FormatType.Pptx, Response);
                        }
                      
                    }
                    catch (Exception)
                    {
                        this.label1.Text = "The input document could not be processed, Could you please email the document to support@syncfusion.com for troubleshooting";
                    }
                    # endregion
                }
                else
                {
                    this.label1.Text = "Please choose pptx file to perform merging";
                }

            }
            else
            {
                this.label1.Text = "Browse a powerpoint document and then click the button to merge documents";
            }
        }
    }
}
    
    
