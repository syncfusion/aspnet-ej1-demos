#region Copyright Syncfusion Inc. 2001 - 2020
//
//  Copyright Syncfusion Inc. 2001 - 2020. All rights reserved.
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
using System.Drawing;
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
using System.ComponentModel;

namespace WebSampleBrowser.DocIO
{
    public partial class TableInsertion : System.Web.UI.Page
    {
        # region Page Load
        /// <summary>
        /// Handles page load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        # endregion

        # region Events
        /// <summary>
        /// Creates word document
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {            
            AppDomain.CurrentDomain.SetData("SQLServerCompactEditionUnderWebHosting", true);
            DataTable table = new DataTable();
            SqlCeConnection conn = new SqlCeConnection();
            if (conn.ServerVersion.StartsWith("3.5"))
                conn.ConnectionString = "Data Source = " + ResolveApplicationDataSourcePath("NorthwindIO_3.5.sdf");
            else
                conn.ConnectionString = "Data Source = " + ResolveApplicationDataSourcePath("NorthwindIO.sdf");
            conn.Open();
            SqlCeDataAdapter adapter = new SqlCeDataAdapter("Select [Customer ID],[Company Name],[Contact Name],Address,Country,Phone from Customers", conn);
            adapter.Fill(table);
            adapter.Dispose();
            conn.Close();


            // Creating a new document.
            WordDocument document = new WordDocument();
            // Adding a new section to the document.
            IWSection section = document.AddSection();
            // Set Margin of the document
            section.PageSetup.Margins.All = 72;
            IWParagraph paragraph = section.AddParagraph();
            //Format the heading.
            IWTextRange text = paragraph.AppendText("Northwind Report");
            text.CharacterFormat.Bold = true;
            text.CharacterFormat.FontName = "Cambria";
            text.CharacterFormat.FontSize = 14.0f;
            text.CharacterFormat.TextColor = Color.DarkBlue;
            paragraph.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Center;

            paragraph = section.AddParagraph();
            paragraph.ParagraphFormat.BeforeSpacing = 18f;

            //Create a new table
            WTextBody textBody = section.Body;
            IWTable docTable = textBody.AddTable();

            //Set the format for rows
            RowFormat format = new RowFormat();
            format.Borders.BorderType = Syncfusion.DocIO.DLS.BorderStyle.Single;
            format.Borders.LineWidth = 1.0F;
            format.Borders.Color = Color.Black;

            //Initialize number of rows and cloumns.
            docTable.ResetCells(table.Rows.Count + 1, table.Columns.Count, format, 84);

            //Repeat the header.
            docTable.Rows[0].IsHeader = true;

            string colName;

            //Format the header rows
            for (int c = 0; c <= table.Columns.Count - 1; c++)
            {

                string[] Cols = table.Columns[c].ColumnName.Split('|');
                colName = Cols[Cols.Length - 1];
                IWTextRange theadertext = docTable.Rows[0].Cells[c].AddParagraph().AppendText(colName);
                theadertext.CharacterFormat.FontSize = 12f;
                theadertext.CharacterFormat.Bold = true;
                theadertext.CharacterFormat.TextColor = Color.White;
                docTable.Rows[0].Cells[c].CellFormat.BackColor = Color.FromArgb(33, 67, 126);
                docTable.Rows[0].Cells[c].CellFormat.Borders.Color = Color.Black;
                docTable.Rows[0].Cells[c].CellFormat.Borders.BorderType = Syncfusion.DocIO.DLS.BorderStyle.Single;
                docTable.Rows[0].Cells[c].CellFormat.Borders.LineWidth = 1.0f;

                docTable.Rows[0].Cells[c].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
            }

            //Format the table body rows
            for (int r = 0; r <= table.Rows.Count - 1; r++)
            {
                for (int c = 0; c <= table.Columns.Count - 1; c++)
                {
                    string Value = table.Rows[r][c].ToString();
                    IWTextRange theadertext = docTable.Rows[r + 1].Cells[c].AddParagraph().AppendText(Value);
                    theadertext.CharacterFormat.FontSize = 10;

                    docTable.Rows[r + 1].Cells[c].CellFormat.BackColor = ((r & 1) == 0) ? Color.FromArgb(237, 240, 246) : Color.FromArgb(192, 201, 219);

                    docTable.Rows[r + 1].Cells[c].CellFormat.Borders.Color = Color.Black;
                    docTable.Rows[r + 1].Cells[c].CellFormat.Borders.BorderType = Syncfusion.DocIO.DLS.BorderStyle.Single;
                    docTable.Rows[r + 1].Cells[c].CellFormat.Borders.LineWidth = 0.5f;
                    docTable.Rows[r + 1].Cells[c].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
                }
            }

            // Add a footer paragraph text to the document.
            WParagraph footerPar = new WParagraph(document);
            // Add text.
            footerPar.AppendText("Copyright Northwind Inc. 2001 - 2015");
            // Add page and Number of pages field to the document.
            footerPar.AppendText("            Page ");
            footerPar.AppendField("Page", FieldType.FieldPage);

            section.HeadersFooters.Footer.Paragraphs.Add(footerPar);

            # region Save the document
            if (rdButtonWord97To2003.Checked)
            {
                //Save as .doc Word 97-2003 format
                document.Save("Sample.doc", FormatType.Doc, Response, HttpContentDisposition.Attachment);
            }
            //Save as .docx Word2007 format
            else if (rdButtonWord2007.Checked)
            {
                try
                {
                    document.Save("Sample.docx", FormatType.Word2007, Response, HttpContentDisposition.Attachment);
                }
                catch (Win32Exception ex)
                {
                    Response.Write("Word 2007 is not installed in this system");
                    Console.WriteLine(ex.ToString());
                }
            }
            //Save as .docx Word2010 format
            else if (rdButtonWord2010.Checked)
            {
                try
                {
                    document.Save("Sample.docx", FormatType.Word2010, Response, HttpContentDisposition.Attachment);
                }
                catch (Win32Exception ex)
                {
                    Response.Write("Word 2010 is not installed in this system");
                    Console.WriteLine(ex.ToString());
                }
            }
            //Save as .docx Word2013 format
            else if (rdButtonWord2013.Checked)
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
            # endregion
        }
        # endregion

        # region Helpher Methods
        /// <summary>
        /// Gets the path of the database
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        protected string ResolveApplicationDataSourcePath(string Filename)
        {
            string dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\App_Data\\").FullName;
            return string.Format("{0}\\{1}", dataPath, Filename);
        }
        # endregion
    }
}