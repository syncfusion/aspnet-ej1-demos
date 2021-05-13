#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.EJ.Export;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser
{
    public partial class Exporting : System.Web.UI.Page
    {
        protected void PivotGrid_ServerExcelExporting(object sender, Syncfusion.JavaScript.Web.PivotGridEventArgs e)
        {
            PivotGridExcelExport pGrid = new PivotGridExcelExport();
            dynamic args = e.Arguments;
            string fileName = "Sample";
            pGrid.ExportToExcel(fileName, args["args"].ToString(), HttpContext.Current.Response);
        }

        protected void PivotGrid_ServerPDFExporting(object sender, Syncfusion.JavaScript.Web.PivotGridEventArgs e)
        {
            PivotGridPDFExport pGrid = new PivotGridPDFExport();
            dynamic args = e.Arguments;
            string fileName = "Sample";
            pGrid.ExportToPDF(fileName, args["args"].ToString(), HttpContext.Current.Response);
        }

        protected void PivotGrid_ServerCSVExporting(object sender, Syncfusion.JavaScript.Web.PivotGridEventArgs e)
        {
            PivotGridCSVExport pGrid = new PivotGridCSVExport();
            dynamic args = e.Arguments;
            string fileName = "Sample";
            pGrid.ExportToCSV(fileName, args["args"].ToString(), HttpContext.Current.Response);
        }

        protected void PivotGrid_ServerWordExporting(object sender, Syncfusion.JavaScript.Web.PivotGridEventArgs e)
        {
            PivotGridWordExport pGrid = new PivotGridWordExport();
            dynamic args = e.Arguments;
            string fileName = "Sample";
            pGrid.ExportToWord(fileName, args["args"].ToString(), HttpContext.Current.Response);
        }
    }
}