#region Copyright Syncfusion Inc. 2001 - 2019
// Copyright Syncfusion Inc. 2001 - 2019. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Data;
using System.Configuration;
using System.Drawing;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Syncfusion.XlsIO;
using Syncfusion.Calculate;

namespace WebSampleBrowser.XlsIO
{
    public partial class ComputeSpecificFormula : System.Web.UI.Page
    {
        # region Private Members
        ExcelEngine excelEngine;
        IWorkbook workBook;
        CalcEngine calcEngine;
        # endregion

        # region Page Load
        /// <summary>
        /// Handles the page load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {


            Page.DataBind();
            this.GridView1.FooterRow.Cells[1].ColumnSpan = 4;
            this.GridView1.FooterRow.Cells[1].Text = "Computed Results (Select a Row):";
            for (int i = 3; i < this.GridView1.FooterRow.Cells.Count + 1; i++)
                this.GridView1.FooterRow.Cells.RemoveAt(3);
        }
        # endregion

        # region Helpher Methods

        /// <summary>
        /// Creates data table from the data source
        /// </summary>
        /// <param name="sheetID"></param>
        /// <returns></returns>
        protected DataTable GetData(int sheetID)
        {
            excelEngine = new ExcelEngine();
            string filePath = null;

            if (!this.rdButtonXls.Checked)
            {
                if (this.rdButtonXlsx.Checked)
                    excelEngine.Excel.DefaultVersion = ExcelVersion.Excel2007;
                else if (this.rdButtonXlsx2010.Checked)
                    excelEngine.Excel.DefaultVersion = ExcelVersion.Excel2010;
                else if (this.rdButtonXlsx2013.Checked)
                    excelEngine.Excel.DefaultVersion = ExcelVersion.Excel2013;
                filePath = XlsIOHelper.ResolveApplicationDataPath("Input.xlsx", Request);
            }
            else
                filePath = XlsIOHelper.ResolveApplicationDataPath("Input.xls", Request);

            workBook = excelEngine.Excel.Workbooks.Open(filePath);

            IWorksheet sheet = workBook.Worksheets[sheetID];
            DataTable dt, dtTemp;
            dtTemp = new DataTable();

            //Enable to calculate formulas in the sheet.
            sheet.EnableSheetCalculations();

            //Assign the sheet calculation engine.
            calcEngine = sheet.CalcEngine;
            if (sheetID == 0)
            {
                dt = sheet.ExportDataTable(1, 1, 15, 5, ExcelExportDataTableOptions.None);
                dtTemp.Columns.Add(" ");
                foreach (DataColumn dc in dt.Columns)
                    dtTemp.Columns.Add(dc.ColumnName);
                for (int row = 0; row < dt.Rows.Count; row++)
                {
                    DataRow dr = dtTemp.NewRow();
                    dr[0] = string.Format("{0}", row + 1);
                    for (int col = 0; col < dt.Columns.Count; col++)
                        dr[col + 1] = dt.Rows[row][col];
                    dtTemp.Rows.Add(dr);
                }

                for (int i = 0; i < 5; i++)
                {
                    dtTemp.Columns[i + 1].ColumnName = string.Format("{0}", (char)((int)'A' + i));
                }
            }
            else
            {
                dt = sheet.ExportDataTable(1, 1, 15, 8, ExcelExportDataTableOptions.None);
                dtTemp.Columns.Add(" ");
                foreach (DataColumn dc in dt.Columns)
                    dtTemp.Columns.Add(dc.ColumnName);
                for (int row = 0; row < dt.Rows.Count; row++)
                {
                    DataRow dr = dtTemp.NewRow();
                    dr[0] = string.Format("{0}", row + 1);
                    for (int col = 0; col < dt.Columns.Count; col++)
                        dr[col + 1] = dt.Rows[row][col];
                    dtTemp.Rows.Add(dr);
                }
                for (int i = 0; i < 8; i++)
                {
                    dtTemp.Columns[i + 1].ColumnName = string.Format("{0}", (char)((int)'A' + i));
                }
            }
            return dtTemp;
        }
        # endregion

        # region Events
        protected void Button2_Click(object sender, EventArgs e)
        {
            //Saving the workbook to disk.

            if (this.rdButtonXlsx.Checked)
                workBook.SaveAs("Sample.xlsx", Response, ExcelDownloadType.PromptDialog, ExcelHttpContentType.Excel2007);
            else if (this.rdButtonXls.Checked)
                workBook.SaveAs("Sample.xls", ExcelSaveType.SaveAsXLS, Response, ExcelDownloadType.PromptDialog);
            else if (this.rdButtonXlsx2010.Checked)
                workBook.SaveAs("Sample.xlsx", Response, ExcelDownloadType.PromptDialog, ExcelHttpContentType.Excel2010);
            else if (this.rdButtonXlsx2013.Checked)
                workBook.SaveAs("Sample.xlsx", Response, ExcelDownloadType.PromptDialog, ExcelHttpContentType.Excel2013);

            workBook.Close();
            excelEngine.Dispose();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (this.GridView1.SelectedRow.Cells[5].Text.StartsWith("="))
                this.GridView1.FooterRow.Cells[2].Text = calcEngine.ParseAndComputeFormula(this.GridView1.SelectedRow.Cells[5].Text);
            else
                this.GridView1.FooterRow.Cells[2].Text = "Not a formula cell";

            string FormulaText = this.GridView1.SelectedRow.Cells[6].Text.Replace("&#39;", "");
            if (FormulaText.StartsWith("="))
                this.GridView1.FooterRow.Cells[3].Text = calcEngine.ParseAndComputeFormula(FormulaText);
            else
                this.GridView1.FooterRow.Cells[3].Text = "Not a formula cell";
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[0].BackColor = Color.LightSteelBlue;

                e.Row.Cells[1].BackColor = Color.LightSteelBlue;
                e.Row.Cells[1].Font.Bold = true;
                e.Row.Cells[1].HorizontalAlign = HorizontalAlign.Center;

                e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Right;
                e.Row.Cells[3].HorizontalAlign = HorizontalAlign.Right;
                e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Right;
            }
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[0].BackColor = Color.LightSteelBlue;
                e.Row.Cells[0].Font.Bold = true;
                e.Row.Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
            for (int i = 0; i < e.Row.Cells.Count; i++)
                e.Row.Cells[i].Width = 65;
        }

        protected void CategoryMenu_MenuItemClick(object sender, MenuEventArgs e)
        {
            switch (e.Item.Text)
            {
                case "Sheet1":
                    MultiView1.ActiveViewIndex = 0;
                    break;
                case "Sheet2":
                    MultiView1.ActiveViewIndex = 1;
                    break;
            }
        }
        # endregion
    }
}