#region Copyright Syncfusion Inc. 2001 - 2022
//
//  Copyright Syncfusion Inc. 2001 - 2022. All rights reserved.
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
using System.Drawing;
using System.Data.SqlServerCe;

namespace WebSampleBrowser.DocIO
{
    public partial class Letter : System.Web.UI.Page
    {
        # region Private Members
        DataTable table;
        int pageIndex;
        DataRow dr;
        # endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            //SDF and get the NorthWind               
            AppDomain.CurrentDomain.SetData("SQLServerCompactEditionUnderWebHosting", true);
            SqlCeConnection conn = new SqlCeConnection();
            if (conn.ServerVersion.StartsWith("3.5"))
                conn.ConnectionString = "Data Source = " + ResolveApplicationDataPath("NorthwindIO_3.5.sdf");
            else
                conn.ConnectionString = "Data Source = " + ResolveApplicationDataPath("NorthwindIO.sdf");
            table = new DataTable();           
            conn.Open();
            SqlCeDataAdapter adapter = new SqlCeDataAdapter("Select * from Customers", conn);
            adapter.Fill(table);
            adapter.Dispose();
            conn.Close();

            //Initializes the data grid
            this.gridView1.DataSource = table;
            this.gridView1.DataBind();
        }

        # region Events
        /// <summary>
        /// Handles the page index changed event
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gridView1_PageIndexChanged(object sender, EventArgs e)
        {
            this.gridView1.PageIndex = pageIndex;
            this.gridView1.DataBind();
        }

        /// <summary>
        /// Handles the page index changing event
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            pageIndex = e.NewPageIndex;
        }

        /// <summary>
        /// Handles the selected index changed event
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.gridView1.SelectedRowStyle.BackColor = Color.BlanchedAlmond;
        }

        /// <summary>
        /// Creates word document and executes mail merge
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (this.gridView1.SelectedIndex < 0)
            {
                //If no row is selected
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Please select any one row from the grid!');", true);
                return;
            }
            else
            {
                string dataPath = ResolveApplicationDataPath("\\");

                // Create a new document.
                WordDocument document = new WordDocument();
                // Loading Template.
                document.Open((Path.Combine(dataPath, "Letter Formatting.doc")), FormatType.Doc);

                // Checks if data field mapping should be enabled
                if (checkBoxChoose.Checked)
                {
                    // Merge Template fields with user entered data.
                    document.MailMerge.RemoveEmptyParagraphs = true;

                    //To clear the fields with empty value
                    document.MailMerge.ClearFields = true;

                    //Clear the map fields
                    document.MailMerge.MappedFields.Clear();

                    //Update the mapping fields
                    document.MailMerge.MappedFields.Add("Contact Name", "ContactName");
                    document.MailMerge.MappedFields.Add("Company Name", "CompanyName");
                    document.MailMerge.MappedFields.Add("CompanyAddress", "Address");
                    document.MailMerge.MappedFields.Add("Residing City", "City");
                    document.MailMerge.MappedFields.Add("Current Region", "Region");
                    document.MailMerge.MappedFields.Add("Home Country", "Country");
                }

                // Gets the selected row from the grid
                dr = table.Rows[this.gridView1.SelectedIndex + (this.gridView1.PageIndex * this.gridView1.PageSize)];

                //Mailmerge can be performed with the input as either DataRow, DataField, DataView, IDataReader 
                //or a set of merge field names and values. Here, one particular row is extraced from the table and used.

                //Executes mail merge for the selected record or row
                document.MailMerge.Execute(dr);

                #region Insert WaterMark
                //Add Text Watermark
                document.Watermark = new TextWatermark();
                (document.Watermark as TextWatermark).Text = "Demo";
                (document.Watermark as TextWatermark).Size = 144;
                #endregion

                if (rdButtonWord97To2003.Checked)
                {
                    //Save as .doc Word 97-2003 format
                    document.Save("Sample.doc", FormatType.Doc, Response, HttpContentDisposition.Attachment);
                }
                //Save as .docx Word2007 format
                else if (rdButtonWord2007.Checked)
                {
                    document.Save("Sample.docx", FormatType.Word2007, Response, HttpContentDisposition.Attachment);
                }
                //Save as .docx Word2010 format
                else if (rdButtonWord2010.Checked)
                {
                    document.Save("Sample.docx", FormatType.Word2010, Response, HttpContentDisposition.Attachment);
                }
                //Save as .docx Word2013 format
                else if (rdButtonWord2013.Checked)
                {
                    document.Save("Sample.docx", FormatType.Docx, Response, HttpContentDisposition.Attachment);
                }
                //Save as WordML(.xml) format
                else if (rdButtonWordML.Checked)
                {
                    document.Save("Sample.xml", FormatType.WordML, Response, HttpContentDisposition.Attachment);
                }
            }
        }
        #endregion

        # region Helpher Methods
        /// <summary>
        /// Gets the data path in which the data base and the template document resides in the server
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        protected string ResolveApplicationDataPath(string fileName)
        {
            //Data folder path is resolved from requested page physical path.
            string dataPath = null;
            if (fileName == "NorthwindIO_3.5.sdf" || fileName == "NorthwindIO.sdf")
                dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\App_Data\\").FullName;
            else
                dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\App_Data\\DocIO\\").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
        # endregion
    }
}