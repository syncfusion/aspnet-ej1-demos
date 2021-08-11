#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.JavaScript;
using Syncfusion.PivotAnalysis.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.Text;
using System.Web.Script.Serialization;

namespace WebSampleBrowser
{
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class RelationalChartService : IRelationalChartService
    {
        Syncfusion.JavaScript.PivotChart PivotChart = new Syncfusion.JavaScript.PivotChart();
        JavaScriptSerializer serializer = new JavaScriptSerializer();

        public Dictionary<string, object> InitializeChart(string action, string currentReport, string customObject)
        {
            this.BindData();
            return PivotChart.GetJsonData(action, ProductSales.GetSalesData());
        }

        public Dictionary<string, object> DrillChart(string action, string drilledSeries)
        {
            this.BindData();
            return PivotChart.GetJsonData(action, ProductSales.GetSalesData(), drilledSeries);
        }

        public void Export(System.IO.Stream stream)
        {
            System.IO.StreamReader sReader = new System.IO.StreamReader(stream);
            string args = System.Web.HttpContext.Current.Server.UrlDecode(sReader.ReadToEnd()).Remove(0, 5);
            string fileName = "Sample";
            PivotChart.ExportPivotChart(args, fileName, System.Web.HttpContext.Current.Response);
        }

        private void BindData()
        {
            this.PivotChart.PivotEngine.PivotRows.Add(new PivotItem { FieldMappingName = "Country", FieldHeader = "Country", TotalHeader = "Total", ShowSubTotal = false });
            this.PivotChart.PivotEngine.PivotRows.Add(new PivotItem { FieldMappingName = "State", FieldHeader = "State", TotalHeader = "Total" });
            this.PivotChart.PivotEngine.PivotRows.Add(new PivotItem { FieldMappingName = "Date", FieldHeader = "Date", TotalHeader = "Total" });
            this.PivotChart.PivotEngine.PivotColumns.Add(new PivotItem { FieldMappingName = "Product", FieldHeader = "Product", TotalHeader = "Total", ShowSubTotal = false });
            this.PivotChart.PivotEngine.PivotCalculations.Add(new PivotComputationInfo { CalculationName = "Amount", Description = "Amount", FieldHeader = "Amount", FieldName = "Amount", Format = "C", SummaryType = Syncfusion.PivotAnalysis.Base.SummaryType.DoubleTotalSum });
        }
    }
}
