#region Copyright Syncfusion Inc. 2001 - 2020
// Copyright Syncfusion Inc. 2001 - 2020. All rights reserved.
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

using Syncfusion.XlsIO;
using System.Data.OleDb;
using System.IO;
using System.Drawing;
using System.Collections;

namespace WebSampleBrowser.XlsIO
{
    public partial class DefaultFunctionalities : System.Web.UI.Page
    {
        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        #endregion

        # region Events
        /// <summary>
        /// Create Spreadsheet
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            //New instance of XlsIO is created.[Equivalent to launching MS Excel with no workbooks open].
            //The instantiation process consists of two steps.

            //Step 1 : Instantiate the spreadsheet creation engine.
            ExcelEngine excelEngine = new ExcelEngine();
            //Step 2 : Instantiate the excel application object.
            IApplication application = excelEngine.Excel;

            //A new workbook is created.[Equivalent to creating a new workbook in MS Excel]
            //The new workbook will have 2 worksheets
            IWorkbook workbook = application.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath("BudgetPlanner.xls", Request));

            IWorksheet sheet = workbook.Worksheets[1];
            sheet.FirstVisibleRow = 3;

            IFont font = workbook.CreateFont();
            font.Bold = true;

            #region TextBox
            ITextBoxShape textbox = sheet.TextBoxes.AddTextBox(5, 2, 40, 140);
            textbox.Text = "Quick Budget";
            textbox.RichText.SetFont(0, 11, font);
            textbox.VAlignment = ExcelCommentVAlign.Center;
            textbox.HAlignment = ExcelCommentHAlign.Center;
            textbox.Fill.FillType = ExcelFillType.Gradient;
            textbox.Fill.GradientColorType = ExcelGradientColor.TwoColor;
            textbox.Fill.TwoColorGradient(ExcelGradientStyle.Vertical, ExcelGradientVariants.ShadingVariants_2);
            textbox.Fill.BackColor = Color.FromArgb(204, 204, 255);

            textbox = sheet.TextBoxes.AddTextBox(7, 2, 25, 140);
            textbox.Text = "Income";
            textbox.RichText.SetFont(0, 5, font);
            textbox.VAlignment = ExcelCommentVAlign.Center;
            textbox.HAlignment = ExcelCommentHAlign.Center;
            textbox.Fill.FillType = ExcelFillType.Gradient;
            textbox.Fill.GradientColorType = ExcelGradientColor.TwoColor;
            textbox.Fill.TwoColorGradient(ExcelGradientStyle.Vertical, ExcelGradientVariants.ShadingVariants_2);
            textbox.Fill.BackColor = Color.FromArgb(0, 0, 128);

            textbox = sheet.TextBoxes.AddTextBox(16, 2, 25, 140);
            textbox.Text = "Spending";
            textbox.RichText.SetFont(0, 7, font);
            textbox.VAlignment = ExcelCommentVAlign.Center;
            textbox.HAlignment = ExcelCommentHAlign.Center;
            textbox.Fill.FillType = ExcelFillType.Gradient;
            textbox.Fill.GradientColorType = ExcelGradientColor.TwoColor;
            textbox.Fill.TwoColorGradient(ExcelGradientStyle.Vertical, ExcelGradientVariants.ShadingVariants_2);
            textbox.Fill.BackColor = Color.FromArgb(0, 0, 128);

            #endregion

            #region Write Text and Numbers
            sheet.Range["O6"].Text = "Weekly";
            sheet.Range["E7"].Text = "Frequency";
            sheet.Range["F7"].Text = "Amount";
            sheet.Range["G7"].Text = "Monthly";
            sheet.Range["H7"].Text = "Yearly";

            sheet.Range["B8"].Text = "Total Income";
            sheet.Range["C9"].Text = "Salary/Wages";
            sheet.Range["C10"].Text = "Salary/Wages(Spouse)";
            sheet.Range["C11"].Text = "Other";
            sheet.Range["C12"].Text = "Other";
            sheet.Range["C13"].Text = "Other";
            sheet.Range["B17"].Text = "Transportation";

            sheet.Range["F25"].Number = 3000;
            sheet.Range["F9"].Number = 55000;
            sheet.Range["F10"].Number = 35000;


            sheet.Range["C18"].Text = "Auto Loan/Lease";
            sheet.Range["C19"].Text = "Insurance";
            sheet.Range["C20"].Text = "Gas ";
            sheet.Range["C21"].Text = "Maintenance ";
            sheet.Range["C22"].Text = "Registration/Inspection";
            sheet.Range["C23"].Text = "Bill's train pass";
            sheet.Range["C24"].Text = "Jane's bus pass";
            sheet.Range["C25"].Text = "Other";

            sheet.Range["E16"].Text = "Total";

            sheet.Range["N6"].Text = "Chart";

            sheet.Range["B27"].Text = "Home";

            sheet.Range["F28"].Number = 20000;
            sheet.Range["F29"].Number = 5000;
            sheet.Range["F33"].Number = 5000;

            sheet.Range["C28"].Text = "EMI";
            sheet.Range["C29"].Text = "Rent";
            sheet.Range["C30"].Text = "Maintanence";
            sheet.Range["C31"].Text = "Insurance";
            sheet.Range["C32"].Text = "Furniture";
            sheet.Range["C33"].Text = "Household Supplies";
            sheet.Range["C34"].Text = "Groceries";
            sheet.Range["C35"].Text = "Real Estate Tax";
            sheet.Range["C36"].Text = "Other";

            sheet.Range["B39"].Text = "Utilities";

            sheet.Range["F41"].Number = 1000;
            sheet.Range["F42"].Number = 250;
            sheet.Range["F43"].Number = 150;
            sheet.Range["F45"].Number = 175;

            sheet.Range["C40"].Text = "Phone - Home";
            sheet.Range["C41"].Text = "Phone - Cell";
            sheet.Range["C42"].Text = "Cable";
            sheet.Range["C43"].Text = "Gas";
            sheet.Range["C44"].Text = "Water";
            sheet.Range["C45"].Text = "Electricity";
            sheet.Range["C46"].Text = "Internet";
            sheet.Range["C47"].Text = "Other";

            sheet.Range["B50"].Text = "Health";

            sheet.Range["F53"].Number = 500;


            sheet.Range["C51"].Text = "Dental";
            sheet.Range["C52"].Text = "Medical";
            sheet.Range["C53"].Text = "Medication";
            sheet.Range["C54"].Text = "Vision/contacts";
            sheet.Range["C55"].Text = "Life Insurance";
            sheet.Range["C56"].Text = "Electricity";
            sheet.Range["C57"].Text = "Other";

            #endregion

            #region Cell styles

            IStyle tableStyle = workbook.Styles.Add("TableStyle");

            tableStyle.BeginUpdate();
            tableStyle.Color = Color.White;
            tableStyle.Borders[ExcelBordersIndex.EdgeBottom].ColorRGB = Color.FromArgb(150, 150, 150);
            tableStyle.Borders[ExcelBordersIndex.EdgeBottom].LineStyle = ExcelLineStyle.Thin;
            tableStyle.Borders[ExcelBordersIndex.EdgeLeft].ColorRGB = Color.FromArgb(150, 150, 150);
            tableStyle.Borders[ExcelBordersIndex.EdgeLeft].LineStyle = ExcelLineStyle.Thin;
            tableStyle.Borders[ExcelBordersIndex.EdgeRight].ColorRGB = Color.FromArgb(150, 150, 150);
            tableStyle.Borders[ExcelBordersIndex.EdgeRight].LineStyle = ExcelLineStyle.Thin;
            tableStyle.Borders[ExcelBordersIndex.EdgeTop].ColorRGB = Color.FromArgb(150, 150, 150);
            tableStyle.Borders[ExcelBordersIndex.EdgeTop].LineStyle = ExcelLineStyle.Thin;
            tableStyle.EndUpdate();

            sheet.Range["E7:H7"].CellStyle.Font.Bold = true;
            sheet.Range["B17"].CellStyle.Font.Bold = true;
            sheet.Range["B27"].CellStyle.Font.Bold = true;
            sheet.Range["B39"].CellStyle.Font.Bold = true;
            sheet.Range["B50"].CellStyle.Font.Bold = true;

            sheet.Range["E7:H7"].CellStyle.Font.Underline = ExcelUnderline.Single;


            sheet.Range["B7:H14"].CellStyle.Color = Color.FromArgb(223, 223, 223);
            sheet.Range["C9:C13"].CellStyle = tableStyle;
            sheet.Range["E9:F13"].CellStyle = tableStyle;


            sheet.Range["B16:H26"].CellStyle.Color = Color.FromArgb(223, 223, 223);
            sheet.Range["B17:C17"].CellStyle.Color = Color.White;

            sheet.Range["C18:C25"].CellStyle = tableStyle;
            sheet.Range["O6"].CellStyle = tableStyle;
            sheet.Range["E18:F25"].CellStyle = tableStyle;

            sheet.Range["B27:H38"].CellStyle.Color = Color.FromArgb(223, 223, 223);
            sheet.Range["C28:C36"].CellStyle = tableStyle;
            sheet.Range["B27:C27"].CellStyle.Color = Color.White;
            sheet.Range["E28:F36"].CellStyle = tableStyle;

            sheet.Range["B39:H49"].CellStyle.Color = Color.FromArgb(223, 223, 223);
            sheet.Range["C40:C47"].CellStyle = tableStyle;
            sheet.Range["B39:C39"].CellStyle.Color = Color.White;
            sheet.Range["E40:F47"].CellStyle = tableStyle;

            sheet.Range["B50:H58"].CellStyle.Color = Color.FromArgb(223, 223, 223);
            sheet.Range["C51:C57"].CellStyle = tableStyle;
            sheet.Range["B50:C50"].CellStyle.Color = Color.White;
            sheet.Range["E51:F57"].CellStyle = tableStyle;


            #endregion

            #region Data Validation
            IDataValidation validation = sheet.Range["E9:E13"].DataValidation;
            sheet.Range["E9:E13"].Text = "Monthly";
            validation.ListOfValues = new string[] { "Daily", "Weekly", "Monthly", "Semi-Annually", "Quarterly", "Yearly" };

            IDataValidation validation1 = sheet.Range["E18:E25"].DataValidation;
            sheet.Range["E18:E25"].Text = "Monthly";
            validation1.ListOfValues = new string[] { "Daily", "Weekly", "Monthly", "Semi-Annually", "Quarterly", "Yearly" };

            IDataValidation validation2 = sheet.Range["O6"].DataValidation;
            validation2.ListOfValues = new string[] { "Weekly", "Monthly", "Yearly" };

            IDataValidation validation3 = sheet.Range["E28:E37"].DataValidation;
            sheet.Range["E28:E36"].Text = "Monthly";
            validation3.ListOfValues = new string[] { "Daily", "Weekly", "Monthly", "Semi-Annually", "Quarterly", "Yearly" };


            IDataValidation validation4 = sheet.Range["E40:E47"].DataValidation;
            sheet.Range["E40:E47"].Text = "Monthly";
            validation4.ListOfValues = new string[] { "Daily", "Weekly", "Monthly", "Semi-Annually", "Quarterly", "Yearly" };

            IDataValidation validation5 = sheet.Range["E51:E57"].DataValidation;
            sheet.Range["E51:E57"].Text = "Monthly";
            validation5.ListOfValues = new string[] { "Daily", "Weekly", "Monthly", "Semi-Annually", "Quarterly", "Yearly" };

            #endregion

            #region Formulas
            sheet.Range["G8"].Formula = "SUM(G9:G13)";
            sheet.Range["H8"].Formula = "SUM(H9:H13)";

            sheet.Range["G17"].Formula = "SUM(G18:G25)";
            sheet.Range["H17"].Formula = "SUM(H18:H25)";
            sheet.Range["G16"].Formula = "G17+G27+G39+G50+G59+G71";
            sheet.Range["h16"].Formula = "H17+H27+H39+H50+H59+H71";

            for (int i = 9; i <= 13; i++)
            {
                sheet.Range["G" + i].Formula = "F" + i + "*A" + i;
                sheet.Range["H" + i].Formula = "G" + i + "*12";
            }

            for (int i = 18; i <= 25; i++)
            {
                sheet.Range["G" + i].Formula = "F" + i + "*A" + i;
                sheet.Range["H" + i].Formula = "G" + i + "*12";
            }

            sheet.Range["G27"].Formula = "SUM(G28:G36)";
            sheet.Range["H27"].Formula = "SUM(H28:H37)";
            for (int i = 28; i <= 36; i++)
            {
                sheet.Range["G" + i].Formula = "F" + i + "*A" + i;
                sheet.Range["H" + i].Formula = "G" + i + "*12";
            }

            sheet.Range["G39"].Formula = "SUM(G40:G47)";
            sheet.Range["H39"].Formula = "SUM(H40:H47)";
            for (int i = 40; i <= 47; i++)
            {
                sheet.Range["G" + i].Formula = "F" + i + "*A" + i;
                sheet.Range["H" + i].Formula = "G" + i + "*12";
            }

            sheet.Range["G50"].Formula = "SUM(G51:G57)";
            sheet.Range["H50"].Formula = "SUM(H51:H57)";
            for (int i = 51; i <= 57; i++)
            {
                sheet.Range["G" + i].Formula = "F" + i + "*A" + i;
                sheet.Range["H" + i].Formula = "G" + i + "*12";
            }

            #endregion

            #region SummaryChart
            //Clustered Column Chart
            IChartShape chart = sheet.Charts.Add();

            //Set Chart Type
            chart.ChartType = ExcelChartType.Bar_Clustered;

            //Set DataRange. 

            chart.Series.Add("Expense");
            chart.Series[0].Values = workbook.Worksheets["Sheet1"].Range["N10"];
            chart.Series[0].DataPoints[0].DataLabels.IsValue = true;
            chart.Series[0].DataPoints[0].DataLabels.Size = 7f;

            chart.Series.Add("Income");
            chart.Series[1].Values = workbook.Worksheets["Sheet1"].Range["N9"];
            chart.Series[1].DataPoints[0].DataLabels.IsValue = true;
            chart.Series[1].DataPoints[0].DataLabels.Size = 7f;

            chart.Series.Add("Balance");
            chart.Series[2].Values = workbook.Worksheets["Sheet1"].Range["N8"];
            chart.Series[2].DataPoints[0].DataLabels.IsValue = true;
            chart.Series[2].DataPoints[0].DataLabels.Size = 7f;

            chart.PrimaryValueAxis.NumberFormat = "$#,##0";
            chart.PrimaryCategoryAxis.Visible = false;

            //Format Chart Area
            IChartFrameFormat chartArea = chart.ChartArea;

            //Style
            chartArea.Border.LinePattern = ExcelChartLinePattern.Solid;
            chartArea.Border.LineColor = Color.Gray;
            chartArea.Border.LineWeight = ExcelChartLineWeight.Medium;

            //Plot Area
            IChartFrameFormat chartPlotArea = chart.PlotArea;
            chartPlotArea.Border.LinePattern = ExcelChartLinePattern.Solid;
            chart.PlotArea.Border.LineColor = Color.Gray;

            chart.Legend.Position = ExcelLegendPosition.Bottom;

            //Embedded chart position.
            chart.TopRow = 7;
            chart.BottomRow = 22;
            chart.LeftColumn = 9;
            chart.RightColumn = 16;

            chart.ChartTitle = "Budget Summary";
            chart.ChartTitleArea.Bold = true;
            #endregion

            #region SpendingChart

            chart = sheet.Charts.Add();
            chart.ChartTitle = "Spending Summary";
            chart.ChartTitleArea.Bold = true;
            //Set Chart Type
            chart.ChartType = ExcelChartType.Pie_3D;

            //Set DataRange. 
            chart.DataRange = workbook.Worksheets["Sheet1"].Range["J9:K12"];
            chart.IsSeriesInRows = false;
            chart.Series[0].Values = workbook.Worksheets["Sheet1"].Range["K9:K12"];
            chart.Series[0].CategoryLabels = workbook.Worksheets["Sheet1"].Range["J9:J12"];
            chart.Series[0].Name = "Spending summary";

            chart.Series[0].DataPoints[0].DataLabels.IsValue = true;
            chart.Series[0].DataPoints[0].DataLabels.Size = 7f;

            chart.Series[0].DataPoints[1].DataLabels.IsValue = true;
            chart.Series[0].DataPoints[1].DataLabels.Size = 7f;

            chart.Series[0].DataPoints[2].DataLabels.IsValue = true;
            chart.Series[0].DataPoints[2].DataLabels.Size = 7f;

            chart.Series[0].DataPoints[3].DataLabels.IsValue = true;
            chart.Series[0].DataPoints[3].DataLabels.Size = 7f;

            chart.PrimaryValueAxis.NumberFormat = "$#,##0";

            //Format Chart Area
            chartArea = chart.ChartArea;

            //Style
            chartArea.Border.LinePattern = ExcelChartLinePattern.Solid;
            chartArea.Border.LineColor = Color.Gray;
            chartArea.Border.LineWeight = ExcelChartLineWeight.Medium;

            //Plot Area
            chartPlotArea = chart.PlotArea;
            chartPlotArea.Border.LinePattern = ExcelChartLinePattern.Solid;
            chart.PlotArea.Border.LineColor = Color.Gray;
            chartPlotArea.Fill.ForeColor = Color.FromArgb(223, 223, 223);

            chart.Legend.Position = ExcelLegendPosition.Bottom;

            //Embedded chart position.
            chart.TopRow = 25;
            chart.BottomRow = 42;
            chart.LeftColumn = 9;
            chart.RightColumn = 16;
            #endregion

            #region Sheet View
            workbook.Worksheets["Sheet1"].Visibility = WorksheetVisibility.Hidden;
            workbook.Worksheets[0].Activate();
            workbook.TabSheets[0].TabColor = ExcelKnownColors.Blue;
            workbook.TabSheets[1].TabColor = ExcelKnownColors.Blue;
            workbook.Worksheets[1].IsRowColumnHeadersVisible = false;

            sheet.InsertColumn(9);
            #endregion

            //Saving the workbook to disk.
            if (this.rBtnXls.Checked == true)
            {
                workbook.Version = ExcelVersion.Excel97to2003;
                workbook.SaveAs("Sample.xls", Response, ExcelDownloadType.PromptDialog);
            }
            else
            {
                workbook.Version = ExcelVersion.Excel2016;
                workbook.SaveAs("Sample.xlsx", Response, ExcelDownloadType.PromptDialog, ExcelHttpContentType.Excel2016);
            }           

            //Close the workbook.
            workbook.Close();
            excelEngine.Dispose();
        }
        # endregion
    }
}