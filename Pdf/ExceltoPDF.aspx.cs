#region Copyright Syncfusion Inc. 2001 - 2019
// Copyright Syncfusion Inc. 2001 - 2019. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion

using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Syncfusion.XlsIO;
using Syncfusion.Pdf;
using Syncfusion.ExcelToPdfConverter;

namespace WebSampleBrowser.Pdf
{
    public partial class ExceltoPDF : System.Web.UI.Page
    {
        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        #endregion

        protected void btnExceltoPDFClick(object sender, EventArgs e)
        {
            if (this.FileUpload1.HasFile)
            {
                string ext = System.IO.Path.GetExtension(this.FileUpload1.PostedFile.FileName).ToLower();
                if (ext == ".xls" || ext == ".xlsx")
                {
                    //Convert the input Excel document to a PDF file
                    # region Convert Excel to PDF
                    Stream readFile = this.FileUpload1.PostedFile.InputStream;
                    try
                    {
                        ExcelToPdfConverter converter = null;
                        if (ext == ".xls")
                            converter = new ExcelToPdfConverter(readFile);
                        else if (ext == ".xlsx")
                            converter = new ExcelToPdfConverter(readFile);

                        //Intialize the PdfDocument Class
                        PdfDocument pdfDoc = new PdfDocument();

                        //Intialize the ExcelToPdfConverterSettings class
                        ExcelToPdfConverterSettings settings = new ExcelToPdfConverterSettings();

                        //Set the Layout Options for the output Pdf page.
                        if (noScaleRadioBtn.Checked)
                            settings.LayoutOptions = LayoutOptions.NoScaling;
                        else if (allRowsRadioBtn.Checked)
                            settings.LayoutOptions = LayoutOptions.FitAllRowsOnOnePage;
                        else if (allColumnRadioBtn.Checked)
                            settings.LayoutOptions = LayoutOptions.FitAllColumnsOnOnePage;
                        else
                            settings.LayoutOptions = LayoutOptions.FitSheetOnOnePage;

                        //Assign the output PdfDocument to the TemplateDocument property of ExcelToPdfConverterSettings 
                        settings.TemplateDocument = pdfDoc;
                        settings.DisplayGridLines = GridLinesDisplayStyle.Invisible;
                        //Convert the Excel document to PDf
                        pdfDoc = converter.Convert(settings);

                        //Save the pdf file            
                        if (this.CheckBox1.Checked)
                        {
                            pdfDoc.Save("ExceltoPDF.pdf", Response, HttpReadType.Open);
                        }
                        else
                        {
                            pdfDoc.Save("ExceltoPDF.pdf", Response, HttpReadType.Save);
                        }
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
                    this.label1.Text = "Please choose xls or xlsx file to convert to PDF";
                }
            }

            else
            {
                this.label1.Text = "Browse a Excel document and then click the button to convert as a PDF document";
            }
        }
        protected void RadioButton4_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}