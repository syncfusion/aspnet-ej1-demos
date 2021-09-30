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
    public partial class HistoryManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DiagramContent.Height = "500px";
            DiagramContent.Width = "100%";
            DiagramContent.PageSettings.ScrollLimit = ScrollLimit.Diagram;
            DiagramContent.OnClientNodeCollectionChange = "nodecollectionchange";
            DiagramContent.OnClientHistoryChange = "historyChange";
            DiagramContent.HistoryManager.StackLimit = 3;
            CreateFlowShape("node1", FlowShapes.Terminator, 90, 40, 380, 30, "#C44E5F", "Start", DiagramContent.Nodes);
            CreateFlowShape("node2", FlowShapes.Process, 90, 40, 380, 100, "#5E5F5F", "Design?", DiagramContent.Nodes, true);
            CreateFlowShape("node3", FlowShapes.Process, 90, 40, 380, 180, "#5E5F5F", "Coding", DiagramContent.Nodes, true);
            CreateFlowShape("node4", FlowShapes.Process, 90, 40, 380, 260, "#5E5F5F", "Testing", DiagramContent.Nodes);
            CreateFlowShape("node5", FlowShapes.Decision, 90, 40, 380, 340, "#4EAB8B", "Errors?", DiagramContent.Nodes);
            CreateFlowShape("node6", FlowShapes.Terminator, 90, 40, 380, 450, "#C44E5F", "End", DiagramContent.Nodes);
            CreateFlowShape("node7", FlowShapes.Decision, 120, 40, 200, 180, "#4EAB8B", "Design Errors?", DiagramContent.Nodes, true);


            //Connect Shapes
            ConnectHistoryShapes(DiagramContent.Model, "node1", "node2");
            ConnectHistoryShapes(DiagramContent.Model, "node2", "node3");
            ConnectHistoryShapes(DiagramContent.Model, "node3", "node4");
            ConnectHistoryShapes(DiagramContent.Model, "node4", "node5");
            //Label label = new Label() { Text = "No", FillColor = "white", Offset = new DiagramPoint(0.2f, 0.2f) };
            ConnectHistoryShapes(DiagramContent.Model, "node5", "node6");
            Label label1 = new Label() { Text = "Yes", FillColor = "white", Offset = new DiagramPoint(0.44f, 0.27f) };
            Connector connector = ConnectHistoryShapes(DiagramContent.Model, "node5", "node7",null,"inn");
            connector.Labels.Add(label1);
            Label label2 = new Label() { Text = "Yes", FillColor = "white", Offset = new DiagramPoint(0.44f, 0.27f) };
            connector = ConnectHistoryShapes(DiagramContent.Model, "node7", "node2", "in", null);
            connector.Labels.Add(label2);
            Label label3 = new Label() { Text = "No", FillColor = "white", Offset = new DiagramPoint(0.44f, 0.27f) };
            connector = ConnectHistoryShapes(DiagramContent.Model, "node7", "node3");
            connector.Labels.Add(label3);

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
            //node.FillColor = "#6bbd45";
            node.OffsetY = offsety;
            Label label = new Label();
            label.Margin = new LabelMargin() { Bottom = 2, Top = 2, Left = 20, Right = 20 };
            label.Text = labelText;
            label.FontColor = "white";
            label.Name = name + "_label";
            node.Labels.Add(label);
            //node.Constraints =NodeConstraints.Default & ~NodeConstraints.Drag;
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
            port1.Offset = new DiagramPoint(0.5f, 1);
            port1.Shape = PortShapes.Circle;
            node.Ports.Add(port1);
            Port port2 = new Port();
            port2.Name = "innn";
            port2.Offset = new DiagramPoint(1, 0.5f);
            port2.Shape = PortShapes.Circle;
            node.Ports.Add(port2);
        }

        private Connector ConnectHistoryShapes(DiagramProperties model, string sourceNode, string targetNode, string sourcePort = "", string targetPort = "")
        {
            Connector connector = new Connector();
            connector.Name = "line" + model.Connectors.Count + 1;
            connector.TargetNode = targetNode;
            connector.SourceNode = sourceNode;
            connector.SourcePort = sourcePort;
            connector.TargetPort = targetPort;
            connector.LineWidth = 2;
            connector.Constraints = ConnectorConstraints.Default | ConnectorConstraints.Bridging;
            connector.Segments = new Collection() { new Segment() { Type = Segments.Orthogonal } };
            model.Connectors.Add(connector);
            return connector;
        }
    }

    
    
}