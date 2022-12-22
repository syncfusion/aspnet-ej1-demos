#region Copyright Syncfusion Inc. 2001 - 2022
// Copyright Syncfusion Inc. 2001 - 2022. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.XlsIO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlServerCe;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.XlsIO
{
    public partial class SalesInvoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    AppDomain.CurrentDomain.SetData("SQLServerCompactEditionUnderWebHosting", true);

                    using (SqlCeConnection sqlCeConnection = new SqlCeConnection())
                    {
                        if (sqlCeConnection.ServerVersion.StartsWith("3.5"))
                            sqlCeConnection.ConnectionString = "Data Source = " + XlsIOHelper.ResolveApplicationDataBasePath("NorthwindIO_3.5.sdf", Request);
                        else
                            sqlCeConnection.ConnectionString = "Data Source = " + XlsIOHelper.ResolveApplicationDataBasePath("NorthwindIO.sdf", Request);
                        connString = sqlCeConnection.ConnectionString;
                        using (SqlCeDataAdapter sqlCeAdapter = new SqlCeDataAdapter("select OrderID from SyncOrders Order By OrderID", sqlCeConnection))
                        {
                            DataSet ds = new DataSet();
                            sqlCeAdapter.Fill(ds);

                            if (ds.Tables.Count > 0)
                            {
                                this.DropDownList1.DataSource = ds.Tables[0];
                                this.DropDownList1.DataTextField = "OrderID";
                                this.DropDownList1.DataBind();
                            }
                        }
                    }
                }
                catch (Exception Ex)
                {
                    // Shows the Message box with Exception message, if an exception is thrown.
                    this.Response.Write(Ex.Message);
                }
            }
        }
        # region Events
        protected void Button1_Click(object sender, EventArgs e)
        {
            // Generate Invoice for the selected ID.
            GenerateXls(Convert.ToInt32(DropDownList1.SelectedItem.Value));
        }
        # endregion

        # region Helper Methods
        public void GenerateXls(int id)
        {
            //New instance of XlsIO is created.[Equivalent to launching Microsoft Excel with no workbooks open].
            //The instantiation process consists of two steps.

            //Step 1 : Instantiate the spreadsheet creation engine.
            ExcelEngine excelEngine = new ExcelEngine();

            //Step 2 : Instantiate the excel application object.
            IApplication application = excelEngine.Excel;
            IWorkbook workbook;

            if (this.rBtnXls.Checked)
            {
                application.DefaultVersion = ExcelVersion.Excel97to2003;
                workbook = application.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath("Invoice.xls", Request));             
            }
            else
            {
                application.DefaultVersion = ExcelVersion.Excel2016;
                workbook = application.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath("Invoice.xlsx", Request));                
            }

            IWorksheet sheet = workbook.Worksheets[0];

            sheet.Range["A5"].Text = "One Portals Way";
            sheet.Range["A6"].Text = "Twin Points WA 98156";
            sheet.Range["A7"].Text = "Phone: 1-206-555-1417 ";
            sheet.Range["A8"].Text = "Fax: 1-206-555-5938";

            sheet.Range["D5"].Text = "INVOICE NO:";
            sheet.Range["D6"].Text = "DATE:";
            sheet.Range["D7"].Text = "CUSTOMER ID  :";
            sheet.Range["E6"].Formula = "TODAY()";

            sheet.Range["E5"].Number = id;

            //Set values for Ship To.
            GetShipDetails(id);
            sheet.Range["E7"].Text = shipName;
            sheet.Range["E10"].Text = shipName;
            sheet.Range["E11"].Text = address;
            sheet.Range["E12"].Text = shipCity;
            sheet.Range["E13"].Text = shipCountry;

            //Set values for Bill To.
            sheet.Range["B10"].Text = shipName;
            sheet.Range["B11"].Text = address;
            sheet.Range["B12"].Text = shipCity;
            sheet.Range["B13"].Text = shipCountry;

            //Calculates sub total
            sheet.Range["E27"].Formula = "SUM(E20:E26)";

            //Set the number format
            sheet.Range["E20:E29"].NumberFormat = "$#,##0.00";
            sheet.Range["E28"].Value = freight.ToString();

            //Calculates final total
            sheet.Range["E29"].Formula = "E27+E28";

            //Import the data tables.
            sheet.ImportDataTable(GetOrder(id), false, 17, 1);
            sheet.ImportDataTable(GetProductDetails(id), false, 20, 1);

            //Calculates price from discount and unit price.
            for (int i = 20; i <= 26; i++)
            {
                if (sheet.Range["A" + i.ToString()].Value == "")
                {
                    break;
                }
                else
                {
                    sheet.Range["E" + i.ToString()].Formula = "(B" + i.ToString() + "*C" + i.ToString() + ")- (D" + i.ToString() + "/100)";
                }
            }

            //Save the workbook to disk.
            if (this.rBtnXls.Checked)
                workbook.SaveAs("Sample.xls", ExcelSaveType.SaveAsXLS, Response, ExcelDownloadType.PromptDialog);
            else
                workbook.SaveAs("Sample.xlsx", Response, ExcelDownloadType.PromptDialog, ExcelHttpContentType.Excel2016);


            //Close the workbook.
            workbook.Close();
            excelEngine.Dispose();
        }

        private DataTable GetProductDetails(int id)
        {
            SqlCeDataAdapter da = new SqlCeDataAdapter("Select ProductID,Quantity,UnitPrice,Discount from SyncOrderDetails where OrderID=" + id, this.connString);
            DataSet ds = new DataSet();
            da.Fill(ds);

            DataTable prodDS = new DataTable();
            prodDS = ds.Tables[0];
            return prodDS;
        }

        private void GetShipDetails(int id)
        {
            SqlCeDataAdapter da = new SqlCeDataAdapter("Select ShipName,ShipAddress,Freight,ShippedDate,ShipCity,ShipCountry from Orders where OrderID=" + id, this.connString);
            DataSet ds = new DataSet();
            da.Fill(ds);

            DataTable dataTable = new DataTable();
            dataTable = ds.Tables[0];
            DataRow dr;
            int rows = dataTable.Rows.Count;
            for (int i = 0; i < rows; i++)
            {
                dr = dataTable.Rows[i];
                shipName = dr["ShipName"].ToString();
                freight = System.Convert.ToDouble(dr["Freight"].ToString());
                address = dr["ShipAddress"].ToString();
                shippedDate = dr["ShippedDate"].ToString();
                shipCity = dr["ShipCity"].ToString();
                shipCountry = dr["ShipCountry"].ToString();
            }
        }

        private DataTable GetOrder(int id)
        {
            DataTable dt = new DataTable();
            SqlCeDataAdapter da = new SqlCeDataAdapter("Select Salesperson,ShipName,ShipCountry,CustomerID,OrderDate,RequiredDate from SyncOrders where OrderID=" + id, connString);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dt = ds.Tables[0];

            return dt;
        }

        # endregion

        #region Session Variables
        protected string connString
        {
            get
            {
                if (Session["connString"] == null)
                    return null;
                return Session["connString"] as string;
            }
            set
            {
                Session["connString"] = value;
            }
        }

        protected OleDbConnection conn
        {
            get
            {
                if (Session["conn"] == null)
                    return null;
                return Session["conn"] as OleDbConnection;
            }
            set
            {
                Session["conn"] = value;
            }
        }

        protected OleDbCommand cmd
        {
            get
            {
                if (Session["cmd"] == null)
                    return null;
                return Session["cmd"] as OleDbCommand;
            }
            set
            {
                Session["cmd"] = value;
            }
        }

        protected OleDbDataAdapter da
        {
            get
            {
                if (Session["da"] == null)
                    return null;
                return Session["da"] as OleDbDataAdapter;
            }
            set
            {
                Session["da"] = value;
            }
        }

        protected DataSet ds
        {
            get
            {
                if (Session["ds"] == null)
                    return null;
                return Session["ds"] as DataSet;
            }
            set
            {
                Session["ds"] = value;
            }
        }

        protected string shipName
        {
            get
            {
                if (Session["shipName"] == null)
                    return null;
                return Session["shipName"] as string;
            }
            set
            {
                Session["shipName"] = value;
            }
        }

        protected string address
        {
            get
            {
                if (Session["address"] == null)
                    return null;
                return Session["address"] as string;
            }
            set
            {
                Session["address"] = value;
            }
        }

        protected string shipCity
        {
            get
            {
                if (Session["shipCity"] == null)
                    return null;
                return Session["shipCity"] as string;
            }
            set
            {
                Session["shipCity"] = value;
            }
        }

        protected string shipCountry
        {
            get
            {
                return Session["shipCountry"] as string;
            }
            set
            {
                Session["shipCountry"] = value;
            }
        }

        protected string shippedDate
        {
            get
            {
                return Session["shippedDate"] as string;
            }
            set
            {
                Session["shippedDate"] = value;
            }
        }

        protected double freight
        {
            get
            {
                return Convert.ToDouble(Session["freight"].ToString());
            }
            set
            {
                Session["freight"] = value;
            }
        }
        #endregion
    }
}