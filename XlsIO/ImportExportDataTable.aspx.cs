#region Copyright Syncfusion Inc. 2001 - 2020
// Copyright Syncfusion Inc. 2001 - 2020. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
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
using Syncfusion.XlsIO;
using Syncfusion.XlsIO.Implementation;

namespace WebSampleBrowser.XlsIO
{
    public partial class ImportExportDataTable : System.Web.UI.Page
    {
		static DataTable sourceDataTable = null;
        # region Page Load
        /// <summary>
        /// Handles the page load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
		protected void Page_Load(object sender, EventArgs e)
		{
			this.DataGrid1.DataSource = null;
		}			
        protected void Button3_Click(object sender, EventArgs e)
        {

            //Imports Data from the Template spreadsheet into the Grid.

            //New instance of XlsIO is created.[Equivalent to launching Microsoft Excel with no workbooks open].
            //The instantiation process consists of two steps.

            //Step 1 : Instantiate the spreadsheet creation engine.
            ExcelEngine excelEngine = new ExcelEngine();
            //Step 2 : Instantiate the excel application object.
            IApplication application = excelEngine.Excel;

            //Open an existing spreadsheet which will be used as a template for generating the new spreadsheet.
            //After opening, the workbook object represents the complete in-memory object model of the template spreadsheet.
            IWorkbook workbook = application.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath("NorthwindDataTemplate.xls", Request));
            //The first worksheet object in the worksheets collection is accessed.
            IWorksheet sheet = workbook.Worksheets[0];
			
            sheet.ExportDataTableEvent += ExportDataTableEventActions;
            //Read data from spreadsheet.
            DataTable customersTable = sheet.ExportDataTable(sheet.UsedRange, ExcelExportDataTableOptions.ColumnNames);
            this.DataGrid1.DataSource = customersTable;
            this.DataGrid1.DataBind();
			sourceDataTable = customersTable;
            btnexport.Enabled = true;

            //Close the workbook.
            workbook.Close();

            //No exception will be thrown if there are unsaved workbooks.
            excelEngine.ThrowNotSavedOnDestroy = false;
            excelEngine.Dispose();
        }
        # endregion

        /// <summary>
        /// Export dataTable required actions.
        /// </summary>
        /// <param name="e"></param>
        protected void ExportDataTableEventActions(ExportDataTableEventArgs e)
        {
            if(this.rBtnSkip.Checked)
            {
                if ( e.ExcelValue != null && e.ExcelValue.ToString() == "Owner")
                    e.ExportDataTableAction = ExportDataTableActions.SkipRow;
            }
            if(this.rBtnStop.Checked)
            {
                if (e.ExcelValue != null && e.ExcelValue.ToString() == "CACTU")
                    e.ExportDataTableAction = ExportDataTableActions.StopExporting;
            }
            if(this.rBtnReplaceValue.Checked)
            {
                if (e.ExcelValue != null && e.ExcelValue.ToString() == "México D.F.")
                    e.DataTableValue = "Mexico";
            }
        }
		protected void Button1_Click(object sender, EventArgs e)
        {
            //Step 1 : Instantiate the spreadsheet creation engine.
            ExcelEngine excelEngine = new ExcelEngine();
            //Step 2 : Instantiate the excel application object.
            IApplication application = excelEngine.Excel;

            //Get path of the Input file
            string inputPath = XlsIOHelper.ResolveApplicationDataPath("NorthwindDataTemplate.xls", Request);

            //After opening, the workbook object represents the complete in-memory object model of the template spreadsheet.
            IWorkbook workbook = application.Workbooks.Open(inputPath);
            workbook.Version = ExcelVersion.Excel2016;
            workbook.SaveAs("InputDocument.xlsx", Response, ExcelDownloadType.PromptDialog, ExcelHttpContentType.Excel2016);
        }
	    protected void CheckChanged(object sender, EventArgs e)  
        {  
          btnexport.Enabled = false;
        }  
        # region Events
        /// <summary>
        /// Exports the data table to a spreadsheet
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

            // Default version is set as Excel 2007
            if (this.rBtnXlsx.Checked)
                application.DefaultVersion = ExcelVersion.Excel2016;
            else
                application.DefaultVersion = ExcelVersion.Excel97to2003;
            
            //A new workbook is created.[Equivalent to creating a new workbook in Microsoft Excel]
            //The new workbook will have 3 worksheets
            IWorkbook workbook = application.Workbooks.Create(1);

            //The first worksheet object in the worksheets collection is accessed.
            IWorksheet sheet = workbook.Worksheets[0];

            //Export DataTable.
            if (sourceDataTable != null)
            {
                sheet.ImportDataTable(sourceDataTable, true, 3, 1, -1, -1);
            }

            //Formatting the Report

            //Body Style
            IStyle bodyStyle = workbook.Styles.Add("BodyStyle");
            bodyStyle.BeginUpdate();

            //Add custom colors to the palette.
            workbook.SetPaletteColor(9, Color.FromArgb(239, 242, 247));
            bodyStyle.Color = Color.FromArgb(239, 243, 247);
            bodyStyle.Borders[ExcelBordersIndex.EdgeLeft].LineStyle = ExcelLineStyle.Thin;
            bodyStyle.Borders[ExcelBordersIndex.EdgeRight].LineStyle = ExcelLineStyle.Thin;

            //Apply Style
            sheet.UsedRange.CellStyleName = "BodyStyle";
            bodyStyle.EndUpdate();

            //Header Style
            IStyle headerStyle = workbook.Styles.Add("HeaderStyle");
            headerStyle.BeginUpdate();

            //Add custom colors to the palette.
            workbook.SetPaletteColor(8, Color.FromArgb(182, 189, 218));
            headerStyle.Color = Color.FromArgb(182, 189, 218);
            headerStyle.Font.Bold = true;
            headerStyle.Borders[ExcelBordersIndex.EdgeLeft].LineStyle = ExcelLineStyle.Thin;
            headerStyle.Borders[ExcelBordersIndex.EdgeRight].LineStyle = ExcelLineStyle.Thin;
            headerStyle.Borders[ExcelBordersIndex.EdgeTop].LineStyle = ExcelLineStyle.Thin;
            headerStyle.Borders[ExcelBordersIndex.EdgeBottom].LineStyle = ExcelLineStyle.Thin;

            //Apply Style
            sheet.Range["A1:K3"].CellStyleName = "HeaderStyle";
            headerStyle.EndUpdate();

            //Remove grid lines in the worksheet.
            sheet.IsGridLinesVisible = false;

            //Autofit Rows and Columns
            sheet.UsedRange.AutofitRows();
            sheet.UsedRange.AutofitColumns();

            //Adjust Row Height.
            sheet.Rows[2].RowHeight = 25;

            //Freeze header row.
            sheet.Range["A4"].FreezePanes();

            sheet.Range["C2"].Text = "Customer Details";
            sheet.Range["C2:D2"].Merge();
            sheet.Range["C2"].CellStyle.Font.Size = 14;
            sheet.Range["C2"].CellStyle.HorizontalAlignment = ExcelHAlign.HAlignCenter;

            if (this.rBtnXlsx.Checked)
                workbook.SaveAs("Sample.xlsx", Response, ExcelDownloadType.PromptDialog, ExcelHttpContentType.Excel2016);
            else
                workbook.SaveAs("Sample.xls", ExcelSaveType.SaveAsXLS, Response, ExcelDownloadType.PromptDialog);            
            workbook.Close();
            excelEngine.Dispose();
        }
        # endregion
    }
}