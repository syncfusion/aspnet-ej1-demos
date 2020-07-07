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
using System.Drawing;

namespace WebSampleBrowser.XlsIO
{
    public partial class ConditionalFormatting : System.Web.UI.Page
    {
        # region Page Load
        /// <summary>
        /// Handles the page load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        # endregion

        # region Events
        /// <summary>
        /// Creates spreadsheet with visualizations.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            //New instance of XlsIO is created.[Equivalent to launching Microsoft Excel with no workbooks open].
            //The instantiation process consists of two steps.

            //Step 1 : Instantiate the spreadsheet creation engine.
            ExcelEngine excelEngine = new ExcelEngine();
            //Step 2 : Instantiate the excel application object.
            IApplication application = excelEngine.Excel;
            string OutputFileName = "";

            //Open an existing Excel 2007 file
            IWorkbook workbook = null;

            //The first worksheet object in the worksheets collection is accessed.
            IWorksheet sheet = null;

            //Set the file format as Xls
            if (this.rBtnXls.Checked)
            {
                workbook = application.Workbooks.Create(3);
                sheet = workbook.Worksheets[0];
                workbook.Version = ExcelVersion.Excel97to2003;
                OutputFileName = "AdvancedCF.xls";
            }
            //Set the file format as Xlsx           
            else 
            {
                workbook = excelEngine.Excel.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath("CFTemplate.xlsx", Request));
                sheet = workbook.Worksheets[0];
                workbook.Version = ExcelVersion.Excel2016;
                OutputFileName = "AdvancedCF.xlsx";
            }
            if (!(this.rBtnXls.Checked))
            {
                #region Databar
                //Add condition for the range
                IConditionalFormats formats = sheet.Range["C7:C46"].ConditionalFormats;
                IConditionalFormat format = formats.AddCondition();

                //Set Data bar and icon set for the same cell
                //Set the format type
                format.FormatType = ExcelCFType.DataBar;
                IDataBar dataBar = format.DataBar;

                //Set the constraint
                dataBar.MinPoint.Type = ConditionValueType.LowestValue;
                dataBar.MinPoint.Value = "0";
                dataBar.MaxPoint.Type = ConditionValueType.HighestValue;
                dataBar.MaxPoint.Value = "0";

                //Set color for Bar
                dataBar.BarColor = Color.FromArgb(156, 208, 243);

                //Hide the value in data bar
                dataBar.ShowValue = false;
                #endregion

                #region Iconset
                //Add another condition in the same range
                format = formats.AddCondition();

                //Set Icon format type
                format.FormatType = ExcelCFType.IconSet;
                IIconSet iconSet = format.IconSet;
                iconSet.IconSet = ExcelIconSetType.FourRating;
                iconSet.IconCriteria[0].Type = ConditionValueType.LowestValue;
                iconSet.IconCriteria[0].Value = "0";
                iconSet.IconCriteria[1].Type = ConditionValueType.HighestValue;
                iconSet.IconCriteria[1].Value = "0";
                iconSet.ShowIconOnly = true;

                //Sets Icon sets for another range
                formats = sheet.Range["E7:E46"].ConditionalFormats;
                format = formats.AddCondition();
                format.FormatType = ExcelCFType.IconSet;
                iconSet = format.IconSet;
                iconSet.IconSet = ExcelIconSetType.ThreeSymbols;
                iconSet.IconCriteria[0].Type = ConditionValueType.LowestValue;
                iconSet.IconCriteria[0].Value = "0";
                iconSet.IconCriteria[1].Type = ConditionValueType.HighestValue;
                iconSet.IconCriteria[1].Value = "0";
                iconSet.ShowIconOnly = true;
                #endregion

                #region Databar Negative value settings
                //Add condition for the range
                IConditionalFormats conditionalFormats1 = sheet.Range["E7:E46"].ConditionalFormats;
                IConditionalFormat conditionalFormat1 = conditionalFormats1.AddCondition();

                //Set Data bar and icon set for the same cell
                //Set the conditionalFormat type
                conditionalFormat1.FormatType = ExcelCFType.DataBar;
                IDataBar dataBar1 = conditionalFormat1.DataBar;

                //Set the constraint
                dataBar1.BarColor = Color.YellowGreen;
                dataBar1.NegativeFillColor = Color.Pink;
                dataBar1.NegativeBorderColor = Color.WhiteSmoke;
                dataBar1.BarAxisColor = Color.Yellow;
                dataBar1.BorderColor = Color.WhiteSmoke;
                dataBar1.DataBarDirection = DataBarDirection.context;
                dataBar1.DataBarAxisPosition = DataBarAxisPosition.middle;
                dataBar1.HasGradientFill = true;

                //Hide the value in data bar
                dataBar1.ShowValue = false;
                #endregion

                #region Duplicate
                formats = sheet.Range["D7:D46"].ConditionalFormats;
                format = formats.AddCondition();
                format.FormatType = ExcelCFType.Duplicate;

                format.BackColorRGB = Color.FromArgb(255, 199, 206);
                #endregion
				
				#region TopBottom and AboveBelowAverage
                sheet = workbook.Worksheets[1];
                formats = sheet.Range["N6:N35"].ConditionalFormats;
                format = formats.AddCondition();
                format.FormatType = ExcelCFType.TopBottom;
                format.TopBottom.Type = ExcelCFTopBottomType.Bottom;

                format.BackColorRGB = Color.FromArgb(51, 153, 102);

                formats = sheet.Range["M6:M35"].ConditionalFormats;
                format = formats.AddCondition();
                format.FormatType = ExcelCFType.AboveBelowAverage;
                format.AboveBelowAverage.AverageType = ExcelCFAverageType.Below;
 
                format.FontColorRGB = Color.FromArgb(255, 255, 255);
                format.BackColorRGB = Color.FromArgb(166, 59, 38);
                #endregion
            }
            else
            {
                sheet.IsGridLinesVisible = false;
                sheet.Range["D2"].Text = "Conditional Formatting";
                sheet.Range["D2:E2"].Merge();
                sheet.Range["D2"].CellStyle.HorizontalAlignment = ExcelHAlign.HAlignCenter;
                sheet.Range["D2"].CellStyle.Font.Bold = true;
                sheet.Range["D2"].CellStyle.Font.Size = 14;


                //Applying conditional formatting to "E5" for format type as CellValue( Between)
                IConditionalFormats condition = sheet.Range["E5"].ConditionalFormats;
                sheet.Range["E5"].CellStyle.Borders.LineStyle = ExcelLineStyle.Medium;
                sheet.Range["E5"].CellStyle.Borders[ExcelBordersIndex.DiagonalDown].ShowDiagonalLine = false;
                sheet.Range["E5"].CellStyle.Borders[ExcelBordersIndex.DiagonalUp].ShowDiagonalLine = false;
                sheet.Range["E5"].AddComment().Text = "Entering a Number between 10 to 20 will set the backcolor for the cell";

                //Adding formats to IConditionalFormats collection
                IConditionalFormat condition1 = condition.AddCondition();
                sheet.Range["D5"].Text = "Enter a Number between 10 to 20";
                condition1.FirstFormula = "10";
                condition1.SecondFormula = "20";
                //Setting format properties.
                condition1.Operator = ExcelComparisonOperator.Between;
                condition1.FormatType = ExcelCFType.CellValue;
                condition1.BackColorRGB = Color.FromArgb(238, 122, 3);
                condition1.IsBold = true;
                condition1.IsItalic = true;

                //Applying conditional formatting to "E8" for format type as CellValue( Equal)
                IConditionalFormats condition2 = sheet.Range["E8"].ConditionalFormats;
                sheet.Range["E8"].CellStyle.Borders.LineStyle = ExcelLineStyle.Medium;
                sheet.Range["E8"].CellStyle.Borders[ExcelBordersIndex.DiagonalDown].ShowDiagonalLine = false;
                sheet.Range["E8"].CellStyle.Borders[ExcelBordersIndex.DiagonalUp].ShowDiagonalLine = false;
                sheet.Range["E8"].AddComment().Text = "Entering a Number as 1000 will set the highlight the number with Red color";

                //Adding formats to IConditionalFormats collection
                IConditionalFormat condition3 = condition2.AddCondition();
                sheet.Range["D8"].Text = "Enter the Number as 1000";

                //Setting format properties.
                condition3.FormatType = ExcelCFType.CellValue;
                condition3.Operator = ExcelComparisonOperator.Equal;
                condition3.FirstFormula = "1000";
                condition3.FontColorRGB = Color.FromArgb(0xde, 0x64, 0x13);

                //Applying conditional formatting to "E11" for format type as CellValue( Not between)
                IConditionalFormats condition4 = sheet.Range["E11"].ConditionalFormats;
                sheet.Range["E11"].CellStyle.Borders.LineStyle = ExcelLineStyle.Medium;
                sheet.Range["E11"].CellStyle.Borders[ExcelBordersIndex.DiagonalDown].ShowDiagonalLine = false;
                sheet.Range["E11"].CellStyle.Borders[ExcelBordersIndex.DiagonalUp].ShowDiagonalLine = false;
                sheet.Range["E11"].AddComment().Text = "Entering a Number which is not between 100 to 200 will retain the pattern";

                //Adding formats to IConditionalFormats collection
                IConditionalFormat condition5 = condition4.AddCondition();
                sheet.Range["D11"].Text = "Enter a Number not between 100 to 200";
                //Setting format properties
                condition5.FormatType = ExcelCFType.CellValue;
                condition5.Operator = ExcelComparisonOperator.NotBetween;
                condition5.FirstFormula = "100";
                condition5.SecondFormula = "200";
                condition5.FillPattern = ExcelPattern.DarkVertical;

                //Applying conditional formatting to "E14" for format type as CellValue( LessOrEqual)
                IConditionalFormats condition6 = sheet.Range["E14"].ConditionalFormats;
                sheet.Range["E14"].CellStyle.Borders.LineStyle = ExcelLineStyle.Medium;
                sheet.Range["E14"].CellStyle.Borders[ExcelBordersIndex.DiagonalDown].ShowDiagonalLine = false;
                sheet.Range["E14"].CellStyle.Borders[ExcelBordersIndex.DiagonalUp].ShowDiagonalLine = false;
                sheet.Range["E14"].AddComment().Text = "Entering a Number which is less than or equal to 1000 will retain the pattern";

                //Adding formats to IConditionalFormats collection
                IConditionalFormat condition7 = condition6.AddCondition();
                sheet.Range["D14"].Text = "Enter a Number which is less than or equal to 1000";
                //Setting format properties.
                condition7.FormatType = ExcelCFType.CellValue;
                condition7.Operator = ExcelComparisonOperator.LessOrEqual;
                condition7.FirstFormula = "1000";
                condition7.BackColorRGB = Color.FromArgb(204, 212, 230);

                //Applying conditional formatting to "E17" for format type as CellValue( NotEqual)
                IConditionalFormats condition8 = sheet.Range["E17"].ConditionalFormats;
                sheet.Range["E17"].CellStyle.Borders.LineStyle = ExcelLineStyle.Medium;
                sheet.Range["E17"].CellStyle.Borders[ExcelBordersIndex.DiagonalDown].ShowDiagonalLine = false;
                sheet.Range["E17"].CellStyle.Borders[ExcelBordersIndex.DiagonalUp].ShowDiagonalLine = false;
                sheet.Range["E17"].AddComment().Text = "Entering a Number which is not equal to 1000 will retain the pattern";

                //Adding formats to IConditionalFormats collection
                IConditionalFormat condition9 = condition8.AddCondition();
                sheet.Range["D17"].Text = "Enter a Number which is not equal to 1000";
                //Setting format properties.
                condition9.FormatType = ExcelCFType.CellValue;
                condition9.Operator = ExcelComparisonOperator.NotEqual;
                condition9.FirstFormula = "1000";
                condition9.BackColorRGB = Color.ForestGreen;


                sheet.UsedRange.AutofitColumns();
            }

            if(this.rBtnXls.Checked)
                workbook.SaveAs(OutputFileName, ExcelSaveType.SaveAsXLS, Response, ExcelDownloadType.PromptDialog);
            else
                workbook.SaveAs(OutputFileName, Response, ExcelDownloadType.PromptDialog, ExcelHttpContentType.Excel2016);

            workbook.Close();
            excelEngine.ThrowNotSavedOnDestroy = true;
            excelEngine.Dispose();
        }
        # endregion
    }
}