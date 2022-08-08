#region Copyright Syncfusion Inc. 2001-2022
//
//  Copyright Syncfusion Inc. 2001-2022. All rights reserved.
//
//  Use of this code is subject to the terms of our license.
//  A copy of the current license can be obtained at any time by e-mailing
//  licensing@syncfusion.com. Any infringement will be prosecuted under
//  applicable laws. 
//
#endregion

using System;
using System.Drawing;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Syncfusion.XlsIO;

namespace WebSampleBrowser.XlsIO
{
    public partial class Sunburst : System.Web.UI.Page
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
        /// Creates spreadsheet
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            //Instantiate the spreadsheet creation engine.
            ExcelEngine excelEngine = new ExcelEngine();
            IApplication application = excelEngine.Excel;
            //A new workbook is created.[Equivalent to creating a new workbook in Microsoft Excel]
            //Open workbook with Data
            IWorkbook workbook = application.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath("SunburstTemplate.xlsx", Request));
            IWorksheet sheet = workbook.Worksheets[0];
            IChart chart = null;

            if (this.rBtnSheet.Checked)
                chart = workbook.Charts.Add();
            else
                chart = workbook.Worksheets[0].Charts.Add();            
            
            #region Sunburst Chart Settings
            chart.ChartType = ExcelChartType.SunBurst;
            chart.DataRange = sheet["A1:D29"];
            chart.ChartTitle = "Breakdown of Bookstore Revenue";
            #endregion

            chart.Legend.Position = ExcelLegendPosition.Right;

            if (this.rBtnSheet.Checked)
                chart.Activate();
            else
            {
                workbook.Worksheets[0].Activate();
                IChartShape chartShape = chart as IChartShape;
                chartShape.TopRow = 1;
                chartShape.BottomRow = 23;
                chartShape.LeftColumn = 6;
                chartShape.RightColumn = 15;
            }
            //Saving the workbook to disk.          
            workbook.Version = ExcelVersion.Excel2016;
            workbook.SaveAs("Sunburst_Chart.xlsx", Response, ExcelDownloadType.PromptDialog, ExcelHttpContentType.Excel2016);
            //No exception will be thrown if there are unsaved workbooks.
            excelEngine.ThrowNotSavedOnDestroy = false;
            excelEngine.Dispose();
        }

        /// <summary>
        /// Open the input template file
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button2_Click(object sender, EventArgs e)
        {
            //Instantiate the spreadsheet creation engine.
            ExcelEngine excelEngine = new ExcelEngine();
            IApplication application = excelEngine.Excel;
            //A new workbook is created.[Equivalent to creating a new workbook in Microsoft Excel]
            //Open workbook with Data
            IWorkbook workbook = application.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath("SunburstTemplate.xlsx", Request));
            //Saving the workbook to disk.          
            workbook.Version = ExcelVersion.Excel2016;
            workbook.SaveAs("InputTemplate.xlsx", Response, ExcelDownloadType.PromptDialog, ExcelHttpContentType.Excel2016);
            //No exception will be thrown if there are unsaved workbooks.
            excelEngine.ThrowNotSavedOnDestroy = false;
            excelEngine.Dispose();
        }
        # endregion
    }

}