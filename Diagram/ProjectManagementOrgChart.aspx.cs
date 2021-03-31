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
    public partial class ProjectManagementOrgChart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ProjectChart.Model.DataSourceSettings.DataSource = GetProjectChartData();
                ProjectChart.Model.DataSourceSettings.Parent = "Phase";
                ProjectChart.Model.DataSourceSettings.Id = "Id";
                Dictionary<string, object> addInfo = new Dictionary<string, object>();
                addInfo.Add("orientation", "vertical");
                addInfo.Add("type", "alternate");
                ProjectChart.Model.DefaultSettings.Node = new Node()
                {
                    Constraints = NodeConstraints.Select | NodeConstraints.PointerEvents,
                    Width = 110,
                    Height = 40,
                    BorderColor = "black",
                    AddInfo = addInfo
                };
                Label label = new Label() { FontColor = "#ffffff" };
                ProjectChart.Model.DefaultSettings.Node.Labels.Add(label);
                ProjectChart.Model.DefaultSettings.Connector = new Connector()
                {
                    LineColor = "#000000",
                    Segments = new Collection() { new Segment(Segments.Orthogonal) },
                    TargetDecorator = new Decorator() { Shape = DecoratorShapes.None }
                };
                ProjectChart.Model.SelectedItems.Constraints &= ~SelectorConstraints.Rotator;
                ProjectChart.Model.NodeTemplate = "nodeTemplate";
                ProjectChart.Model.SelectionChange = "selectionChange";
            }
        }
        public Array GetProjectChartData()
        {
            string allText = System.IO.File.ReadAllText(Server.MapPath("~/App_Data/ProjectChart.json"));
            Dictionary<string, object> requestArgs = (Dictionary<string, object>)new JavaScriptSerializer().DeserializeObject(allText);
            requestArgs = (Dictionary<string, object>)requestArgs["root"];
            return (Array)requestArgs.Values.ElementAt(0);
        }
    }
}