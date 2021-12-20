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
    public partial class Animation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Stream file1 = new FileStream(ResolveApplicationDataPath("Animation.pptx"), FileMode.Open, FileAccess.Read, FileShare.Read);
            IPresentation presentation = Presentation.Open(file1);

            //Method call to create slides
            CreateAnimation(presentation);           
          
            //Saves the presentation
            presentation.Save("AnimationSample.pptx",FormatType.Pptx, Response);
			
        }
		
		# region Slide1
        private void CreateAnimation(IPresentation presentation)
        {
            //Get the slide from the presentation
            ISlide slide = presentation.Slides[0];

            //Access the animation sequence to create effects
            ISequence sequence = slide.Timeline.MainSequence;

            //Add motion path effect to the shape
            IEffect line1 = sequence.AddEffect(slide.Shapes[8] as IShape, EffectType.PathUp, EffectSubtype.None, EffectTriggerType.OnClick);
            IMotionEffect motionEffect = line1.Behaviors[0] as IMotionEffect;
            motionEffect.Timing.Duration = 1f;
            IMotionPath motionPath = motionEffect.Path;
            motionPath[1].Points[0].X = 0.00365f;
            motionPath[1].Points[0].Y = -0.27431f;

            //Add motion path effect to the shape
            IEffect line2 = sequence.AddEffect(slide.Shapes[3] as IShape, EffectType.PathDown, EffectSubtype.None, EffectTriggerType.WithPrevious);
            motionEffect = line2.Behaviors[0] as IMotionEffect;
            motionEffect.Timing.Duration = 0.75f;
            motionPath = motionEffect.Path;
            motionPath[1].Points[0].X = 0.00234f;
            motionPath[1].Points[0].Y = 0.43449f;

            //Add wipe effect to the shape
            IEffect wipe1 = sequence.AddEffect(slide.Shapes[1] as IShape, EffectType.Wipe, EffectSubtype.None, EffectTriggerType.AfterPrevious);
            wipe1.Behaviors[1].Timing.Duration = 1f;

            //Add fly effect to the shape
            IEffect fly1 = sequence.AddEffect(slide.Shapes[5] as IShape, EffectType.Fly, EffectSubtype.Left, EffectTriggerType.AfterPrevious);
            fly1.Behaviors[1].Timing.Duration = 0.70f;
            fly1.Behaviors[2].Timing.Duration = 0.70f;

            ////Add wipe effect to the shape
            IEffect wipe2 = sequence.AddEffect(slide.Shapes[2] as IShape, EffectType.Wipe, EffectSubtype.None, EffectTriggerType.AfterPrevious);
            wipe2.Behaviors[1].Timing.Duration = 1f;

            ////Add fly effect to the shape
            IEffect fly2 = sequence.AddEffect(slide.Shapes[4] as IShape, EffectType.Fly, EffectSubtype.Right, EffectTriggerType.AfterPrevious);
            fly2.Behaviors[1].Timing.Duration = 0.70f;
            fly2.Behaviors[2].Timing.Duration = 0.70f;

            IEffect fly3 = sequence.AddEffect(slide.Shapes[6] as IShape, EffectType.Fly, EffectSubtype.Top, EffectTriggerType.AfterPrevious);
            fly3.Behaviors[1].Timing.Duration = 1.50f;
            fly3.Behaviors[2].Timing.Duration = 1.50f;

            ////Add flay effect to the shape
            IEffect fly4 = sequence.AddEffect(slide.Shapes[7] as IShape, EffectType.Fly, EffectSubtype.Left, EffectTriggerType.AfterPrevious);
            fly4.Behaviors[1].Timing.Duration = 0.50f;
            fly4.Behaviors[2].Timing.Duration = 0.50f;
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