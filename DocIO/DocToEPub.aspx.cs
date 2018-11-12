using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

using Syncfusion.DocIO.DLS;
using Syncfusion.DocIO;

namespace WebSampleBrowser.DocIO
{
    public partial class DocToEPub : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDocToEPUB_Click(object sender, EventArgs e)
        {
            if (this.fileUpload1.HasFile)
            {
                string ext = System.IO.Path.GetExtension(this.fileUpload1.PostedFile.FileName).ToLower();
                if (ext == ".doc" || ext == ".docx")
                {
                    //Convert the input word document to a EPub file
                    # region Convert Doc to EPub
                    Stream readFile = this.fileUpload1.PostedFile.InputStream;
                    try
                    {
                        WordDocument document = null;
                        if (ext == ".doc")
                            document = new WordDocument(readFile, Syncfusion.DocIO.FormatType.Doc);
                        else if (ext == ".docx")
                            document = new WordDocument(readFile, Syncfusion.DocIO.FormatType.Docx);

                        document.SaveOptions.EPubExportFont = this.chkBox1.Checked;

                        document.Save("Sample.epub", FormatType.EPub, Response, HttpContentDisposition.Attachment);
                        document.Close();

                        readFile.Close();
                        this.label1.Text = "";

                    }
                    catch (Exception)
                    {
                        this.label1.Text = "The input document could not be processed, Could you please email the document to support@syncfusion.com for troubleshooting";
                    }

                    # endregion

                }
                else
                {
                    this.label1.Text = "Please choose a Word document to convert to EPub";
                }
            }

            else
            {
                this.label1.Text = "Browse a word document and then click the button to convert as a EPub document";
            }
        }
    }
}