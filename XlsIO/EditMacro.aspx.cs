#region Copyright Syncfusion Inc. 2001-2022.
// Copyright Syncfusion Inc. 2001-2022. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.XlsIO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Syncfusion.Office;

namespace WebSampleBrowser.XlsIO
{
    public partial class EditMacro : System.Web.UI.Page
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

        # region Events
        /// <summary>
        /// Edit Macro
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            //Step 1 : Instantiate the spreadsheet creation engine.
            ExcelEngine excelEngine = new ExcelEngine();
            //Step 2 : Instantiate the excel application object.
            IApplication application = excelEngine.Excel;

            // Accessing workbook
            IWorkbook workbook = application.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath(@"EditMacroTemplate.xltm", Request), ExcelOpenType.Automatic);

            #region VbaProject
            IVbaProject vbaProject = workbook.VbaProject;
            IVbaModule vbaModule = vbaProject.Modules["Module1"];
            vbaModule.Code = vbaModule.Code.Replace("xlAreaStacked", "xlLine");
            #endregion


            if (rdButtonXls.Checked)
            {
                //Save as .xls format
                workbook.SaveAs("Sample.xls", ExcelSaveType.SaveAsXLS, Response, ExcelDownloadType.PromptDialog);
            }
            //Save as .xltm format
            else if (rdButtonXltm.Checked)
            {
                workbook.Version = ExcelVersion.Excel2016;
                workbook.SaveAs("Sample.xltm", ExcelSaveType.SaveAsMacroTemplate, Response, ExcelDownloadType.PromptDialog);
            }
            else if (rdButtonXlsm.Checked)
            {
                //Save in .xlsm format
                workbook.SaveAs("Sample.xlsm", ExcelSaveType.SaveAsMacro, Response, ExcelDownloadType.PromptDialog);
            }

            workbook.Close();
            excelEngine.Dispose();
        }
        # endregion
    }
}