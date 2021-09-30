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
        System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer() { MaxJsonLength = Int32.MaxValue };

        protected void PivotChart_ServerExcelExporting(object sender, Syncfusion.JavaScript.Web.PivotChartEventArgs e)
        {
            PivotChartExcelExport pivotChartExcelExport = new PivotChartExcelExport();
            dynamic args = e.Arguments;
            Dictionary<string, string> chartParams = serializer.Deserialize<Dictionary<string, string>>(args["args"].ToString());
            pivotChartExcelExport.ExportToExcel(chartParams);
        }

        protected void PivotChart_ServerWordExporting(object sender, Syncfusion.JavaScript.Web.PivotChartEventArgs e)
        {
            PivotChartWordExport pivotChartWordExport = new PivotChartWordExport();
            dynamic args = e.Arguments;
            Dictionary<string, string> chartParams = serializer.Deserialize<Dictionary<string, string>>(args["args"].ToString());
            pivotChartWordExport.ExportToWord(chartParams);
        }

        protected void PivotChart_ServerPDFExporting(object sender, Syncfusion.JavaScript.Web.PivotChartEventArgs e)
        {
            PivotChartPDFExport pivotChartPDFExport = new PivotChartPDFExport();
            dynamic args = e.Arguments;
            Dictionary<string, string> chartParams = serializer.Deserialize<Dictionary<string, string>>(args["args"].ToString());
            pivotChartPDFExport.ExportToPDF(chartParams);
        }

        protected void PivotChart_ServerImageExporting(object sender, Syncfusion.JavaScript.Web.PivotChartEventArgs e)
        {
            PivotChartImageExport pivotChartImageExport = new PivotChartImageExport();
            dynamic args = e.Arguments;
            Dictionary<string, string> chartParams = serializer.Deserialize<Dictionary<string, string>>(args["args"].ToString());
            pivotChartImageExport.ExportToImage(chartParams);
        }
    }
}