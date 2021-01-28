#region Copyright Syncfusion Inc. 2001 - 2021
//
//  Copyright Syncfusion Inc. 2001 - 2021. All rights reserved.
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
namespace WebSampleBrowser.DocIO
{
    public partial class MacroPreservation : System.Web.UI.Page
    {
        # region Private Members
        // Create a DataSet.
        DataSet ds = new DataSet();

        // Creating a new document.
        WordDocument document;
        # endregion
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
            try
            {
                // Load the macro-enabled template.
                document = new WordDocument((ResolveApplicationDataPath1("/") + "MacroTemplate.dotm"));

                // Get the tables from Data Set.
                GetDataTable();

                // Execute Mail Merge with groups.
                document.MailMerge.ExecuteGroup(ds.Tables["Products"]);

                ds = null;
                ds = new DataSet();

               //Saving the document as .docm
               document.Save("Sample.docm", FormatType.Word2013Docm, Response, HttpContentDisposition.Attachment);
            }
            catch (Exception Ex)
            {
                System.Diagnostics.Trace.WriteLine(Ex.Message + "\n\n\n" + Ex.StackTrace);
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            string fileName = "Template.dotm";
            FileStream fileStream = new FileStream((ResolveApplicationDataPath1("/") + "MacroTemplate.dotm"), FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
            fileStream.Position = 0L;
            Response.Clear();
            Response.AddHeader("Content-Type", fileName.EndsWith("doc") ? "application/msword" : "application/application/vnd.ms-word.document.12");
            Response.AddHeader("Content-Disposition", "attachment;filename=" + fileName + ";");
            fileStream.CopyTo(Response.OutputStream);
            fileStream.Close();
            Response.End();
        }
        # endregion

        #region Helpher Methods
        private void GetDataTable()
        {
            // List of syncfusion products name.
            string[] products = { "DocIO", "PDF", "XlsIO" };

            // Add new Tables to the data set.
            DataRow row;
            ds.Tables.Add();

            // Add fields to the Products table.
            ds.Tables[0].TableName = "Products";
            ds.Tables[0].Columns.Add("ProductName");
            ds.Tables[0].Columns.Add("Binary");
            ds.Tables[0].Columns.Add("Source");

            // Inserting values to the tables.
            foreach (string product in products)
            {
                row = ds.Tables["Products"].NewRow();
                row["ProductName"] = string.Concat("Essential ", product);
                row["Binary"] = "$895.00";
                row["Source"] = "$1,295.00";
                ds.Tables["Products"].Rows.Add(row);
            }
        }
        protected string ResolveApplicationDataPath1(string fileName)
        {
            //Data folder path is resolved from requested page physical path.
            string dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\App_Data\\DocIO\\").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
        # endregion
    }
}