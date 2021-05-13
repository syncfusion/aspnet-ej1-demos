#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.JavaScript.DataVisualization.DiagramEnums;
using Syncfusion.JavaScript.DataVisualization.Models;
using Syncfusion.JavaScript.DataVisualization.Models.Collections;
using Syncfusion.JavaScript.DataVisualization.Models.Diagram;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.Diagram
{
    public partial class Rulers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GenerateDiagram();
            }
        }

        public void GenerateDiagram()
        {
            DiagramRuler.Height = "600px";
            DiagramRuler.Width = "100%";
            DiagramRuler.RulerSettings.ShowRulers = true;
            DiagramRuler.RulerSettings.HorizontalRuler.Interval = 6;
            DiagramRuler.RulerSettings.HorizontalRuler.ArrangeTick = "arrangeTick";
            DiagramRuler.RulerSettings.VerticalRuler.Interval = 6;
            DiagramRuler.RulerSettings.VerticalRuler.ArrangeTick = "arrangeTick";
            CreateNode("NewIdea", 150, 60, 300, 60, "New idea identified", FlowShapes.Terminator);
            CreateNode("Meeting", 150, 60, 300, 155, "Meeting with board", FlowShapes.Process);
            CreateNode("BoardDecision", 150, 110, 300, 280, "Board decides \nwhether \nto proceed", FlowShapes.Decision);
            CreateNode("Project", 150, 100, 300, 430, "Find Project \nmanager", FlowShapes.Decision);
            CreateNode("End", 150, 60, 300, 555, "Implement and Deliver", FlowShapes.Process);
            CreateNode("Decision", 250, 60, 550, 60, "Decision Process for new software ideas", FlowShapes.Card);
            CreateNode("Reject", 150, 60, 550, 285, "Reject and write report", FlowShapes.Process);
            CreateNode("Resources", 150, 60, 550, 430, "Hire new resources", FlowShapes.Process);

            createConnector("connector1", "NewIdea", "Meeting", null);
            createConnector("connector2", "Meeting", "BoardDecision", null);
            createConnector("connector3", "BoardDecision", "Project", "Yes");
            createConnector("connector4", "Project", "End", "Yes");
            createConnector("connector5", "BoardDecision", "Reject", "No");
            createConnector("connector6", "Project", "Resources", "No");
        }

        private void CreateNode(string name, double width, double height, double offsetX, double offsetY, string text, FlowShapes shape)
        {
            FlowShape node = new FlowShape();
            node.Name = name;
            node.Width = width;
            node.Height = height;
            node.OffsetX = offsetX;
            node.OffsetY = offsetY;
            if (node.Name == "Decision")
            {
                node.FillColor = "#858585";
                node.BorderColor = "#858585";
            }
            else
            {
                node.FillColor = "#1BA0E2";
                node.BorderColor = "#1BA0E2";
            }
            node.Type = Shapes.Flow;
            node.Shape = shape;
            node.Labels.Add(new Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label { Text = text, FontColor = "white" });
            DiagramRuler.Model.Nodes.Add(node);
        }

        private void createConnector(string name, string sourceNode, string targetNode, string text)
        {
            Connector connector = new Connector();
            connector.Name = name;
            connector.SourceNode = sourceNode;
            connector.TargetNode = targetNode;
            connector.LineColor = "#606060";
            connector.Labels.Add(new Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label { Text = text, FillColor = "white" });
            DiagramRuler.Model.Connectors.Add(connector);
        }
    }
}