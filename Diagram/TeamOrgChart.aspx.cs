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
    public partial class TeamOrgChart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TeamChart.Model.DataSourceSettings.DataSource = GetOrgChartData();
                TeamChart.Model.DataSourceSettings.Parent = "ReportingPerson";
                TeamChart.Model.DataSourceSettings.Id = "Id";
                TeamChart.Model.DefaultSettings.Node = new ImageNode() { Width = 140, Height = 50, BorderColor = "transparent", BorderWidth = 0 };
                Label label = new Label() { Name = "label1", Text = "", HorizontalAlignment = HorizontalAlignment.Left, VerticalAlignment = VerticalAlignment.Top, FontSize = 11, Bold = true, FontFamily = "Segoe UI", Margin = new LabelMargin(-17, -17, 0, 0) };
                Label label1 = new Label() { Name = "label2", Text = "", HorizontalAlignment = HorizontalAlignment.Left, VerticalAlignment = VerticalAlignment.Top, FontSize = 10, FontFamily = "Segoe UI", Margin = new LabelMargin(-2, -17, 0, 0) };
                TeamChart.Model.DefaultSettings.Node.Labels.Add(label);
                TeamChart.Model.DefaultSettings.Node.Labels.Add(label1);
                TeamChart.Model.DefaultSettings.Connector = new Connector()
                {
                    Segments = new Collection() { new Segment(Segments.Orthogonal) },
                    TargetDecorator = new Decorator() { Shape = DecoratorShapes.None },
                    Constraints = ConnectorConstraints.None
                };
                TeamChart.Model.NodeTemplate = "nodeTemplate";
            }
        }
        public Array GetOrgChartData()
        {
            string allText = System.IO.File.ReadAllText(Server.MapPath("~/App_Data/OrgChart.json"));
            Dictionary<string, object> requestArgs = (Dictionary<string, object>)new JavaScriptSerializer().DeserializeObject(allText);
            requestArgs = (Dictionary<string, object>)requestArgs["root"];
            return (Array)requestArgs.Values.ElementAt(0);
        }
    }
}