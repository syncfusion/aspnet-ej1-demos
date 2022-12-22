#region Copyright Syncfusion Inc. 2001 - 2022
//
//  Copyright Syncfusion Inc. 2001 - 2022. All rights reserved.
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
using System.ComponentModel;

namespace WebSampleBrowser.DocIO
{
    public partial class TrackChanges : System.Web.UI.Page
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
           //Loads the template document.
            WordDocument document = new WordDocument(Path.Combine(ResolveApplicationDataPath(string.Empty), @"TrackChangesTemplate.docx"));
            string author = GetAuthorName(comboBoxAuthorName.SelectedIndex);

            //Accepts the all changes made by the author
            if (rdButtonAccept.Checked)
                AcceptRevisionsOfAuthor(document, author);
            //Rejects the all the changes made by the author
            else if (rdButtonReject.Checked)
                RejectRevisionsOfAuthor(document, author);
            //Rejects all the tracked changes revisions in the Word document
            else if (rdButtonRejectAll.Checked)
                document.Revisions.RejectAll();
            //Accepts all the tracked changes revisions in the Word document
            else
                document.Revisions.AcceptAll();  
			
            //Save as .docx format
            document.Save("Track Changes.docx", FormatType.Docx, Response, HttpContentDisposition.Attachment);
        }
        # endregion

        # region Helpher Methods
		 /// <summary>
        ///  Rejects the all changes made by the author
        /// </summary>
        private void RejectRevisionsOfAuthor(WordDocument document, string author)
        {
            //Iterate into all the revisions in Word document
            for (int i = document.Revisions.Count-1; i >=0;i--)
            {
                //Checks the author of current revision and rejects it.
                if (document.Revisions[i].Author == author)
                    document.Revisions[i].Reject();

                //Reset to last item when reject the moving related revisions.
                if (i > document.Revisions.Count - 1)
                    i = document.Revisions.Count;
            }
        }
        /// <summary>
        ///  Accepts the all changes made by the author
        /// </summary>
        private void AcceptRevisionsOfAuthor(WordDocument document, string author)
        {
            //Iterate into all the revisions in Word document
            for (int i = document.Revisions.Count - 1; i >= 0; i--)
            {
                //Checks the author of current revision and rejects it.
                if (document.Revisions[i].Author == author)
                    document.Revisions[i].Accept();

                //Reset to last item when accept the moving related revisions.
                if (i > document.Revisions.Count - 1)
                    i = document.Revisions.Count;
            }
        }
        /// <summary>
        /// Gets the author name
        /// </summary>
        private string GetAuthorName(int selectedIndex)
        {
            switch (selectedIndex)
            {
                case 1:
                    return "Nancy Davolio";
                case 2:
                    return "Steven Buchanan";
                case 3:
                    return "Stanley Hudson";
                case 4:
                    return "Andrew Fuller";
            }
            return string.Empty;
        }
        #endregion
        protected void OnAuthorNameChanged(object sender, EventArgs e)
        {
            //If none author selected disable the radio button, otherwise enabled
            if (comboBoxAuthorName.SelectedIndex != 0)
            {
                rdButtonAccept.Checked = true;
                rdButtonAccept.Enabled = true;
                rdButtonReject.Enabled = true;
            }
            else
            {
                rdButtonAcceptAll.Checked = true;
                rdButtonAccept.Enabled = false;
                rdButtonReject.Enabled = false;
            }
        }
        /// <summary>
        /// Handles the Click event of the Button2 control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected void Button2_Click(object sender, EventArgs e)
        {
            string fileName = "TrackChangesTemplate.docx";
            FileStream fileStream = new FileStream(ResolveApplicationDataPath("TrackChangesTemplate.docx"), FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
            fileStream.Position = 0L;
            Response.Clear();
            Response.AddHeader("Content-Type", fileName.EndsWith("doc") ? "application/msword" : "application/application/vnd.ms-word.document.12");
            Response.AddHeader("Content-Disposition", "attachment;filename=" + fileName + ";");
            fileStream.CopyTo(Response.OutputStream);
            fileStream.Close();
            Response.End();
        }
		 /// <summary>
        /// Data folder path is resolved from requested page physical path
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        protected string ResolveApplicationDataPath(string fileName)
        {
            //Data folder path is resolved from requested page physical path.
            string dataPath = null;
            dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\App_Data\\DocIO\\").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
    }
}