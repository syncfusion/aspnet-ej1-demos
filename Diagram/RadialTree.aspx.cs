#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.JavaScript.DataVisualization.DiagramEnums;
using Syncfusion.JavaScript.DataVisualization.Models.Collections;
using Syncfusion.JavaScript.DataVisualization.Models.Diagram;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using Label = Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label;

namespace WebSampleBrowser.Diagram
{
    public partial class RadialTree : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RadialChart.Model.DataSourceSettings.DataSource = GetOrgChartData();
                RadialChart.Model.DataSourceSettings.Parent = "ReportingPerson";
                RadialChart.Model.DataSourceSettings.Id = "Id";
                RadialChart.Model.DefaultSettings.Node = new ImageNode() { Width = 50, Height = 50, BorderColor = "transparent", 
                    BorderWidth = 0, Constraints = NodeConstraints.InheritTooltip | NodeConstraints.PointerEvents
                };
                RadialChart.Model.DefaultSettings.Connector = new Connector() { Constraints = ConnectorConstraints.None };
                RadialChart.Model.NodeTemplate = "nodeTemplate";
                RadialChart.Model.Tooltip = new Syncfusion.JavaScript.DataVisualization.Models.Diagram.Tooltip() { TemplateId = "mouseovertoolTipId" };
                RadialChart.Model.Constraints = DiagramConstraints.Default &~ DiagramConstraints.PageEditable;
            }
        }
        public Array GetOrgChartData()
        {
            string allText = System.IO.File.ReadAllText(Server.MapPath("~/App_Data/RadialData.json"));
            Dictionary<string, object> requestArgs = (Dictionary<string, object>)new JavaScriptSerializer().DeserializeObject(allText);
            requestArgs = (Dictionary<string, object>)requestArgs["root"];
            return (Array)requestArgs.Values.ElementAt(0);
        }
    }
}