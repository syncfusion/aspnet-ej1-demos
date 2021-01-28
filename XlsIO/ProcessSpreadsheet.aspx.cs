#region Copyright Syncfusion Inc. 2001 - 2021
// Copyright Syncfusion Inc. 2001 - 2021. All rights reserved.
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
using System.Collections;
using System.IO;

namespace WebSampleBrowser.XlsIO
{
    public partial class ProcessSpreadsheet : System.Web.UI.Page
    {
        # region Private Members
        /// <summary>
        /// Private variable collection
        /// </summary>
        private System.Collections.Hashtable regionInfoCollection;
        private System.Collections.Hashtable typeInfoCollection;
        # endregion

        # region Session Variable
        /// <summary>
        /// Session variable
        /// </summary>
        private DataTable ExcelTable
        {
            get
            {
                return (DataTable)Session[string.Format("DT_{0}", Session.SessionID)];
            }
            set
            {
                Session[string.Format("DT_{0}", Session.SessionID)] = value;
            }
        }
        # endregion

        # region Page Load
        /// <summary>
        /// Handles the page load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {

            if (this.ExcelTable != null)
            {
                AnalyseExcelSheetData(this.ExcelTable);
                DrawChart();
            }
        }
        # endregion

        #region Helper Methods
        private void DrawChart()
        {
            string info = "../getImage.ashx?info=";
            foreach (DictionaryEntry entry in regionInfoCollection)
            {
                info += string.Format("{0}_{1}^", entry.Key.ToString(), entry.Value.ToString());
            }
            piechartImg.ImageUrl = info;

            string info1 = "../getImage.ashx?info=";
            foreach (DictionaryEntry entry in typeInfoCollection)
            {
                info1 += string.Format("{0}_{1}^", entry.Key.ToString(), entry.Value.ToString());
            }
            Image1.ImageUrl = info1;
        }

        private void AnalyseExcelSheetData(DataTable dt)
        {
            regionInfoCollection = new System.Collections.Hashtable();
            typeInfoCollection = new System.Collections.Hashtable();
            ArrayList type = GetDistinctValues(dt, "type");
            ArrayList region = GetDistinctValues(dt, "region");

            if (ddlYear.SelectedItem == null)
            {
                int minValue = Convert.ToInt32(this.ExcelTable.Compute("Min(Year)", ""));
                int maxValue = Convert.ToInt32(this.ExcelTable.Compute("Max(Year)", ""));
                for (int i = minValue; i <= maxValue; i++)
                {
                    ddlYear.Items.Add(i.ToString());
                }
            }

            //Calculate Region info        
            foreach (string item in region)
            {
                double totalUnits = 0;
                DataRow[] dr = dt.Select(string.Format("Region='{0}' AND Year='{1}'", item, ddlYear.SelectedItem.Text));
                for (int j = 0; j < dr.Length; j++)
                {
                    totalUnits += Convert.ToDouble(dr[j].ItemArray.GetValue(1));
                }
                regionInfoCollection.Add(item, totalUnits);
            }

            //Calculate Type Info
            foreach (string item in type)
            {
                double totalUnits = 0;
                DataRow[] dr = dt.Select(string.Format("Type='{0}' AND Year='{1}'", item, ddlYear.SelectedItem.Text));
                for (int j = 0; j < dr.Length; j++)
                {
                    totalUnits += Convert.ToDouble(dr[j].ItemArray.GetValue(1));
                }
                typeInfoCollection.Add(item, totalUnits);
            }
        }
        private ArrayList GetDistinctValues(DataTable dt, string ColumnName)
        {
            ArrayList tempLt = new ArrayList();
            DataTable tempDt = dt.DefaultView.ToTable(true, new string[] { ColumnName });
            foreach (DataRow dr in tempDt.Rows)
            {
                tempLt.Add(dr[0].ToString());
            }
            return tempLt;
        }
        private void EnsureSheetFormat()
        {
            string[] columnNames = new string[] { "type", "units", "region", "year" };
            for (int i = 0; i < this.ExcelTable.Columns.Count; i++)
            {
                if (this.ExcelTable.Columns[i].ColumnName.ToLower() != columnNames[i])
                    throw new Exception("Spread sheet format is corrupted.Might be Column Name is modified. Please download fresh template in step I and try again.");
            }
        }
        #endregion

        # region Events
        /// <summary>
        /// Gets the spreadsheet from client
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            Stream fileStream = this.FileUpload1.PostedFile.InputStream;

            //Step 1 : Instantiate the spreadsheet creation engine.
            ExcelEngine excelEngine = new ExcelEngine();
            //Step 2 : Instantiate the excel object.
            IApplication application = excelEngine.Excel;

            try
            {
                //Open the Source WorkBook    
                IWorkbook sourceWorkbook = excelEngine.Excel.Workbooks.Open(fileStream);

                IWorksheet sheet = sourceWorkbook.Worksheets[0];

                this.ExcelTable = sheet.ExportDataTable(2, 1, sheet.UsedRange.Rows.Length - 2, sheet.UsedRange.Columns.Length, ExcelExportDataTableOptions.ColumnNames);
                EnsureSheetFormat();

                if (ddlYear.SelectedItem == null)
                {
                    int minValue = Convert.ToInt32(this.ExcelTable.Compute("Min(Year)", ""));
                    int maxValue = Convert.ToInt32(this.ExcelTable.Compute("Max(Year)", ""));
                    for (int i = minValue; i <= maxValue; i++)
                    {
                        ddlYear.Items.Add(i.ToString());
                    }
                }
                AnalyseExcelSheetData(this.ExcelTable);
                DrawChart();
                StepMenu.Items[3].Selected = true;
                MultiView1.SetActiveView(MultiView1.Views[3]);
            }
            catch (Exception ex)
            {
                this.ExcelTable = null;
                if (ex is System.Runtime.InteropServices.ExternalException)
                {
                    lbl_Error.Text = string.Format("Error: Uploaded file validation failed, {0}", ex.Message);
                    lbl_Error.Visible = true;
                }
                else
                {
                    lbl_Error.Text = string.Format("Error: {0}", ex.Message);
                    lbl_Error.Visible = true;
                }
            }
        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            //Step 1 : Instantiate the spreadsheet creation engine.
            ExcelEngine excelEngine = new ExcelEngine();

            //Step 2 : Instantiate the excel application object.
            IApplication application = excelEngine.Excel;

            //Open an existing spreadsheet which will be used as a template for generating the new spreadsheet.
            //After opening, the workbook object represents the complete in-memory object model of the template spreadsheet.
            IWorkbook workbook = application.Workbooks.OpenReadOnly(Server.MapPath("../Data/Sample.xls"));

            workbook.SaveAs("sample.xls", Response, ExcelDownloadType.PromptDialog);
            workbook.Close();
        }

        protected void StepMenu_MenuItemClick(object sender, MenuEventArgs e)
        {
            int PageInedx = StepMenu.Items.IndexOf(e.Item);
            if (PageInedx == 3 && this.ExcelTable == null)
            {
                lbl_Error.Text = string.Format("Error: {0}", "Please upload the updated excel sheet here.");
                lbl_Error.Visible = true;
                PageInedx = 2;
                StepMenu.Items[PageInedx].Selected = true;
            }
            MultiView1.SetActiveView(MultiView1.Views[PageInedx]);
        }
        # endregion
    }
}