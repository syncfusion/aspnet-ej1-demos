#region Copyright Syncfusion Inc. 2001 - 2019
//
//  Copyright Syncfusion Inc. 2001 - 2019. All rights reserved.
//
//  Use of this code is subject to the terms of our license.
//  A copy of the current license can be obtained at any time by e-mailing
//  licensing@syncfusion.com. Any infringement will be prosecuted under
//  applicable laws. 
//
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

using Syncfusion.DocIO;
using Syncfusion.DocIO.DLS;
using System.ComponentModel;
using System.Drawing;
using System.IO;
using System.Data.SqlServerCe;
using Syncfusion.DocToPDFConverter;
using Syncfusion.Pdf;

namespace WebSampleBrowser.DocIO
{
    public partial class DefaultFunctionalities : System.Web.UI.Page
    {
        # region Load
        /// <summary>
        /// Handles load
        /// </summary>
        /// <param name="e"></param>
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);



            if (!IsPostBack)
            {
                try
                {
                    dataPath = ResolveApplicationDataPath("\\", "template");
                    AppDomain.CurrentDomain.SetData("SQLServerCompactEditionUnderWebHosting", true);
                    SqlCeConnection conn = new SqlCeConnection();
                    if (conn.ServerVersion.StartsWith("3.5"))
                        conn.ConnectionString = "Data Source = " + ResolveApplicationDataPath("NorthwindIO_3.5.sdf", "database");
                    else
                        conn.ConnectionString = "Data Source = " + ResolveApplicationDataPath("NorthwindIO.sdf", "database");
                    DataTable dt = new DataTable();
                    
                    conn.Open();
                    SqlCeDataAdapter adapter = new SqlCeDataAdapter("select OrderID  from SyncOrders Order By OrderID", conn);
                    adapter.Fill(dt);
                    adapter.Dispose();
                    conn.Close();

                    //SampleDatabases db = new SampleDatabases(SampleDatabases.Connections.NorthwindIO, "select OrderID  from SyncOrders Order By OrderID");
                    //DataTable dt = db.DataTable;
                    this.DropDownList1.DataSource = dt;
                    this.DropDownList1.DataTextField = "OrderID";
                    this.DropDownList1.DataBind();

                }
                catch (Exception Ex)
                {
                    // Shows the Message box with Exception message, if an exception is thrown.
                    this.Response.Write(Ex.Message);
                }
            }
        }
        # endregion

        # region Events
        protected void Button1_Click(object sender, EventArgs e)
        {
            // Generate Invoice for the selected ID.
            ExecuteMail_Doc(Convert.ToInt32(DropDownList1.SelectedItem.Value));
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            string fileName = "Template.doc";
            FileStream fileStream = new FileStream(ResolveApplicationDataPath("SalesInvoiceDemo.doc", string.Empty), FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
            fileStream.Position = 0L;
            Response.Clear();
            Response.AddHeader("Content-Type", fileName.EndsWith("doc") ? "application/msword" : "application/application/vnd.ms-word.document.12");
            Response.AddHeader("Content-Disposition", "attachment;filename=" + fileName + ";");
            fileStream.CopyTo(Response.OutputStream);
            fileStream.Close();
            Response.End();
        }
        private void MailMerge_MergeField(object sender, MergeFieldEventArgs args)
        {
            // Conditionally format data during Merge.
            if (args.RowIndex % 2 == 0)
            {
                args.CharacterFormat.TextColor = System.Drawing.Color.DarkBlue;
            }

        }
        # endregion

        # region Helpher Methods
        /// <summary>
        /// Data folder path is resolved from requested page physical path.
        /// </summary>
        /// <param name="fileName"></param>
        /// <param name="folderName"></param>
        /// <returns></returns>
        protected string ResolveApplicationDataPath(string fileName, string location)
        {
            string dataPath = null;
            if (location == "database")
                dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\App_Data\\").FullName;
            else
                dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\App_Data\\DocIO\\").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }

        private void ExecuteMail_Doc(int ID)
        {

            // Create a new document
            WordDocument doc = new WordDocument();
            // Load the template.
            doc.Open((System.IO.Path.Combine(dataPath, @"SalesInvoiceDemo.doc")), FormatType.Doc);
            // Execute Mail Merge with groups.
            doc.MailMerge.ExecuteGroup(GetTestOrder(ID));
            doc.MailMerge.ExecuteGroup(GetTestOrderTotals(ID));

            // Using Merge events to do conditional formatting during runtime.
            doc.MailMerge.MergeField += new MergeFieldEventHandler(MailMerge_MergeField);

            DataView orderDetails = new DataView(GetTestOrderDetails(ID));
            orderDetails.Sort = "ExtendedPrice DESC";
            doc.MailMerge.ExecuteGroup(orderDetails);

            if (rdButtonDoc.Checked)
            {
                //Save as .doc format
                doc.Save("Sample.doc", FormatType.Doc, Response, HttpContentDisposition.Attachment);
            }
            //Save as .docx format
            else if (rdButtonDocx.Checked)
            {
                doc.Save("Sample.docx", FormatType.Docx, Response, HttpContentDisposition.Attachment);
            }
            //Save as .xml(WordML) format
            else if (rdButtonWordML.Checked)
            {
                doc.Save("Sample.xml", FormatType.WordML, Response, HttpContentDisposition.Attachment);
            }
            //Save as .pdf format
            else if (rdButtonPdf.Checked)
            {
               
                DocToPDFConverter converter = new DocToPDFConverter();
                PdfDocument pdfDoc = converter.ConvertToPDF(doc);

                pdfDoc.Save("Sample.pdf", Response, HttpReadType.Save);
            }
            
        }

        private DataTable GetTestOrder(int TestOrderId)
        {
            AppDomain.CurrentDomain.SetData("SQLServerCompactEditionUnderWebHosting", true);

            DataTable table = new DataTable();
            SqlCeConnection conn = new SqlCeConnection();
            if (conn.ServerVersion.StartsWith("3.5"))
                conn.ConnectionString = "Data Source = " + ResolveApplicationDataPath("NorthwindIO_3.5.sdf", "database");
            else
                conn.ConnectionString = "Data Source = " + ResolveApplicationDataPath("NorthwindIO.sdf", "database");
            conn.Open();
            SqlCeDataAdapter adapter = new SqlCeDataAdapter("SELECT * FROM SyncOrders WHERE OrderId = " + TestOrderId, conn);
            adapter.Fill(table);
            adapter.Dispose();
            conn.Close();

            table.TableName = "Orders";
            return table;
        }

        private DataTable GetTestOrderDetails(int TestOrderId)
        {
            AppDomain.CurrentDomain.SetData("SQLServerCompactEditionUnderWebHosting", true);

            DataTable table = new DataTable();
            SqlCeConnection conn = new SqlCeConnection();
            if (conn.ServerVersion.StartsWith("3.5"))
                conn.ConnectionString = "Data Source = " + ResolveApplicationDataPath("NorthwindIO_3.5.sdf", "database");
            else
                conn.ConnectionString = "Data Source = " + ResolveApplicationDataPath("NorthwindIO.sdf", "database");
            conn.Open();
            SqlCeDataAdapter adapter = new SqlCeDataAdapter("SELECT * FROM SyncOrderDetails WHERE OrderId = " + TestOrderId + " ORDER BY ProductID", conn);
            adapter.Fill(table);
            adapter.Dispose();
            conn.Close();
            table.TableName = "Order";
            return table;
        }

        private DataTable GetTestOrderTotals(int TestOrderId)
        {
            AppDomain.CurrentDomain.SetData("SQLServerCompactEditionUnderWebHosting", true);

            DataTable table = new DataTable();
            SqlCeConnection conn = new SqlCeConnection();
            if (conn.ServerVersion.StartsWith("3.5"))
                conn.ConnectionString = "Data Source = " + ResolveApplicationDataPath("NorthwindIO_3.5.sdf", "database");
            else
                conn.ConnectionString = "Data Source = " + ResolveApplicationDataPath("NorthwindIO.sdf", "database");
            conn.Open();
            SqlCeDataAdapter adapter = new SqlCeDataAdapter("SELECT * FROM SyncOrderTotals WHERE OrderId = " + TestOrderId, conn);
            adapter.Fill(table);
            adapter.Dispose();
            conn.Close();

            table.TableName = "OrderTotals";
            return table;
        }

        private DataTable ExecuteDataTable(string commandText)
        {
            // Return DataTable
            try
            {

                AppDomain.CurrentDomain.SetData("SQLServerCompactEditionUnderWebHosting", true);

                DataTable table = new DataTable();
                SqlCeConnection conn = new SqlCeConnection();
                if (conn.ServerVersion.StartsWith("3.5"))
                    conn.ConnectionString = "Data Source = " + ResolveApplicationDataPath("NorthwindIO_3.5.sdf", "database");
                else
                    conn.ConnectionString = "Data Source = " + ResolveApplicationDataPath("NorthwindIO.sdf", "database");
                conn.Open();
                SqlCeDataAdapter adapter = new SqlCeDataAdapter(commandText, conn);
                adapter.Fill(table);
                adapter.Dispose();
                conn.Close();

                return table;
            }
            finally
            {
            }
        }
        # endregion

        #region Session Variables

        protected string dataPath
        {
            get
            {
                if (Session["dataPath"] == null)
                    return null;
                return Session["dataPath"] as string;
            }
            set
            {
                Session["dataPath"] = value;
            }
        }
        #endregion
    }
}