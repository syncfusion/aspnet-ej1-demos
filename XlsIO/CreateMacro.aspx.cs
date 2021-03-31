#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
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
    public partial class CreateMacro : System.Web.UI.Page
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
        /// Creates Macro
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
            IWorkbook workbook = application.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath(@"CreateMacroTemplate.xlsx", Request), ExcelOpenType.Automatic);
            workbook.Version = ExcelVersion.Excel2016;

            #region VbaProject
            //Access Vba Project from workbook
            IVbaProject vbaProject = workbook.VbaProject;

            IVbaModule vbaModule = vbaProject.Modules.Add("Module1", VbaModuleType.StdModule);
            vbaModule.Code = GetVbaCode();
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

        /// <summary>
        /// Get the Vba code as string
        /// </summary>
        /// <param name="inputFile"></param>
        /// <returns>Vba</returns>
        private string GetVbaCode()
        {
            string vbaCode = "Sub Auto_Open()\n" +
                             "'\n" +
                             "' Auto_Open Macro\n" +
                             "'\n" +
                             "\n" +
                             "'\n" +
                                "Range(\"B3:C28\").Select\n" +
                                "Range(\"E3\").Activate\n" +
                                "Sheet1.Activate\n" +
                                "ActiveSheet.Shapes.AddChart2(276, xlAreaStacked).Select\n" +
                                "ActiveChart.SetSourceData Source:= Range(\"'Exchange Report'!$B$3:$C$28\")\n" +
                                "ActiveChart.Parent.Left = Range(\"F3\").Left + 3\n" +
                                "ActiveChart.Parent.Top = Range(\"F3\").Top\n" +
                                "ActiveChart.Parent.Width = Range(\"M3\").Left - ActiveChart.Parent.Left\n" +
                                "ActiveChart.Parent.Height = Range(\"F16\").Top - ActiveChart.Parent.Top\n" +
                                "ActiveChart.ChartTitle.Select\n" +
                                "ActiveChart.ChartTitle.Text = \"Open-Close Statistics\"\n" +
                                "Selection.Format.TextFrame2.TextRange.Characters.Text = \"Open-Close Statistics\"\n" +
                                "With Selection.Format.TextFrame2.TextRange.Characters(1, 21).Font\n" +
                                "    .BaselineOffset = 0\n" +
                                "    .Bold = msoFalse\n" +
                                "    .NameComplexScript = \" +mn-cs\"\n" +
                                "    .NameFarEast = \" +mn-ea\"\n" +
                                "    .Fill.Visible = msoTrue\n" +
                                "    .Fill.ForeColor.RGB = RGB(89, 89, 89)\n" +
                                "    .Fill.Transparency = 0\n" +
                                "    .Fill.Solid\n" +
                                "    .Size = 14\n" +
                                "    .Italic = msoFalse\n" +
                                "    .Kerning = 12\n" +
                                "    .Name = \" +mn-lt\"\n" +
                                "    .UnderlineStyle = msoNoUnderline\n" +
                                "    .Spacing = 0\n" +
                                "    .Strike = msoNoStrike\n" +
                                "End With\n" +
                                "ActiveChart.FullSeriesCollection(1).XValues = \"='Exchange Report'!$A$4:$A$28\"\n" +
                                "ActiveChart.ChartArea.Select\n" +
                                "ActiveChart.ChartTitle.Select\n" +
                                "Selection.Format.TextFrame2.TextRange.Font.Bold = msoTrue\n" +
                                "ActiveChart.ChartArea.Select\n" +
                                "ActiveChart.ChartTitle.Select\n" +
                                "Selection.Top = 8\n" +
                                "ActiveChart.ChartColor = 13\n" +
                             "End Sub";
            return vbaCode;
        }
        #endregion
    }
}