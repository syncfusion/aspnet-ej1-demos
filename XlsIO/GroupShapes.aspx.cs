#region Copyright Syncfusion Inc. 2001 - 2018
// Copyright Syncfusion Inc. 2001 - 2018. All rights reserved.
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
using System.Drawing.Imaging;
using Syncfusion.XlsIO.Implementation;

namespace WebSampleBrowser.XlsIO
{
    public partial class GroupShapes : System.Web.UI.Page
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
            // New instance of XlsIO is created.[Equivalent to launching Microsoft Excel with no workbooks open].
            // The instantiation process consists of two steps.

            // Step 1 : Instantiate the spreadsheet creation engine.
            ExcelEngine excelEngine = new ExcelEngine();

            // Step 2 : Instantiate the excel application object.
            IApplication application = excelEngine.Excel;

            // An existing workbook is opened.
            IWorkbook workbook = application.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath("GroupShapes.xlsx", Request));

            // The first worksheet object in the worksheets collection is accessed.
            IWorksheet worksheet = workbook.Worksheets[0];

            if (this.groupRBtn.Checked)
            {
                worksheet = workbook.Worksheets[0];
                IShapes shapes = worksheet.Shapes;

                IShape[] groupItems;
                for (int i = 0; i < shapes.Count; i++)
                {
                    if (shapes[i].Name == "Development" || shapes[i].Name == "Production" || shapes[i].Name == "Sales")
                    {
                        groupItems = new IShape[] { shapes[i], shapes[i + 1], shapes[i + 2], shapes[i + 3], shapes[i + 4], shapes[i + 5] };
                        shapes.Group(groupItems);
                        i = -1;
                    }
                }

                groupItems = new IShape[] { shapes[0], shapes[1], shapes[2], shapes[3], shapes[4], shapes[5], shapes[6] };
                shapes.Group(groupItems);

                workbook.SaveAs("GroupShapes.xlsx", ExcelSaveType.SaveAsXLS, Response, ExcelDownloadType.PromptDialog);
            }
            else if(ungroupRBtnAll.Checked)
            {
                worksheet = workbook.Worksheets[1];
                IShapes shapes = worksheet.Shapes;
                shapes.Ungroup(shapes[0] as IGroupShape, true);
                worksheet.Activate();
                workbook.SaveAs("UngroupShape.xlsx", ExcelSaveType.SaveAsXLS, Response, ExcelDownloadType.PromptDialog);
            }
            else if(ungroupRBtn.Checked)
            {
                worksheet = workbook.Worksheets[1];
                IShapes shapes = worksheet.Shapes;
                shapes.Ungroup(shapes[0] as IGroupShape);
                worksheet.Activate();
                workbook.SaveAs("UngroupShape.xlsx", ExcelSaveType.SaveAsXLS, Response, ExcelDownloadType.PromptDialog);
            }

            //Close the workbook.
            workbook.Close();
            excelEngine.Dispose();
        }

        # endregion

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Step 1 : Instantiate the spreadsheet creation engine.
            ExcelEngine excelEngine = new ExcelEngine();
            //Step 2 : Instantiate the excel application object.
            IApplication application = excelEngine.Excel;
            //A new workbook is created.[Equivalent to creating a new workbook in Microsoft Excel]
            //The new workbook will have 2 worksheets
            IWorkbook workbook = application.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath("GroupShapes.xlsx", Request));
            workbook.Version = ExcelVersion.Excel97to2003;
            workbook.SaveAs("GroupShapes.xlsx", Response, ExcelDownloadType.PromptDialog);
        }
    }
}