using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Syncfusion.DocIO;
using Syncfusion.DocIO.DLS;
using System.ComponentModel;
using System.IO;

namespace WebSampleBrowser.DocIO
{
    public partial class InsertOLEObject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            //Data folder path is resolved from requested page physical path.
            string dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\App_Data\\DocIO\\").FullName;

            //Open an existing word document 
            WordDocument oleSource;
            if (rdButtonDoc.Checked)
            {
                oleSource = new WordDocument(Path.Combine(dataPath, "OleTemplate.doc"));
            }
            else
            {
                oleSource = new WordDocument(Path.Combine(dataPath, "OleTemplate.docx"));

            }
            WordDocument dest = new WordDocument();
            dest.EnsureMinimal();

            // Get OLE object from source document
            WOleObject oleObject = oleSource.LastParagraph.Items[0] as WOleObject;

            WPicture pic = oleObject.OlePicture.Clone() as WPicture;
            dest.LastParagraph.AppendText("OLE Object Demo");
            dest.LastParagraph.ApplyStyle(BuiltinStyle.Heading1);
            dest.LastParagraph.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Center;

            dest.Sections[0].AddParagraph();
            dest.LastParagraph.AppendText("Adobe PDF object Inserted");
            dest.LastParagraph.ApplyStyle(BuiltinStyle.Heading2);

            dest.Sections[0].AddParagraph();
            // AppendOLE object to the destination document
            dest.LastParagraph.AppendOleObject(oleObject.Container, pic, OleLinkType.Embed);
            if (rdButtonDoc.Checked)
            {
                //Save as .doc format
                dest.Save("Sample.doc", FormatType.Doc, Response, HttpContentDisposition.Attachment);
            }
            //Save as .docx format
            else if (rdButtonDocx.Checked)
            {
                try
                {
                    dest.Save("Sample.docx", FormatType.Docx, Response, HttpContentDisposition.Attachment);
                }
                catch (Win32Exception ex)
                {
                    Response.Write("Microsoft Word Viewer or Microsoft Word is not installed in this system");
                    Console.WriteLine(ex.ToString());
                }
            }
            //Save as WordML(.xml) format
            else if (rdButtonWordML.Checked)
            {
                try
                {
                    dest.Save("Sample.xml", FormatType.WordML, Response, HttpContentDisposition.Attachment);
                }
                catch (Win32Exception ex)
                {
                    Response.Write("Microsoft Word Viewer or Microsoft Word is not installed in this system");
                    Console.WriteLine(ex.ToString());
                }
            }
        }
    }
}