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
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Syncfusion.XlsIO;
using System.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls.WebParts;
using System.Globalization;

namespace WebSampleBrowser.XlsIO
{
    public partial class AutoShapes : System.Web.UI.Page
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
        /// Creates spreadsheet
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
            application.DefaultVersion = ExcelVersion.Excel2016;
            
            IWorkbook workbook = application.Workbooks.Create(1);
            //The first worksheet object in the worksheets collection is accessed.
            IWorksheet worksheet = workbook.Worksheets[0];

            #region AddAutoShapes
            IShape shape;
            string text;

            IFont font = workbook.CreateFont();
            font.Color = ExcelKnownColors.White;
            font.Italic = true;
            font.Size = 12;


            IFont font2 = workbook.CreateFont();
            font2.Color = ExcelKnownColors.Black;
            font2.Size = 15;
            font2.Italic = true;
            font2.Bold = true;

            text = "Requirement";
            shape = worksheet.Shapes.AddAutoShapes(AutoShapeType.RoundedRectangle, 2, 7, 60, 192);
            shape.TextFrame.TextRange.Text = text;
            shape.TextFrame.TextRange.RichText.SetFont(0, text.Length - 1, font);
            shape.TextFrame.TextRange.RichText.SetFont(0, 0, font2);
            shape.Fill.ForeColorIndex = ExcelKnownColors.Light_blue;
            shape.Line.Visible = false;
            shape.TextFrame.VerticalAlignment = ExcelVerticalAlignment.MiddleCentered;

            shape = worksheet.Shapes.AddAutoShapes(AutoShapeType.DownArrow, 5, 8, 40, 64);
            shape.Fill.ForeColorIndex = ExcelKnownColors.White;
            shape.Line.ForeColorIndex = ExcelKnownColors.Blue;
            shape.Line.Weight = 1;

            text = "Design";
            shape = worksheet.Shapes.AddAutoShapes(AutoShapeType.RoundedRectangle, 7, 7, 60, 192);
            shape.TextFrame.TextRange.Text = text;
            shape.TextFrame.TextRange.RichText.SetFont(0, text.Length - 1, font);
            shape.TextFrame.TextRange.RichText.SetFont(0, 0, font2);
            shape.Line.Visible = false;
            shape.Fill.ForeColorIndex = ExcelKnownColors.Light_orange;
            shape.TextFrame.VerticalAlignment = ExcelVerticalAlignment.MiddleCentered;


            shape = worksheet.Shapes.AddAutoShapes(AutoShapeType.DownArrow, 10, 8, 40, 64);
            shape.Fill.ForeColorIndex = ExcelKnownColors.White;
            shape.Line.ForeColorIndex = ExcelKnownColors.Blue;
            shape.Line.Weight = 1;

            text = "Execution";
            shape = worksheet.Shapes.AddAutoShapes(AutoShapeType.RoundedRectangle, 12, 7, 60, 192);
            shape.TextFrame.TextRange.Text = text;
            shape.TextFrame.TextRange.RichText.SetFont(0, text.Length - 1, font);
            shape.TextFrame.TextRange.RichText.SetFont(0, 0, font2);
            shape.Line.Visible = false;
            shape.Fill.ForeColorIndex = ExcelKnownColors.Blue;
            shape.TextFrame.VerticalAlignment = ExcelVerticalAlignment.MiddleCentered;

            shape = worksheet.Shapes.AddAutoShapes(AutoShapeType.DownArrow, 15, 8, 40, 64);
            shape.Fill.ForeColorIndex = ExcelKnownColors.White;
            shape.Line.ForeColorIndex = ExcelKnownColors.Blue;
            shape.Line.Weight = 1;

            text = "Testing";
            shape = worksheet.Shapes.AddAutoShapes(AutoShapeType.RoundedRectangle, 17, 7, 60, 192);
            shape.TextFrame.TextRange.Text = text;
            shape.TextFrame.TextRange.RichText.SetFont(0, text.Length - 1, font);
            shape.TextFrame.TextRange.RichText.SetFont(0, 0, font2);
            shape.Line.Visible = false;
            shape.Fill.ForeColorIndex = ExcelKnownColors.Green;
            shape.TextFrame.VerticalAlignment = ExcelVerticalAlignment.MiddleCentered;

            shape = worksheet.Shapes.AddAutoShapes(AutoShapeType.DownArrow, 20, 8, 40, 64);
            shape.Fill.ForeColorIndex = ExcelKnownColors.White;
            shape.Line.ForeColorIndex = ExcelKnownColors.Blue;
            shape.Line.Weight = 1;

            text = "Release";
            shape = worksheet.Shapes.AddAutoShapes(AutoShapeType.RoundedRectangle, 22, 7, 60, 192);
            shape.TextFrame.TextRange.Text = text;
            shape.TextFrame.TextRange.RichText.SetFont(0, text.Length - 1, font);
            shape.TextFrame.TextRange.RichText.SetFont(0, 0, font2);
            shape.Line.Visible = false;
            shape.Fill.ForeColorIndex = ExcelKnownColors.Lavender;
            shape.TextFrame.VerticalAlignment = ExcelVerticalAlignment.MiddleCentered;
            #endregion

            //Saving the workbook to disk.
            workbook.SaveAs("AutoShapes.xlsx", Response, ExcelDownloadType.PromptDialog, ExcelHttpContentType.Excel2016);
            workbook.Close();
            excelEngine.Dispose();
        }
        # endregion
    }
}