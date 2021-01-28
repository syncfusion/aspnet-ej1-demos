#region Copyright Syncfusion Inc. 2001 - 2021
//
//  Copyright Syncfusion Inc. 2001 - 2021. All rights reserved.
//
//  Use of this code is subject to the terms of our license.
//  A copy of the current license can be obtained at any time by e-mailing
//  licensing@syncfusion.com. Any infringement will be prosecuted under
//  applicable laws. 
//
#endregion

using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Syncfusion.XlsIO;
using System.IO;

namespace WebSampleBrowser.XlsIO
{
    public partial class EncryptionDecryption : System.Web.UI.Page
    {
        # region Page Load
        /// <summary>
        /// Handles the page load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        # endregion

        #region Events
        /// <summary>
        /// Encrypts the selected spreadsheet
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
                //Step 1 : Instantiate the spreadsheet creation engine.
                ExcelEngine excelEngine = new ExcelEngine();

                //Step 2 : Instantiate the excel application object.
                IApplication application = excelEngine.Excel;
                application.DefaultVersion = ExcelVersion.Excel2016;

                // Opening the Existing Worksheet from a Workbook.
                IWorkbook workbook = application.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath("Encrypt.xlsx", Request));

                //Encrypt the workbook with password.
                workbook.PasswordToOpen = "syncfusion";
                //Saving the workbook to disk.
                if (this.rdBtnXls.Checked)
                {
                    workbook.Version = ExcelVersion.Excel97to2003;
                    workbook.SaveAs("EncryptedWorkbook.xls", Response, ExcelDownloadType.PromptDialog);
                }
                else
                {
                    workbook.SaveAs("EncryptedWorkbook.xlsx", Response, ExcelDownloadType.PromptDialog);
                }

                // Close the workbook
                workbook.Close();
                excelEngine.Dispose();
      
        }

        /// <summary>
        /// Decrpts the selected spreadsheet
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button2_Click(object sender, EventArgs e)
        {
         
                    //New instance of XlsIO is created.[Equivalent to launching Microsoft Excel with no workbooks open].
                    //The instantiation process consists of two steps.

                    //Step 1 : Instantiate the spreadsheet creation engine.
                    ExcelEngine excelEngine = new ExcelEngine();

                    //Step 2 : Instantiate the excel application object.
                    IApplication application = excelEngine.Excel;
                    application.DefaultVersion = ExcelVersion.Excel2016;

                    // Opening the encrypted Workbook.
                    IWorkbook workbook = application.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath("EncryptedSpreadsheet.xlsx",Request), ExcelParseOptions.Default, true, "syncfusion");

                    //Modify the decrypted document.
                    workbook.Worksheets[0].Range["B2"].Text = "Demo for workbook decryption with Essential XlsIO";
                    workbook.Worksheets[0].Range["B5"].Text = "This document is decrypted using password syncfusion"+ ".";

                    workbook.PasswordToOpen = "";
                    //Saving the workbook to disk.
                    if (this.rdBtnXls.Checked)
                    {
                        workbook.Version = ExcelVersion.Excel97to2003;
                        workbook.SaveAs("Final.xls", Response, ExcelDownloadType.PromptDialog);
                    }
                    else
                    {
                        workbook.SaveAs("Final.xlsx", Response, ExcelDownloadType.PromptDialog);
                    }
                   // Close the workbook
                    workbook.Close();
                    excelEngine.Dispose();
              
          }
        # endregion
    }
}