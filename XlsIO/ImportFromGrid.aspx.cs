using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Syncfusion.XlsIO;
using System.Data;
using System.Drawing;

namespace WebSampleBrowser.XlsIO
{
    public partial class ImportFromGrid : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            gridView.DataSource = GetDataTable();
            gridView.DataBind();
            gridView.AlternatingRowStyle.BackColor = Color.WhiteSmoke;
            gridView.RowStyle.BackColor = Color.LightGray;
            gridView.HeaderStyle.BackColor = Color.WhiteSmoke;
            
        }

        protected void btnCreateExcel_Click(object sender, EventArgs e)
        {
            //Step 1 : Instantiate the spreadsheet creation engine.
            ExcelEngine excelEngine = new ExcelEngine();
            //Step 2 : Instantiate the excel application object.
            IApplication application = excelEngine.Excel;

            IWorkbook workbook = application.Workbooks.Create(1);
            //IWorkbook workbook = application.Workbooks.Create(1);
            IWorksheet sheet = workbook.Worksheets[0];

            //Imports from GridView to worksheet.
            sheet.ImportGridView(gridView, 1, 1, chbHeader.Checked, chbStyle.Checked);

	        sheet.UsedRange.AutofitColumns();

            if (rdButtonXls.Checked)
            {
                application.DefaultVersion = ExcelVersion.Excel97to2003;
                workbook.SaveAs("Output.xls", ExcelSaveType.SaveAsXLS, Response, ExcelDownloadType.PromptDialog);
               
            }
            else if (rdButtonXlsx.Checked)
            {
                application.DefaultVersion = ExcelVersion.Excel2013;
                workbook.SaveAs("Output.xlsx", ExcelSaveType.SaveAsXLS, Response, ExcelDownloadType.PromptDialog);
            }
           
            workbook.Close();
            excelEngine.Dispose();
        }
        private DataTable GetDataTable()
        {
            DataSet customersDataSet = new DataSet();
            //Get the path of the input file
            string inputXmlPath = XlsIOHelper.ResolveApplicationDataPath("Customers.xml", Request);
            customersDataSet.ReadXml(inputXmlPath);
            DataTable dataTable = new DataTable();
            dataTable = customersDataSet.Tables[0];
            dataTable.Columns.RemoveAt(4);
            return dataTable;
        }
    }
}
