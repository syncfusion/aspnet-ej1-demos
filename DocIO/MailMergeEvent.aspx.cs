#region Copyright Syncfusion Inc. 2001-2022
//
//  Copyright Syncfusion Inc. 2001-2022. All rights reserved.
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
using Syncfusion.DocToPDFConverter;
using Syncfusion.Pdf;


namespace WebSampleBrowser.DocIO
{
    public partial class MailMergeEvent : System.Web.UI.Page
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
                // Load the template.
                document = new WordDocument((ResolveApplicationDataPath1("/") + "/Template.doc"));

                // Get the tables from Data Set.
                GetDataTable();

                // Using Merge events to do conditional formatting during runtime.
                document.MailMerge.MergeField += new MergeFieldEventHandler(AlternateRows_MergeField);
                document.MailMerge.MergeImageField += new MergeImageFieldEventHandler(MergeField_ProductImage);

                // Execute Mail Merge with groups.
                document.MailMerge.ExecuteGroup(ds.Tables["Products"]);
                document.MailMerge.ExecuteGroup(ds.Tables["Product_PriceList"]);


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
                //Save as WordML(.xml) format
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
            catch (Exception Ex)
            {
                System.Diagnostics.Trace.WriteLine(Ex.Message + "\n\n\n" + Ex.StackTrace);
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
            FileStream fileStream = new FileStream((ResolveApplicationDataPath1("/") + "/Template.doc"), FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
            fileStream.Position = 0L;
            Response.Clear();
            Response.AddHeader("Content-Type", fileName.EndsWith("doc") ? "application/msword" : "application/application/vnd.ms-word.document.12");
            Response.AddHeader("Content-Disposition", "attachment;filename=" + fileName + ";");
            fileStream.CopyTo(Response.OutputStream);
            fileStream.Close();
            Response.End();
        }

        private void AlternateRows_MergeField(object sender, MergeFieldEventArgs args)
        {
            // Conditionally format data during Merge.
            if (args.RowIndex % 2 == 0)
            {
                args.CharacterFormat.TextColor = System.Drawing.Color.FromArgb(255, 102, 0);
            }
        }

        private void MergeField_ProductImage(object sender, MergeImageFieldEventArgs args)
        {
            // Get the image from disk during Merge.
            if (args.FieldName == "ProductImage")
            {
                string ProductFileName = args.FieldValue.ToString();
                args.Image = System.Drawing.Image.FromFile(Path.Combine(ResolveApplicationDataPath("/"), ProductFileName));
            }
        }
        # endregion

        #region Helpher Methods
        private void GetDataTable()
        {
            // List of syncfusion products name.        
            string[] products = { "Apple Juice", "Grape Juice", "Hot Soup", "Tender Coconut", "Vennila", "Strawberry", "Cherry", "Cone" };

            // Add new Tables to the data set.
            DataRow row;
            ds.Tables.Add();
            ds.Tables.Add();

            // Add fields to the Product_PriceList table.
            ds.Tables[0].TableName = "Product_PriceList";
            ds.Tables[0].Columns.Add("ProductName");
            ds.Tables[0].Columns.Add("Price");

            // Add fields to the Products table.
            ds.Tables[1].TableName = "Products";
            ds.Tables[1].Columns.Add("SNO");
            ds.Tables[1].Columns.Add("ProductName");
            ds.Tables[1].Columns.Add("ProductImage");

            int count = 0;

            // Inserting values to the tables.
            foreach (string product in products)
            {
                row = ds.Tables["Product_PriceList"].NewRow();
                row["ProductName"] = product;
                switch (product)
                {
                    case "Apple Juice":
                        row["Price"] = "$12.00"; break;
                    case "Grape Juice":
                        row["Price"] = "$15.00"; break;
                    case "Hot Soup":
                        row["Price"] = "$20.00"; break;
                    case "Tender coconut":
                        row["Price"] = "$10.00"; break;
                    case "Vennila Ice Cream":
                        row["Price"] = "$15.00"; break;
                    case "Strawberry":
                        row["Price"] = "$18.00"; break;
                    case "Cherry":
                        row["Price"] = "$25.00"; break;
                    default:
                        row["Price"] = "$20.00"; break;
                }

                ds.Tables["Product_PriceList"].Rows.Add(row);

                count++;
                row = ds.Tables["Products"].NewRow();
                row["SNO"] = count.ToString();
                row["ProductName"] = product;
                row["ProductImage"] = string.Concat(product, ".png");
                ds.Tables["Products"].Rows.Add(row);
            }
        }

        protected string ResolveApplicationDataPath(string fileName)
        {
            //Data folder path is resolved from requested page physical path.
            string dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\Content\\DocIO\\").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
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