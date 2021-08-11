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
namespace WebSampleBrowser.Diagram
{
    public partial class UMLActivityDiagram : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                createSymbolPalette();
                GenerateActivityShapes();
                GenerateDiagram();
            }
        }

        public void createSymbolPalette()
        {
            symbolpalette.Height = "100%";
            symbolpalette.Width = "100%";
            symbolpalette.PaletteItemHeight = 51;
            symbolpalette.PaletteItemWidth = 51;
            symbolpalette.PreviewHeight = 100;
            symbolpalette.PreviewWidth = 100;
            symbolpalette.SelectedPaletteName = "UML Activity Shapes";
            symbolpalette.ShowPaletteItemText = false;
            symbolpalette.DiagramId = "DiagramContent";
        }

        public void GenerateActivityShapes()
        {
            Palette activityShapes = new Palette("UML Activity Shapes");
            activityShapes.Expanded = true;

            createPaletteShapes(activityShapes, "AcceptingEvent", 80, 50, 70 / 2, 70 / 2, UMLActivityShapes.AcceptingEvent);
            createPaletteShapes(activityShapes, "Action", 80, 50, 20, 20, UMLActivityShapes.Action);
            createPaletteShapes(activityShapes, "SendSignal", 80, 50, 20, 20, UMLActivityShapes.SendSignal);
            createPaletteShapes(activityShapes, "MergeNode", 80, 50, 20, 20, UMLActivityShapes.MergeNode);
            createPaletteShapes(activityShapes, "Decision", 80, 50, 20, 20, UMLActivityShapes.Decision);
            createPaletteShapes(activityShapes, "FinalNode", 80, 50, 40, 25, UMLActivityShapes.FinalNode);
            createPaletteShapes(activityShapes, "JoinNode", 90, 50, 20, 20, UMLActivityShapes.JoinNode);
            createPaletteShapes(activityShapes, "ForkNode", 90, 50, 20, 20, UMLActivityShapes.ForkNode);
            createPaletteShapes(activityShapes, "InitialNode", 70, 70, 20, 20, UMLActivityShapes.InitialNode);
            createPaletteShapes(activityShapes, "TimeEvent", 50, 50, 20, 20, UMLActivityShapes.TimeEvent);
            createPaletteShapes(activityShapes, "ReceiveSignal", 80, 50, 20, 20, UMLActivityShapes.ReceiveSignal);
            createPaletteShapes(activityShapes, "StructuredNode", 80, 50, 20, 20, UMLActivityShapes.StructuredNode);
            createPaletteShapes(activityShapes, "Note", 80, 50, 20, 20, UMLActivityShapes.Note);
            createPaletteShapes(activityShapes, "AcceptingEvent", 80, 50, 20, 20, UMLActivityShapes.AcceptingEvent);

            symbolpalette.Palettes.Add(activityShapes);

        }

        public void GenerateDiagram()
        {
            DiagramContent.Height = "100%";
            DiagramContent.Width = "100%";
            DiagramContent.SelectedItems.Constraints = SelectorConstraints.All ^ SelectorConstraints.Rotator;
            UMLActivityShape node1 = CreateNode("node1", 50, 50, 390, 40, "", UMLActivityShapes.InitialNode);
            UMLActivityShape node2 = CreateNode("node2", 100, 50, 390, 130, "Establish E-mail Communication", UMLActivityShapes.Action);
            UMLActivityShape node3 = CreateNode("node3", 340, 5, 390, 200, "", UMLActivityShapes.ForkNode);
            node3.Ports.Add(AddPort("n3aport", 0.13f, 0.5f, PortShapes.Circle, PortVisibility.Visible));
            node3.Ports.Add(AddPort("n3bport", 0.85f, 0.5f, PortShapes.Circle, PortVisibility.Visible));
            UMLActivityShape node4 = CreateNode("node4", 80, 50, 264, 270, "Send Email", UMLActivityShapes.Action);
            UMLActivityShape node5 = CreateNode("node5", 80, 50, 510, 270, "Receive Response", UMLActivityShapes.Action);
            UMLActivityShape node6 = CreateNode("node6", 60, 60, 264, 360, "", UMLActivityShapes.MergeNode);
            node6.Ports.Add(AddPort("n6aport", 0, 0.5f));
            node6.Ports.Add(AddPort("n6bport", 1, 0.5f));
            UMLActivityShape node7 = CreateNode("node7", 80, 50, 185, 450, "Encrypted Email", UMLActivityShapes.Action);
            UMLActivityShape node8 = CreateNode("node8", 80, 50, 340, 450, "Regular Email", UMLActivityShapes.Action);
            UMLActivityShape node9 = CreateNode("node9", 60, 60, 264, 540, "", UMLActivityShapes.MergeNode);
            node9.Ports.Add(AddPort("n9aport", 0, 0.5f));
            node9.Ports.Add(AddPort("n9bport", 1, 0.5f));
            UMLActivityShape node10 = CreateNode("node10", 50, 50, 510, 450, "Wait 2 hours after send", UMLActivityShapes.TimeEvent);
            UMLActivityShape node11 = CreateNode("node11", 60, 60, 510, 540, "", UMLActivityShapes.MergeNode);
            UMLActivityShape node11a = CreateNode("node11a", 50, 50, 650, 540, "", UMLActivityShapes.FinalNode);
            UMLActivityShape node12 = CreateNode("node12", 340, 50, 388.74, 620, "", UMLActivityShapes.ForkNode);
            node12.Ports.Add(AddPort("n12aport", 0.13f, 0.5f, PortShapes.Circle, PortVisibility.Visible));
            node12.Ports.Add(AddPort("n12bport", 0.85f, 0.5f, PortShapes.Circle, PortVisibility.Visible));
            UMLActivityShape node13 = CreateNode("node13", 100, 50, 388.74, 690, "Communication Established", UMLActivityShapes.Action);
            UMLActivityShape node14 = CreateNode("node14", 50, 50, 388, 765, "", UMLActivityShapes.FinalNode);

            Connector connector1 = new Connector() { SourceNode = "node1", TargetNode = "node2" };
            Connector connector2 = new Connector() { SourceNode = "node2", TargetNode = "node3" };
            Connector connector3 = new Connector() { SourceNode = "node3", TargetNode = "node4", SourcePort = "n3aport" };
            Connector connector4 = new Connector() { SourceNode = "node3", TargetNode = "node5", SourcePort = "n3bport" };
            Connector connector5 = new Connector() { SourceNode = "node4", TargetNode = "node6" };
            Connector connector6 = new Connector() { SourceNode = "node5", TargetNode = "node10" };
            Connector connector7 = new Connector() { SourceNode = "node6", TargetNode = "node7", SourcePort = "n6aport", Segments = new Collection() { new Segment(Segments.Orthogonal) }, Labels = new Collection() { new Label() { Text = "private content", FillColor = "white", Wrapping = TextWrapping.WrapWithOverflow } } };
            Connector connector8 = new Connector() { SourceNode = "node6", TargetNode = "node8", SourcePort = "n6bport", Segments = new Collection() { new Segment(Segments.Orthogonal) }, Labels = new Collection() { new Label() { Text = "else", FillColor = "white", Wrapping = TextWrapping.WrapWithOverflow } } };
            Connector connector9 = new Connector() { SourceNode = "node7", TargetNode = "node9", TargetPort = "n9aport", Segments = new Collection() { new Segment(Segments.Orthogonal) } };
            Connector connector10 = new Connector() { SourceNode = "node8", TargetNode = "node9", TargetPort = "n9bport", Segments = new Collection() { new Segment(Segments.Orthogonal) } };
            Connector connector11 = new Connector() { SourceNode = "node10", TargetNode = "node11" };
            Connector connector12 = new Connector() { SourceNode = "node9", TargetNode = "node12", TargetPort = "n12aport" };
            Connector connector13 = new Connector() { SourceNode = "node11", TargetNode = "node11a", Labels = new Collection() { new Label() { Text = "[no reply] || \n [error]", Wrapping = TextWrapping.WrapWithOverflow } } };
            Connector connector14 = new Connector() { SourceNode = "node11", TargetNode = "node12", TargetPort = "n12bport", Labels = new Collection() { new Label() { Text = "Valid\nreply", FillColor = "white", Wrapping = TextWrapping.WrapWithOverflow, SegmentOffset=0.4f } } };
            Connector connector15 = new Connector() { SourceNode = "node12", TargetNode = "node13" };
            Connector connector16 = new Connector() { SourceNode = "node13", TargetNode = "node14" };

            DiagramContent.Model.Nodes.Add(node1);
            DiagramContent.Model.Nodes.Add(node2);
            DiagramContent.Model.Nodes.Add(node3);
            DiagramContent.Model.Nodes.Add(node4);
            DiagramContent.Model.Nodes.Add(node5);
            DiagramContent.Model.Nodes.Add(node6);
            DiagramContent.Model.Nodes.Add(node7);
            DiagramContent.Model.Nodes.Add(node8);
            DiagramContent.Model.Nodes.Add(node9);
            DiagramContent.Model.Nodes.Add(node10);
            DiagramContent.Model.Nodes.Add(node11);
            DiagramContent.Model.Nodes.Add(node11a);
            DiagramContent.Model.Nodes.Add(node12);
            DiagramContent.Model.Nodes.Add(node13);
            DiagramContent.Model.Nodes.Add(node14);

            DiagramContent.Model.Connectors.Add(connector1);
            DiagramContent.Model.Connectors.Add(connector2);
            DiagramContent.Model.Connectors.Add(connector3);
            DiagramContent.Model.Connectors.Add(connector4);
            DiagramContent.Model.Connectors.Add(connector5);
            DiagramContent.Model.Connectors.Add(connector6);
            DiagramContent.Model.Connectors.Add(connector7);
            DiagramContent.Model.Connectors.Add(connector8);
            DiagramContent.Model.Connectors.Add(connector9);
            DiagramContent.Model.Connectors.Add(connector10);
            DiagramContent.Model.Connectors.Add(connector11);
            DiagramContent.Model.Connectors.Add(connector12);
            DiagramContent.Model.Connectors.Add(connector13);
            DiagramContent.Model.Connectors.Add(connector14);
            DiagramContent.Model.Connectors.Add(connector15);
            DiagramContent.Model.Connectors.Add(connector16);
        }
        private UMLActivityShape CreateNode(string name, double width, double height, double offsetX, double offsetY, string text, UMLActivityShapes shape)
        {
            UMLActivityShape node = new UMLActivityShape();
            node.Name = name;
            node.Width = width;
            node.Height = height;
            node.OffsetX = offsetX;
            node.OffsetY = offsetY;
            node.Type = Shapes.UMLActivity;
            node.Shape = shape;
            Label label = new Label();
            label.Text = text;
            label.FontColor = "black";
            if (shape == UMLActivityShapes.TimeEvent && text != "")
            {
                label.Offset = new DiagramPoint() { X = 1, Y = 0.5f };
                label.HorizontalAlignment = HorizontalAlignment.Left;
                label.Margin = new LabelMargin()
                {
                    Left = -5
                };
            }
            else
            {
                label.Offset = new DiagramPoint() { X = 0.5f };
            }
            node.Labels.Add(label);
            return node;
        }

        public Port AddPort(string name, float offsetX, float offsetY, PortShapes shape = PortShapes.Square, PortVisibility visiblity = PortVisibility.Hidden)
        {
            Port port = new Port();
            port.Name = name;
            port.Offset = new DiagramPoint(offsetX, offsetY);
            port.Visibility = visiblity;
            port.FillColor = "red";
            port.BorderColor = "black";
            port.Shape = shape;
            if (shape == PortShapes.Path)
            {
                port.FillColor = port.BorderColor = "black";
                port.PathData = "M6.805,0L13.61,10.703L0,10.703z";
            }
            port.ConnectorPadding = 4;
            return port;
        }

        public void createPaletteShapes(Palette activityShapes, string name, double width, double height, double offsetX, double offsetY, UMLActivityShapes shape)
        {
            UMLActivityShape ActivityShape = new UMLActivityShape()
               {
                   Name = name,
                   Width = width,
                   Height = height,
                   OffsetX = offsetX,
                   OffsetY = offsetY,
                   Type = Shapes.UMLActivity,
                   Shape = shape,
               };
            if (name == "StructuredNode")
            {
                Collection labels = new Collection();
                labels.Add(new Label() { Text = "Structured Node" });
                ActivityShape.Labels = labels;
            }
            activityShapes.AppendChild(ActivityShape);
        }
    }
}