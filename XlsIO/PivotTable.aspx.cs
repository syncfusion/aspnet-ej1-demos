#region Copyright Syncfusion Inc. 2001-2021
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
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
using Syncfusion.XlsIO;
using System.Drawing;

namespace WebSampleBrowser.XlsIO
{
    public partial class PivotTable : System.Web.UI.Page
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
        /// Creates spreadsheet in Excel 2007 format
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {

            //New instance of XlsIO is created.[Equivalent to launching Microsoft Excel with no workbooks open].
            //The instantiation process consists of two steps.

            //Step 1 : Instantiate the spreadsheet creation engine.
            ExcelEngine excelEngine = new ExcelEngine();
            //Step 2 : Instantiate the excel application object.
            IApplication application = excelEngine.Excel;
            application.DefaultVersion = ExcelVersion.Excel2016;

            IWorkbook workbook = application.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath("PivotCodeDate.xlsx", Request));

            // The first worksheet object in the worksheets collection is accessed.
            IWorksheet sheet = workbook.Worksheets[0];

            //Access the sheet to draw pivot table.
            IWorksheet pivotSheet = workbook.Worksheets[1];
            pivotSheet.Activate();
            //Select the data to add in cache
            IPivotCache cache = workbook.PivotCaches.Add(sheet["A1:H50"]);

            //Insert the pivot table. 
            IPivotTable pivotTable = pivotSheet.PivotTables.Add("PivotTable1", pivotSheet["A1"], cache);
            pivotTable.Fields[4].Axis = PivotAxisTypes.Page;

            pivotTable.Fields[2].Axis = PivotAxisTypes.Row;
            pivotTable.Fields[6].Axis = PivotAxisTypes.Row;
            pivotTable.Fields[3].Axis = PivotAxisTypes.Column;

            IPivotField field = pivotSheet.PivotTables[0].Fields[5];
            pivotTable.DataFields.Add(field, "Sum of Units", PivotSubtotalTypes.Sum);
            if (ckbRowFilter.Checked)
            {
                if (rdbRCLabelFilter.Checked)
                {
                    //Apply label filter to row field
                    pivotTable.Fields[2].PivotFilters.Add(PivotFilterType.CaptionEqual, null, "East", null);
                }
                else if (rdbRCValueFilter.Checked)
                {
                    //Apply value filter to row field
                    pivotTable.Fields[2].PivotFilters.Add(PivotFilterType.ValueEqual, field, "1341", null);
                }
                else
                {
                    //Apply multiple item filter to row field
                    pivotTable.Fields[2].Items[0].Visible = false;
                    pivotTable.Fields[2].Items[1].Visible = false;
                }
            }
            if (ckbColumnFilter.Checked)
            {
                if (rdbRCLabelFilter.Checked)
                {
                    //Apply label filter to column field
                    pivotTable.Fields[3].PivotFilters.Add(PivotFilterType.CaptionNotEqual, null, "Jones", null);
                }
                else if (rdbRCValueFilter.Checked)
                {
                    //Apply value filter to column field
                    pivotTable.Fields[3].PivotFilters.Add(PivotFilterType.ValueEqual, field, "398", null);
                }
                else
                {
                    //Apply multiple item filter to column field
                    pivotTable.Fields[3].Items[0].Visible = false;
                    pivotTable.Fields[3].Items[1].Visible = false;
                }
            }
            if (ckbPageFilter.Checked)
            {
                //Create Pivot Filter object to apply filter to page Fields
                IPivotFilter filterValue = pivotTable.Fields[4].PivotFilters.Add();
                //Page Field would be filtered with value 'Binder'
                filterValue.Value1 = "Binder";
                //XlsIO layout the Pivot table like Microsoft Excel
                if (!rdbRCValueFilter.Checked)
                    pivotTable.Layout();
            }
            else if (ckbMultiplePageFilter.Checked)
            {
                //Apply multiple item filter to page field
                pivotTable.Fields[4].Items[1].Visible = false;
                pivotTable.Fields[4].Items[2].Visible = false;
                if (!rdbRCValueFilter.Checked)
                    pivotTable.Layout();
            }

            //Apply built in style.
            pivotTable.BuiltInStyle = PivotBuiltInStyles.PivotStyleMedium2;
            pivotSheet.Range[1, 1, 1, 14].ColumnWidth = 11;
            pivotSheet.SetColumnWidth(1, 15.29);
            pivotSheet.SetColumnWidth(2, 15.29);
            //Activate the pivot sheet.
            pivotSheet.Activate();

            workbook.SaveAs("Sample.xlsx", Response, ExcelDownloadType.PromptDialog, ExcelHttpContentType.Excel2016);

            //Close the workbook.
            workbook.Close();

            //No exception will be thrown if there are unsaved workbooks.
            excelEngine.ThrowNotSavedOnDestroy = false;
            excelEngine.Dispose();
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            ExcelEngine excelEngine = new ExcelEngine();

            IApplication application = excelEngine.Excel;
            application.DefaultVersion = ExcelVersion.Excel2016;

            IWorkbook workbook = application.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath("PivotTable.xlsx", Request));

            // The first worksheet object in the worksheets collection is accessed.
            IWorksheet sheet = workbook.Worksheets[1];
            sheet.Activate();
            //Access the collection of Pivot Table in the worksheet.
            IPivotTables pivotTables = sheet.PivotTables;

            //Access the Single pivot table from the collection.
            IPivotTable pivotTable = pivotTables[0];

            //Access collection of pivot fields from the pivot table.
            IPivotFields fields = pivotTable.Fields;

            //Access a Pivot field from the collection.
            IPivotField field = fields[2];
            //Add the field to page axis
            field.Axis = PivotAxisTypes.Page;

            fields[1].Axis = PivotAxisTypes.None;
            fields[0].Axis = PivotAxisTypes.None;
            fields[3].Axis = PivotAxisTypes.Row;
            fields[4].Axis = PivotAxisTypes.Column;
            IPivotField dataField = fields[5];

            //Accessing the Calculated fields from the pivot table .
            IPivotCalculatedFields calculatedfields = pivotTable.CalculatedFields;

            //Adding Calculatd field to the pivot table.
            //  IPivotField calculatedField = calculatedfields.Add("Percent", "Units/3000*100");

            if (ckbRowFilter.Checked)
            {
                if (rdbRCLabelFilter.Checked)
                {
                    //Apply label filter to row field
                    pivotTable.Fields[3].PivotFilters.Add(PivotFilterType.CaptionNotEqual, null, "Parent", null);
                }
                else if (rdbRCValueFilter.Checked)
                {
                    //Apply value filter to row field
                    pivotTable.Fields[3].PivotFilters.Add(PivotFilterType.ValueGreaterThan, dataField, "100", null);
                }
                else
                {
                    //Apply multiple item filter to row field
                    pivotTable.Fields[3].Items[0].Visible = false;
                }

            }
            if (ckbColumnFilter.Checked)
            {
                if (rdbRCLabelFilter.Checked)
                {
                    //Apply label filter to column field
                    pivotTable.Fields[4].PivotFilters.Add(PivotFilterType.CaptionNotEqual, null, "Binder", null);
                }
                else if (rdbRCValueFilter.Checked)
                {
                    //Apply value filter to column field
                    pivotTable.Fields[4].PivotFilters.Add(PivotFilterType.ValueGreaterThan, dataField, "100", null);
                }
                else
                {
                    //Apply multiple filter to column field
                    pivotTable.Fields[4].Items[0].Visible = false;
                }

            }
            if (ckbPageFilter.Checked)
            {

                //Create Pivot Filter object to apply filter to page Fields
                IPivotFilter filterValue = pivotTable.Fields[2].PivotFilters.Add();
                //Page Field would be filtered with value 'East'
                filterValue.Value1 = "East";
                //XlsIO layout the Pivot table like Microsoft Excel
                if (!rdbRCValueFilter.Checked)
                    pivotTable.Layout();
            }
            else if (ckbMultiplePageFilter.Checked)
            {
                pivotTable.Fields[2].Items[0].Visible = false;
            }
            sheet.Range[1, 1, 1, 14].ColumnWidth = 11;
            sheet.SetColumnWidth(1, 15.29);
            sheet.SetColumnWidth(2, 15.29);        
            workbook.SaveAs("Sample.xlsx", Response, ExcelDownloadType.PromptDialog, ExcelHttpContentType.Excel2016);

            //Close the workbook.
            workbook.Close();

            //No exception will be thrown if there are unsaved workbooks.
            excelEngine.ThrowNotSavedOnDestroy = false;
            excelEngine.Dispose();
        }
        #endregion

        protected void chkPageFilter_CheckedChanged(object sender, EventArgs e)
        {
            if (ckbPageFilter.Checked)
                ckbMultiplePageFilter.Checked = false;
        }
        protected void ckbMultiplePageFilter_CheckedChanged(object sender, EventArgs e)
        {
            if (ckbMultiplePageFilter.Checked)
                ckbPageFilter.Checked = false;
        }
        protected void ckbRowFilter_CheckedChanged(object sender, EventArgs e)
        {
            if (ckbRowFilter.Checked)
            {
                rdbRCLabelFilter.Enabled = true;
                rdbRCMultipleFilter.Enabled = true;
                rdbRCValueFilter.Enabled = true;
            }
            else if (!(ckbRowFilter.Checked))
            {
                if (!ckbColumnFilter.Checked)
                {
                    rdbRCLabelFilter.Enabled = false;
                    rdbRCMultipleFilter.Enabled = false;
                    rdbRCValueFilter.Enabled = false;
                }
            }
        }
        protected void ckbColumnFilter_CheckedChanged(object sender, EventArgs e)
        {
            if (ckbColumnFilter.Checked)
            {
                rdbRCLabelFilter.Enabled = true;
                rdbRCMultipleFilter.Enabled = true;
                rdbRCValueFilter.Enabled = true;
            }
            else if (!ckbColumnFilter.Checked)
            {
                if (!(ckbRowFilter.Checked))
                {
                    rdbRCLabelFilter.Enabled = false;
                    rdbRCMultipleFilter.Enabled = false;
                    rdbRCValueFilter.Enabled = false;
                }
            }
        }
    }
}