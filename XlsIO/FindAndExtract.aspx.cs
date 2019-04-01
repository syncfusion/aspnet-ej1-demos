#region Copyright Syncfusion Inc. 2001 - 2019
// Copyright Syncfusion Inc. 2001 - 2019. All rights reserved.
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
using System.Globalization;

namespace WebSampleBrowser.XlsIO
{
    public partial class FindAndExtract : System.Web.UI.Page
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

            //Open an existing spreadsheet which will be used as a template for generating the new spreadsheet.
            //After opening, the workbook object represents the complete in-memory object model of the template spreadsheet.
            IWorkbook workbook = application.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath("FindAndExtract.xls", Request));

            //The first worksheet object in the worksheets collection is accessed.
            IWorksheet sheet = workbook.Worksheets[0];

            IRange result;

            try
            {
                #region Find and Extract Numbers
                if (lstFormat.SelectedItem.ToString() == "Number with format 0.00")
                {

                    result = sheet.FindFirst(1000000.00075, ExcelFindType.Number);

                    //Gets the cell display text
                    txtDisplay.Text = result.DisplayText.ToString();

                    //Gets the cell value
                    txtValue.Text = result.Value2.ToString();

                }

                if (lstFormat.SelectedItem.ToString() == "Number with format $#,##0.00")
                {

                    result = sheet.FindFirst(3.2, ExcelFindType.Number);

                    //Gets the cell display text
                    txtDisplay.Text = result.DisplayText.ToString();

                    //Gets the cell value
                    txtValue.Text = result.Value2.ToString();

                }

                #endregion

                #region Find and Extract DateTime
                if (lstFormat.SelectedItem.ToString() == "DateTime with format m/d/yy h:mm")
                {

                    result = sheet.FindFirst(DateTime.Parse("12/1/2007  1:23:00 AM", CultureInfo.InvariantCulture));

                    //Gets the cell display text
                    txtDisplay.Text = result.DisplayText.ToString();

                    //Gets the cell value
                    txtValue.Text = result.Value2.ToString();

                }

                if (lstFormat.SelectedItem.ToString() == "Time with format h:mm:ss AM/PM")
                {

                    result = sheet.FindFirst(DateTime.Parse("1/1/2007  2:23:00 AM", CultureInfo.InvariantCulture));

                    //Gets the cell display text
                    txtDisplay.Text = result.DisplayText.ToString();

                    //Gets the cell value
                    txtValue.Text = result.DateTime.ToString();

                }
                if (lstFormat.SelectedItem.ToString() == "Date with format d-mmm-yy")
                {

                    result = sheet.FindFirst(DateTime.Parse("12/4/2007  1:23:00 AM", CultureInfo.InvariantCulture));

                    //Gets the cell display text
                    txtDisplay.Text = result.DisplayText.ToString();

                    //Gets the cell value
                    txtValue.Text = result.Value2.ToString();

                }
                if (lstFormat.SelectedItem.ToString() == "Date with format Saturday, December 01, 2007")
                {

                    result = sheet.FindFirst(DateTime.Parse("8/1/2007  3:23:00 AM", CultureInfo.InvariantCulture));

                    //Gets the cell display text
                    txtDisplay.Text = result.DisplayText.ToString();

                    //Gets the cell value
                    txtValue.Text = result.Value2.ToString();

                }
                #endregion

                #region Find and Extract Text

                if (lstFormat.SelectedItem.ToString() == "Text")
                {

                    result = sheet.FindFirst("Simple text", ExcelFindType.Text);

                    //Gets the cell display text
                    txtDisplay.Text = result.DisplayText.ToString();

                    //Gets the cell value
                    txtValue.Text = result.Value2.ToString();

                }
                if (lstFormat.SelectedItem.ToString() == "Text With Styles and Patterns")
                {

                    result = sheet.FindFirst("Text with Styles and patterns", ExcelFindType.Text);

                    //Gets the cell display text
                    txtDisplay.Text = result.DisplayText.ToString();

                    //Gets the cell value
                    txtValue.Text = result.Value2.ToString();

                }
                if (lstFormat.SelectedItem.ToString() == "Number with Text Format")
                {

                    result = sheet.FindFirst("$8.200", ExcelFindType.Text);

                    //Gets the cell display text
                    txtDisplay.Text = result.DisplayText.ToString();

                    //Gets the cell value
                    txtValue.Text = result.Value2.ToString();

                }
                workbook.Close();
                excelEngine.Dispose();
                #endregion
            }
            catch (Exception)
            {
                Response.Write("<b>Please select an item from list box </b>");
            }
        }
        # endregion
    }
}