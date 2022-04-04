#region Copyright Syncfusion Inc. 2001-2022
// Copyright Syncfusion Inc. 2001-2022. All rights reserved.
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
using Syncfusion.ExcelChartToImageConverter;
using System.Drawing.Printing;
namespace WebSampleBrowser.XlsIO 
{
    public partial class Print : System.Web.UI.Page
    {
        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        #endregion

        protected void btnPrintExcelClick(object sender, EventArgs e)
        {
            if (this.FileUpload1.HasFile)
            {
                string ext = System.IO.Path.GetExtension(this.FileUpload1.PostedFile.FileName).ToLower();
                if (ext == ".xls" || ext == ".xlsx")
                {
                    #region Print

                    Stream readFile = this.FileUpload1.PostedFile.InputStream;
                    try
                    {
                        ExcelToPdfConverter converter = null;
                        if (ext == ".xls")
                            converter = new ExcelToPdfConverter(readFile);
                        else if (ext == ".xlsx")
                            converter = new ExcelToPdfConverter(readFile);
                        converter.ChartToImageConverter = new ChartToImageConverter();
                        //Set the image quality 
                        converter.ChartToImageConverter.ScalingMode = ScalingMode.Best;

                        //Create new printerSettings instance.
                        PrinterSettings printerSettings = new PrinterSettings();
                        printerSettings.FromPage = 1;
						printerSettings.Collate = true;
                        printerSettings.Copies = 2;
                        printerSettings.Duplex = Duplex.Simplex;
                        if (this.printWithConverterAndPrinterBtn.Checked)
                        {
                            //Print excel document with specified printer settings and converter settings.
                            converter.Print(printerSettings, GetConverterSettings());
                        }
                        else if (this.printWithPrinterBtn.Checked)
                        {
                            //Print excel document with specified printer settings.
                            converter.Print(printerSettings);
                        }
                        else if (this.printWithConverterBtn.Checked)
                        {
                            //Print excel document with specified and converter settings.
                            converter.Print(GetConverterSettings());
                        }
                        else if (this.defaultPrintBtn.Checked)
                        {
                            //print excel document with default printer settings.
                            converter.Print();
                        }

                    }
                    catch (Exception)
                    {
                        this.label1.Text = "The input document could not be processed, Could you please email the document to support@syncfusion.com for troubleshooting";
                    }

                    # endregion
                }
                else
                {
                    this.label1.Text = "Please choose xls or xlsx file to print";
                }
            }
            else
            {
                this.label1.Text = "Browse a Excel document and then click the button to print the document";
            }
        }
        private ExcelToPdfConverterSettings GetConverterSettings()
        {
            //Intialize the ExcelToPdfconverterSettings
            ExcelToPdfConverterSettings converterSettings = new ExcelToPdfConverterSettings();

            if (noScaleRadioBtn.Checked)
                converterSettings.LayoutOptions = LayoutOptions.NoScaling;
            else if (allRowsRadioBtn.Checked)
                converterSettings.LayoutOptions = LayoutOptions.FitAllRowsOnOnePage;
            else if (allColumnRadioBtn.Checked)
                converterSettings.LayoutOptions = LayoutOptions.FitAllColumnsOnOnePage;
            else
                converterSettings.LayoutOptions = LayoutOptions.FitSheetOnOnePage;

            return converterSettings;
        }

        protected void btnInputTemplateClick(object sender, EventArgs e)
        {
            if (this.FileUpload1.HasFile)
            {
                ExcelEngine excelEngine = new ExcelEngine();
                IApplication application = excelEngine.Excel;
                Stream readFile = this.FileUpload1.PostedFile.InputStream;
                IWorkbook workbook = application.Workbooks.Open(readFile);
                if (workbook.Version == ExcelVersion.Excel97to2003)
                    workbook.SaveAs("Template.xls", Response, ExcelDownloadType.PromptDialog);
                else
                    workbook.SaveAs("Template.xlsx", Response, ExcelDownloadType.PromptDialog);
            }
        }
        protected void option_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.printWithConverterBtn.Checked || this.printWithConverterAndPrinterBtn.Checked)
            {
                this.converterSettings.Visible = true;
            }
            else
                this.converterSettings.Visible = false;
        }
    }
}