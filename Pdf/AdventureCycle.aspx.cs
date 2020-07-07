#region Copyright Syncfusion Inc. 2001-2020.
// Copyright Syncfusion Inc. 2001-2020. All rights reserved.
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
using Syncfusion.Pdf;
using Syncfusion.Pdf.Graphics;
using Syncfusion.Pdf.Grid;
using System.Data.OleDb;
using System.Data.SqlServerCe;

namespace WebSampleBrowser.Pdf
{
    public partial class AdventureCycle : System.Web.UI.Page
    {
        # region Private Members
        private const string DEF_DB_COMMAND2 = "SELECT CustomerID,CompanyName,ContactName,Address,City,PostalCode,Country,Phone,Fax FROM Customers";
        string styleName;
        # endregion

        # region Page Load
        /// <summary>
        /// Handles page load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {            
            Array styleArray = Enum.GetValues(typeof(PdfGridBuiltinStyle));           
            foreach (PdfGridBuiltinStyle style in styleArray)
            {
                ListItem item=new ListItem(style.ToString());
                this.comComBox.Items.Add(item);
            }
            this.comComBox.SelectedIndex = 26;
            this.CheckBox2.Checked = true;
            this.CheckBox3.Checked = true;
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
            styleName = this.comComBox.SelectedItem.Text;

            //Create PDF document
            PdfDocument doc = new PdfDocument();

            //Set font
            PdfFont font = new PdfStandardFont(PdfFontFamily.Helvetica, 7);

            //Create Pdf ben for drawing broder
            PdfPen borderPen = new PdfPen(PdfBrushes.DarkBlue);
            borderPen.Width = 0;

            //Create brush
            PdfColor color = new PdfColor(192, 201, 219);
            PdfSolidBrush brush = new PdfSolidBrush(color);
           
            //Create Page
            PdfPage page = doc.Pages.Add();          

           //Create PdfGrid
            PdfGrid grid = new PdfGrid();

            //Create dataset with the "Customers" table from Norwind database
            DataSet dataSet = GetAdventureWorkCycleDataSet();

            DataTable dt = dataSet.Tables[0];
            string[] unwantedColumns = { "Freight", "EmployeeID", "OrderDate", "RequiredDate", "ShippedDate", "ShipVia", "ShipRegion" };
            foreach (string columnIndex in unwantedColumns)
            {
                dt.Columns.Remove(columnIndex);
            }
       
            grid.Style.AllowHorizontalOverflow = true;
           
            //Set Data source
            grid.DataSource = dt;

            #region PdfGridBuiltinStyleSettings
            PdfGridBuiltinStyleSettings setting = new PdfGridBuiltinStyleSettings();
            setting.ApplyStyleForHeaderRow = this.CheckBox2.Checked;
            setting.ApplyStyleForBandedRows = this.CheckBox3.Checked;
            setting.ApplyStyleForBandedColumns = this.CheckBox4.Checked;          
            setting.ApplyStyleForFirstColumn = this.CheckBox5.Checked;          
            setting.ApplyStyleForLastColumn = this.CheckBox6.Checked;
            setting.ApplyStyleForLastRow = this.CheckBox7.Checked;
            #endregion 

            //Set layout properties 
            PdfGridLayoutFormat format = new PdfGridLayoutFormat();
            format.Break = PdfLayoutBreakType.FitPage;
            format.Layout = PdfLayoutType.Paginate;           

            PdfGridBuiltinStyle style = ConvertToPdfGridBuiltinStyle(styleName);

            grid.ApplyBuiltinStyle(style, setting);
            grid.Style.Font = font;

            //Draw table
            grid.Draw(page, PointF.Empty, format);

            //Save to disk
            //Stream the output to the browser.	
            if (this.CheckBox1.Checked)
                doc.Save("Sample.pdf", Response, HttpReadType.Open);
            else
                doc.Save("Sample.pdf", Response, HttpReadType.Save);
        }
        # endregion

        # region Helpher Methods

        /// <summary>
        /// Convert string to PdfGridBuiltinStyle
        /// </summary>
        /// <param name="s"></param>
        /// <returns></returns>
        private PdfGridBuiltinStyle ConvertToPdfGridBuiltinStyle(string styleName)
        {
            PdfGridBuiltinStyle value = (PdfGridBuiltinStyle)Enum.Parse(typeof(PdfGridBuiltinStyle), styleName);
            return value;
        }

        /// <summary>
        /// Returns dataset.
        /// </summary>
        private DataSet GetAdventureWorkCycleDataSet()
        {
            DataSet dataSet = new DataSet();
            dataSet.ReadXml(ResolveApplicationDBPath("Orders.xml"));            
            return dataSet;
        }

      

        /// <summary>
        /// Data folder path is resolved from requested page physical path
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        protected string ResolveApplicationDBPath(string fileName)
        {
            string dataPath = new System.IO.DirectoryInfo(Server.MapPath("~\\App_Data") + "\\PDF").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
       
        # endregion
    }
}