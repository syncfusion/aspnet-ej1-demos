#region Copyright Syncfusion Inc. 2001-2022.
// Copyright Syncfusion Inc. 2001-2022. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;
using System.Drawing.Imaging;
using Syncfusion.Pdf;
using Syncfusion.Pdf.Graphics;
using Syncfusion.Pdf.Tables;
using System.Data.OleDb;
using Syncfusion.Pdf.Parsing;
using System.IO;
using Syncfusion.Pdf.Interactive;
using Syncfusion.Pdf.Xfa;

namespace WebSampleBrowser.Pdf
{
    public partial class XFAFormFilling : System.Web.UI.Page
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
        /// Creates PDF document
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            string dataPath = ResolveApplicationDataPath("xfaTemplate.pdf");

            Stream file1 = new FileStream(dataPath, FileMode.Open, FileAccess.Read, FileShare.Read);
            //Load the existing XFA document.
            PdfLoadedXfaDocument ldoc = new PdfLoadedXfaDocument(file1);

            //Loaded the existing XFA form.
            PdfLoadedXfaForm lform = ldoc.XfaForm;

            //Fill the XFA form fields.
            (((lform.Fields["subform1[0]"] as PdfLoadedXfaForm).Fields["subform3[0]"] as PdfLoadedXfaForm).Fields["title[0]"] as PdfLoadedXfaComboBoxField).SelectedIndex = 0;
            (((lform.Fields["subform1[0]"] as PdfLoadedXfaForm).Fields["subform3[0]"] as PdfLoadedXfaForm).Fields["fn[0]"] as PdfLoadedXfaTextBoxField).Text = "Simons";
            (((lform.Fields["subform1[0]"] as PdfLoadedXfaForm).Fields["subform3[0]"] as PdfLoadedXfaForm).Fields["ln[0]"] as PdfLoadedXfaTextBoxField).Text = "Bistro";
            (((lform.Fields["subform1[0]"] as PdfLoadedXfaForm).Fields["subform3[0]"] as PdfLoadedXfaForm).Fields["dob[0]"] as PdfLoadedXfaDateTimeField).Value = new DateTime(1989, 5, 21);
            (((lform.Fields["subform1[0]"] as PdfLoadedXfaForm).Fields["subform3[0]"] as PdfLoadedXfaForm).Fields["company[0]"] as PdfLoadedXfaTextBoxField).Text = "XYZ Pvt Ltd";
            (((lform.Fields["subform1[0]"] as PdfLoadedXfaForm).Fields["subform3[0]"] as PdfLoadedXfaForm).Fields["jt[0]"] as PdfLoadedXfaTextBoxField).Text = "Developer";
            (((lform.Fields["subform1[0]"] as PdfLoadedXfaForm).Fields["subform3[0]"] as PdfLoadedXfaForm).Fields["jd[0]"] as PdfLoadedXfaTextBoxField).Text = "Develop and maintain components and applications for the web, desktop and mobile platforms. \nWork with some of the best UI/UX designers in the world to craft Stunning user interfaces. \nRegular appraisals to ensure quick growth if you deliver on the job.";
            (((lform.Fields["subform1[0]"] as PdfLoadedXfaForm).Fields["subform3[0]"] as PdfLoadedXfaForm).Fields["st[0]"] as PdfLoadedXfaTextBoxField).Text = "Vinbaeltet 34";
            (((lform.Fields["subform1[0]"] as PdfLoadedXfaForm).Fields["subform3[0]"] as PdfLoadedXfaForm).Fields["ad1[0]"] as PdfLoadedXfaTextBoxField).Text = "Kobenhaven";
            (((lform.Fields["subform1[0]"] as PdfLoadedXfaForm).Fields["subform3[0]"] as PdfLoadedXfaForm).Fields["city[0]"] as PdfLoadedXfaTextBoxField).Text = "Denmark";
            (((lform.Fields["subform1[0]"] as PdfLoadedXfaForm).Fields["subform3[0]"] as PdfLoadedXfaForm).Fields["state[0]"] as PdfLoadedXfaComboBoxField).SelectedIndex = 1;
            (((lform.Fields["subform1[0]"] as PdfLoadedXfaForm).Fields["subform3[0]"] as PdfLoadedXfaForm).Fields["zip[0]"] as PdfLoadedXfaNumericField).NumericValue = 24534;
            (((lform.Fields["subform1[0]"] as PdfLoadedXfaForm).Fields["subform3[0]"] as PdfLoadedXfaForm).Fields["country[0]"] as PdfLoadedXfaTextBoxField).Text = "US";
            (((lform.Fields["subform1[0]"] as PdfLoadedXfaForm).Fields["subform3[0]"] as PdfLoadedXfaForm).Fields["em[0]"] as PdfLoadedXfaTextBoxField).Text = "simonsbistro@outlook.com";
            (((lform.Fields["subform1[0]"] as PdfLoadedXfaForm).Fields["subform3[0]"] as PdfLoadedXfaForm).Fields["phone[0]"] as PdfLoadedXfaNumericField).NumericValue = 8765456789;
            (((lform.Fields["subform1[0]"] as PdfLoadedXfaForm).Fields["subform3[0]"] as PdfLoadedXfaForm).Fields["sdn[0]"] as PdfLoadedXfaListBoxField).SelectedItems = new string[] { "Vegan", "Diary Free" };
            (((lform.Fields["subform1[0]"] as PdfLoadedXfaForm).Fields["subform3[0]"] as PdfLoadedXfaForm).Fields["san[0]"] as PdfLoadedXfaListBoxField).SelectedIndex = 0;
            (((lform.Fields["subform1[0]"] as PdfLoadedXfaForm).Fields["subform3[0]"] as PdfLoadedXfaForm).Fields["email[0]"] as PdfLoadedXfaCheckBoxField).IsChecked = true;
            (((lform.Fields["subform1[0]"] as PdfLoadedXfaForm).Fields["subform3[0]"] as PdfLoadedXfaForm).Fields["phone[1]"] as PdfLoadedXfaCheckBoxField).IsChecked = true;
            (((lform.Fields["subform1[0]"] as PdfLoadedXfaForm).Fields["subform3[0]"] as PdfLoadedXfaForm).Fields["group1[0]"] as PdfLoadedXfaRadioButtonGroup).Fields[1].IsChecked = true;

			if(this.CheckBox2.Checked)
            {
				//Flatten the XFA form
                ldoc.Flatten = true;
            }
            //Save the XFA document.
            if (this.CheckBox1.Checked)
            {
                ldoc.Save("Sample.pdf", Response, HttpReadType.Open);
            }
            else
            {
                ldoc.Save("Sample.pdf", Response, HttpReadType.Save);
            }

            //Close the XFA document
            ldoc.Close();

            //Close the stream and the pdf instances
            file1.Dispose();
            ldoc.Close();
        }

        /// <summary>
        /// Opens the template document
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnViewTemplate_Click(object sender, EventArgs e)
        {
            string dataPath = ResolveApplicationDataPath("xfaTemplate.pdf");

            Stream file2 = new FileStream(dataPath, FileMode.Open, FileAccess.Read, FileShare.Read);

            //Load the template document
            PdfLoadedDocument doc = new PdfLoadedDocument(file2);
            doc.Save("FormTemplate.pdf", Response, HttpReadType.Open);

            //Close the pdf and the stream instances
            file2.Dispose();
            doc.Close(true);
            doc.Dispose();
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
            string dataPath = new System.IO.DirectoryInfo(Server.MapPath("~\\App_Data") + "\\PDF").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
        # endregion
    }
}