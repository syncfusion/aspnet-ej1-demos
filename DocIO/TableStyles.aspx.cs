#region Copyright Syncfusion Inc. 2001 - 2018
//
//  Copyright Syncfusion Inc. 2001 - 2018. All rights reserved.
//
//  Use of this code is subject to the terms of our license.
//  A copy of the current license can be obtained at any time by e-mailing
//  licensing@syncfusion.com. Any infringement will be prosecuted under
//  applicable laws. 
//
#endregion

using System;
using System.Data;
using System.Drawing;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.OleDb;
using Syncfusion.DocIO;
using Syncfusion.DocIO.DLS;
using System.ComponentModel;
using Syncfusion.DocToPDFConverter;
using Syncfusion.Pdf;

namespace WebSampleBrowser.DocIO
{
    public partial class TableStyles : System.Web.UI.Page
    {
        # region Private Members
        string dataPath = null;
        # endregion
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        # region Helpher Methods
        /// <summary>
        /// Helps to identify the path of the data folder
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        protected string ResolveApplicationDataPath(string fileName)
        {
            //Data folder path is resolved from requested page physical path.
            string dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\App_Data\\").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
        # endregion

        # region Events
        protected void Button1_Click(object sender, EventArgs e)
        {
            dataPath = ResolveApplicationDataPath("");

            // Open the template document.
            WordDocument document = new WordDocument(dataPath + "\\DocIO\\TemplateTableStyle.doc");

            // Get Data from the Database.
            OleDbConnection conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + dataPath + "Northwind.mdb");
            conn.Open();
            DataSet ds = new DataSet();
            OleDbDataAdapter adapter = new OleDbDataAdapter("Select * from Suppliers", conn);
            adapter.Fill(ds);
            ds.Tables[0].TableName = "Suppliers";
            adapter.Dispose();
            conn.Close();

            // Execute Mail Merge with groups. 
            document.MailMerge.ExecuteGroup(ds.Tables[0]);

            #region Built-in table styles
            //Get table to apply style.
            WTable table = (WTable)document.LastSection.Tables[0];

            //Apply built-in table style to the table.
            table.ApplyStyle(BuiltinTableStyle.MediumShading1Accent5);
            #endregion

            # region Save Document

            //Save as .docx format
            if (rdButtonDocx.Checked)
            {
                try
                {
                    document.Save("Sample.docx", FormatType.Docx, Response, HttpContentDisposition.Attachment);
                }
                catch (Win32Exception ex)
                {
                    Response.Write("Microsoft Word Viewer or Microsoft Word is not installed in this system");
                    Console.WriteLine(ex.ToString());
                }
            }
            //Save as WordML(.xml) format
            else if (rdButtonWordML.Checked)
            {
                try
                {
                    document.Save("Sample.xml", FormatType.WordML, Response, HttpContentDisposition.Attachment);
                }
                catch (Win32Exception ex)
                {
                    Response.Write("Microsoft Word Viewer or Microsoft Word is not installed in this system");
                    Console.WriteLine(ex.ToString());
                }
            }
            //Save as .pdf format
            else if (rdButtonPdf.Checked)
            {

                DocToPDFConverter converter = new DocToPDFConverter();
                PdfDocument pdfDoc = converter.ConvertToPDF(document);

                pdfDoc.Save("Sample.pdf", Response, HttpReadType.Save);
            }
            # endregion
        }
        # endregion
    }
}