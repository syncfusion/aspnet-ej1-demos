#region Copyright Syncfusion Inc. 2001-2015.
// Copyright Syncfusion Inc. 2001-2015. All rights reserved.
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
using System.IO;
using Syncfusion.Presentation;
using Syncfusion.PresentationToPdfConverter;
using Syncfusion.Pdf;

namespace WebSampleBrowser.PPTX
{
    public partial class CustomizingAppearance : System.Web.UI.Page
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
        /// Creates Presentation
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            Stream file1 = new FileStream(ResolveApplicationDataPath("SmartArts.pptx"), FileMode.Open, FileAccess.Read, FileShare.Read);

            IPresentation presentation = Presentation.Open(file1);

            //Method call to edit slides
            CreateSlide1(presentation);
            CreateSlide2(presentation);
            CreateSlide3(presentation);
            if (RadioButton1.Checked)
            {
                presentation.Save("Sample.pptx", FormatType.Pptx, Response);
            }
            else
            {
                //To set each slide in a pdf page.
                PresentationToPdfConverterSettings settings = new PresentationToPdfConverterSettings();

                settings.ShowHiddenSlides = true;

                //Instance to create pdf document from presentation
                PdfDocument doc = PresentationToPdfConverter.Convert(presentation, settings);

                doc.Save("Sample.pdf", Response, HttpReadType.Save); 
            }
        }
        #endregion

        # region Slide1
        private void CreateSlide1(IPresentation presentation)
        {
            ISlide slide1 = presentation.Slides[0];
            ISmartArt smartArt = slide1.Shapes[0] as ISmartArt;
            smartArt.Background.FillType = FillType.Solid;
            smartArt.Background.SolidFill.Color = ColorObject.Wheat;
            smartArt.Background.SolidFill.Transparency = 100;
            smartArt.Nodes[0].Shapes[0].Fill.FillType = FillType.Solid;
            smartArt.Nodes[0].Shapes[0].Fill.SolidFill.Color = ColorObject.CornflowerBlue;
            smartArt.Nodes[1].Shapes[0].Fill.FillType = FillType.Solid;
            smartArt.Nodes[1].Shapes[0].Fill.SolidFill.Color = ColorObject.CornflowerBlue;
            smartArt.Nodes[2].Shapes[0].Fill.FillType = FillType.Solid;
            smartArt.Nodes[2].Shapes[0].Fill.SolidFill.Color = ColorObject.CornflowerBlue;
        }
        #endregion

        # region Slide2
        private void CreateSlide2(IPresentation presentation)
        {
            ISlide slide2 = presentation.Slides[1];
            ISmartArt smartArt = slide2.Shapes[0] as ISmartArt;
            smartArt.Background.FillType = FillType.Solid;
            smartArt.Background.SolidFill.Color = ColorObject.Wheat;
            smartArt.Background.SolidFill.Transparency = 100;
            smartArt.Nodes[0].Shapes[0].Fill.FillType = FillType.Solid;
            smartArt.Nodes[0].Shapes[0].Fill.SolidFill.Color = ColorObject.CornflowerBlue;
            smartArt.Nodes[0].Shapes[0].LineFormat.Weight = 5;
            smartArt.Nodes[1].Shapes[0].Fill.FillType = FillType.Solid;
            smartArt.Nodes[1].Shapes[0].Fill.SolidFill.Color = ColorObject.CornflowerBlue;
            smartArt.Nodes[1].Shapes[0].LineFormat.Weight = 5;
            smartArt.Nodes[2].Shapes[0].Fill.FillType = FillType.Solid;
            smartArt.Nodes[2].Shapes[0].Fill.SolidFill.Color = ColorObject.CornflowerBlue;
            smartArt.Nodes[2].Shapes[0].LineFormat.Weight = 5;
            smartArt.Nodes[3].Shapes[0].Fill.FillType = FillType.Solid;
            smartArt.Nodes[3].Shapes[0].Fill.SolidFill.Color = ColorObject.CornflowerBlue;
            smartArt.Nodes[3].Shapes[0].LineFormat.Weight = 5;
            smartArt.Nodes[4].Shapes[0].Fill.FillType = FillType.Solid;
            smartArt.Nodes[4].Shapes[0].Fill.SolidFill.Color = ColorObject.CornflowerBlue;
            smartArt.Nodes[4].Shapes[0].LineFormat.Weight = 5;
        }
        #endregion

	# region Slide3
        private void CreateSlide3(IPresentation presentation)
        {
            ISlide slide2 = presentation.Slides[2];
            ISmartArt smartArt = slide2.Shapes[1] as ISmartArt;
            smartArt.Background.FillType = FillType.Solid;
            smartArt.Background.SolidFill.Color = ColorObject.Wheat;
            smartArt.Background.SolidFill.Transparency = 100;
            smartArt.Nodes[0].ChildNodes[0].Shapes[0].Fill.FillType = FillType.Solid;
            smartArt.Nodes[0].ChildNodes[0].Shapes[0].Fill.SolidFill.Color = ColorObject.CornflowerBlue;
            smartArt.Nodes[0].ChildNodes[0].Shapes[0].LineFormat.Weight = 5;
            smartArt.Nodes[0].ChildNodes[1].Shapes[0].Fill.FillType = FillType.Solid;
            smartArt.Nodes[0].ChildNodes[1].Shapes[0].Fill.SolidFill.Color = ColorObject.CornflowerBlue;
            smartArt.Nodes[0].ChildNodes[1].Shapes[0].LineFormat.Weight = 5;
            smartArt.Nodes[1].ChildNodes[0].Shapes[0].Fill.FillType = FillType.Solid;
            smartArt.Nodes[1].ChildNodes[0].Shapes[0].Fill.SolidFill.Color = ColorObject.CornflowerBlue;
            smartArt.Nodes[1].ChildNodes[0].Shapes[0].LineFormat.Weight = 5;
            smartArt.Nodes[1].ChildNodes[1].Shapes[0].Fill.FillType = FillType.Solid;
            smartArt.Nodes[1].ChildNodes[1].Shapes[0].Fill.SolidFill.Color = ColorObject.CornflowerBlue;
            smartArt.Nodes[1].ChildNodes[1].Shapes[0].LineFormat.Weight = 5;
            smartArt.Nodes[1].ChildNodes[2].Shapes[0].Fill.FillType = FillType.Solid;
            smartArt.Nodes[1].ChildNodes[2].Shapes[0].Fill.SolidFill.Color = ColorObject.CornflowerBlue;
            smartArt.Nodes[1].ChildNodes[2].Shapes[0].LineFormat.Weight = 5;
        }

        #endregion
		
		protected string ResolveApplicationDataPath(string fileName)
        {
            string dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\App_Data\\Presentation").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
    }
}