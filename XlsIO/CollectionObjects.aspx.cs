#region Copyright Syncfusion Inc. 2001-2021
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
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
using System.ComponentModel;

namespace WebSampleBrowser.XlsIO
{
    public partial class CollectionObjects : System.Web.UI.Page
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

            sheet.ImportData((List<Brand>)this.grdView.DataSource, 4, 1, true);
            #endregion

            #region Define Styles
            IStyle pageHeader = workbook.Styles.Add("PageHeaderStyle");
            IStyle tableHeader = workbook.Styles.Add("TableHeaderStyle");

            pageHeader.Font.FontName = "Calibri";
            pageHeader.Font.Size = 16;
            pageHeader.Font.Bold = true;
            pageHeader.Color = Color.FromArgb(0, 146, 208, 80);
            pageHeader.HorizontalAlignment = ExcelHAlign.HAlignCenter;
            pageHeader.VerticalAlignment = ExcelVAlign.VAlignCenter;

            tableHeader.Font.Bold = true;
            tableHeader.Font.FontName = "Calibri";
            tableHeader.Color = Color.FromArgb(0, 146, 208, 80);

            #endregion

            #region Apply Styles
            // Apply style for header
            sheet["A1:C2"].Merge();
            sheet["A1"].Text = "Automobile Brands in the US";
            sheet["A1"].CellStyle = pageHeader;

            sheet["A4:C4"].CellStyle = tableHeader;

            sheet["A1:C1"].CellStyle.Font.Bold = true;
            sheet.UsedRange.AutofitColumns();

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
            string inputPath = XlsIOHelper.ResolveApplicationDataPath("ExportData.xlsx", Request);

            //After opening, the workbook object represents the complete in-memory object model of the template spreadsheet.
            IWorkbook workbook = application.Workbooks.Open(inputPath);
            workbook.Version = ExcelVersion.Excel2016;
            workbook.SaveAs("ExportData.xlsx", Response, ExcelDownloadType.PromptDialog, ExcelHttpContentType.Excel2016);
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
            string inputPath = XlsIOHelper.ResolveApplicationDataPath("ExportData.xlsx", Request);

            //After opening, the workbook object represents the complete in-memory object model of the template spreadsheet.
            IWorkbook workbook = application.Workbooks.Open(inputPath);
            //The first worksheet object in the worksheets collection is accessed.
            IWorksheet worksheet = workbook.Worksheets[0];
            #endregion

            #region Export Business Object from Workbook
            //Read data from spreadsheet.
            Dictionary<string, string> mappingProperties = new Dictionary<string, string>();
            mappingProperties.Add("Brand", "BrandName");
            mappingProperties.Add("Vehicle Type", "VehicleType.VehicleName");
            mappingProperties.Add("Model", "VehicleType.Model.ModelName");

            List<Brand> businessObjects = worksheet.ExportData<Brand>(4, 1, 141, 3, mappingProperties);

            grdView.DataSource = businessObjects;
            grdView.DataBind();
            Button3.Enabled = true;

            //Set the ID for sales Editing option
            int id = 1;
            foreach (Brand export in businessObjects)
            {
                export.ID = id;
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
            List<Brand> data = Session["CellEditDataSource"] as List<Brand>;
            Dictionary<string, object> KeyVal = record as Dictionary<string, object>;
            if (eventType == "endEdit")
            {
                Brand value = new Brand();
                foreach (KeyValuePair<string, object> keyval in KeyVal)
                {
                    if (keyval.Key == "ID")
                    {
                        value = data.Where(d => d.ID == (int)keyval.Value).FirstOrDefault();
                        value.ID = Convert.ToInt32(keyval.Value);
                    }
                    else if (keyval.Key == "BrandName")
                        value.BrandName = Convert.ToString(keyval.Value);
                    else if (keyval.Key == "VehicleType.VehicleName")
                        value.VehicleType.VehicleName = Convert.ToString(keyval.Value);
                    else if (keyval.Key == "VehicleType.Model.ModelName")
                        value.VehicleType.Model.ModelName = Convert.ToString(keyval.Value);
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
    public class Brand
    {
        private int m_Id;
        [Bindable(false)]
        public int ID
        {
            get { return m_Id; }
            set { m_Id = value; }
        }

        private string m_brandName;
        [DisplayNameAttribute("Brand")]
        public string BrandName
        {
            get { return m_brandName; }
            set { m_brandName = value; }
        }

        private VehicleType m_vehicleType;
        public VehicleType VehicleType
        {
            get { return m_vehicleType; }
            set { m_vehicleType = value; }
        }

        public Brand(string brandName)
        {
            m_brandName = brandName;
        }
        public Brand()
        {

        }
    }

    public class VehicleType
    {
        private string m_vehicleName;
        [DisplayNameAttribute("Vehicle Type")]
        public string VehicleName
        {
            get { return m_vehicleName; }
            set { m_vehicleName = value; }
        }

        private Model m_model;
        public Model Model
        {
            get { return m_model; }
            set { m_model = value; }
        }

        public VehicleType(string vehicle)
        {
            m_vehicleName = vehicle;
        }
        public VehicleType()
        {

        }
    }

    public class Model
    {
        private string m_modelName;
        [DisplayNameAttribute("Model")]
        public string ModelName
        {
            get { return m_modelName; }
            set { m_modelName = value; }
        }

        public Model(string name)
        {
            m_modelName = name;
        }
        public Model()
        {

        }
    }
    #endregion
}