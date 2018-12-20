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
using System.IO;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Syncfusion.XlsIO;
using System.Collections.Generic;

namespace WebSampleBrowser.XlsIO
{
    public partial class TemplateMarker : System.Web.UI.Page
    {
        # region Private Members
        private DataTable northwindDt;
        private DataTable numbersDt;
        IList<Customer> _customers = new List<Customer>();
        # endregion

        # region Page Load
        /// <summary>
        /// Handles the page load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            //Load Data
            DataSet customersDataSet = new DataSet();
            customersDataSet.ReadXml(XlsIOHelper.ResolveApplicationDataPath("customers.xml", Request), XmlReadMode.ReadSchema);
            northwindDt = customersDataSet.Tables[0].Copy();
            //Change the Column Data Type from string to Byte Array
            northwindDt.Columns.Remove("Image");
            northwindDt.Columns.Add("Image", typeof(byte[]));
            //Get the path of Image File and convert the image into bytes
            for (int j = 0; j < customersDataSet.Tables[0].Rows.Count; j++)
            {
                string imagePath = XlsIOHelper.ResolveApplicationImagePath("Template_Marker_Images\\" + customersDataSet.Tables[0].Rows[j]["Image"].ToString().Trim(), Request);
                northwindDt.Rows[j]["Image"] = File.ReadAllBytes(imagePath);
            }
            numbersDt = GetTable();
            customersDataSet.Dispose();
        }
        # endregion

        # region Helpher Methods
        private DataTable GetTable()
        {
            Random r = new Random();
            DataTable dt = new DataTable("NumbersTable");

            int nCols = 4;
            int nRows = 10;

            for (int i = 0; i < nCols; i++)
                dt.Columns.Add(new DataColumn("Column" + i.ToString()));

            for (int i = 0; i < nRows; ++i)
            {
                DataRow dr = dt.NewRow();
                for (int j = 0; j < nCols; j++)
                    dr[j] = r.Next(0, 10);
                dt.Rows.Add(dr);
            }
            return dt;
        }

        /// <summary>
        /// Gets the Collection of objects from the XML data.
        /// </summary>
        /// <returns>Collection of Customer Objects</returns>
        private IList<Customer> GetCustomerAsObjects()
        {
            DataSet customersDataSet = new DataSet();
            //Get the path of the input file
            string inputXmlPath = XlsIOHelper.ResolveApplicationDataPath("Customers.xml", Request);
            customersDataSet.ReadXml(inputXmlPath, XmlReadMode.ReadSchema);
            northwindDt = customersDataSet.Tables[0].Copy();
            //Changing the column data type from string to Byte Array
            northwindDt.Columns.Remove("Image");
            northwindDt.Columns.Add("Image", typeof(byte[]));
            //Get the path of Image File and convert it into bytes
            for (int j = 0; j < customersDataSet.Tables[0].Rows.Count; j++)
            {
                northwindDt.Rows[j]["Image"] = File.ReadAllBytes(XlsIOHelper.ResolveApplicationImagePath(@"Template_Marker_Images\" + customersDataSet.Tables[0].Rows[j]["Image"].ToString().Trim(), Request));
            }
            IList<Customer> tmpCustomers = new List<Customer>();
            Customer customer;
            numbersDt = GetTable();
            DataRowCollection rows = northwindDt.Rows;
            foreach (DataRow row in rows)
            {
                customer = new Customer();
                customer.SalesPerson = row[0].ToString();
                customer.SalesJanJune = row[1].ToString();
                customer.SalesJulyDec = row[2].ToString();
                customer.Change = Convert.ToInt32(row[3]);
                customer.Hyperlink = new Hyperlink("https://help.syncfusion.com/file-formats/xlsio/working-with-template-markers", "", "Hyperlink", "Syncfusion", ExcelHyperLinkType.Url, (byte[])row[4]);

                tmpCustomers.Add(customer);
            }
            customersDataSet.Dispose();
            return tmpCustomers;
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
            //New instance of XlsIO is created.[Equivalent to launching Microsoft Excel with no workbooks open].
            //The instantiation process consists of two steps.

            //Instantiate the spreadsheet creation engine.
            ExcelEngine excelEngine = new ExcelEngine();

            excelEngine.Excel.DefaultVersion = ExcelVersion.Excel2016;
            //Open an existing spreadsheet which will be used as a template for generating the new spreadsheet.
            //After opening, the workbook object represents the complete in-memory object model of the template spreadsheet.
            IWorkbook workbook;
            string fileName = null;
            if (RadioButton1.Checked)
                fileName = "TemplateMarkerImageOnly.xlsx";
            else if (RadioButton2.Checked)
                fileName = "TemplateMarkerImageWithSize.xlsx";
            else if (RadioButton3.Checked)
                fileName = "TemplateMarkerImageWithPosition.xlsx";
            else if (RadioButton5.Checked)
                fileName = "TemplateMarkerImageFitToCell.xlsx";
            else
                fileName = "TemplateMarkerImageWithSize&Position.xlsx";
            workbook = excelEngine.Excel.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath(fileName, Request));
            //The first worksheet object in the worksheets collection is accessed.
            IWorksheet sheet1 = workbook.Worksheets[0];
            IWorksheet sheet2 = workbook.Worksheets[1];

            //Create Template Marker Processor
            ITemplateMarkersProcessor marker = workbook.CreateTemplateMarkersProcessor();

            IConditionalFormats conditions = marker.CreateConditionalFormats(sheet1["C5"]);
            #region Data Bar
            //Apply markers using Formula

            IConditionalFormat condition = conditions.AddCondition();

            //Set Data bar and icon set for the same cell
            //Set the format type
            condition.FormatType = ExcelCFType.DataBar;
            IDataBar dataBar = condition.DataBar;

            //Set the constraint
            dataBar.MinPoint.Type = ConditionValueType.LowestValue;
            dataBar.MinPoint.Value = "0";
            dataBar.MaxPoint.Type = ConditionValueType.HighestValue;
            dataBar.MaxPoint.Value = "0";

            //Set color for Bar
            dataBar.BarColor = Color.FromArgb(156, 208, 243);

            //Hide the value in data bar
            dataBar.ShowValue = false;
            #endregion

            #region IconSet
            condition = conditions.AddCondition();
            condition.FormatType = ExcelCFType.IconSet;
            IIconSet iconSet = condition.IconSet;
            iconSet.IconSet = ExcelIconSetType.FourRating;
            iconSet.IconCriteria[0].Type = ConditionValueType.LowestValue;
            iconSet.IconCriteria[0].Value = "0";
            iconSet.IconCriteria[1].Type = ConditionValueType.HighestValue;
            iconSet.IconCriteria[1].Value = "0";
            iconSet.ShowIconOnly = true;
            #endregion

            conditions = marker.CreateConditionalFormats(sheet1["D5"]);
            #region Color Scale

            condition = conditions.AddCondition();

            condition.FormatType = ExcelCFType.ColorScale;
            IColorScale colorScale = condition.ColorScale;

            //Sets 3 - color scale.
            colorScale.SetConditionCount(3);

            colorScale.Criteria[0].FormatColorRGB = Color.FromArgb(230, 197, 218);
            colorScale.Criteria[0].Type = ConditionValueType.LowestValue;
            colorScale.Criteria[0].Value = "0";

            colorScale.Criteria[1].FormatColorRGB = Color.FromArgb(244, 210, 178);
            colorScale.Criteria[1].Type = ConditionValueType.Percentile;
            colorScale.Criteria[1].Value = "50";

            colorScale.Criteria[2].FormatColorRGB = Color.FromArgb(245, 247, 171);
            colorScale.Criteria[2].Type = ConditionValueType.HighestValue;
            colorScale.Criteria[2].Value = "0";
            #endregion

            conditions = marker.CreateConditionalFormats(sheet1["E5"]);
            #region Iconset
            condition = conditions.AddCondition();
            condition.FormatType = ExcelCFType.IconSet;
            iconSet = condition.IconSet;
            iconSet.IconSet = ExcelIconSetType.ThreeSymbols;
            iconSet.IconCriteria[0].Type = ConditionValueType.LowestValue;
            iconSet.IconCriteria[0].Value = "0";
            iconSet.IconCriteria[1].Type = ConditionValueType.HighestValue;
            iconSet.IconCriteria[1].Value = "0";
            iconSet.ShowIconOnly = false;

            #endregion



            //Northwind customers table			
            if (rdbDataTable.Checked)
            {
                sheet1["A5"].Value = sheet1["A5"].Value.Replace("Customers.Hyperlink.", "Customers.");
                marker.AddVariable("Customers", northwindDt);
            }
            else
            {
                //New instance of XlsIO is created.[Equivalent to launching Microsoft Excel with no workbooks open].
                //The instantiation process consists of two steps.
                if (this._customers.Count == 0)
                {
                    this._customers = GetCustomerAsObjects();
                }
                marker.AddVariable("Customers", _customers);
            }


            //Stretch Formula. This shows the data getting replaced in the marker specified in another worksheet.
            marker.AddVariable("NumbersTable", numbersDt);

            //Process the markers in the template.
            marker.ApplyMarkers();

            //Saving the workbook to disk. This spreadsheet is the result of opening and modifying
            //an existing spreadsheet and then saving the result to a new workbook.

            workbook.SaveAs(fileName, ExcelSaveType.SaveAsXLS, Response, ExcelDownloadType.PromptDialog, ExcelHttpContentType.Excel2016);

            //Close the workbook.
            workbook.Close();

            excelEngine.Dispose();

        }
        # endregion
        protected void Button2_Click(object sender, EventArgs e)
        {
           //Step 1 : Instantiate the spreadsheet creation engine.
            ExcelEngine excelEngine = new ExcelEngine();
            //Step 2 : Instantiate the excel application object.
            IApplication application = excelEngine.Excel;
            //A new workbook is created.[Equivalent to creating a new workbook in Microsoft Excel]
            //The new workbook will have 2 worksheets
            string fileName = null;
            if (RadioButton1.Checked)
                fileName = "TemplateMarkerImageOnly.xlsx";
            else if (RadioButton2.Checked)
                fileName = "TemplateMarkerImageWithSize.xlsx";
            else if (RadioButton3.Checked)
                fileName = "TemplateMarkerImageWithPosition.xlsx";
            else if (RadioButton5.Checked)
                fileName = "TemplateMarkerImageFitToCell.xlsx";
            else
                fileName = "TemplateMarkerImageWithSize&Position.xlsx";
            IWorkbook workbook = application.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath(fileName, Request));
            workbook.Version = ExcelVersion.Excel2016;
            workbook.SaveAs(fileName, Response, ExcelDownloadType.PromptDialog);
        }
    }
    #region Hyperlink Class

    public class Hyperlink : IHyperLink
    {
        public IApplication Application { get; private set; }
        public object Parent { get; private set; }
        public string Address { get; set; }
        public string Name { get; private set; }
        public IRange Range { get; private set; }
        public string ScreenTip { get; set; }
        public string SubAddress { get; set; }
        public string TextToDisplay { get; set; }
        public ExcelHyperLinkType Type { get; set; }
        public IShape Shape { get; private set; }
        public ExcelHyperlinkAttachedType AttachedType { get; private set; }
        public byte[] Image { get; set; }

        public Hyperlink(string address, string subAddress, string screenTip, string textToDisplay, ExcelHyperLinkType type, byte[] image)
        {
            Address = address;
            ScreenTip = screenTip;
            SubAddress = subAddress;
            TextToDisplay = textToDisplay;
            Type = type;
            Image = image;
        }
    }

    public class Company
    {
        public string Name { get; set; }
        public Hyperlink Link { get; set; }
    }

    #endregion
    class Customer
    {
        #region Members
        private string m_salesPerson;
        private string m_salesJanJune;
        private string m_salesJulyDec;
        private int m_change;
        private byte[] m_image;
        private Hyperlink m_hyperlink;
        #endregion

        #region Properties
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

        public string SalesJanJune
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
        public string SalesJulyDec
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

        public Hyperlink Hyperlink
        {
            get
            {
                return m_hyperlink;
            }
            set
            {
                m_hyperlink = value;
            }

        }

        public byte[] Image
        {
            get
            {
                return m_image;
            }
            set
            {
                m_image = value;
            }
        }
        #endregion

        #region Intialization
        public Customer()
        {
        }
        public Customer(string name, string juneToJuly, string julyToDec, int change, byte[] image)
        {
            this.m_salesPerson = name;
            this.m_salesJanJune = juneToJuly;
            this.m_salesJulyDec = julyToDec;
            this.m_change = change;
            this.m_image = image;
        }
        #endregion
    }
}