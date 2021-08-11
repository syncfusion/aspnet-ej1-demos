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
    public partial class UniversityOrgChart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UniversityChart.Model.DataSourceSettings.DataSource = GetUniversityChartData();
                UniversityChart.Model.DataSourceSettings.Parent = "Supervision";
                UniversityChart.Model.DataSourceSettings.Id = "Id";
                UniversityChart.Model.Layout.GetLayoutInfo = "getLayoutInfo";
                UniversityChart.Model.DefaultSettings.Node = new Node() { Width = 130, Height = 40, BorderColor = "transparent" };
                Label label = new Label() { Name = "label1", Margin = new LabelMargin(0, 5, 5, 0), FontColor = "#ffffff" };
                UniversityChart.Model.DefaultSettings.Node.Labels.Add(label);
                UniversityChart.Model.DefaultSettings.Connector = new Connector()
                {
                    Segments = new Collection() { new Segment(Segments.Orthogonal) },
                    TargetDecorator = new Decorator() { Shape = DecoratorShapes.None },
                    Constraints = ConnectorConstraints.None
                };
                UniversityChart.Model.NodeTemplate = "nodeTemplate";
            }
        }
        public Array GetUniversityChartData()
        {
            string allText = System.IO.File.ReadAllText(Server.MapPath("~/App_Data/UniversityChart.json"));
            Dictionary<string, object> requestArgs = (Dictionary<string, object>)new JavaScriptSerializer().DeserializeObject(allText);
            requestArgs = (Dictionary<string, object>)requestArgs["root"];
            return (Array)requestArgs.Values.ElementAt(0);
        }
    }
}