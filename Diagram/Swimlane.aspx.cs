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
    public partial class Swimlane : System.Web.UI.Page
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
            DiagramContent.SelectedItems.Constraints = SelectorConstraints.All ^ SelectorConstraints.Rotator;
            GenerateDiagramNodes();
            GenerateDiagramConnectors();
        }

        private void GenerateDiagramNodes()
        {
            SwimLane swimlane = new SwimLane();
            swimlane.Type = "swimlane";
            swimlane.Name = "swimlane";
            Header header = new Header();
            header.Text = "ONLINE PURCHASE STATUS";
            header.Height = 50;
            header.FillColor = darkColor;
            header.FontSize = 11;
            swimlane.Header = header;
            swimlane.FillColor = darkColor;
            swimlane.Orientation = "horizontal";
            swimlane.OffsetX = 350;
            swimlane.OffsetY = 290;
            swimlane.Height = 100;
            swimlane.Width = 650;
            swimlane.Lanes = CreateLanes();
            swimlane.Phases = CreatePhases();
            DiagramContent.Model.Nodes.Add(swimlane);
        }

        private Node CreateDiagramNode(string name, int width, int height, string fillColor, string text, int mLeft, int mTop, bool path)
        {
            BasicShape node = new BasicShape();
            node.Name = name;
            node.Width = width;
            node.Height = height;
            node.FillColor = fillColor;
            node.Labels.Add(new Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label { Text = text, FontSize = 11 });
            if (path)
            {
                node.Shape = BasicShapes.Path;
                node.PathData = "M 120 24.9999 C 120 38.8072 109.642 50 96.8653 50 L 23.135 50 C 10.3578 50 0 38.8072 0 24.9999 L 0 24.9999 C 0 11.1928 10.3578 0 23.135 0 L 96.8653 0 C 109.642 0 120 11.1928 120 24.9999 Z";
            }
            node.MarginLeft = mLeft;
            node.MarginTop = mTop;
            return node;
        }

        private Collection CreateLanes()
        {
            Collection laneCollection = new Collection();

            Collection childCollec = new Collection();
            childCollec.Add(CreateDiagramNode("Order", 100, 40, "white", "ORDER", 60, 20, true));
            laneCollection.Add(CreateLane("stackCanvas1", "CUSTOMER", 50, lightColor, 120, childCollec));

            childCollec = new Collection();
            childCollec.Add(CreateDiagramNode("selectItemaddcart", 100, 40, "white", "Select item\nAdd cart", 190, 20, false));
            childCollec.Add(CreateDiagramNode("paymentondebitcreditcard", 100, 40, "white", "Payment on\nDebit\\Credit Card", 350, 20, false));
            laneCollection.Add(CreateLane("stackCanvas2", "ONLINE", 50, darkColor, 120, childCollec));


            childCollec = new Collection();
            childCollec.Add(CreateDiagramNode("getmaildetailaboutorder", 100, 40, "white", "Get mail detail\nabout order", 190, 20, false));
            childCollec.Add(CreateDiagramNode("pakingitem", 100, 40, "white", "Get mail detail\nabout order", 350, 20, false));
            laneCollection.Add(CreateLane("stackCanvas3", "SHOP", 50, lightColor, 120, childCollec));


            childCollec = new Collection();
            childCollec.Add(CreateDiagramNode("sendcourieraboutaddress", 100, 40, "white", "Send Courier\n about Address", 190, 20, false));
            childCollec.Add(CreateDiagramNode("deliveryonthataddress", 100, 40, "white", "Delivery on that\n Address", 350, 20, false));
            childCollec.Add(CreateDiagramNode("getitItem", 100, 40, "white", "GET IT ITEM", 500, 20, true));
            laneCollection.Add(CreateLane("stackCanvas4", "DELIVERY", 50, darkColor, 120, childCollec));

            return laneCollection;
        }

        private Lane CreateLane(string name, string hText, int hWidth, string fillColor, int height, Collection children)
        {
            Lane lane = new Lane();
            lane.Name = name;
            Header header = new Header();
            header.Text = hText;
            header.Width = hWidth;
            header.FillColor = darkColor;
            header.FontSize = 11;
            lane.FillColor = lightColor;
            lane.Header = header;
            lane.Height = height;
            lane.Children = children;
            return lane;
        }

        private void GenerateDiagramConnectors()
        {
            DiagramContent.Connectors.Add(GenerateDiagramConnector("connector1", "Order", "selectItemaddcart"));
            DiagramContent.Connectors.Add(GenerateDiagramConnector("connector2", "selectItemaddcart", "paymentondebitcreditcard"));
            DiagramContent.Connectors.Add(GenerateDiagramConnector("connector3", "paymentondebitcreditcard", "getmaildetailaboutorder"));
            DiagramContent.Connectors.Add(GenerateDiagramConnector("connector4", "getmaildetailaboutorder", "pakingitem"));
            DiagramContent.Connectors.Add(GenerateDiagramConnector("connector5", "pakingitem", "sendcourieraboutaddress"));
            DiagramContent.Connectors.Add(GenerateDiagramConnector("connector6", "sendcourieraboutaddress", "deliveryonthataddress"));
            DiagramContent.Connectors.Add(GenerateDiagramConnector("connector7", "deliveryonthataddress", "getitItem"));
        }

        private Connector GenerateDiagramConnector(string name, string sName, string Tname)
        {
            Connector connector = new Connector();
            connector.Name = name;
            connector.SourceNode = sName;
            connector.TargetNode = Tname;
            connector.LineColor = "#606060";
            Decorator decorator = new Decorator();
            decorator.Shape = DecoratorShapes.Arrow;
            decorator.BorderColor = "#606060";
            decorator.Width = 10;
            decorator.Height = 10;
            connector.TargetDecorator = decorator;
            connector.Segments.Add(new Segment() { Type = Segments.Orthogonal });
            return connector;
        }

        private Collection CreatePhases()
        {
            Collection phaseCollec = new Collection();
            phaseCollec.Add(new Phase { Name = "phase1", Offset = 200, LineWidth = 1, LineDashArray = "3,3", LineColor = "#606060", Label = new Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label() { Text = "Phase" } });
            phaseCollec.Add(new Phase { Name = "phase2", Offset = 500, LineWidth = 1, LineDashArray = "3,3", LineColor = "#606060", Label = new Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label() { Text = "Phase" } });

            return phaseCollec;
        }
    }
}