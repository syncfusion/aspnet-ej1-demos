#region Copyright Syncfusion Inc. 2001-2020.
// Copyright Syncfusion Inc. 2001-2020. All rights reserved.
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

namespace WebSampleBrowser.PPTX
{
    public partial class ManipulatingSmartArt : System.Web.UI.Page
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
            Stream file1 = new FileStream(ResolveApplicationDataPath("SmartArtNode.pptx"), FileMode.Open, FileAccess.Read, FileShare.Read);

            IPresentation presentation = Presentation.Open(file1);
           
            //Adds node to the main node collection.
            AddNodeInMainNodes(presentation);
            //Adds node to the child node collection.
            AddNodeInChildNodes(presentation);

            presentation.Save("Sample.pptx", FormatType.Pptx, Response);
        }
        #endregion

        # region Slide1
        private void AddNodeInMainNodes(IPresentation presentation)
        {
            ISlide slide1 = presentation.Slides[0];
            ISmartArt smartArt = slide1.Shapes[0] as ISmartArt;
            smartArt.Background.FillType = FillType.Solid;
            smartArt.Background.SolidFill.Color = ColorObject.Lavender;
            //New node adds to the node collection.
            ISmartArtNode newNode = smartArt.Nodes.Add();
            //Text content to the newly added node.
            newNode.TextBody.AddParagraph("Marketing");
        }
        #endregion

        # region Slide2
        private void AddNodeInChildNodes(IPresentation presentation)
        {
            ISlide slide2 = presentation.Slides[2];
            ISmartArt smartArt = slide2.Shapes[1] as ISmartArt;
            // Gets first node from the node collection using index value.
            ISmartArtNode firstNode = smartArt.Nodes[0];
            //Adds new child node to the first node's child node collection.
            ISmartArtNode childNode = firstNode.ChildNodes.Add();
            //Gives the text content to the newly added child node.
            childNode.TextBody.AddParagraph("Make Simple");
        }

        #endregion
		
		protected string ResolveApplicationDataPath(string fileName)
        {
            string dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\App_Data\\Presentation").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
    }
}