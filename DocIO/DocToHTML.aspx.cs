using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.ComponentModel;
using Syncfusion.DocIO;
using System.IO;
using System.Drawing;
using Syncfusion.DocIO.DLS;
using System.Diagnostics;

namespace WebSampleBrowser.DocIO
{
    public partial class DocToHTML : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        # region Events
        /// <summary>
        /// Generates a PDF document
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnDocToHTML_Click(object sender, EventArgs e)
        {
            if (this.FileUpload1.HasFile)
            {
                string ext = System.IO.Path.GetExtension(this.FileUpload1.PostedFile.FileName).ToLower();

                if (ext == ".doc" || ext == ".docx")
                {
                    //Convert the input word document to a PDF file
                    # region Convert Doc to PDF
                    try
                    {
                        Stream readFile = this.FileUpload1.PostedFile.InputStream;
                        WordDocument doc = null;
                        if (ext == ".doc")
                            doc = new WordDocument(readFile, Syncfusion.DocIO.FormatType.Doc);
                        else if (ext == ".docx")
                            doc = new WordDocument(readFile, Syncfusion.DocIO.FormatType.Docx);
                        readFile.Close();
                        doc.Save("Sample.html", FormatType.Html, Response, HttpContentDisposition.Attachment);
                        doc.Close();
                        this.label1.Text = "";
                    }
                    catch (Exception e1)
                    {
                        this.label1.Text = e1.Message;
                    }

                    # endregion

                }
                else
                {
                    this.label1.Text = "Please choose doc or docx file to convert to HTML";
                }
            }
            else
            {
                this.label1.Text = "Browse a word document and then click the button to convert as a html document";
            }
        }

        # endregion
    }
}