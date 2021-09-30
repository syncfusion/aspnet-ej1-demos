#region Copyright Syncfusion Inc. 2001-2021
//
//  Copyright Syncfusion Inc. 2001-2021. All rights reserved.
//
//  Use of this code is subject to the terms of our license.
//  A copy of the current license can be obtained at any time by e-mailing
//  licensing@syncfusion.com. Any infringement will be prosecuted under
//  applicable laws. 
//
#endregion

using System;
using System.IO;
using System.Drawing;
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
    public partial class Forms : System.Web.UI.Page
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

            // Adding a new paragraph to the section.
            IWParagraph paragraph = section.AddParagraph();

            #region Create Form

            #region Document formatting
            //Set background color.
            document.Background.Gradient.Color1 = Color.FromArgb(232, 232, 232);
            document.Background.Gradient.Color2 = Color.FromArgb(255, 255, 255);
            document.Background.Type = BackgroundType.Gradient;
            document.Background.Gradient.ShadingStyle = GradientShadingStyle.Horizontal;
            document.Background.Gradient.ShadingVariant = GradientShadingVariant.ShadingDown;

            section.PageSetup.Margins.All = 30f;
            section.PageSetup.PageSize = new SizeF(600, 600f);

            #endregion

            #region Title Section
            IWTable table = section.Body.AddTable();
            table.ResetCells(1, 2);

            WTableRow row = table.Rows[0];
            row.Height = 25f;

            IWParagraph cellPara = row.Cells[0].AddParagraph();
            System.Drawing.Image img = System.Drawing.Image.FromFile(ResolveApplicationDataPath("image.jpg"));
            IWPicture pic = cellPara.AppendPicture(img);
            pic.Height = 80;
            pic.Width = 180;

            cellPara = row.Cells[1].AddParagraph();
            row.Cells[1].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
            row.Cells[1].CellFormat.BackColor = Color.FromArgb(173, 215, 255);
            IWTextRange txt = cellPara.AppendText("Job Application Form");
            cellPara.ParagraphFormat.HorizontalAlignment = Syncfusion.DocIO.DLS.HorizontalAlignment.Center;
            txt.CharacterFormat.Bold = true;
            txt.CharacterFormat.FontName = "Arial";
            txt.CharacterFormat.FontSize = 18f;

            row.Cells[0].Width = 200;
            row.Cells[1].Width = 300;
            //row.Cells[1].CellFormat.FitText = true;
            row.Cells[1].CellFormat.Borders.BorderType = Syncfusion.DocIO.DLS.BorderStyle.Hairline;
            #endregion

            section.AddParagraph();

            #region General Information
            table = section.Body.AddTable();
            table.TableFormat.Paddings.All = 5.4f;
            table.ResetCells(2, 1);
            row = table.Rows[0];
            row.Height = 20;
            row.Cells[0].Width = 500;
            cellPara = row.Cells[0].AddParagraph();
            row.Cells[0].CellFormat.Borders.BorderType = Syncfusion.DocIO.DLS.BorderStyle.Thick;
            row.Cells[0].CellFormat.Borders.Color = Color.FromArgb(155, 205, 255);
            row.Cells[0].CellFormat.BackColor = Color.FromArgb(198, 227, 255);
            row.Cells[0].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
            txt = cellPara.AppendText(" General Information");
            txt.CharacterFormat.FontName = "Arial";
            txt.CharacterFormat.Bold = true;
            txt.CharacterFormat.FontSize = 11f;

            row = table.Rows[1];
            cellPara = row.Cells[0].AddParagraph();
            row.Cells[0].Width = 500;
            row.Cells[0].CellFormat.Borders.BorderType = Syncfusion.DocIO.DLS.BorderStyle.Hairline;
            row.Cells[0].CellFormat.Borders.Color = Color.FromArgb(155, 205, 255);
            row.Cells[0].CellFormat.BackColor = Color.FromArgb(222, 239, 255);

            txt = cellPara.AppendText("\n Full Name:\t\t\t\t");
            txt.CharacterFormat.FontName = "Arial";
            txt.CharacterFormat.FontSize = 11f;
            WTextFormField txtField = cellPara.AppendTextFormField(" ");
            txtField.TextRange.CharacterFormat.TextColor = Color.MidnightBlue;
            txtField.TextRange.CharacterFormat.FontName = "Arial";
            txtField.TextRange.CharacterFormat.FontSize = 11f;

            txt = cellPara.AppendText("\n\n Birth Date:\t\t\t\t");
            txt.CharacterFormat.FontName = "Arial";
            txt.CharacterFormat.FontSize = 11f;
            txtField = cellPara.AppendTextFormField("BirthDayField", DateTime.Now.ToString("M/d/yyyy"));
            txtField.StringFormat = "M/d/yyyy";
            txtField.Type = TextFormFieldType.DateText;
            txtField.TextRange.CharacterFormat.TextColor = Color.MidnightBlue;
            txtField.TextRange.CharacterFormat.FontName = "Arial";
            txtField.TextRange.CharacterFormat.FontSize = 11f;
            txtField.CharacterFormat.TextColor = Color.MidnightBlue;
            txtField.CharacterFormat.FontName = "Arial";
            txtField.CharacterFormat.FontSize = 11f;

            txt = cellPara.AppendText("\n\n Address:\t\t\t\t");
            txt.CharacterFormat.FontName = "Arial";
            txt.CharacterFormat.FontSize = 11f;
            txtField = cellPara.AppendTextFormField(" ");
            txtField.TextRange.CharacterFormat.TextColor = Color.MidnightBlue;
            txtField.TextRange.CharacterFormat.FontName = "Arial";
            txtField.TextRange.CharacterFormat.FontSize = 11f;

            txt = cellPara.AppendText("\n\n Phone:\t\t\t\t");
            txt.CharacterFormat.FontName = "Arial";
            txt.CharacterFormat.FontSize = 11f;
            txtField = cellPara.AppendTextFormField(" ");
            txtField.TextRange.CharacterFormat.TextColor = Color.MidnightBlue;
            txtField.TextRange.CharacterFormat.FontName = "Arial";
            txtField.TextRange.CharacterFormat.FontSize = 11f;

            txt = cellPara.AppendText("\n\n Email:\t\t\t\t\t");
            txt.CharacterFormat.FontName = "Arial";
            txt.CharacterFormat.FontSize = 11f;
            txtField = cellPara.AppendTextFormField(" ");
            txtField.TextRange.CharacterFormat.TextColor = Color.MidnightBlue;
            txtField.TextRange.CharacterFormat.FontName = "Arial";
            txtField.TextRange.CharacterFormat.FontSize = 11f;
            cellPara.AppendText("\n");
            #endregion

            section.AddParagraph();

            #region Educational Qualification
            table = section.Body.AddTable();
            table.TableFormat.Paddings.All = 5.4f;
            table.ResetCells(2, 1);
            row = table.Rows[0];
            row.Height = 20;
            row.Cells[0].Width = 500;
            cellPara = row.Cells[0].AddParagraph();
            row.Cells[0].CellFormat.Borders.BorderType = Syncfusion.DocIO.DLS.BorderStyle.Thick;
            row.Cells[0].CellFormat.Borders.Color = Color.FromArgb(155, 205, 255);
            row.Cells[0].CellFormat.BackColor = Color.FromArgb(198, 227, 255);
            row.Cells[0].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
            txt = cellPara.AppendText(" Educational Qualification");
            txt.CharacterFormat.FontName = "Arial";
            txt.CharacterFormat.Bold = true;
            txt.CharacterFormat.FontSize = 11f;

            row = table.Rows[1];
            cellPara = row.Cells[0].AddParagraph();
            row.Cells[0].Width = 500;
            row.Cells[0].CellFormat.Borders.BorderType = Syncfusion.DocIO.DLS.BorderStyle.Hairline;
            row.Cells[0].CellFormat.Borders.Color = Color.FromArgb(155, 205, 255);
            row.Cells[0].CellFormat.BackColor = Color.FromArgb(222, 239, 255);

            txt = cellPara.AppendText("\n Type:\t\t\t\t\t");
            txt.CharacterFormat.FontName = "Arial";
            txt.CharacterFormat.FontSize = 11f;
            WDropDownFormField dropField = cellPara.AppendDropDownFormField();
            dropField.DropDownItems.Add("Higher");
            dropField.DropDownItems.Add("Vocational");
            dropField.DropDownItems.Add("Universal");
            dropField.CharacterFormat.TextColor = Color.MidnightBlue;
            dropField.CharacterFormat.FontName = "Arial";
            dropField.CharacterFormat.FontSize = 11f;

            txt = cellPara.AppendText("\n\n Institution:\t\t\t\t");
            txt.CharacterFormat.FontName = "Arial";
            txt.CharacterFormat.FontSize = 11f;
            txtField = cellPara.AppendTextFormField(" ");
            txtField.TextRange.CharacterFormat.TextColor = Color.MidnightBlue;
            txtField.TextRange.CharacterFormat.FontName = "Arial";
            txtField.CharacterFormat.FontSize = 11f;

            txt = cellPara.AppendText("\n\n Programming Languages:");
            txt.CharacterFormat.FontName = "Arial";
            txt.CharacterFormat.FontSize = 11f;
            txt = cellPara.AppendText("\n\n\t C#:\t\t\t\t");
            txt.CharacterFormat.FontName = "Arial";
            txt.CharacterFormat.FontSize = 9f;
            dropField = cellPara.AppendDropDownFormField();
            dropField.DropDownItems.Add("Perfect");
            dropField.DropDownItems.Add("Good");
            dropField.DropDownItems.Add("Excellent");
            dropField.CharacterFormat.TextColor = Color.MidnightBlue;
            dropField.CharacterFormat.FontName = "Arial";
            dropField.CharacterFormat.FontSize = 11f;

            txt = cellPara.AppendText("\n\n\t VB:\t\t\t\t");
            txt.CharacterFormat.FontName = "Arial";
            txt.CharacterFormat.FontSize = 9f;
            dropField = cellPara.AppendDropDownFormField();
            dropField.DropDownItems.Add("Perfect");
            dropField.DropDownItems.Add("Good");
            dropField.DropDownItems.Add("Excellent");
            dropField.CharacterFormat.TextColor = Color.MidnightBlue;
            dropField.CharacterFormat.FontName = "Arial";
            dropField.CharacterFormat.FontSize = 11f;
            #endregion
            #endregion

            #region Fill Form

            WSection sec = document.LastSection;
            WTextFormField textFF;
            WDropDownFormField dropFF;
            WTableCell cell = sec.Body.Tables[1].LastRow.Cells[0];
            //Access the text field
            textFF = cell.FormFields[0] as WTextFormField;

            //Fill value for the textfield
            textFF.TextRange.Text = "John";

            //Access the form field with feild name
            textFF = cell.FormFields["BirthDayField"] as WTextFormField;
            textFF.TextRange.Text = "5/13/1980";

            textFF = cell.FormFields[2] as WTextFormField;
            textFF.TextRange.Text = "221b Baker Street";

            textFF = cell.FormFields[3] as WTextFormField;
            textFF.TextRange.Text = "(206)555-3412";

            textFF = cell.FormFields[4] as WTextFormField;
            textFF.TextRange.Text = "John@company.com";

            cell = sec.Body.Tables[2].LastRow.Cells[0];
            dropFF = cell.FormFields[0] as WDropDownFormField;

            //Set the value
            dropFF.DropDownSelectedIndex = 1;

            textFF = cell.FormFields[1] as WTextFormField;
            textFF.TextRange.Text = "Michigan University";


            dropFF = cell.FormFields[2] as WDropDownFormField;
            dropFF.DropDownSelectedIndex = 1;

            dropFF = cell.FormFields[3] as WDropDownFormField;
            dropFF.DropDownSelectedIndex = 2;

            //Allow only to fill the form.
            document.ProtectionType = ProtectionType.AllowOnlyFormFields;

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
            #endregion
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
            string dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\Content\\DocIO\\").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
        # endregion
    }
}