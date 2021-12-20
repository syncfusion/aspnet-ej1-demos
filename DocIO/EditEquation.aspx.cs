#region Copyright Syncfusion Inc. 2001-2021
//
//  Copyright Syncfusion Inc. 2001-2021. All rights reserved.
//
//  Use of this code is subject to the terms of our license.
//  A copy of the current license can be obtained at any time by e-mailing
//  licensing@syncfusion.com. Any infringement will be prosecuted under
//  applicable laws. 
//
#endregion

using System;
using System.IO;
using System.Drawing;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Syncfusion.DocIO;
using Syncfusion.DocIO.DLS;
using Syncfusion.Office;
using Syncfusion.DocToPDFConverter;
using Syncfusion.Pdf;

namespace WebSampleBrowser.DocIO
{
    public partial class EditEquation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        # region Events
        /// <summary>
        /// Creates word document
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            //Opens an existing Word document
            WordDocument document = new WordDocument(ResolveApplicationDataPath("Mathematical Equation.docx"));
            //Gets the last section in the document
            WSection section = document.LastSection;
            //Gets paragraph from Word document
            WParagraph paragraph = document.LastSection.Body.ChildEntities[3] as WParagraph;

            //Gets MathML from the paragraph
            WMath math = paragraph.ChildEntities[0] as WMath;
            //Gets the radical equation
            IOfficeMathRadical mathRadical = math.MathParagraph.Maths[0].Functions[1] as IOfficeMathRadical;
            //Gets the fraction equation in radical
            IOfficeMathFraction mathFraction = mathRadical.Equation.Functions[0] as IOfficeMathFraction;
            //Gets the n-array in fraction
            IOfficeMathNArray mathNAry = mathFraction.Numerator.Functions[0] as IOfficeMathNArray;
            //Gets the math script in n-array
            IOfficeMathScript mathScript = mathNAry.Equation.Functions[0] as IOfficeMathScript;
            //Gets the delimiter in math script
            IOfficeMathDelimiter mathDelimiter = mathScript.Equation.Functions[0] as IOfficeMathDelimiter;
            //Gets the math script in delimiter
            mathScript = mathDelimiter.Equation[0].Functions[0] as IOfficeMathScript;
            //Gets the math run element in math script
            IOfficeMathRunElement mathParaItem = mathScript.Equation.Functions[0] as IOfficeMathRunElement;
            //Modifies the math text value
            (mathParaItem.Item as WTextRange).Text = "x";

            //Gets the math bar in delimiter
            IOfficeMathBar mathBar = mathDelimiter.Equation[0].Functions[2] as IOfficeMathBar;
            //Gets the math run element in bar
            mathParaItem = mathBar.Equation.Functions[0] as IOfficeMathRunElement;
            //Modifies the math text value
            (mathParaItem.Item as WTextRange).Text = "x";

            //Gets the paragraph from Word document
            paragraph = document.LastSection.Body.ChildEntities[6] as WParagraph;
            //Gets MathML from the paragraph
            math = paragraph.ChildEntities[0] as WMath;
            //Gets the math script equation
            mathScript = math.MathParagraph.Maths[0].Functions[0] as IOfficeMathScript;
            //Gets the math run element in math script
            mathParaItem = mathScript.Equation.Functions[0] as IOfficeMathRunElement;
            //Modifies the math text value
            (mathParaItem.Item as WTextRange).Text = "x";

            //Gets the paragraph from Word document
            paragraph = document.LastSection.Body.ChildEntities[7] as WParagraph;
            //Gets MathML from the paragraph
            WMath math2 = paragraph.ChildEntities[0] as WMath;
            //Gets bar equation
            mathBar = math2.MathParagraph.Maths[0].Functions[0] as IOfficeMathBar;
            //Gets the math run element in bar
            mathParaItem = mathBar.Equation.Functions[0] as IOfficeMathRunElement;
            //Gets the math text
            (mathParaItem.Item as WTextRange).Text = "x";
			
            //Save as .docx format
            if (rdButtonDocx.Checked)
            {
                document.Save("EditEquation.docx", FormatType.Docx, Response, HttpContentDisposition.Attachment);
            }
            //Save as .pdf format
            else if (rdButtonPdf.Checked)
            {
                DocToPDFConverter converter = new DocToPDFConverter();
                PdfDocument pdfDoc = converter.ConvertToPDF(document);
                converter.Dispose();
                pdfDoc.Save("EditEquation.pdf", Response, HttpReadType.Save);
                pdfDoc.Close();
            }
        }
        #endregion

        #region Helper Methods
        /// <summary>
        /// Data folder path is resolved from requested page physical path
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        protected string ResolveApplicationDataPath(string fileName)
        {
            string dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\App_Data\\DocIO").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
        #endregion
    }
}