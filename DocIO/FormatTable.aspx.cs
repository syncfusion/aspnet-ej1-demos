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
using Syncfusion.DocToPDFConverter;
using Syncfusion.Pdf;


namespace WebSampleBrowser.DocIO
{
    public partial class FormatTable : System.Web.UI.Page
    {
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
            // Create a new document.
            WordDocument document = new WordDocument();

            // Adding a new section to the document.
            IWSection section = document.AddSection();
            section.PageSetup.Margins.All = 50;
            section.PageSetup.DifferentFirstPage = true;
            IWTextRange textRange;
            IWParagraph paragraph = section.AddParagraph();


            #region Table Cell Spacing.
            // --------------------------------------------
            // Table Cell Spacing.
            // --------------------------------------------
            paragraph.AppendText("Table Cell spacing...").CharacterFormat.FontSize = 14;

            section.AddParagraph();
            paragraph = section.AddParagraph();
            WTextBody textBody = section.Body;

            // Adding a new Table to the textbody.
            IWTable table = textBody.AddTable();
            table.TableFormat.Borders.BorderType = Syncfusion.DocIO.DLS.BorderStyle.Single;
            table.TableFormat.Paddings.All = 5.4f;
            RowFormat format = new RowFormat();

            format.Paddings.All = 5;
            format.CellSpacing = 2;
            format.Borders.BorderType = Syncfusion.DocIO.DLS.BorderStyle.DotDash;
            format.IsBreakAcrossPages = true;
            table.ResetCells(25, 5, format, 90);
            IWTextRange text;
            table.Rows[0].IsHeader = true;

            for (int i = 0; i < table.Rows[0].Cells.Count; i++)
            {
                paragraph = table[0, i].AddParagraph() as WParagraph;
                paragraph.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Center;
                text = paragraph.AppendText(string.Format("Header {0}", i + 1));
                text.CharacterFormat.Font = new Font("Bitstream Vera Serif", 10);
                text.CharacterFormat.Bold = true;
                text.CharacterFormat.TextColor = Color.FromArgb(0, 21, 84);
                table[0, i].CellFormat.BackColor = Color.FromArgb(203, 211, 226);
            }

            for (int i = 1; i < table.Rows.Count; i++)
            {
                for (int j = 0; j < 5; j++)
                {
                    paragraph = table[i, j].AddParagraph() as WParagraph;
                    paragraph.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Center;

                    text = paragraph.AppendText(string.Format("Cell {0} , {1}", i, j + 1));
                    text.CharacterFormat.TextColor = Color.FromArgb(242, 151, 50);
                    text.CharacterFormat.Bold = true;
                    if (i % 2 != 1)
                        table[i, j].CellFormat.BackColor = Color.FromArgb(231, 235, 245);
                    else
                        table[i, j].CellFormat.BackColor = Color.FromArgb(246, 249, 255);

                }

            }
            (table as WTable).AutoFit(AutoFitType.FitToContent);
            #endregion Table Cell Spacing.

            #region Nested Table
            // --------------------------------------------
            // Nested Table.
            // --------------------------------------------

            section.AddParagraph();
            paragraph = section.AddParagraph();
            paragraph.ParagraphFormat.PageBreakBefore = true;
            paragraph.AppendText("Nested Table...").CharacterFormat.FontSize = 14;

            section.AddParagraph();
            paragraph = section.AddParagraph();
            textBody = section.Body;

            // Adding a new Table to the textbody.
            table = textBody.AddTable();

            format = new RowFormat();
            format.Paddings.All = 5;
            format.CellSpacing = 2.5f;
            format.Borders.BorderType = Syncfusion.DocIO.DLS.BorderStyle.DotDash;
            table.ResetCells(5, 3, format, 100);


            for (int i = 0; i < table.Rows[0].Cells.Count; i++)
            {
                paragraph = table[0, i].AddParagraph() as WParagraph;
                paragraph.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Center;
                text = paragraph.AppendText(string.Format("Header {0}", i + 1));
                text.CharacterFormat.Font = new Font("Bitstream Vera Serif", 10);
                text.CharacterFormat.Bold = true;
                text.CharacterFormat.TextColor = Color.FromArgb(0, 21, 84);
                table[0, i].CellFormat.BackColor = Color.FromArgb(242, 151, 50);
            }
            table[0, 2].Width = 200;
            for (int i = 1; i < table.Rows.Count; i++)
            {
                for (int j = 0; j < 3; j++)
                {
                    paragraph = table[i, j].AddParagraph() as WParagraph;
                    paragraph.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Center;

                    if ((i == 2) && (j == 2))
                    {
                        text = paragraph.AppendText("Nested Table");
                    }

                    else
                    {
                        text = paragraph.AppendText(string.Format("Cell {0} , {1}", i, j + 1));
                    }

                    if ((j == 2))
                        table[i, j].Width = 200;

                    text.CharacterFormat.TextColor = Color.FromArgb(242, 151, 50);
                    text.CharacterFormat.Bold = true;

                }
            }

            // Adding a nested Table.
            IWTable nestTable = table[2, 2].AddTable();

            format = new RowFormat();

            format.Borders.BorderType = Syncfusion.DocIO.DLS.BorderStyle.DotDash;
            format.HorizontalAlignment = RowAlignment.Center;
            nestTable.ResetCells(3, 3, format, 45);

            for (int i = 0; i < nestTable.Rows.Count; i++)
            {
                for (int j = 0; j < 3; j++)
                {
                    paragraph = nestTable[i, j].AddParagraph() as WParagraph;
                    paragraph.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Center;

                    nestTable[i, j].CellFormat.BackColor = Color.FromArgb(231, 235, 245);
                    text = paragraph.AppendText(string.Format("Cell {0} , {1}", i, j + 1));
                    text.CharacterFormat.TextColor = Color.Black;
                    text.CharacterFormat.Bold = true;
                }
            }
            (nestTable as WTable).AutoFit(AutoFitType.FitToContent);
            (table as WTable).AutoFit(AutoFitType.FitToWindow);
            #endregion Nested Table
            #region Table with Images
            string dataPath = ResolveApplicationDataPath();

            //Add a new section to the document.
            section = document.AddSection();
            //Add paragraph to the section.
            paragraph = section.AddParagraph();
            //Writing text.
            textRange = paragraph.AppendText("Table with Images");
            textRange.CharacterFormat.FontSize = 13f;
            textRange.CharacterFormat.TextColor = Color.DarkBlue;
            textRange.CharacterFormat.Bold = true;

            //Add paragraph to the section.
            section.AddParagraph();
            paragraph = section.AddParagraph();

            text = null;

            //Adding a new Table to the paragraph.
            table = section.Body.AddTable();
            table.ResetCells(1, 3);

            //Adding rows to the table.
            WTableRow row = table.Rows[0];
            //Set heading row height
            row.Height = 25f;
            //set heading values to the Table.
            for (int i = 0; i < 3; i++)
            {
                //Add paragraph for writing Text to the cells.
                paragraph = (IWParagraph)row.Cells[i].AddParagraph();
                //Set Horizontal Alignment as Center.
                paragraph.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Center;
                //Writing Row Heading
                switch (i)
                {
                    case 0:
                        text = paragraph.AppendText("SNO");
                        row.Cells[i].Width = 50f; break;
                    case 1: text = paragraph.AppendText("Drinks"); break;
                    case 2: text = paragraph.AppendText("Showcase Image"); row.Cells[i].Width = 200f; break;
                }
                //Set row Heading formatting
                text.CharacterFormat.Bold = true;
                text.CharacterFormat.FontName = "Cambria";
                text.CharacterFormat.FontSize = 11f;
                text.CharacterFormat.TextColor = Color.White;

                //Set row cells formatting
                row.Cells[i].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
                row.Cells[i].CellFormat.BackColor = Color.FromArgb(157, 161, 190);

                row.Cells[i].CellFormat.Borders.BorderType = Syncfusion.DocIO.DLS.BorderStyle.Single;
            }

            int sno = 1;
            //Writing Sno, Product name and Product Images to the Table.

            WTableRow row1 = table.AddRow(false);

            //Writing SNO to the table with formatting text.
            paragraph = (IWParagraph)row1.Cells[0].AddParagraph();
            paragraph.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Center;
            text = paragraph.AppendText(sno.ToString());
            text.CharacterFormat.Bold = true;
            text.CharacterFormat.FontSize = 10f;
            row1.Cells[0].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
            row1.Cells[0].CellFormat.Borders.BorderType = Syncfusion.DocIO.DLS.BorderStyle.Single;
            row1.Cells[0].CellFormat.BackColor = Color.FromArgb(217, 223, 239);
            //Writing Product Name to the table with Formatting.
            paragraph = (IWParagraph)row1.Cells[1].AddParagraph();
            paragraph.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Center;
            text = paragraph.AppendText("Apple Juice");
            text.CharacterFormat.Bold = true;
            text.CharacterFormat.FontSize = 10f;
            text.CharacterFormat.TextColor = Color.FromArgb(50, 65, 124);
            row1.Cells[1].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
            row1.Cells[1].CellFormat.Borders.BorderType = Syncfusion.DocIO.DLS.BorderStyle.Single;
            row1.Cells[1].CellFormat.BackColor = Color.FromArgb(217, 223, 239);

            //Writing Product Images to the Table.
            paragraph = (IWParagraph)row1.Cells[2].AddParagraph();
            paragraph.AppendPicture(System.Drawing.Image.FromFile(dataPath + "Apple Juice.png"));
            paragraph.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Center;
            row1.Cells[2].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
            row1.Cells[2].CellFormat.Borders.BorderType = Syncfusion.DocIO.DLS.BorderStyle.Single;
            row1.Cells[2].CellFormat.BackColor = Color.FromArgb(217, 223, 239);
            sno++;
            row1 = table.AddRow(false);

            //Writing SNO to the table with formatting text.
            paragraph = (IWParagraph)row1.Cells[0].AddParagraph();
            paragraph.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Center;
            text = paragraph.AppendText(sno.ToString());
            text.CharacterFormat.Bold = true;
            text.CharacterFormat.FontSize = 10f;
            row1.Cells[0].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
            row1.Cells[0].CellFormat.Borders.BorderType = Syncfusion.DocIO.DLS.BorderStyle.Single;
            row1.Cells[0].CellFormat.BackColor = Color.FromArgb(217, 223, 239);
            //Writing Product Name to the table with Formatting.
            paragraph = (IWParagraph)row1.Cells[1].AddParagraph();
            paragraph.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Center;
            text = paragraph.AppendText("Grape Juice");
            text.CharacterFormat.Bold = true;
            text.CharacterFormat.FontSize = 10f;
            text.CharacterFormat.TextColor = Color.FromArgb(50, 65, 124);
            row1.Cells[1].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
            row1.Cells[1].CellFormat.Borders.BorderType = Syncfusion.DocIO.DLS.BorderStyle.Single;
            row1.Cells[1].CellFormat.BackColor = Color.FromArgb(217, 223, 239);

            //Writing Product Images to the Table.
            paragraph = (IWParagraph)row1.Cells[2].AddParagraph();
            paragraph.AppendPicture(System.Drawing.Image.FromFile(dataPath + "Grape Juice.png"));
            paragraph.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Center;
            row1.Cells[2].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
            row1.Cells[2].CellFormat.Borders.BorderType = Syncfusion.DocIO.DLS.BorderStyle.Single;
            row1.Cells[2].CellFormat.BackColor = Color.FromArgb(217, 223, 239);
            sno++;
            row1 = table.AddRow(false);

            //Writing SNO to the table with formatting text.
            paragraph = (IWParagraph)row1.Cells[0].AddParagraph();
            paragraph.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Center;
            text = paragraph.AppendText(sno.ToString());
            text.CharacterFormat.Bold = true;
            text.CharacterFormat.FontSize = 10f;
            row1.Cells[0].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
            row1.Cells[0].CellFormat.Borders.BorderType = Syncfusion.DocIO.DLS.BorderStyle.Single;
            row1.Cells[0].CellFormat.BackColor = Color.FromArgb(217, 223, 239);
            //Writing Product Name to the table with Formatting.
            paragraph = (IWParagraph)row1.Cells[1].AddParagraph();
            paragraph.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Center;
            text = paragraph.AppendText("Hot Soup");
            text.CharacterFormat.Bold = true;
            text.CharacterFormat.FontSize = 10f;
            text.CharacterFormat.TextColor = Color.FromArgb(50, 65, 124);
            row1.Cells[1].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
            row1.Cells[1].CellFormat.Borders.BorderType = Syncfusion.DocIO.DLS.BorderStyle.Single;
            row1.Cells[1].CellFormat.BackColor = Color.FromArgb(217, 223, 239);

            //Writing Product Images to the Table.
            paragraph = (IWParagraph)row1.Cells[2].AddParagraph();
            paragraph.AppendPicture(System.Drawing.Image.FromFile(dataPath + "Hot Soup.png"));
            paragraph.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Center;
            row1.Cells[2].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
            row1.Cells[2].CellFormat.Borders.BorderType = Syncfusion.DocIO.DLS.BorderStyle.Single;
            row1.Cells[2].CellFormat.BackColor = Color.FromArgb(217, 223, 239);
            sno++;
            (table as WTable).AutoFit(AutoFitType.FixedColumnWidth);
            #endregion Table with Images

            # region Save the document

            if (rdButtonDoc.Checked)
            {
                //Save as .doc format
                document.Save("Sample.doc", FormatType.Doc, Response, HttpContentDisposition.Attachment);
            }
            //Save as .docx format
            else if (rdButtonDocx.Checked)
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

        # region Helpher Methods
        /// <summary>
        /// Gets the path of the template and images
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        protected string ResolveApplicationDataPath()
        {
            //Data folder path is resolved from requested page physical path.
            string dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\Content\\DocIO\\").FullName;
            return string.Format("{0}", dataPath);
        }
        # endregion
    }
}