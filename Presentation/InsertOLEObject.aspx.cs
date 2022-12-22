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
    public partial class InsertOLEObject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //New Instance of PowerPoint is Created.[Equivalent to launching MS PowerPoint with no slides].
            IPresentation presentation = Presentation.Create();

            ISlide slide = presentation.Slides.Add(SlideLayoutType.TitleOnly);

            IShape titleShape = slide.Shapes[0] as IShape;
            titleShape.Left = 0.65 * 72;
            titleShape.Top = 0.24 * 72;
            titleShape.Width = 11.5 * 72;
            titleShape.Height = 1.45 * 72;
            titleShape.TextBody.AddParagraph("Ole Object");
            titleShape.TextBody.Paragraphs[0].Font.Bold = true;
            titleShape.TextBody.Paragraphs[0].HorizontalAlignment = HorizontalAlignmentType.Left;

            IShape heading = slide.Shapes.AddTextBox(100, 100, 100, 100);
            heading.Left = 0.84 * 72;
            heading.Top = 1.65 * 72;
            heading.Width = 2.23 * 72;
            heading.Height = 0.51 * 72;
            heading.TextBody.AddParagraph("MS Word Object");
            heading.TextBody.Paragraphs[0].Font.Italic = true;
            heading.TextBody.Paragraphs[0].Font.Bold = true;
            heading.TextBody.Paragraphs[0].Font.FontSize = 18;

            //Get the word file as stream
            using (Stream wordStream = File.Open(ResolveApplicationDataPath("OleTemplate.docx"), FileMode.Open))
            {
                //Image to be displayed, This can be any image
                using (Stream imageStream = File.Open(ResolveApplicationImagePath("OlePicture.png"), FileMode.Open))
                {
                    IOleObject oleObject = slide.Shapes.AddOleObject(imageStream, "Word.Document.12", wordStream);
                    //Set size and position of the ole object
                    oleObject.Left = 4.53 * 72;
                    oleObject.Top = 0.79 * 72;
                    oleObject.Width = 4.26 * 72;
                    oleObject.Height = 5.92 * 72;
                    //Set DisplayAsIcon as true, to open the embedded document in separate (default) application.
                    oleObject.DisplayAsIcon = true;
                    //Saves the presentation
                    presentation.Save("InsertOLEObject.pptx", FormatType.Pptx, Response);
                    wordStream.Close();
                    imageStream.Close();
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Opens the specified presentation
            IPresentation pptxDoc = Presentation.Open(ResolveApplicationDataPath("EmbeddedOleObject.pptx"));
            //Gets the first slide of the Presentation
            ISlide slide = pptxDoc.Slides[0];
            //Gets the Ole Object of the slide
            IOleObject oleObject = slide.Shapes[2] as IOleObject;
            //Gets the file data of embedded Ole Object.
            byte[] array = oleObject.ObjectData;
            //Gets the file Name of OLE Object
            string outputFile = oleObject.FileName;

            //Save the extracted Ole data            
            MemoryStream stream = new MemoryStream(array);
            stream.Position = 0;
            //Close the presentation
            pptxDoc.Close();
            Response.AddHeader("content-disposition", "attachment; filename=" + outputFile);
            stream.WriteTo(Response.OutputStream);
            Response.End();
        }

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