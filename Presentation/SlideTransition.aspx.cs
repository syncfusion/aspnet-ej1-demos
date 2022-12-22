#region Copyright Syncfusion Inc. 2001 - 2022
// Copyright Syncfusion Inc. 2001 - 2022. All rights reserved.
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
    public partial class SlideTransition : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Stream file1 = new FileStream(ResolveApplicationDataPath("Transition.pptx"), FileMode.Open, FileAccess.Read, FileShare.Read);
            IPresentation presentation = Presentation.Open(file1);

            //Method call to create slides
            CreateTransition(presentation);

            //Saves the presentation
            presentation.Save("TransitionSample.pptx", FormatType.Pptx, Response);
			
        }

        #region Slide1
        private void CreateTransition(IPresentation presentation)
        {
            //Get the first slide from the presentation
            ISlide slide1 = presentation.Slides[0];

            // Add the 'Wheel' transition effect to the first slide
            slide1.SlideTransition.TransitionEffect = TransitionEffect.Wheel;

            // Get the second slide from the presentation
            ISlide slide2 = presentation.Slides[1];

            // Add the 'Checkerboard' transition effect to the second slide
            slide2.SlideTransition.TransitionEffect = TransitionEffect.Checkerboard;

            // Add the subtype to the transition effect
            slide2.SlideTransition.TransitionEffectOption = TransitionEffectOption.Across;

            // Apply the value to transition mouse on click parameter
            slide2.SlideTransition.TriggerOnClick = true;

            // Get the third slide from the presentation
            ISlide slide3 = presentation.Slides[2];

            // Add the 'Orbit' transition effect for slide
            slide3.SlideTransition.TransitionEffect = TransitionEffect.Orbit;

            // Add the speed for transition
            slide3.SlideTransition.Speed = TransitionSpeed.Fast;

            // Get the fourth slide from the presentation
            ISlide slide4 = presentation.Slides[3];

            // Add the 'Uncover' transition effect to the slide
            slide4.SlideTransition.TransitionEffect = TransitionEffect.Uncover;

            // Apply the value to advance on time for slide
            slide4.SlideTransition.TriggerOnTimeDelay = true;

            // Assign the advance on time value
            slide4.SlideTransition.TimeDelay = 5;

            // Get the fifth slide from the presentation
            ISlide slide5 = presentation.Slides[4];

            // Add the 'PageCurlDouble' transition effect to the slide
            slide5.SlideTransition.TransitionEffect = TransitionEffect.PageCurlDouble;

            // Add the duration value for the transition effect
            slide5.SlideTransition.Duration = 5;
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