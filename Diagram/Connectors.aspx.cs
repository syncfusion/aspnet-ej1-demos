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
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Label = Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label;
namespace WebSampleBrowser.Diagram
{
    public partial class Connectors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            DiagramWebControl1.Height = "550px";
            DiagramWebControl1.PageSettings.ScrollLimit = ScrollLimit.Diagram;
            DiagramWebControl1.SnapSettings.SnapConstraints = SnapConstraints.None;
            DiagramWebControl1.OnClientSelectionChange = "selectionchanged";


            //Initialize shapes
            CreateFlowShape("node1", FlowShapes.Terminator, 90, 40, 80, 90, "Start", DiagramWebControl1.Nodes);
            CreateFlowShape("node2", FlowShapes.Decision, 130, 100, 260, 90, "Already installed the software?", DiagramWebControl1.Nodes);
            CreateFlowShape("node3", FlowShapes.Process, 100, 50, 440, 90, "Show license agreement", DiagramWebControl1.Nodes);
            CreateFlowShape("node4", FlowShapes.Decision, 90, 80, 620, 90, "Agreed?", DiagramWebControl1.Nodes);
            CreateFlowShape("node5", FlowShapes.Decision, 130, 90, 260, 240, "Can override the existing version?", DiagramWebControl1.Nodes);
            CreateFlowShape("node6", FlowShapes.Process, 90, 50, 620, 240, "Select destination folder", DiagramWebControl1.Nodes);
            CreateFlowShape("node7", FlowShapes.Decision, 110, 100, 620, 410, "Enough disk space?", DiagramWebControl1.Nodes);
            CreateFlowShape("node8", FlowShapes.Process, 90, 50, 440, 410, "Free Space", DiagramWebControl1.Nodes);
            FlowShape target = CreateFlowShape("node9", FlowShapes.Process, 90, 50, 260, 410, "Copy files", DiagramWebControl1.Nodes, true);
            CreateFlowShape("node10", FlowShapes.Terminator, 90, 40, 80, 410, "End", DiagramWebControl1.Nodes);


            //Connect Shapes
            ConnectNode(DiagramWebControl1.Connectors, "node1", "node2");
            ConnectNode(DiagramWebControl1.Connectors, "node2", "node3", null, new Label() { Text = "No" });
            ConnectNode(DiagramWebControl1.Connectors, "node3", "node4");

            Collection segments = new Collection() {
                new Segment(){Type=Segments.Orthogonal, Length=30, Direction="right"},
                new Segment(){Type=Segments.Orthogonal, Length=80, Direction="bottom"},
                new Segment(){Type=Segments.Orthogonal, Length=620, Direction="left"},
                new Segment(){Type=Segments.Orthogonal, Length=220, Direction="bottom"}
            };
            Label label = new Label() { Text = "No", FillColor = "white", Offset = new DiagramPoint(0.44f, 0.27f) };
            ConnectNode(DiagramWebControl1.Connectors, "node4", "node10", segments, label);

            label = new Label() { Text = "Yes", FillColor = "white", Offset = new DiagramPoint(0.2f, 0.2f) };
            ConnectNode(DiagramWebControl1.Connectors, "node2", "node5", null, label);

            label = new Label() { Text = "Yes", FillColor = "white", Offset = new DiagramPoint(0.2f, 0.2f) };
            ConnectNode(DiagramWebControl1.Connectors, "node4", "node6", null, label);

            ConnectNode(DiagramWebControl1.Connectors, "node6", "node7");
            ConnectNode(DiagramWebControl1.Connectors, "node7", "node8", null, new Label() { Text = "No" });

            Label label4 = new Label() { Text = "No", FillColor = "white" };
            ConnectNode(DiagramWebControl1.Connectors, "node8", "node9");

            ConnectNode(DiagramWebControl1.Connectors, "node9", "node10");

            segments = new Collection() { 
            new Segment(){Type=Segments.Orthogonal, Length=20, Direction="left"},
            new Segment(){Type=Segments.Orthogonal, Length=72, Direction="bottom"},
            new Segment(){Type=Segments.Orthogonal, Length=20, Direction="right"}
            };
            label = new Label() { Text = "Yes", FillColor = "white", Offset = new DiagramPoint(0.01f, 0.38f) };
            ConnectNode(DiagramWebControl1.Connectors, "node5", "node9", segments, label, (target.Ports[0] as Port).Name);

            segments = new Collection() { 
                new Segment(){Type=Segments.Orthogonal, Length=20, Direction="right"},
                new Segment(){Type=Segments.Orthogonal, Length=97, Direction="top"},
                new Segment(){Type=Segments.Orthogonal, Length=426, Direction="left"}
            };
            label = new Label() { Text = "Yes", FillColor = "white", Offset = new DiagramPoint(0.22f, 0.01f) };
            ConnectNode(DiagramWebControl1.Connectors, "node7", "node9", segments, label, (target.Ports[1] as Port).Name);

        }
        private FlowShape CreateFlowShape(String name, FlowShapes shape, double width, double height, double offsetx, double offsety, string labelText, Collection nodes, bool addPorts = false)
        {
            FlowShape node = new FlowShape();
            node.Name = name;
            node.Width = width;
            node.Shape = shape;
            node.Height = height;
            node.OffsetX = offsetx;
            node.BorderColor = "#000000";
            node.FillColor = "#6bbd45";
            node.OffsetY = offsety;
            Label label = new Label();
            label.Margin = new LabelMargin() { Bottom = 2, Top = 2, Left = 20, Right = 20 };
            label.Text = labelText;
            label.FontColor = "white";
            label.Name = name + "_label";
            node.Labels.Add(label);
            node.Constraints =NodeConstraints.Default & ~NodeConstraints.Drag;
            if (addPorts) AddPorts(node);
            nodes.Add(node);
            return node;
        }

        private void AddPorts(FlowShape node)
        {
            Port port = new Port();
            port.Name = "in";
            port.Offset = new DiagramPoint(0.4f, 0.01f);
            port.Shape = PortShapes.Circle;
            node.Ports.Add(port);
            Port port1 = new Port();
            port1.Name = "inn";
            port1.Offset = new DiagramPoint(0.6f, 0.01f);
            port1.Shape = PortShapes.Circle;
            node.Ports.Add(port1);
        }

        private void ConnectNode(Collection nodes, string sourceNode, string targetNode, Collection segments = null, Label label = null, string targetPort = "")
        {
            Connector connector = new Connector();
            connector.Name = "line" + DiagramWebControl1.Connectors.Count + 1;
            connector.TargetNode = targetNode;
            connector.SourceNode = sourceNode;
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
            DiagramWebControl1.Connectors.Add(connector);
        }
    }
}