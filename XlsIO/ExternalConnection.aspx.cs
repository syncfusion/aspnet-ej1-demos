#region Copyright Syncfusion Inc. 2001-2022
// Copyright Syncfusion Inc. 2001-2022. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using Syncfusion.XlsIO;

namespace WebSampleBrowser.XlsIO
{
    public partial class ExternalConnection : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {

                    OleDbConnection Oledb = new OleDbConnection();
                    Oledb.ConnectionString = "Provider=Microsoft.JET.OLEDB.4.0;Password=\"\";User ID=Admin;Data Source=" + XlsIOHelper.ResolveApplicationDataBasePath("Northwind.mdb", Request);
                    OleDbCommand Command = new OleDbCommand("select distinct country from Customers order by country", Oledb);
                    OleDbDataAdapter Adapter = new OleDbDataAdapter(Command);
                    DataSet Dataset = new DataSet();
                    Adapter.Fill(Dataset);
                    // Add Customer ID to the list box.
                    if (Dataset.Tables.Count > 0)
                    {
                        this.DropDownList1.DataSource = Dataset.Tables[0];
                        this.DropDownList1.DataTextField = "Country";
                        this.DropDownList1.DataBind();

                    }
                }
                catch (Exception ex)
                {
                    this.Response.Write(ex.Message);
                }
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            GenerateXls((DropDownList1.SelectedItem.Value));

        }
        public void GenerateXls(object selctedcountry)
        {
            //New instance of XlsIO is created.[Equivalent to launching Microsoft Excel with no workbooks open].

            //Step 1 : Instantiate the spreadsheet creation engine.
            ExcelEngine excelEngine = new ExcelEngine();
            //Step 2 : Instantiate the excel application object.
            IApplication application = excelEngine.Excel;

            //Set the Workbook version
            application.DefaultVersion = ExcelVersion.Excel2016;

            //Create the workbook with default sheet
            IWorkbook workbook = application.Workbooks.Create();
            //Get the 1st sheet from the workbook
            IWorksheet sheet = workbook.Worksheets[0];

            //Get the DataBase Path.
            string dbPath = XlsIOHelper.ResolveApplicationDataBasePath("Northwind.mdb", Request);
            //connection string for DataSource
            string ConnectionString = "OLEDB;Provider=Microsoft.JET.OLEDB.4.0;Password=\"\";User ID=Admin;Data Source=" + dbPath;
            //query for the datasource
            string query = null;
            if (selctedcountry != null)
            {
                query = "select * from Customers where country='" + selctedcountry + "'";
            }
            else
            {
                query = "select * from Customers";
            }
            //Add the connection to workbook
            IConnection Connection = workbook.Connections.Add("Connection1", "Sample connection with MsAccess", ConnectionString, query, ExcelCommandType.Sql);

            //Add the QueryTable to sheet object
            sheet.ListObjects.AddEx(ExcelListObjectSourceType.SrcQuery, Connection, sheet.Range["C3"]);

            //Refresh the Connection for include the data
            if (this.refresh.Checked)
            {
                try
                {
                    sheet.ListObjects[0].Refresh();
                    sheet.UsedRange.AutofitColumns();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }

            //Save the workbook to disk.
            workbook.SaveAs("Sample.xlsx", Response, ExcelDownloadType.PromptDialog, ExcelHttpContentType.Excel2016);

            //Close the workbook.
            workbook.Close();
            excelEngine.Dispose();
        }

    }
}