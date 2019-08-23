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
using System.IO;
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
using System.Data.SqlServerCe;
using Syncfusion.DocToPDFConverter;
using Syncfusion.Pdf;

namespace WebSampleBrowser.DocIO
{
    public partial class EmployeeReport : System.Web.UI.Page
    {
        # region Private Members
        string dataPath = null;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        # region Events
        /// <summary>
        /// Creates word document
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            //SDF and get the NorthWind               
            AppDomain.CurrentDomain.SetData("SQLServerCompactEditionUnderWebHosting", true);
            SqlCeConnection conn = new SqlCeConnection();
            if (conn.ServerVersion.StartsWith("3.5"))
                conn.ConnectionString = "Data Source = " + ResolveApplicationDataPath("..\\NorthwindIO_3.5.sdf");
            else
                conn.ConnectionString = "Data Source = " + ResolveApplicationDataPath("..\\NorthwindIO.sdf");
           

            DataTable table = new DataTable();  
            conn.Open();
            SqlCeDataAdapter adapter = new SqlCeDataAdapter("Select TOP(5) * from EmployeesReport", conn);
            adapter.Fill(table);
            adapter.Dispose();
            conn.Close();

            dataPath = ResolveApplicationDataPath("EmployeesReportDemo.doc");
            // Creating a new document.
            WordDocument document = new WordDocument();
            // Load template
            document.Open(dataPath, FormatType.Doc);

            // Set table name as Employess for template mergefield reference.
            table.TableName = "Employees";
            // Execute Mail Merge with groups. 
            document.MailMerge.ExecuteGroup(table);

            if (rdButtonDoc.Checked)
            {
                //Save as .doc format
                document.Save("Sample.doc", FormatType.Doc, Response, HttpContentDisposition.Attachment);
            }
            //Save as .docx format
            else if (rdButtonDocx.Checked)
            {
                document.Save("Sample.docx", FormatType.Docx, Response, HttpContentDisposition.Attachment);
            }
            //Save as .xml(WordML) format
            else if (rdButtonWordML.Checked)
            {
                document.Save("Sample.xml", FormatType.WordML, Response, HttpContentDisposition.Attachment);
            }
            //Save as .pdf format
            else if (rdButtonPdf.Checked)
            {

                DocToPDFConverter converter = new DocToPDFConverter();
                PdfDocument pdfDoc = converter.ConvertToPDF(document);

                pdfDoc.Save("Sample.pdf", Response, HttpReadType.Save);
            }
        }
        /// <summary>
        /// Handles the Click event of the Button2 control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected void Button2_Click(object sender, EventArgs e)
        {
            string fileName = "Template.doc";
            FileStream fileStream = new FileStream(ResolveApplicationDataPath("EmployeesReportDemo.doc"), FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
            fileStream.Position = 0L;
            Response.Clear();
            Response.AddHeader("Content-Type", fileName.EndsWith("doc") ? "application/msword" : "application/application/vnd.ms-word.document.12");
            Response.AddHeader("Content-Disposition", "attachment;filename=" + fileName + ";");
            fileStream.CopyTo(Response.OutputStream);
            fileStream.Close();
            Response.End();
        }

        # endregion

        # region Helpher Methods
        /// <summary>
        /// Data folder path is resolved from requested page physical path
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        protected string ResolveApplicationDataPath(string fileName)
        {
            //Data folder path is resolved from requested page physical path.
            string dataPath = null;
            dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\App_Data\\DocIO\\").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
        # endregion
    }
}