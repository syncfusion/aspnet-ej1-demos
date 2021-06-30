#region Copyright Syncfusion Inc. 2001-2021
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
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Label = Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label;
namespace WebSampleBrowser.Diagram
{
    public partial class DiagramModelSample : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Diagrammodel.Height = "500px";
            Diagrammodel.Width = "100%";
            Constraints.SelectedIndices = new List<int>() { 1, 2, 3, 4 };
            Diagrammodel.PageSettings.ScrollLimit = ScrollLimit.Diagram;
            Diagrammodel.PageSettings.PageHeight = 500;
            Diagrammodel.PageSettings.PageWidth = 690;
            Diagrammodel.PageSettings.PageOrientation = PageOrientation.Landscape;
            Diagrammodel.PageSettings.PageBackgroundColor = "transparent";
            Diagrammodel.SnapSettings.SnapConstraints = SnapConstraints.ShowLines;
            Diagrammodel.OnClientSelectionChange = "selectionchanged";
            Diagrammodel.Constraints = DiagramConstraints.Default | DiagramConstraints.PageEditable;
            Diagrammodel.Model.BackgroundImage.Source = "../Content/diagram/Artboard 13.png";
            Diagrammodel.BackgroundImage.Alignment = ImageAlignment.XMinYMid;
            Diagrammodel.Model.BackgroundImage.Scale = ScaleConstraints.Meet;

            //Initialize shapes
            CreateFlowShape("node1", FlowShapes.Terminator, 90, 40, 380, 30, "#C44E5F", "Start", Diagrammodel.Nodes);
            CreateFlowShape("node2", FlowShapes.Process, 90, 40, 380, 100, "#5E5F5F", "Design?", Diagrammodel.Nodes, true);
            CreateFlowShape("node3", FlowShapes.Process, 90, 40, 380, 180, "#5E5F5F", "Coding", Diagrammodel.Nodes, true);
            CreateFlowShape("node4", FlowShapes.Process, 90, 40, 380, 260, "#5E5F5F", "Testing", Diagrammodel.Nodes);
            CreateFlowShape("node5", FlowShapes.Decision, 90, 40, 380, 340, "#4EAB8B", "Errors?", Diagrammodel.Nodes);
            CreateFlowShape("node6", FlowShapes.Terminator, 90, 40, 380, 450, "#C44E5F", "End", Diagrammodel.Nodes);
            CreateFlowShape("node7", FlowShapes.Decision, 90, 40, 200, 180, "#4EAB8B", "Design Errors?", Diagrammodel.Nodes, true);


            //Connect Shapes
            ConnectNode(Diagrammodel.Connectors, "node1", "node2");
            ConnectNode(Diagrammodel.Connectors, "node2", "node3");
            ConnectNode(Diagrammodel.Connectors, "node3", "node4");
            ConnectNode(Diagrammodel.Connectors, "node4", "node5");
            Label label = new Label() { Text = "No", FillColor = "white", Offset = new DiagramPoint(0.2f, 0.2f) };
            ConnectNode(Diagrammodel.Connectors, "node5", "node6", null, label);
            Label label1 = new Label() { Text = "Yes", FillColor = "white", Offset = new DiagramPoint(0.2f, 0.2f) };
            ConnectNode(Diagrammodel.Connectors, "node5", "node7", null, label1,null,"inn");

            Label label2 = new Label() { Text = "Yes", FillColor = "white", Offset = new DiagramPoint(0.2f, 0.2f) };
            ConnectNode(Diagrammodel.Connectors, "node7", "node2", null, label2,"in" ,null);

            Label label3 = new Label() { Text = "No", FillColor = "white", Offset = new DiagramPoint(0.2f, 0.2f) };
            ConnectNode(Diagrammodel.Connectors, "node7", "node3", null, label3);

        }
        private FlowShape CreateFlowShape(String name, FlowShapes shape, double width, double height, double offsetx, double offsety, string color, string labelText, Collection nodes, bool addPorts = false)
        {
            FlowShape node = new FlowShape();
            node.Name = name;
            node.Width = width;
            node.Shape = shape;
            node.Height = height;
            node.OffsetX = offsetx;
            node.FillColor = color;
            node.BorderColor = "#000000";
            node.OffsetY = offsety;
            Label label = new Label();
            label.Margin = new LabelMargin() { Bottom = 2, Top = 2, Left = 20, Right = 20 };
            label.Text = labelText;
            label.FontColor = "white";
            label.Name = name + "_label";
            node.Labels.Add(label);
            if (addPorts) AddPorts(node);
            nodes.Add(node);
            return node;
        }

        private void AddPorts(FlowShape node)
        {
            Port port = new Port();
            port.Name = "in";
            port.Offset = new DiagramPoint(0.5f, 0);
            port.Shape = PortShapes.Circle;
            node.Ports.Add(port);
            Port port1 = new Port();
            port1.Name = "inn";
            port1.Offset = new DiagramPoint(0.5f,1);
            port1.Shape = PortShapes.Circle;
            node.Ports.Add(port1);
            Port port2 = new Port();
            port2.Name = "innn";
            port2.Offset = new DiagramPoint(1, 0.5f);
            port2.Shape = PortShapes.Circle;
            node.Ports.Add(port2);
        }

        private void ConnectNode(Collection nodes, string sourceNode, string targetNode, Collection segments = null, Label label = null, string sourcePort = "", string targetPort = "")
        {
            Connector connector = new Connector();
            connector.Name = "line" + Diagrammodel.Connectors.Count + 1;
            connector.TargetNode = targetNode;
            connector.SourceNode = sourceNode;
            connector.SourcePort = sourcePort;
            connector.TargetPort = targetPort;
            connector.CornerRadius = 10;
            connector.LineWidth = 2;
            connector.Constraints = ConnectorConstraints.Default | ConnectorConstraints.Bridging;
            if (segments == null) segments = new Collection() { new Segment() { Type = Segments.Orthogonal } };
            connector.Segments = segments;
            connector.AddInfo = new Dictionary<string, object> {
                {"segments", segments}
            };
            if (label != null)
            {
                label.FillColor = "white";
                connector.Labels = new Collection() { label };
            }
            Diagrammodel.Connectors.Add(connector);
        }
    }
}