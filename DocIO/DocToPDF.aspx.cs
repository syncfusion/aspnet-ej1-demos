#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Syncfusion.DocIO.DLS;
using Syncfusion.Pdf;
using Syncfusion.DocToPDFConverter;
using System.IO;
using Syncfusion.OfficeChart;
using Syncfusion.OfficeChartToImageConverter;


namespace WebSampleBrowser.DocIO
{
    public partial class DocToPDF : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDocToPDF_Click(object sender, EventArgs e)
        {
            if (this.FileUpload1.HasFile)
            {
                string ext = System.IO.Path.GetExtension(this.FileUpload1.PostedFile.FileName).ToLower();
                if (ext == ".doc" || ext == ".docx")
                {
                    //Convert the input word document to a PDF file
                    # region Convert Doc to PDF
                    Stream readFile = this.FileUpload1.PostedFile.InputStream;
                    try
                    {
                        WordDocument wordDoc = null;
                        if (ext == ".doc")
                            wordDoc = new WordDocument(readFile, Syncfusion.DocIO.FormatType.Doc);
                        else if (ext == ".docx")
                            wordDoc = new WordDocument(readFile, Syncfusion.DocIO.FormatType.Docx);

                        //Initialize chart to image converter for converting charts in word to pdf conversion
                        wordDoc.ChartToImageConverter = new ChartToImageConverter();
                        wordDoc.ChartToImageConverter.ScalingMode = Syncfusion.OfficeChart.ScalingMode.Normal;

                        DocToPDFConverter converter = new DocToPDFConverter();
                        //Enable Direct PDF rendering mode for faster conversion.
                        converter.Settings.EnableFastRendering = chkBox1.Checked;
                        converter.Settings.AutoTag = CheckBox1.Checked;
                        converter.Settings.PreserveFormFields = CheckBox2.Checked;
                        converter.Settings.EmbedCompleteFonts = CheckBox4.Checked;
                        converter.Settings.EmbedFonts = CheckBox5.Checked;
                        converter.Settings.ExportBookmarks = CheckBox3.Checked ? Syncfusion.DocIO.ExportBookmarkType.Headings :
                                                            Syncfusion.DocIO.ExportBookmarkType.Bookmarks;
                        if(CheckBox6.Checked)
                        {
                            wordDoc.RevisionOptions.ShowMarkup = RevisionType.Deletions | RevisionType.Formatting | RevisionType.Insertions;
                            // Set revision bars color as Black.
                            wordDoc.RevisionOptions.RevisionBarsColor = RevisionColor.Black;
                            // Set revised properties (Formatting) color as Blue.
                            wordDoc.RevisionOptions.RevisedPropertiesColor = RevisionColor.Blue;
                            // Set deleted text (Deletions) color as Yellow.
                            wordDoc.RevisionOptions.DeletedTextColor = RevisionColor.Yellow;
                            // Set inserted text (Insertions) color as Pink.
                            wordDoc.RevisionOptions.InsertedTextColor = RevisionColor.Pink;
                        }
                        if(CheckBox7.Checked)
                        {
                            //Sets ShowInBalloons to render a document comments in converted PDF document.
                            wordDoc.RevisionOptions.CommentDisplayMode = CommentDisplayMode.ShowInBalloons;
                            //Sets the color to be used for Comment Balloon
                            wordDoc.RevisionOptions.CommentColor = RevisionColor.Blue;
                        }
                        //Convert word document into PDF document
                        PdfDocument pdfDoc = converter.ConvertToPDF(wordDoc);

                        pdfDoc.Save("DoctoPDF.pdf", Response, HttpReadType.Save);

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
                    this.label1.Text = "Please choose doc or docx file to convert to PDF";
                }
            }

            else
            {
                this.label1.Text = "Browse a word document and then click the button to convert as a PDF document";
            }
        }
        protected string GetDictionary(string fileName)
        {
            return new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\App_Data\\DocIO\\").FullName + fileName;
        }
    }
}