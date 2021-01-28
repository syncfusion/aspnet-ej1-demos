#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Syncfusion.XlsIO;
using System.Web.UI.HtmlControls;
using System.IO;

namespace WebSampleBrowser.XlsIO
{
    public partial class ExcelToJSON : System.Web.UI.Page
    {
		# region Page Load
		/// <summary>
        /// Handles the page load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            string[] convertOptions = { "Workbook", "Worksheet", "Range" };
            for (int i = 0; i < convertOptions.Length; i++)
            {
                ConvertList.Items.Add(convertOptions[i]);
            }
        }
		# endregion
       
	    # region Events

		/// <summary>
        /// Convert Excel to JSON
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button2_Click(object sender, EventArgs e)
        {
            // New instance of XlsIO is created.[Equivalent to launching Microsoft Excel with no workbooks open].
            // The instantiation process consists of two steps.

            // Step 1 : Instantiate the spreadsheet creation engine.
            ExcelEngine excelEngine = new ExcelEngine();

            // Step 2 : Instantiate the excel application object.
            IApplication application = excelEngine.Excel;

            // An existing workbook is opened.
            IWorkbook workbook = application.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath("ExcelToJSON.xlsx", Request));

            // The first worksheet object in the worksheets collection is accessed.
            IWorksheet sheet = workbook.Worksheets[0];
            IRange range = sheet.Range["A2:B10"];

            bool isSchema = Check1.Checked;

            string fileName = "ExcelToJSON.json";

            if (ConvertList.SelectedIndex == 0)
                workbook.SaveAsJson(Server.MapPath(fileName), isSchema);
            else if (ConvertList.SelectedIndex == 1)
                workbook.SaveAsJson(Server.MapPath(fileName), sheet, isSchema);
            else if (ConvertList.SelectedIndex == 2)
                workbook.SaveAsJson(Server.MapPath(fileName), range, isSchema);

            workbook.Close();
            excelEngine.Dispose();

            FileStream input = new FileStream(Server.MapPath(fileName), FileMode.Open, FileAccess.ReadWrite);
            input.CopyTo(Response.OutputStream);
            Response.ContentType = "text/json";
            Response.AppendHeader("Content-Disposition", "attachment; filename=ExcelToJSON.json");
            input.Close();
            Response.Flush();
            Response.End();            
        }

        /// <summary>
        /// Open input spreadsheet
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            FileStream input = new FileStream(XlsIOHelper.ResolveApplicationDataPath("ExcelToJSON.xlsx", Request), FileMode.Open, FileAccess.ReadWrite);
            input.CopyTo(Response.OutputStream);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AppendHeader("Content-Disposition", "attachment; filename=ExcelToJSON.xlsx");
            input.Close();
            Response.Flush();
            Response.End();
        }
        #endregion
    }
}