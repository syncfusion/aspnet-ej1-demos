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
    public partial class ModifyingAnimation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Stream file1 = new FileStream(ResolveApplicationDataPath("ShapeWithAnimation.pptx"), FileMode.Open, FileAccess.Read, FileShare.Read);
            IPresentation presentation = Presentation.Open(file1);
            
            //Save the presentation
            presentation.Save("ShapeWithAnimation.pptx",FormatType.Pptx,Response);           
        }
		
        protected void Button2_Click(object sender, EventArgs e)
        {
            Stream file1 = new FileStream(ResolveApplicationDataPath("ShapeWithAnimation.pptx"), FileMode.Open, FileAccess.Read, FileShare.Read);
            IPresentation presentation = Presentation.Open(file1);
            

            //Modify the existing animation
            ModifyAnimation(presentation);

            //Save the presentation
            presentation.Save("ModifiedAnimation.pptx",FormatType.Pptx,Response);           
        }

        #region Modify Animation

        private void ModifyAnimation(IPresentation presentation)
        {
            //Retrieves the slide instance
            ISlide slide = presentation.Slides[0];
            //Retrieves the slide main sequence
            ISequence sequence = slide.Timeline.MainSequence;
            //Retrieves the existing animation effect from the main sequence
            IEffect loopEffect = sequence[0];
            //Change the type of the existing animation effect
            loopEffect.Type = EffectType.Bounce;
        }
        #endregion

        protected string ResolveApplicationDataPath(string fileName)
        {
            string dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\App_Data\\Presentation").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
		
		protected string ResolveApplicationImagePath(string fileName)
        {
            string dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\Content\\Presentation").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
    }
}