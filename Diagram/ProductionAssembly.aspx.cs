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
    public partial class ProductionAssembly : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Node node1 = CreateNativeNode("fromEnginPlant", 100, 80, 00, 300, "Production_Load", "From Engine", "top", 0, null);
            Node node2 = CreateNativeNode("fromChassisPlant", 100, 80, 00, 450, "Production_Load", "From Chassis", "top", 0, null);
            Node node3 = CreateNativeNode("todistribution", 100, 80, 800, 780, "Production_Load", "To distribution", "bottom", 0, null);
            Node node4 = CreateNativeNode("Production_Home", 100, 80, 1380, 0, "Production_Home", "Home", "bottom", 0, null);

            DiagramWebControl1.Model.Nodes.Add(node1);
            DiagramWebControl1.Model.Nodes.Add(node2);
            DiagramWebControl1.Model.Nodes.Add(node3);
            DiagramWebControl1.Model.Nodes.Add(node4);


            Group group1 = new Group() { Name = "group1" };
            group1.Children.Add(CreateNode("bigrect1", 230, 230, 200, 190, 0, null, 0, "whitesmoke", 1));
            group1.Children.Add(CreateNativeNode("smallrect1", 90, 90, 143, 200, "Production_Paint_Green", null, null, 0, null));
            group1.Children.Add(CreateNode("ellipse1", 115, 40, 150, 50, 0, "Frame Assy", 20, "#FF7620", 1));
            group1.Children.Add(CreateNativeNode("flag1", 30, 45, 180, 110, "Production_CriticallyLow", null, null, 0, "white"));
            group1.Children.Add(CreateNativeNode("tick1", 35, 35, 290, 105, "Production_Active", null, null, 0, "white"));
            group1.Children.Add(CreateNativeNode("switch", 25, 15, 280, 60, "Production_Optimal", null, null, 0, null));
            group1.Children.Add(CreateNode("rect1", 230, 45, 200, 280, 0, null, 0, "lightgrey", 0.9));
            group1.Children.Add(CreateNativeNode("inner_object", 50, 80, 265, 200, "stProduction_Frameassy", null, null, 0, null));
            DiagramWebControl1.Model.Nodes.Add(group1);

            Group group2 = new Group() { Name = "group2" };
            group2.Children.Add(CreateNode("bigrect2", 230, 230, 500, 190, 0, null, 0, "whitesmoke", 1));
            group2.Children.Add(CreateNode("ellipse2", 110, 40, 450, 50, 0, "Electical", 20, "#FF7620", 1));
            group2.Children.Add(CreateNativeNode("smallrect2", 90, 90, 442, 200, "Production_Paint_Yellow", null, null, 0, null));
            group2.Children.Add(CreateNativeNode("flag2", 30, 45, 480, 110, "Production_CriticallyLow", null, null, 0, "white"));
            group2.Children.Add(CreateNativeNode("tick2", 35, 35, 590, 105, "Production_Down", null, null, 0, "white"));
            group2.Children.Add(CreateNativeNode("switch2", 25, 15, 580, 60, "Production_Optimal", null, null, 0, null));
            group2.Children.Add(CreateNode("rect2", 230, 45, 500, 280, 0, null, 0, "lightgrey", 0.9));
            group2.Children.Add(CreateNativeNode("inner_object2", 50, 80, 565, 200, "Production_Internal", null, null, 0, null));
            DiagramWebControl1.Model.Nodes.Add(group2);

            Group group3 = new Group() { Name = "group3" };
            group3.Children.Add(CreateNode("bigrect3", 230, 230, 800, 190, 0, null, 0, "whitesmoke", 1));
            group3.Children.Add(CreateNode("ellipse3", 110, 40, 750, 50, 0, "Bears", 20, "#FF7620", 1));
            group3.Children.Add(CreateNativeNode("smallrect3", 90, 90, 742, 200, "Production_Paint_Green", null, null, 0, null));
            group3.Children.Add(CreateNativeNode("flag3", 30, 45, 790, 110, "Production_CriticallyLow", null, null, 0, "white"));
            group3.Children.Add(CreateNativeNode("tick3", 35, 35, 880, 105, "Production_Down", null, null, 0, "white"));
            group3.Children.Add(CreateNativeNode("switch3", 25, 15, 880, 60, "Production_Optimal", null, null, 0, null));
            group3.Children.Add(CreateNode("rect3", 230, 45, 800, 280, 0, null, 0, "lightgrey", 0.9));
            group3.Children.Add(CreateNativeNode("inner_object3", 50, 80, 865, 200, "Production_Break", null, null, 0, null));
            DiagramWebControl1.Model.Nodes.Add(group3);

            Group group4 = new Group() { Name = "group4" };
            group4.Children.Add(CreateNode("bigrect4", 230, 230, 1100, 190, 0, null, 0, "whitesmoke", 1));
            group4.Children.Add(CreateNode("ellipse4", 130, 40, 1050, 50, 0, "Transmission", 20, "#FF7620", 1));
            group4.Children.Add(CreateNativeNode("smallrect4", 90, 90, 1042, 200, "Production_Paint_Green", null, null, 0, null));
            group4.Children.Add(CreateNativeNode("flag4", 30, 45, 1090, 110, "Production_CriticallyLow", null, null, 0, "white"));
            group4.Children.Add(CreateNativeNode("tick4", 35, 35, 1180, 105, "Production_Active", null, null, 0, "white"));
            group4.Children.Add(CreateNativeNode("switch4", 25, 15, 1180, 60, "Production_Optimal", null, null, 0, null));
            group4.Children.Add(CreateNode("rect4", 230, 45, 1100, 280, 0, null, 0, "lightgrey", 0.9f));
            group4.Children.Add(CreateNativeNode("inner_object4", 50, 80, 1165, 200, "Production_Transmission", null, null, 0, null));
            DiagramWebControl1.Model.Nodes.Add(group4);

            Group group5 = new Group() { Name = "group5" };
            group5.Children.Add(CreateNode("bigrect5", 230, 230, 560, 480, 0, null, 0, "whitesmoke", 1));
            group5.Children.Add(CreateNativeNode("smallrect5", 90, 90, 502, 490, "Production_Paint_Green", null, null, 0, null));
            group5.Children.Add(CreateNode("ellipse5", 130, 40, 500, 340, 0, "Engine filter", 20, "#FF7620", 1));
            group5.Children.Add(CreateNativeNode("flag5", 30, 45, 550, 400, "Production_CriticallyLow", null, null, 0, "white"));
            group5.Children.Add(CreateNativeNode("tick5", 35, 35, 650, 400, "Production_Down", null, null, 0, "white"));
            group5.Children.Add(CreateNativeNode("switch5", 25, 15, 645, 350, "Production_Optimal", null, null, 0, null));
            group5.Children.Add(CreateNativeNode("inner_object5", 50, 80, 623, 490, "Production_engineFitting", null, null, 0, null));
            DiagramWebControl1.Model.Nodes.Add(group5);

            Group group6 = new Group() { Name = "group6" };
            group6.Children.Add(CreateNode("bigrect6", 230, 230, 950, 480, 0, null, 0, "whitesmoke", 1));
            group6.Children.Add(CreateNativeNode("smallrect6", 90, 90, 892, 490, "Production_Paint_Green", null, null, 0, null));
            group6.Children.Add(CreateNode("ellipse6", 110, 40, 900, 340, 0, "Seats", 20, "#FF7620", 1));
            group6.Children.Add(CreateNativeNode("flag6", 30, 45, 947, 400, "Production_CriticallyLow", null, null, 0, "white"));
            group6.Children.Add(CreateNativeNode("tick6", 35, 35, 1030, 400, "Production_Active", null, null, 0, "white"));
            group6.Children.Add(CreateNativeNode("switch6", 25, 15, 1030, 350, "Production_Optimal", null, null, 0, null));
            group6.Children.Add(CreateNode("rect6", 227, 45, 950, 570, 0, null, 0, "lightgrey", 0.9));
            group6.Children.Add(CreateNativeNode("inner_object6", 50, 80, 1017, 490, "seat_Assembly", null, null, 0, null));
            DiagramWebControl1.Model.Nodes.Add(group6);

            Group group7 = new Group() { Name = "group7" };
            group7.Children.Add(CreateNode("bigrect7", 230, 230, 1320, 440, 0, null, 0, "whitesmoke", 1));
            group7.Children.Add(CreateNativeNode("smallrect7", 90, 90, 1380, 500, "Production_Paint_Yellow", null, null, 0, null));
            group7.Children.Add(CreateNode("ellipse7", 110, 40, 1315, 300, 0, "Interior", 20, "#FF7620", 1));
            group7.Children.Add(CreateNativeNode("flag7", 30, 45, 1410, 420, "Production_StockPiled", null, null, 0, "white"));
            group7.Children.Add(CreateNativeNode("tick7", 35, 35, 1407, 350, "Production_Down", null, null, 0, "white"));
            group7.Children.Add(CreateNativeNode("switch7", 25, 15, 1405, 310, "Production_Optimal", null, null, 0, null));
            group7.Children.Add(CreateNode("rect7", 45, 230, 1230, 440, 0, null, 0, "lightgrey", 0.9));
            group7.Children.Add(CreateNativeNode("inner_object7", 50, 80, 1295, 440, "Production_Internal", null, null, 0, null));
            DiagramWebControl1.Model.Nodes.Add(group7);

            Group group8 = new Group() { Name = "group8" };
            group8.Children.Add(CreateNode("bigrect8", 230, 230, 290, 700, 0, null, 0, "whitesmoke", 1));
            group8.Children.Add(CreateNativeNode("smallrect8", 90, 90, 230, 700, "Production_Panit_Red", null, null, 0, null));
            group8.Children.Add(CreateNode("ellipse8", 110, 40, 230, 560, 0, "Paint", 20, "#FF7620", 1));
            group8.Children.Add(CreateNativeNode("flag8", 30, 45, 260, 620, "Production_CriticallyLow", null, null, 0, "white"));
            group8.Children.Add(CreateNativeNode("tick8", 35, 35, 340, 620, "Production_Active", null, null, 0, "white"));
            group8.Children.Add(CreateNativeNode("switch8", 25, 15, 340, 573, "Production_Optimal", null, null, 0, null));
            group8.Children.Add(CreateNode("rect8", 230, 45, 560, 569, 0, null, 0, "lightgrey", 0.9));
            group8.Children.Add(CreateNativeNode("inner_object8", 50, 80, 320, 760, "paint_Assembly", null, null, 0, null));
            DiagramWebControl1.Model.Nodes.Add(group8);

            Group group9 = new Group() { Name = "group9" };
            group9.Children.Add(CreateNode("bigrect9", 230, 230, 540, 760, 0, null, 0, "whitesmoke", 1));
            group9.Children.Add(CreateNativeNode("smallrect9", 90, 90, 545, 750, "Production_QualityCheck", null, null, 0, null));
            group9.Children.Add(CreateNode("ellipse9", 135, 40, 490, 620, 0, "Quality check", 20, "#FF7620", 1));
            group9.Children.Add(CreateNode("rect9", 230, 45, 540, 850, 0, null, 0, "lightgrey", 1));
            group9.Children.Add(CreateNode("rect5", 45, 230, 380, 700, 0, null, 0, "lightgrey", 1));
            group9.Children.Add(CreateNativeNode("tick9", 35, 35, 620, 670, "Production_Active", null, null, 0, "white"));
            group9.Children.Add(CreateNativeNode("switch9", 25, 15, 620, 630, "Production_Optimal", null, null, 0, null));
            DiagramWebControl1.Model.Nodes.Add(group9);

            Group group10 = new Group() { Name = "group10" };
            group10.Children.Add(CreateDiagramNode("bigrect10", 510, 50, 1160, 900, "LEGEND", 0, 0, "#42b9f4"));
            group10.Children.Add(CreateDiagramNode("inventcount", 170, 220, 990, 1025, "Inventory count", 0.5f, 0.1f, null));
            group10.Children.Add(CreateDiagramNode("Stationstatus", 170, 220, 1160, 1025, "Status Section", 0.5f, 0.1f, null));
            group10.Children.Add(CreateDiagramNode("Processingtime", 170, 220, 1330, 1025, "Processing Time", 0.5f, 0.1f, null));
            DiagramWebControl1.Model.Nodes.Add(group10);

            Node node5 = CreateNativeNode("Production_Critically_Low", 30, 45, 930, 995, "Production_CriticallyLow", "Critical", "right", 0, "white");
            Node node6 = CreateNativeNode("Production_WithinLimits", 30, 45, 930, 1045, "Production_WithinLimits", "Within limit", "right", 0, "white");
            Node node7 = CreateNativeNode("Production_StockPiled", 30, 45, 930, 1095, "Production_StockPiled", "Stockpill", "right", 0, "white");
            Node node8 = CreateNativeNode("Production_Down", 35, 35, 1110, 995, "Production_Down", "Down", "right", 0, "white");
            Node node9 = CreateNativeNode("Production_Active", 35, 35, 1110, 1045, "Production_Active", "Active", "right", 0, "white");
            Node node10 = CreateNativeNode("Production_Optimal", 25, 15, 1270, 995, "Production_Optimal", "Optimal ", "right", 0, null);
            Node node11 = CreateNativeNode("Production_Non", 25, 15, 1270, 1040, "Production_Non", "Non-optimal ", "right", 0, null);

            Node node12 = CreateNode("Inventory", 40, 40, 50, 1000, BasicShapes.Ellipse, null, 0, null, 1);
            node12.FillColor = "#9ABEE8";
            Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label label1 = new Label() { Text = "Inventory", FontSize = 22, FontColor = "black", Bold = true, HorizontalAlignment = HorizontalAlignment.Left, Offset = new DiagramPoint() { X = 1.2f, Y = .5f }, Wrapping = TextWrapping.NoWrap };
            node12.Labels.Add(label1);

            Node node13 = CreateNode("StationStatus", 40, 40, 50, 1050, BasicShapes.Ellipse, null, 0, null, 1);
            node13.FillColor = "#9ABEE8";
            Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label label2 = new Label() { Text = "Station Status", FontSize = 22, FontColor = "black", Bold = true, HorizontalAlignment = HorizontalAlignment.Left, Offset = new DiagramPoint() { X = 1.2f, Y = .5f }, Wrapping = TextWrapping.NoWrap };
            node13.Labels.Add(label2);

            Node node14 = CreateNode("Assemblylinelayout", 40, 40, 50, 1100, BasicShapes.Ellipse, null, 0, null, 1);
            node14.FillColor = "#9ABEE8";
            Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label label3 = new Label() { Text = "Assembly Line Layout", FontSize = 22, FontColor = "black", Bold = true, HorizontalAlignment = HorizontalAlignment.Left, Offset = new DiagramPoint() { X = 1.2f, Y = .5f }, Wrapping = TextWrapping.NoWrap };
            node14.Labels.Add(label3);

            DiagramWebControl1.Model.Nodes.Add(node5);
            DiagramWebControl1.Model.Nodes.Add(node6);
            DiagramWebControl1.Model.Nodes.Add(node7);
            DiagramWebControl1.Model.Nodes.Add(node8);
            DiagramWebControl1.Model.Nodes.Add(node9);
            DiagramWebControl1.Model.Nodes.Add(node10);
            DiagramWebControl1.Model.Nodes.Add(node11);
            DiagramWebControl1.Model.Nodes.Add(node12);
            DiagramWebControl1.Model.Nodes.Add(node13);
            DiagramWebControl1.Model.Nodes.Add(node14);

            Connector connector1 = new Connector() { Name = "ortho", SourcePoint = new DiagramPoint() { X = 80, Y = 280 }, TargetPoint = new DiagramPoint() { X = 700, Y = 775 }, CornerRadius = 20, LineColor = "lightgrey", LineWidth = 40, TargetDecorator = { Shape = DecoratorShapes.None }, ZOrder = 0 };
            connector1.Segments.Add(new Segment() { Type = Segments.Orthogonal, Direction = "right", Length = 1150 });
            connector1.Segments.Add(new Segment() { Type = Segments.Orthogonal, Direction = "bottom", Length = 290 });
            connector1.Segments.Add(new Segment() { Type = Segments.Orthogonal, Direction = "left", Length = 850 });
            connector1.Segments.Add(new Segment() { Type = Segments.Orthogonal, Direction = "bottom", Length = 280 });
            connector1.Segments.Add(new Segment() { Type = Segments.Orthogonal, Direction = "right", Length = 300 });
            DiagramWebControl1.Model.Connectors.Add(connector1);
            DiagramWebControl1.Model.Create = "created";
            DiagramWebControl1.Model.Click = "click";
            DiagramWebControl1.Height = "650px";
            DiagramWebControl1.Width = "100%";
            DiagramWebControl1.PageSettings.ScrollLimit = ScrollLimit.Diagram;
            DiagramWebControl1.SnapSettings.SnapConstraints = SnapConstraints.None;
        }
        private Node CreateNode(string name, double width, double height, double offsetx, double offsety, BasicShapes shape, string text, double corner, string fillColor, double opacity)
        {
            BasicShape node = new BasicShape();
            node.Name = name;
            node.Width = width;
            node.Height = height;
            node.OffsetX = offsetx;
            node.OffsetY = offsety;
            node.FillColor = fillColor;
            node.CornerRadius = corner;
            node.Type = Shapes.Basic;
            node.BorderColor = "transparent";
            node.Opacity = opacity;
            Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label label = new Label() { Text = text, FontSize = 18, FontFamily = "segoe", FontColor = "white", Bold = true };
            node.Labels.Add(label);
            if (shape != null)
                node.Shape = shape;
            else
                node.Shape = BasicShapes.Rectangle;
            return node;
        }

        private Node CreateNativeNode(string name, double width, double height, double x, double y, string id, string text, string position, double angle, string border)
        {
            NativeNode node = new NativeNode();
            node.Name = name;
            node.Width = width;
            node.OffsetX = x;
            node.OffsetY = y;
            node.Height = height;
            node.TemplateId = id;
            node.RotateAngle = angle;
            node.Type = Shapes.Native;
            node.TemplateId = id;
            node.Scale = ScaleConstraints.Stretch;
            if (border != null)
                node.BorderColor = border;
            else
                node.BorderColor = "gray";
            string fontColor = "black";
            HorizontalAlignment horizontalAlignment = HorizontalAlignment.Center;
            Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label label = new Label() { Text = text, FontSize = 18, FontFamily = "segoe UI", FontColor = fontColor, Bold = true, HorizontalAlignment = horizontalAlignment, Wrapping = TextWrapping.NoWrap };
            if (position == "top")
                label.Offset = new DiagramPoint() { X = .5f, Y = -.45f };
            else if (position == "bottom")
                label.Offset = new DiagramPoint() { X = 0.5f, Y = 1.49f };
            if (position == "right")
            {
                label.Offset = new DiagramPoint() { X = 1.1f, Y = .5f };
                label.HorizontalAlignment = HorizontalAlignment.Left;
                label.FontColor = "black";
                label.FontSize = 18;
            }
            node.Labels.Add(label);
            return node;
        }

        private Node CreateDiagramNode(string name, int width, int height, double x, double y, string text, float labelX, float labelY, string fillColor)
        {
            BasicShape node = new BasicShape();
            node.Name = name;
            node.Width = width;
            node.Height = height;
            if (fillColor != null)
                node.FillColor = fillColor;
            node.OffsetX = x;
            node.OffsetY = y;
            Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label label = new Label() { Text = text, FontSize = 18, FontFamily = "segoe UI" };
            if (labelX != 0 && labelY != 0)
                label.Offset = new DiagramPoint() { X = labelX, Y = labelY };
            node.Labels.Add(label);
            return node;
        }
    }
}