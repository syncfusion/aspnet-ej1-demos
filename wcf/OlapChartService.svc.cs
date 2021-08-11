#region Copyright Syncfusion Inc. 2001-2021
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using OLAPUTILS = Syncfusion.JavaScript.Olap;
using Syncfusion.Olap.Manager;
using Syncfusion.Olap.Reports;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.Text;
using System.Web.Script.Serialization;
using Syncfusion.JavaScript.Olap;
using System.Configuration;
using Syncfusion.JavaScript;


namespace WebSampleBrowser
{
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class OlapChartService : IOlapChartService
    {
        Syncfusion.JavaScript.PivotChart htmlHelper = new Syncfusion.JavaScript.PivotChart();
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        static int cultureIDInfoVal = 1033;
        string connectionString = ConfigurationManager.ConnectionStrings["Adventure Works"].ConnectionString + "Locale Identifier=" + cultureIDInfoVal + ";";


        public Dictionary<string, object> InitializeChart(string action, string customObject, string currentReport)
        {
            OlapDataManager DataManager = null;
            dynamic customData = serializer.Deserialize<dynamic>(customObject.ToString());
            var cultureIDInfo = new System.Globalization.CultureInfo(("en-US")).LCID;
            if (customData.ContainsKey("Language"))
            {
                cultureIDInfo = new System.Globalization.CultureInfo((customData["Language"])).LCID;
            }
            connectionString = connectionString.Replace("" + cultureIDInfoVal + "", "" + cultureIDInfo + "");
            cultureIDInfoVal = cultureIDInfo;
            DataManager = new OlapDataManager(connectionString);
            DataManager.Culture = new System.Globalization.CultureInfo((cultureIDInfo));
            if (customData != null && customData.ContainsKey("currentReport"))
                DataManager.SetCurrentReport(OLAPUTILS.Utils.DeserializeOlapReport(customData["currentReport"]));
            else if (currentReport != "" && currentReport != null)
                DataManager.SetCurrentReport(OLAPUTILS.Utils.DeserializeOlapReport(currentReport));
            else
                DataManager.SetCurrentReport(CreateOlapReport());
            return htmlHelper.GetJsonData(action, DataManager);
        }

        public Dictionary<string, object> DrillChart(string action, string drilledSeries, string olapReport,string customObject)
        {
            OlapDataManager DataManager = new OlapDataManager(connectionString);
            dynamic customData = serializer.Deserialize<dynamic>(customObject.ToString());
            if (customData is Dictionary<string, object> && customData.ContainsKey("Language"))
            {
                var cultureIDInfo = new System.Globalization.CultureInfo((customData["Language"])).LCID;
                connectionString = connectionString.Replace("" + cultureIDInfoVal + "", "" + cultureIDInfo + "");
                cultureIDInfoVal = cultureIDInfo;
                DataManager = new OlapDataManager(connectionString);
                DataManager.Culture = new System.Globalization.CultureInfo((customData["Language"]));
            }
            else
                DataManager = new OlapDataManager(connectionString);
            DataManager.SetCurrentReport(OLAPUTILS.Utils.DeserializeOlapReport(olapReport));
            return htmlHelper.GetJsonData(action, DataManager, drilledSeries);
        }

        public void Export(System.IO.Stream stream)
        {
            System.IO.StreamReader sReader = new System.IO.StreamReader(stream);
            string args = System.Web.HttpContext.Current.Server.UrlDecode(sReader.ReadToEnd()).Remove(0, 5);
            string fileName = "Sample";
            htmlHelper.ExportPivotChart(args, fileName, System.Web.HttpContext.Current.Response);
        }

        private OlapReport CreateOlapReport()
        {
            OlapReport olapReport = new OlapReport();
            olapReport.Name = "Default Report";
            olapReport.CurrentCubeName = "Adventure Works";

            DimensionElement dimensionElementColumn = new DimensionElement();
            //Specifying the Name for the Dimension Element
            dimensionElementColumn.Name = "Customer";
            dimensionElementColumn.AddLevel("Customer Geography", "Country");

            MeasureElements measureElementColumn = new MeasureElements();
            //Specifying the Name for the Measure Element
            measureElementColumn.Elements.Add(new MeasureElement { Name = "Customer Count" });

            DimensionElement dimensionElementRow = new DimensionElement();
            //Specifying the Dimension Name
            dimensionElementRow.Name = "Date";
            dimensionElementRow.AddLevel("Fiscal", "Fiscal Year");

            ///Adding Row Members
            olapReport.SeriesElements.Add(dimensionElementRow);
            ///Adding Column Members
            olapReport.CategoricalElements.Add(dimensionElementColumn);
            ///Adding Measure Element
            olapReport.CategoricalElements.Add(measureElementColumn);
            return olapReport;
        }
    }
}
