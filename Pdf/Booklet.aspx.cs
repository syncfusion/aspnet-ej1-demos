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
    public partial class Booklet : System.Web.UI.Page
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
        /// Creates PDF
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCreatePDF_Click(object sender, EventArgs e)
        {
            try
            {
                if (!System.IO.Path.GetExtension(fileUpload1.PostedFile.FileName).Equals(".pdf") || textBoxWidth.Text == String.Empty || textBoxHeight.Text == String.Empty)
                {
                    lb_error.Visible = true;
                    lb_error.Text = "Please ensure that a PDF document, width and height for the page are updated.";
                }
                else
                {
                    //Read the file as stream
                    Stream file = fileUpload1.PostedFile.InputStream;

                    //Load a PDF document
                    PdfLoadedDocument ldoc = new PdfLoadedDocument(file);

                    //Create booklet with two sides               
                    PdfDocument pdf = PdfBookletCreator.CreateBooklet(ldoc, new SizeF(float.Parse(textBoxWidth.Text), float.Parse(textBoxHeight.Text)), checkBoxDoubleSide.Checked);

                    //Save the document
                    if (this.checkBoxOpen.Checked)
                    {
                        pdf.Save("Sample.pdf", Response, HttpReadType.Open);
                    }
                    else
                    {
                        pdf.Save("Sample.pdf", Response, HttpReadType.Save);
                    }

                    file.Close();

                    //Close the loaded document
                    pdf.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
        # endregion
    }
}
