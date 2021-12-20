#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Syncfusion.JavaScript.DataVisualization.Models.Diagram;
using Syncfusion.JavaScript.DataVisualization.Models.Collections;
using Syncfusion.JavaScript.DataVisualization.Models;
using System.Web.Script.Serialization;
using System.Text.RegularExpressions;
using Syncfusion.JavaScript.DataVisualization.DiagramEnums;


namespace WebSampleBrowser.Diagram
{
    public partial class Events : System.Web.UI.Page
    {
        string darkColor = "#C7D4DF";
        string lightColor = "#f5f5f5";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                createSymbolPalette();
                GenerateBasicShapes();
                GenerateSwimlaneShapes();
                GenerateConnectors();
                GenerateDiagram();
                selectControls.SelectedIndices = new List<int>() { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21 };
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
            symbolpalette.SelectedPaletteName = "Flow Shapes";
            symbolpalette.ShowPaletteItemText = false;
            symbolpalette.DiagramId = "DiagramContent";
        }

        private void GenerateSwimlaneShape(Palette Palette, string name, int headWid, string headFill, string orientation, int height, int width, string fillcolor, int offsetX, int offsetY)
        {
            Lane lane = new Lane();
            lane.Name = name;
            Header header = new Header();
            header.Text = "";
            header.Width = headWid;
            header.Height = 60;
            header.FillColor = headFill;
            header.FontSize = 11;
            lane.Header = header;
            lane.FillColor = fillcolor;
            lane.Height = height;
            lane.Width = width;
            lane.OffsetX = offsetX;
            lane.OffsetY = offsetY;
            lane.IsLane = true;
            lane.Orientation = orientation;
            Palette.Items.Add(lane);
        }

        public void GenerateSwimlaneShapes()
        {
            Palette swimlaneShapes = new Palette("Swimlane Shapes");
            swimlaneShapes.Expanded = true;
            GenerateSwimlaneShape(swimlaneShapes, "stackCanvas1", 50, "#C7D4DF", "horizontal", 60, 140, "#f5f5f5", 70, 30);
            GenerateSwimlaneShape(swimlaneShapes, "stackCanvas2", 50, "#C7D4DF", "vertical", 140, 60, "#f5f5f5", 30, 70);
            GenerateSwimlanePhase(swimlaneShapes, "verticalPhase", "vertical");
            GenerateSwimlanePhase(swimlaneShapes, "horizontalPhase", "horizontal");
            symbolpalette.Palettes.Add(swimlaneShapes);
        }

        public void GenerateSwimlanePhase(Palette swimlaneShapes, string name, string orientation)
        {
            Phase phase = new Phase();
            phase.Name = name;
            phase.Type = "phase";
            phase.LineWidth = 1;
            phase.LineDashArray = "3,3";
            phase.LineColor = "#606060";
            phase.Orientation = orientation;
            phase.Parent = "";
            swimlaneShapes.Items.Add(phase);
        }



        public void GenerateConnectors()
        {
            Palette connectors = new Palette("Connectors");
            connectors.Expanded = true;

            Collection segments = new Collection();
            Segment seg = new Syncfusion.JavaScript.DataVisualization.Models.Diagram.Segment(Segments.Orthogonal);
            segments.Add(seg);

            connectors.Items.Add(new Connector { Name = "link1", Segments = segments, SourcePoint = new DiagramPoint(0, 0), TargetPoint = new DiagramPoint(40, 40), LineWidth = 1 });
            segments = new Collection();
            seg = new Syncfusion.JavaScript.DataVisualization.Models.Diagram.Segment(Segments.Straight);
            segments.Add(seg);
            connectors.Items.Add(new Connector { Name = "link2", Segments = segments, SourcePoint = new DiagramPoint(0, 0), TargetPoint = new DiagramPoint(40, 40), LineWidth = 1 });
            symbolpalette.Palettes.Add(connectors);
        }
        public void GenerateBasicShapes()
        {
            Palette basicShapes = new Palette("Basic Shapes");
            basicShapes.Expanded = true;
            Node Rectangle = CreateNodes("Rectangle", "rectangle", null, null, "Process", 70, 45);
            basicShapes.AppendChild(Rectangle);

            Node Ellipse = CreateNodes("Ellipse", "ellipse", null, null, "Start/\nEnd", 70, 70);
            basicShapes.AppendChild(Ellipse);

            Collection points = new Collection();
            points.Add(new DiagramPoint(25, 1));
            points.Add(new DiagramPoint(99, 1));
            points.Add(new DiagramPoint(75, 99));
            points.Add(new DiagramPoint(1, 99));
            Node Parallelogram = CreateNodes("Parallelogram", "polygon", points, null, "Input/\nOutput", 70, 70);
            basicShapes.AppendChild(Parallelogram);

            points = new Collection();
            points.Add(new DiagramPoint(50, 1));
            points.Add(new DiagramPoint(100, 50));
            points.Add(new DiagramPoint(50, 100));
            points.Add(new DiagramPoint(1, 50));
            Node Dimond = CreateNodes("Dimond", "polygon", points, null, "Decision", 70, 70);
            basicShapes.AppendChild(Dimond);

            symbolpalette.Palettes.Add(basicShapes);
        }

        private Node CreateNodes(string name, string type, Collection points, string color, string text, double width, double height)
        {
            BasicShape node = new BasicShape();
            node.Name = name;
            node.Width = width;
            node.Height = height;
            node.OffsetX = node.Width / 2;
            node.OffsetY = 30;
            if (type == "polygon")
            {
                node.Shape = BasicShapes.Polygon;
                node.Points = points;
            }
            else if (type == "ellipse")
            {
                node.Shape = BasicShapes.Path;
                node.PathData = "M 120 24.9999 C 120 38.8072 109.642 50 96.8653 50 L 23.135 50 C 10.3578 50 0 38.8072 0 24.9999 L 0 24.9999 C 0 11.1928 10.3578 0 23.135 0 L 96.8653 0 C 109.642 0 120 11.1928 120 24.9999 Z";
            }
            else if (type == "rectangle")
            {
                node.Shape = BasicShapes.Rectangle;
            }
            node.FillColor = color != null ? color : "white";
            node.BorderWidth = 2;
            node.Labels.Add(new Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label { Text = "" });
            return node;
        }

        public void GenerateDiagram()
        {
            DiagramContent.Height = "100%";
            DiagramContent.Width = "100%";
            DiagramContent.OnClientSelectionChange = "selectionChange";
            DiagramContent.OnClientSizeChange = "sizeChanged";
            DiagramContent.OnClientConnectorCollectionChange = "collectionChanged";
            DiagramContent.OnClientNodeCollectionChange = "collectionChanged";
            DiagramContent.OnClientTextChange = "textChanged";
            DiagramContent.OnClientSegmentChange = "segmentChanged";
            DiagramContent.OnClientRotationChange = "eventLog";
            DiagramContent.OnClientConnectorTargetChange = "endPointChanged";
            DiagramContent.OnClientConnectorSourceChange = "endPointChanged";
            DiagramContent.OnClientScrollChange = "scrollChanged";
            DiagramContent.OnClientDoubleClick = "doubleClickd";
            DiagramContent.OnClientDragEnter = "eventLog";
            DiagramContent.OnClientDragOver = "eventLog";
            DiagramContent.OnClientDragLeave = "eventLog";
            DiagramContent.OnClientDrag = "dragd";
            DiagramContent.OnClientDrop = "eventLog";
            DiagramContent.OnClientGroupChange = "eventLog";
            DiagramContent.OnClientHistoryChange = "eventLog";
            DiagramContent.OnClientClick = "clicked";
            DiagramContent.OnClientConnectionChange = "eventLog";
            DiagramContent.OnClientContextMenuBeforeOpen = "eventLog";
            DiagramContent.OnClientContextMenuClick = "contextMenuClicked";
            
            FlowShape node1 = CreateDiagramNode("node1", 100, 60, 200, 50, "Start", FlowShapes.Terminator, "#05ADA4");
            FlowShape node2 = CreateDiagramNode("node2", 100, 70, 200, 150, "Process1", FlowShapes.Process, "#33AACA");
            FlowShape node3 = CreateDiagramNode("node3", 90, 90, 200, 270, "Decision1", FlowShapes.Decision, "#83A93F");
            FlowShape node4 = CreateDiagramNode("node4", 90, 90, 100, 450, "Decision2", FlowShapes.Decision, "#83A93F");
            FlowShape node5 = CreateDiagramNode("node5", 90, 90, 300, 450, "Process2", FlowShapes.Process, "#83A93F");
            FlowShape node6 = CreateDiagramNode("node6", 100, 60, 200, 550, "End", FlowShapes.Terminator, "#05ADA4");

            ConnectDiagramNode(DiagramContent.Model, node1, node2, "");
            ConnectDiagramNode(DiagramContent.Model, node2, node3, "");
            ConnectDiagramNode(DiagramContent.Model, node3, node4, "No");
            ConnectDiagramNode(DiagramContent.Model, node3, node5, "Yes");
            Connector connector = ConnectDiagramNode(DiagramContent.Model, node4, node6, "No");
            connector.Segments = new Collection(){
                new Segment()
                {
                    Type =  Segments.Orthogonal, 
                    Length = 50, 
                    Direction = "left" 
                }
            };
            connector = ConnectDiagramNode(DiagramContent.Model, node5, node6, "Yes");
            connector.Segments = new Collection(){
                new Segment()
                {
                    Type =  Segments.Orthogonal, 
                    Length = 50, 
                    Direction = "right" 
                }
            };

            DiagramContent.Model.Nodes.Add(node1);
            DiagramContent.Model.Nodes.Add(node2);
            DiagramContent.Model.Nodes.Add(node3);
            DiagramContent.Model.Nodes.Add(node4);
            DiagramContent.Model.Nodes.Add(node5);
            DiagramContent.Model.Nodes.Add(node6);
        }

        private Connector ConnectDiagramNode(DiagramProperties model, Node targetNode, Node sourceNode, string labelText)
        {
            Connector connector = new Connector();
            connector.Name = "line" + model.Connectors.Count + 1;
            connector.Segments = new Collection();
            Segment seg = new Syncfusion.JavaScript.DataVisualization.Models.Diagram.Segment(Segments.Orthogonal);
            connector.Segments.Add(seg);
            connector.TargetNode = targetNode.Name;
            connector.SourceNode = sourceNode.Name;
            connector.LineWidth = 2;
            if (!string.IsNullOrEmpty(labelText))
            {
                Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label label = new Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label();
                label.FontColor = "black";
                label.FillColor = "white";
                label.Text = labelText;
                connector.Labels.Add(label);
            }
            connector.SourceDecorator.Shape = Syncfusion.JavaScript.DataVisualization.DiagramEnums.DecoratorShapes.Arrow;
            connector.TargetDecorator.Shape = Syncfusion.JavaScript.DataVisualization.DiagramEnums.DecoratorShapes.None;
            connector.TargetDecorator.BorderColor = "#606060";
            connector.TargetDecorator.Width = 10;
            connector.TargetDecorator.Height = 10;
            model.Connectors.Add(connector);
            return connector;
        }

        private FlowShape CreateDiagramNode(string name, double width, double height, double offsetx, double offsety, string labelText, FlowShapes shape, string fillColor)
        {
            FlowShape node = new FlowShape();
            node.Name = name;
            node.Width = width;
            node.Height = height;
            node.OffsetX = offsetx;
            node.OffsetY = offsety;
            node.FillColor = fillColor;
            //node.BorderColor = "#1BA0E2";
            node.Shape = shape;
            Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label label = new Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label();
            label.Text = labelText;
            label.FontColor = "white";
            label.Name = name + "_label";
            node.Labels.Add(label);
            return node;

        }
    }
}