using Syncfusion.EJ.Export;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.PivotGrid
{
    public partial class ConditionalFormatting : System.Web.UI.Page
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

        protected void PivotGrid_ServerWordExporting(object sender, Syncfusion.JavaScript.Web.PivotGridEventArgs e)
        {
            PivotGridWordExport pGrid = new PivotGridWordExport();
            dynamic args = e.Arguments;
            string fileName = "Sample";
            pGrid.ExportToWord(fileName, args["args"].ToString(), HttpContext.Current.Response);
        }
    }
}