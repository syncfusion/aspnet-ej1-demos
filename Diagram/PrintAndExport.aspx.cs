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
    public partial class PrintAndExport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BPMNNode node = CreateBPMN("node1", BPMNShapes.Event, 60, 60, 55, 200, "Select Support Ticket");
            node.Event = BPMNEvents.Start;

            CreateBPMN("node2", BPMNShapes.Activity, 75, 70, 190, 200, "Handle Support Ticket");
            node.Activity = BPMNActivity.Task;
            node = CreateBPMN("node3", BPMNShapes.Gateway, 75, 70, 355, 200, "");
            node.Gateway = BPMNGateways.Exclusive;

            node = CreateBPMN("node4", BPMNShapes.Activity, 75, 70, 530, 90, "Respond to customer");
            node.Activity = BPMNActivity.Task;
            node.Task.Type = BPMNTasks.Service;

            node = CreateBPMN("node5", BPMNShapes.Activity, 75, 70, 530, 200, "Close ticket");
            node.Activity = BPMNActivity.Task;
            node.Task.Type = BPMNTasks.Service;

            node = CreateBPMN("node6", BPMNShapes.Activity, 75, 70, 530, 300, "Escalate ticket");
            node.Activity = BPMNActivity.Task;
            node.Task.Type = BPMNTasks.Service;

            node = CreateBPMN("node7", BPMNShapes.Event, 60, 60, 660, 90, "");
            node.Event = BPMNEvents.End;

            node = CreateBPMN("node8", BPMNShapes.Event, 60, 60, 660, 200, "");
            node.Event = BPMNEvents.End;

            node = CreateBPMN("node9", BPMNShapes.Event, 60, 60, 660, 300, "");
            node.Event = BPMNEvents.End;

            ConnNode(DiagramWebControl1.Connectors, "node1", "node2");

            ConnNode(DiagramWebControl1.Connectors, "node2", "node3");

            Collection segments = new Collection() { 
                new Segment(){Type=Segments.Orthogonal, Length=75, Direction="top"},
                new Segment(){Type=Segments.Orthogonal, Length=80, Direction="right"},
            };
            Label label = new Label() { Text = "Respond", FillColor = "white", Wrapping = TextWrapping.Wrap };

            ConnNode(DiagramWebControl1.Connectors, "node3", "node4", segments, label);

            segments = new Collection() { 
                new Segment(){Type=Segments.Orthogonal, Length=75, Direction="right"},
            };
            label = new Label() { Text = "Close", FillColor = "white", Wrapping = TextWrapping.Wrap };
            ConnNode(DiagramWebControl1.Connectors, "node3", "node5", segments, label);

            segments = new Collection() { 
                new Segment(){Type=Segments.Orthogonal, Length=65, Direction="bottom"},
                new Segment(){Type=Segments.Orthogonal, Length=75, Direction="right"},
            };
            label = new Label() { Text = "Escalate", FillColor = "white" };
            ConnNode(DiagramWebControl1.Connectors, "node3", "node6", segments, label);

            ConnNode(DiagramWebControl1.Connectors, "node4", "node7");
            ConnNode(DiagramWebControl1.Connectors, "node5", "node8");
            ConnNode(DiagramWebControl1.Connectors, "node6", "node9");

        }
        private BPMNNode CreateBPMN(String name, BPMNShapes shape, double width, double height, double offsetx, double offsety, string text = "")
        {
            BPMNNode node = new BPMNNode();
            node.Name = name;
            node.Shape = shape;
            node.Width = width;
            node.Height = height;
            node.OffsetX = offsetx;
            node.OffsetY = offsety;
            Label label = new Label();
            label.Text = text;
            label.FontColor = "black";
            if (shape == BPMNShapes.Event && shape == BPMNShapes.Activity && text != "")
            {
                label.Offset = new DiagramPoint() { Y = 1 };
                label.VerticalAlignment = VerticalAlignment.Top;
            }
            else label.Offset = new DiagramPoint() { Y = 0.5f };
            node.Labels.Add(label);
            DiagramWebControl1.Nodes.Add(node);
            return node;
        }
        private void ConnNode(Collection nodes, string sourceNode, string targetNode, Collection segments = null, Label label = null)
        {
            Connector connector = new Connector();
            connector.TargetNode = targetNode;
            connector.SourceNode = sourceNode;
            if (label != null)
            {
                label.FillColor = "white";
                connector.Labels = new Collection() { label };
            }
            if (segments == null) segments = new Collection() { new Segment() { Type = Segments.Orthogonal } };
            connector.Segments = segments;
            DiagramWebControl1.Connectors.Add(connector);
        }
    }
}