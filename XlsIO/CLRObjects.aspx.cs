#region Copyright Syncfusion Inc. 2001 - 2018
// Copyright Syncfusion Inc. 2001 - 2018. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Syncfusion.XlsIO;
using System.Collections.Generic;
using System.Reflection;
using Syncfusion.JavaScript.Web;
using System.Linq;

namespace WebSampleBrowser.XlsIO
{
    public partial class CLRObjects : System.Web.UI.Page
    {
        # region Private Members
        private DataTable northwindDt;
        List<BusinessCustomer> exportBusiness = new List<BusinessCustomer>();
        #endregion
        # region Page Load
        /// <summary>
        /// Handles the page load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            grdView.DataSource = null;
        }
        # endregion

        # region Events
        /// <summary>
        /// Creates spreadsheet
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button3_Click(object sender, EventArgs e)
        {
            grdView.DataSource = Session["CellEditDataSource"];
            grdView.DataBind();
            #region Initialize Workbook
            //New instance of XlsIO is created.[Equivalent to launching Microsoft Excel with no workbooks open].
            //The instantiation process consists of two steps.
            //Instantiate the spreadsheet creation engine.
            ExcelEngine excelEngine = new ExcelEngine();
            //Step 2 : Instantiate the excel application object.
            IApplication application = excelEngine.Excel;
            //Set the Default version as Excel 97to2003
            //Create a new spreadsheet.
            IWorkbook workbook = excelEngine.Excel.Workbooks.Create(1);
            //The first worksheet object in the worksheets collection is accessed.
            IWorksheet sheet = workbook.Worksheets[0];

            sheet.ImportData((List<BusinessCustomer>)this.grdView.DataSource, 5, 1, false);
            #endregion

            #region Define Styles
            IStyle pageHeader = workbook.Styles.Add("PageHeaderStyle");
            IStyle tableHeader = workbook.Styles.Add("TableHeaderStyle");

            pageHeader.Font.RGBColor = Color.FromArgb(0, 83, 141, 213);
            pageHeader.Font.FontName = "Calibri";
            pageHeader.Font.Size = 18;
            pageHeader.Font.Bold = true;
            pageHeader.HorizontalAlignment = ExcelHAlign.HAlignCenter;
            pageHeader.VerticalAlignment = ExcelVAlign.VAlignCenter;

            tableHeader.Font.Color = ExcelKnownColors.White;
            tableHeader.Font.Bold = true;
            tableHeader.Font.Size = 11;
            tableHeader.Font.FontName = "Calibri";
            tableHeader.HorizontalAlignment = ExcelHAlign.HAlignCenter;
            tableHeader.VerticalAlignment = ExcelVAlign.VAlignCenter;
            tableHeader.Color = Color.FromArgb(0, 118, 147, 60);
            tableHeader.Borders[ExcelBordersIndex.EdgeLeft].LineStyle = ExcelLineStyle.Thin;
            tableHeader.Borders[ExcelBordersIndex.EdgeRight].LineStyle = ExcelLineStyle.Thin;
            tableHeader.Borders[ExcelBordersIndex.EdgeTop].LineStyle = ExcelLineStyle.Thin;
            tableHeader.Borders[ExcelBordersIndex.EdgeBottom].LineStyle = ExcelLineStyle.Thin;
            #endregion

            #region Apply Styles
            // Apply style for header
            sheet["A1:E1"].Merge();
            sheet["A1"].Text = "Yearly Sales Report";
            sheet["A1"].CellStyle = pageHeader;

            sheet["A2:E2"].Merge();
            sheet["A2"].Text = "Namewise Sales Comparison Report";
            sheet["A2"].CellStyle = pageHeader;
            sheet["A2"].CellStyle.Font.Bold = false;
            sheet["A2"].CellStyle.Font.Size = 16;

            sheet["A3:A4"].Merge();
            sheet["B3:B4"].Merge();
            sheet["E3:E4"].Merge();
            sheet["C3:D3"].Merge();
            sheet["C3"].Text = "Sales";
            sheet["A3:E4"].CellStyle = tableHeader;

            sheet["A3"].Text = "S.ID";
            sheet["B3"].Text = "Sales Person";
            sheet["C4"].Text = "January - June";
            sheet["D4"].Text = "July - December";
            sheet["E3"].Text = "Change(%)";

            sheet.UsedRange.AutofitColumns();
            sheet.Columns[0].ColumnWidth = 10;
            sheet.Columns[1].ColumnWidth = 24;
            sheet.Columns[2].ColumnWidth = 21;
            sheet.Columns[3].ColumnWidth = 21;
            sheet.Columns[4].ColumnWidth = 16;
            #endregion


            //Saving the workbook to disk.
            if (rBtnXls.Checked == true)
            {
                workbook.Version = ExcelVersion.Excel97to2003;
                workbook.SaveAs("Sample.xls", Response, ExcelDownloadType.PromptDialog);
            }
            else
            {
                workbook.Version = ExcelVersion.Excel2016;
                workbook.SaveAs("Sample.xlsx", Response, ExcelDownloadType.PromptDialog, ExcelHttpContentType.Excel2016);
            }
            workbook.Close();
            excelEngine.Dispose();

        }
        #endregion
        
        #region Input Template
        protected void Button1_Click(object sender, EventArgs e)
        {
            //Step 1 : Instantiate the spreadsheet creation engine.
            ExcelEngine excelEngine = new ExcelEngine();
            //Step 2 : Instantiate the excel application object.
            IApplication application = excelEngine.Excel;

            //Get path of the Input file
            string inputPath = XlsIOHelper.ResolveApplicationDataPath("ExportSales.xlsx", Request);

            //After opening, the workbook object represents the complete in-memory object model of the template spreadsheet.
            IWorkbook workbook = application.Workbooks.Open(inputPath);
            workbook.Version = ExcelVersion.Excel2016;
            workbook.SaveAs("ExportSales.xlsx", Response, ExcelDownloadType.PromptDialog, ExcelHttpContentType.Excel2016);
        }
        #endregion

        #region Export BusinessObjects
        protected void Button2_Click(object sender, EventArgs e)
        {
            //Imports Data from the Template spreadsheet into the Grid.

            #region Workbook Initialize
            //New instance of XlsIO is created.[Equivalent to launching MS Excel with no workbooks open].
            //The instantiation process consists of two steps.

            //Step 1 : Instantiate the spreadsheet creation engine.
            ExcelEngine excelEngine = new ExcelEngine();
            //Step 2 : Instantiate the excel application object.
            IApplication application = excelEngine.Excel;

            //Get path of the Input file
            string inputPath = XlsIOHelper.ResolveApplicationDataPath("ExportSales.xlsx", Request);

            //After opening, the workbook object represents the complete in-memory object model of the template spreadsheet.
            IWorkbook workbook = application.Workbooks.Open(inputPath);
            //The first worksheet object in the worksheets collection is accessed.
            IWorksheet worksheet = workbook.Worksheets[0];
            #endregion

            #region Export Business Object from Workbook
            //Read data from spreadsheet.
            List<BusinessCustomer> businessObjects = worksheet.ExportData<BusinessCustomer>(1, 1, 41, 4);
            grdView.DataSource = businessObjects;
            grdView.DataBind();
            Button3.Enabled = true;

            //Set the ID for sales Editing option
            int id = 1;
            foreach (BusinessCustomer export in businessObjects)
            {
                export.SalesID = id;
                id++;
            }
            Session["CellEditDataSource"] = businessObjects;
            #endregion

            #region Workbook Close and Dispose
            //Close the workbook.
            workbook.Close();

            //No exception will be thrown if there are unsaved workbooks.
            excelEngine.ThrowNotSavedOnDestroy = false;
            excelEngine.Dispose();
            #endregion
        }
        #endregion

        protected void EditEvents_ServerEditRow(object sender, GridEventArgs e)
        {
            EditAction(e.EventType, e.Arguments["data"]);
        }

        protected void EditAction(string eventType, object record)
        {
            List<BusinessCustomer> data = Session["CellEditDataSource"] as List<BusinessCustomer>;
            Dictionary<string, object> KeyVal = record as Dictionary<string, object>;
            if (eventType == "endEdit")
            {
                BusinessCustomer value = new BusinessCustomer();
                foreach (KeyValuePair<string, object> keyval in KeyVal)
                {
                    if (keyval.Key == "SalesID")
                    {
                        value = data.Where(d => d.SalesID == (int)keyval.Value).FirstOrDefault();
                        value.SalesID = Convert.ToInt32(keyval.Value);
                    }
                    else if (keyval.Key == "SalesPerson")
                        value.SalesPerson = Convert.ToString(keyval.Value);
                    else if (keyval.Key == "SalesJanJune")
                        value.SalesJanJune = Convert.ToInt32(keyval.Value);
                    else if (keyval.Key == "SalesJulyDec")
                        value.SalesJulyDec = Convert.ToInt32(keyval.Value);
                    else if (keyval.Key == "Change")
                        value.Change = Convert.ToInt32(keyval.Value);
                }
            }
            Session["CellEditDataSource"] = data;
            this.grdView.DataSource = data;
            this.grdView.DataBind();
        }
    }


    #region Helper Class
    [Serializable]
    public class BusinessCustomer
    {
        #region Members
        private int m_salesId;
        private string m_salesPerson;
        private int m_salesJanJune;
        private int m_salesJulyDec;
        private int m_change;
        #endregion

        #region Prperties
        public int SalesID
        {
            get
            {
                return m_salesId;
            }
            set
            {
                m_salesId = value;
            }
        }
        public string SalesPerson
        {
            get
            {
                return m_salesPerson;
            }
            set
            {
                m_salesPerson = value;
            }
        }

        public int SalesJanJune
        {
            get
            {
                return m_salesJanJune;
            }
            set
            {
                m_salesJanJune = value;
            }
        }
        public int SalesJulyDec
        {
            get
            {
                return m_salesJulyDec;
            }
            set
            {
                m_salesJulyDec = value;
            }

        }
        public int Change
        {
            get
            {
                return m_change;
            }
            set
            {
                m_change = value;
            }

        }
        #endregion

        #region Intialization
        public BusinessCustomer()
        {
        }
        public BusinessCustomer(string name, string juneToJuly, string julyToDec, int change)
        {
            this.m_salesPerson = name;
            this.m_salesJanJune = Convert.ToInt32(juneToJuly);
            this.m_salesJulyDec = Convert.ToInt32(julyToDec);
            this.m_change = change;
        }
        #endregion
    }
    #endregion
}