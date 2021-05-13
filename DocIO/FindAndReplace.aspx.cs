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

namespace WebSampleBrowser.DocIO
{
    public partial class FindAndReplace : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Setting Current Date and Day to the Labels.
            labelDate.Text = DateTime.Now.ToShortDateString();
            labelDay.Text = DateTime.Now.DayOfWeek.ToString();
        }

        # region Events
        /// <summary>
        /// Creates word document
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            // Checking whether all text boxes are filled.
            if ((textBoxName.Text.Trim() == "") || (textBoxBody.Text.Trim() == "") || (textBoxSomeBody.Text.Trim() == ""))
                return;

            // Create document.
            IWordDocument document = new WordDocument();

            // Open template document.
            document.Open((Path.Combine(ResolveApplicationDataPath(String.Empty), "FR_Template.doc")), FormatType.Doc);

            //Find and Replace.
            document.Replace("$Date$", labelDate.Text, true, true);
            document.Replace("$Day$", labelDay.Text, true, true);
            document.Replace("$Name$", textBoxName.Text, true, true);
            document.Replace("$BodyText$", textBoxBody.Text, true, true);
            document.Replace("Somebody", textBoxSomeBody.Text, true, true);

            if (rdButtonWord97To2003.Checked)
            {
                //Save as .doc Word 97-2003 format
                document.Save("Sample.doc", FormatType.Doc, Response, HttpContentDisposition.Attachment);
            }
            //Save as .docx Word2007 format
            else if (rdButtonWord2007.Checked)
            {
                document.Save("Sample.docx", FormatType.Word2007, Response, HttpContentDisposition.Attachment);

            }
            //Save as .docx Word2010 format
            else if (rdButtonWord2010.Checked)
            {
                document.Save("Sample.docx", FormatType.Word2010, Response, HttpContentDisposition.Attachment);

            }
            //Save as .docx Word2013 format
            else if (rdButtonWord2013.Checked)
            {
                document.Save("Sample.docx", FormatType.Docx, Response, HttpContentDisposition.Attachment);

            }
            //Save as .xml(WordML) format
            else if (rdButtonWordML.Checked)
            {
                document.Save("Sample.xml", FormatType.WordML, Response, HttpContentDisposition.Attachment);
            }
        }

        protected void checkBoxDefault_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBoxDefault.Checked)
            {
                // Assign Default Values to the appropriate text boxes.
                textBoxName.Text = "John Doe";
                System.IO.StreamReader myFile = new System.IO.StreamReader((Path.Combine(ResolveApplicationDataPath(String.Empty), "Text.txt")));
                textBoxBody.Text = myFile.ReadToEnd();
                textBoxSomeBody.Text = "Syncfusion";
            }
            else
            {
                // Clear the text boxes values.
                textBoxBody.Text = "";
                textBoxName.Text = "";
                textBoxSomeBody.Text = "";
            }
        }
        # endregion

        # region Helpher Methods
        /// <summary>
        /// Data folder path is resolved from requested page physical path
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        protected string ResolveApplicationDataPath(string fileName)
        {
            string dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\App_Data\\DocIO\\").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
        # endregion
    }
}