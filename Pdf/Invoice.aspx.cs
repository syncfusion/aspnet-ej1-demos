#region Copyright Syncfusion Inc. 2001-2019.
// Copyright Syncfusion Inc. 2001-2019. All rights reserved.
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
using System.Drawing.Imaging;
using System.Data.OleDb;
using System.Data.SqlServerCe;

using Syncfusion.Pdf;
using Syncfusion.Pdf.Graphics;
using Syncfusion.Pdf.Grid;

namespace WebSampleBrowser.Pdf
{
    public partial class Invoice : System.Web.UI.Page
    {
        # region Private Members
        string y, shipName, address, shipCity, shipCountry, shippedDate;
        Double x, total = 0, freight;
        int k = 0;
        //  SampleDatabases db;
        private string DEF_DB_COMMAND2 = "select OrderID from SyncOrders Order By OrderID";
        # endregion

        # region Page Load
        /// <summary>
        /// Handles page load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            //db = new SampleDatabases(SampleDatabases.Connections.NorthwindIO, "select OrderID from SyncOrders Order By OrderID");
            //DataTable dt = db.DataTable;


            //Create dataset with the "Customers" table from Norwind database
            DataSet dataSet = GetNorthwindDataSet(DEF_DB_COMMAND2);

            //Create datatable
            DataTable dt = dataSet.Tables[0];


            // Add Customer ID to the list box.
            foreach (DataRow row in dt.Rows)
            {
                listBox.Items.Add(row["OrderID"].ToString());
            }
            if (!IsPostBack)
            {
                listBox.SelectedIndex = 0;
            }
        }
        # endregion

        # region Events
        /// <summary>
        /// Creates PDF document
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            // Generate Invoice for the selected ID.
            GeneratePDF(Convert.ToInt32(listBox.SelectedItem.Value));
        }
        # endregion

        # region Helpher Methods

        private DataSet GetNorthwindDataSet(string selectCommand)
        {
            DataSet dataSet = new DataSet();
            try
            {
                AppDomain.CurrentDomain.SetData("SQLServerCompactEditionUnderWebHosting", true);
                SqlCeConnection conn = new SqlCeConnection();
                if (conn.ServerVersion.StartsWith("3.5"))
                    conn.ConnectionString = "Data Source = " + ResolveApplicationDBPath("NorthwindIO_3.5.sdf", true);
                else
                    conn.ConnectionString = "Data Source = " + ResolveApplicationDBPath("NorthwindIO.sdf", true);
                conn.Open();
                SqlCeDataAdapter adapter = new SqlCeDataAdapter(DEF_DB_COMMAND2, conn);
                adapter.Fill(dataSet);
                adapter.Dispose();
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }

            return dataSet;

        }

        private void GeneratePDF(int id)
        {
            PdfDocument document = new PdfDocument();
            document.PageSettings.Orientation = PdfPageOrientation.Landscape;
            document.PageSettings.Margins.All = 50;
            PdfPage page = document.Pages.Add();
            PdfGraphics g = page.Graphics;
            PdfTextElement element = new PdfTextElement("Northwind Traders\n67, rue des Cinquante Otages,\nElgin,\nUnites States.");
            element.Font = new PdfStandardFont(PdfFontFamily.TimesRoman, 12);
            element.Brush = new PdfSolidBrush(new PdfColor(89, 89, 93));
            PdfLayoutResult result = element.Draw(page, new RectangleF(0, 0, page.Graphics.ClientSize.Width / 2, 200));

            PdfImage img = PdfImage.FromFile(ResolveApplicationDataPath("logo.jpg"));
            page.Graphics.DrawImage(img, new RectangleF(g.ClientSize.Width - 200, result.Bounds.Y, 190, 45));
            PdfFont subHeadingFont = new PdfStandardFont(PdfFontFamily.TimesRoman, 14);
            g.DrawRectangle(new PdfSolidBrush(new PdfColor(126, 151, 173)), new RectangleF(0, result.Bounds.Bottom + 40, g.ClientSize.Width, 30));
            element = new PdfTextElement("INVOICE " + id.ToString(), subHeadingFont);
            element.Brush = PdfBrushes.White;
            result = element.Draw(page, new PointF(10, result.Bounds.Bottom + 48));
            string currentDate = "DATE " + DateTime.Now.ToString("MM/dd/yyyy");
            SizeF textSize = subHeadingFont.MeasureString(currentDate);
            g.DrawString(currentDate, subHeadingFont, element.Brush, new PointF(g.ClientSize.Width - textSize.Width - 10, result.Bounds.Y));

            element = new PdfTextElement("BILL TO ", new PdfStandardFont(PdfFontFamily.TimesRoman, 10));
            element.Brush = new PdfSolidBrush(new PdfColor(126, 155, 203));
            result = element.Draw(page, new PointF(10, result.Bounds.Bottom + 25));

            g.DrawLine(new PdfPen(new PdfColor(126, 151, 173), 0.70f), new PointF(0, result.Bounds.Bottom + 3), new PointF(g.ClientSize.Width, result.Bounds.Bottom + 3));

            //Get the product table details
            DataTable shipTable = GetShipDetails(id);
            //Get the order details
            GetProductTable(id);

            element = new PdfTextElement(shipName, new PdfStandardFont(PdfFontFamily.TimesRoman, 10));
            element.Brush = new PdfSolidBrush(new PdfColor(89, 89, 93));
            result = element.Draw(page, new RectangleF(10, result.Bounds.Bottom + 5, g.ClientSize.Width / 2, 100));

            element = new PdfTextElement(string.Format("{0}, {1}, {2}", address, shipCity, shipCountry), new PdfStandardFont(PdfFontFamily.TimesRoman, 10));
            element.Brush = new PdfSolidBrush(new PdfColor(89, 89, 93));
            result = element.Draw(page, new RectangleF(10, result.Bounds.Bottom + 3, g.ClientSize.Width / 2, 100));

            PdfGrid grid = new PdfGrid();
            grid.DataSource = GetProductDetails(id);
            PdfGridCellStyle cellStyle = new PdfGridCellStyle();
            cellStyle.Borders.All = PdfPens.White;
            PdfGridRow header = grid.Headers[0];

            PdfGridCellStyle headerStyle = new PdfGridCellStyle();
            headerStyle.Borders.All = new PdfPen(new PdfColor(126, 151, 173));
            headerStyle.BackgroundBrush = new PdfSolidBrush(new PdfColor(126, 151, 173));
            headerStyle.TextBrush = PdfBrushes.White;
            headerStyle.Font = new PdfStandardFont(PdfFontFamily.TimesRoman, 14f, PdfFontStyle.Regular);

            for (int i = 0; i < header.Cells.Count; i++)
            {
                if (i == 0)
                    header.Cells[i].StringFormat = new PdfStringFormat(PdfTextAlignment.Left, PdfVerticalAlignment.Middle);
                else
                    header.Cells[i].StringFormat = new PdfStringFormat(PdfTextAlignment.Right, PdfVerticalAlignment.Middle);
            }

            header.ApplyStyle(headerStyle);
            cellStyle.Borders.Bottom = new PdfPen(new PdfColor(217, 217, 217), 0.70f);
            cellStyle.Font = new PdfStandardFont(PdfFontFamily.TimesRoman, 12f);
            cellStyle.TextBrush = new PdfSolidBrush(new PdfColor(131, 130, 136));
            foreach (PdfGridRow row in grid.Rows)
            {
                row.ApplyStyle(cellStyle);
                for (int i = 0; i < row.Cells.Count; i++)
                {
                    PdfGridCell cell = row.Cells[i];
                    if (i == 0)
                        cell.StringFormat = new PdfStringFormat(PdfTextAlignment.Left, PdfVerticalAlignment.Middle);
                    else
                        cell.StringFormat = new PdfStringFormat(PdfTextAlignment.Right, PdfVerticalAlignment.Middle);

                    if (i > 1)
                    {
                        float val = float.MinValue;
                        float.TryParse(cell.Value.ToString(), out val);
                        cell.Value = val.ToString("C");
                    }
                }
            }

            PdfGridLayoutFormat layoutFormat = new PdfGridLayoutFormat();
            layoutFormat.Layout = PdfLayoutType.Paginate;

            PdfGridLayoutResult gridResult = grid.Draw(page, new RectangleF(new PointF(0, result.Bounds.Bottom + 40), new SizeF(g.ClientSize.Width, g.ClientSize.Height - 100)), layoutFormat);
            float pos = 0.0f;
            for (int i = 0; i < grid.Columns.Count - 1; i++)
                pos += grid.Columns[i].Width;

            PdfFont font = new PdfStandardFont(PdfFontFamily.TimesRoman, 14f);

            gridResult.Page.Graphics.DrawString("Total Due", font, new PdfSolidBrush(new PdfColor(126, 151, 173)), new RectangleF(new PointF(pos, gridResult.Bounds.Bottom + 20), new SizeF(grid.Columns[3].Width - pos, 20)), new PdfStringFormat(PdfTextAlignment.Right));
            gridResult.Page.Graphics.DrawString("Thank you for your business!", new PdfStandardFont(PdfFontFamily.TimesRoman, 12), new PdfSolidBrush(new PdfColor(89, 89, 93)), new PointF(pos - 55, gridResult.Bounds.Bottom + 60));
            pos += grid.Columns[4].Width;
            gridResult.Page.Graphics.DrawString(total.ToString("C"), font, new PdfSolidBrush(new PdfColor(131, 130, 136)), new RectangleF(new PointF(pos, gridResult.Bounds.Bottom + 20), new SizeF(grid.Columns[4].Width - pos, 20)), new PdfStringFormat(PdfTextAlignment.Right));

            //Save to disk
            //Stream the output to the browser.	
            if (this.CheckBox1.Checked)
                document.Save("Sample.pdf", Response, HttpReadType.Open);
            else
                document.Save("Sample.pdf", Response, HttpReadType.Save);

            document.Close(true);
        }

        private void GetProductTable(int id)
        {
            DEF_DB_COMMAND2 = "Select ShipName,ShipAddress,Freight,ShippedDate,ShipCity,ShipCountry from Orders where OrderID=" + id;

            //Create dataset with the "Customers" table from Norwind database
            DataSet dataSet = GetNorthwindDataSet(DEF_DB_COMMAND2);

            //Create datatable
            DataTable dataTable = dataSet.Tables[0];

            //DataTable dataTable1 = new DataTable();
            //db = new SampleDatabases(SampleDatabases.Connections.NorthwindIO, "Select ShipName,ShipAddress,Freight,ShippedDate,ShipCity,ShipCountry from Orders where OrderID=" + id);
            //dataTable1 = db.DataTable;

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

        //Main table
        private DataSet GetTestOrder(int id)
        {

            DEF_DB_COMMAND2 = "Select ShipName,ShipAddress,Freight,ShippedDate,ShipCity,ShipCountry from Orders where OrderID=" + id;

            //Create dataset with the "Customers" table from Norwind database
            DataSet dataSet = GetNorthwindDataSet(DEF_DB_COMMAND2);

            return dataSet;
        }

        //Sub table
        private DataTable GetProductDetails(int id)
        {
            DEF_DB_COMMAND2 = "select ProductID,Quantity,UnitPrice,Discount from SyncOrderDetails where OrderID=" + id;

            //Create dataset with the "Customers" table from Norwind database
            DataSet dataSet = GetNorthwindDataSet(DEF_DB_COMMAND2);

            //Create datatable
            DataTable prodDT = dataSet.Tables[0];

            //Add new column
            prodDT.Columns.Add(new DataColumn("Price", typeof(String)));

            DEF_DB_COMMAND2 = "select Quantity,UnitPrice from SyncOrderDetails where OrderID=" + id;

            //Create dataset with the "Customers" table from Norwind database
            DataSet dataSet1 = GetNorthwindDataSet(DEF_DB_COMMAND2);

            //Create datatable
            DataTable dt = dataSet1.Tables[0];

            DataRow dr;
            int rows = dt.Rows.Count;
            for (int i = 0; i < rows; i++)
            {
                dr = dt.Rows[i];
                x = System.Convert.ToDouble(dr["Quantity"].ToString()) * System.Convert.ToDouble(dr["UnitPrice"].ToString());
                dr = prodDT.Rows[k];
                y = x.ToString();
                dr["Price"] = y.ToString();
                k++;

                total = total + x;
            }
            return prodDT;
        }

        private DataTable GetShipDetails(int TestOrderId)
        {
            DEF_DB_COMMAND2 = String.Format("SELECT ShipName,ShipAddress,Freight,ShipCity,ShipCountry,ShippedDate from Orders where OrderID={0}", TestOrderId);

            //Create dataset with the "Customers" table from Norwind database
            DataSet dataSet = GetNorthwindDataSet(DEF_DB_COMMAND2);

            //Create datatable
            DataTable dt = dataSet.Tables[0];

            return dt;
        }

        /// <summary>
        /// Data folder path is resolved from requested page physical path
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        protected string ResolveApplicationDataPath(string fileName)
        {
            string dataPath = new System.IO.DirectoryInfo(Server.MapPath("~\\Content") + "\\PDF").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }

        protected string ResolveApplicationDBPath(string fileName)
        {
            string dataPath = new System.IO.DirectoryInfo(Server.MapPath("~\\App_Data") + "\\PDF").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
		protected string ResolveApplicationDBPath(string fileName, bool excludePDF)
        {
            string dataPath = new System.IO.DirectoryInfo(Server.MapPath("~\\App_Data")).FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
        # endregion
    }
}