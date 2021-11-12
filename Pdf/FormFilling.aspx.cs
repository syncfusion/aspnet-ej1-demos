#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
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

namespace WebSampleBrowser.Pdf
{
    public partial class FormFilling : System.Web.UI.Page
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
            string dataPath = ResolveApplicationDataPath("Form.pdf");

            Stream file1 = new FileStream(dataPath, FileMode.Open, FileAccess.Read, FileShare.Read);
            //Load the template document
            PdfLoadedDocument doc = new PdfLoadedDocument(file1);

            PdfLoadedForm form = doc.Form;
            // fill the fields from the first page
            (form.Fields["f1-1"] as PdfLoadedTextBoxField).Text = "1";
            (form.Fields["f1-2"] as PdfLoadedTextBoxField).Text = "1";
            (form.Fields["f1-3"] as PdfLoadedTextBoxField).Text = "1";
            (form.Fields["f1-4"] as PdfLoadedTextBoxField).Text = "3";
            (form.Fields["f1-5"] as PdfLoadedTextBoxField).Text = "1";
            (form.Fields["f1-6"] as PdfLoadedTextBoxField).Text = "1";
            (form.Fields["f1-7"] as PdfLoadedTextBoxField).Text = "22";
            (form.Fields["f1-8"] as PdfLoadedTextBoxField).Text = "30";
            (form.Fields["f1-9"] as PdfLoadedTextBoxField).Text = "John";
            (form.Fields["f1-10"] as PdfLoadedTextBoxField).Text = "Doe";
            (form.Fields["f1-11"] as PdfLoadedTextBoxField).Text = "3233 Spring Rd.";
            (form.Fields["f1-12"] as PdfLoadedTextBoxField).Text = "Atlanta, GA 30339";
            (form.Fields["f1-13"] as PdfLoadedTextBoxField).Text = "332";
            (form.Fields["f1-14"] as PdfLoadedTextBoxField).Text = "43";
            (form.Fields["f1-15"] as PdfLoadedTextBoxField).Text = "4556";
            (form.Fields["f1-16"] as PdfLoadedTextBoxField).Text = "3";
            (form.Fields["f1-17"] as PdfLoadedTextBoxField).Text = "2000";
            (form.Fields["f1-18"] as PdfLoadedTextBoxField).Text = "Exempt";
            (form.Fields["f1-19"] as PdfLoadedTextBoxField).Text = "Syncfusion, Inc";
            (form.Fields["f1-20"] as PdfLoadedTextBoxField).Text = "200";
            (form.Fields["f1-21"] as PdfLoadedTextBoxField).Text = "22";
            (form.Fields["f1-22"] as PdfLoadedTextBoxField).Text = "56654";
            (form.Fields["c1-1[0]"] as PdfLoadedCheckBoxField).Items[0].Checked = true;
            (form.Fields["c1-1[1]"] as PdfLoadedCheckBoxField).Items[0].Checked = true;

            // fill the fields from the second page
            (form.Fields["f2-1"] as PdfLoadedTextBoxField).Text = "3200";
            (form.Fields["f2-2"] as PdfLoadedTextBoxField).Text = "4850";
            (form.Fields["f2-3"] as PdfLoadedTextBoxField).Text = "0";
            (form.Fields["f2-4"] as PdfLoadedTextBoxField).Text = "500";
            (form.Fields["f2-5"] as PdfLoadedTextBoxField).Text = "500";
            (form.Fields["f2-6"] as PdfLoadedTextBoxField).Text = "800";
            (form.Fields["f2-7"] as PdfLoadedTextBoxField).Text = "0";
            (form.Fields["f2-8"] as PdfLoadedTextBoxField).Text = "0";
            (form.Fields["f2-9"] as PdfLoadedTextBoxField).Text = "3";
            (form.Fields["f2-10"] as PdfLoadedTextBoxField).Text = "3";
            (form.Fields["f2-11"] as PdfLoadedTextBoxField).Text = "3";
            (form.Fields["f2-12"] as PdfLoadedTextBoxField).Text = "2";
            (form.Fields["f2-13"] as PdfLoadedTextBoxField).Text = "3";
            (form.Fields["f2-14"] as PdfLoadedTextBoxField).Text = "3";
            (form.Fields["f2-15"] as PdfLoadedTextBoxField).Text = "2";
            (form.Fields["f2-16"] as PdfLoadedTextBoxField).Text = "1";
            (form.Fields["f2-17"] as PdfLoadedTextBoxField).Text = "200";
            (form.Fields["f2-18"] as PdfLoadedTextBoxField).Text = "600";
            (form.Fields["f2-19"] as PdfLoadedTextBoxField).Text = "250";

            //Set Form Flatten value
            if(CheckBox2.Checked)
                doc.Form.Flatten = true;

            //Save to disk
            if (this.CheckBox1.Checked)
            {
                doc.Save("Sample.pdf", Response, HttpReadType.Open);
            }
            else
            {
                doc.Save("Sample.pdf", Response, HttpReadType.Save);
            }

            //Close the stream and the pdf instances
            file1.Dispose();
            doc.Close(true);
            doc.Dispose();
        }

        /// <summary>
        /// Opens the template document
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnViewTemplate_Click(object sender, EventArgs e)
        {
            string dataPath = ResolveApplicationDataPath("Form.pdf");

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