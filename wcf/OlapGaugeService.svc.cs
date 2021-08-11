#region Copyright Syncfusion Inc. 2001-2021
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.JavaScript;
using Syncfusion.Olap.Manager;
using Syncfusion.Olap.Reports;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.Text;
using System.Web.Script.Serialization;

namespace WebSampleBrowser
{
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class OlapGaugeService : IOlapGaugeService
    {
        PivotGauge htmlHelper = new PivotGauge();
        int cultureIDInfoVal = 1033;
        string connectionString = ConfigurationManager.ConnectionStrings["Adventure Works"].ConnectionString + "Locale Identifier=1033";
        JavaScriptSerializer serializer = new JavaScriptSerializer();

        public Dictionary<string, object> InitializeGauge(string action, string customObject)
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
            DataManager.SetCurrentReport(CreateOlapReport());
            return htmlHelper.GetJsonData(action, DataManager);
        }

        private OlapReport CreateOlapReport()
        {
            OlapReport report = new OlapReport();
            report.CurrentCubeName = "Adventure Works";

            KpiElements kpiElement = new KpiElements();
            kpiElement.Elements.Add(new KpiElement { Name = "Revenue", ShowKPIGoal = true, ShowKPIStatus = true, ShowKPIValue = true, ShowKPITrend = true });

            DimensionElement dimensionElement1 = new DimensionElement();
            DimensionElement dimensionElement2 = new DimensionElement();
            DimensionElement dimensionElement3 = new DimensionElement();

            MeasureElements measureElement = new MeasureElements();
            measureElement.Elements.Add(new MeasureElement { UniqueName = "[Measures].[Customer Count]" });

            dimensionElement1.Name = "Date";
            dimensionElement1.AddLevel("Fiscal Year", "Fiscal Year");
            dimensionElement1.Hierarchy.LevelElements["Fiscal Year"].Add("FY 2004");
            dimensionElement1.Hierarchy.LevelElements["Fiscal Year"].IncludeAvailableMembers = true;

            dimensionElement2.Name = "Sales Channel";
            dimensionElement2.AddLevel("Sales Channel", "Sales Channel");
            dimensionElement2.Hierarchy.LevelElements["Sales Channel"].Add("Reseller");
            dimensionElement2.Hierarchy.LevelElements["Sales Channel"].IncludeAvailableMembers = true;

            dimensionElement3.Name = "Product";
            dimensionElement3.AddLevel("Product Model Lines", "Product Line");

            report.CategoricalElements.Add(new Item { ElementValue = dimensionElement2 });
            report.CategoricalElements.Add(new Item { ElementValue = dimensionElement1 });
            report.CategoricalElements.Add(new Item { ElementValue = kpiElement });
            report.SeriesElements.Add(new Item { ElementValue = dimensionElement3 });
            return report;
        }
    }
}
