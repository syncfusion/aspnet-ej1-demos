#region Copyright Syncfusion Inc. 2001-2020.
// Copyright Syncfusion Inc. 2001-2020. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.JavaScript.DataVisualization.DiagramEnums;
using Syncfusion.JavaScript.DataVisualization.Models;
using Syncfusion.JavaScript.DataVisualization.Models.Collections;
using Syncfusion.JavaScript.DataVisualization.Models.Diagram;
using Syncfusion.JavaScript.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Label = Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label;

namespace WebSampleBrowser.Dashboard
{
    public partial class DiagramBuilder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitializeDiagram();
                
                InitializePalette();
                pageBackgroundColor.Template = GetPageColorTemplate();
                pageBackgroundColor.DataSource = GetPageColorList();

                fillColor.Template = GetDefaultColorTemplate();
                fillColor.DataSource = GetDefaultColorList();

                borderColor.Template = GetDefaultColorTemplate();
                borderColor.DataSource = GetDefaultColorList();

                fontColor.Template = GetDefaultColorTemplate();
                fontColor.DataSource = GetDefaultColorList();

                lineColor.Template = GetDefaultColorTemplate();
                lineColor.DataSource = GetDefaultColorList();

                borderWidth.Template = GetBorderTemplate();
                borderWidth.DataSource = GetBorderList();

                lineWidth.Template = GetBorderTemplate();
                lineWidth.DataSource = GetBorderList();

                fontSize.DataSource = GetFontSizeList();
                fontStyle.DataSource = GetFontFamilyList();
             
                searchPalette.Height = "100%";
                searchPalette.Width = "100%";
                searchPalette.PaletteItemHeight = 45;
                searchPalette.PaletteItemWidth = 45;
                searchPalette.PreviewHeight = 100;
                searchPalette.PreviewWidth = 100;
                searchPalette.SelectedPaletteName = "Basic Shapes";
                searchPalette.ShowPaletteItemText = false;
                searchPalette.DiagramId = "DiagramContent";
                searchPalette.SelectedPaletteName = "filteredShapes";
                Palette palette = new Palette();
                palette.Name = "filteredShapes";
                searchPalette.Palettes.Add(palette);
                
            }
        }

        public string GetBorderTemplate()
        {

            return "<div style=\"margin-top: 3px; height: 25px\">" +
                    "<label style=\"font-weight: bold\">${text}</label>" +
                    "<div style=\"background-color: black; width: 45px; height: ${height};float: right; margin-top: 11px; margin-left: 20px; margin-right: 5px\"></div>" +
                    "</div>";
        }

        private string GetPageColorTemplate()
        {
            return "<div class=\"ddl-color-list\" style=\"background-color: ${color1};\"></div>"
                    + "<div class=\"ddl-color-list\" style=\"background-color: ${color2};\"></div>"
                    + "<div class=\"ddl-color-list\" style=\"background-color: ${color3};\"></div>"
                    + "<div class=\"ddl-color-list\" style=\"background-color: ${color4};\"></div>"
                    + "<div class=\"ddl-color-list\" style=\"background-color: ${color5};\"></div>"
                    + "<div class=\"ddl-color-list\" style=\"background-color: ${color6};\"></div>"
                    + "<div class=\"ddl-color-list\" style=\"background-color: ${color7};\"></div>"
                    + "<div class=\"ddl-color-list\" style=\"background-color: ${color8};\"></div>";
        }

        private string GetDefaultColorTemplate()
        {
            return "<div class=\"ddl-color-list\" style=\"background-color: ${color1};\"></div>"
                    + "<div class=\"ddl-color-list\" style=\"background-color: ${color2};\"></div>"
                    + "<div class=\"ddl-color-list\" style=\"background-color: ${color3};\"></div>"; 
        }

        private List<ColorList> GetDefaultColorList()
        {
            List<ColorList> colorList = new List<ColorList>()
            {
                new ColorList(){ color1= "#FFFFFF", color2="#F9D9D9", color3= "#FFE6CC" },
                new ColorList(){ color1= "#FFFF99", color2= "#CCFFCC", color3= "#CCFFFF" },
                new ColorList(){ color1= "#D4D4F9", color2= "#E5CCFF", color3= "#FFCCFF" },
                new ColorList(){ color1= "#FFCCE6", color2= "#E5E5E5", color3= "#FF9999" },
                new ColorList(){ color1= "#FCC088", color2= "#FFFF33", color3= "#99FF33" },
                new ColorList(){ color1= "#66FFFF", color2= "#7E7EFC", color3= "#CC99FF" },
                new ColorList(){ color1= "#FF99FF", color2= "#FF8000", color3= "#CCCC00" },
                new ColorList(){ color1= "#FF66B3", color2= "#262626", color3= "#FF0000" },
                new ColorList(){ color1= "#66CC00", color2= "#00CCCC", color3= "#3333FF" },
                new ColorList(){ color1= "#7F00FF", color2= "#FF00FF", color3= "#FF0080" }
            };
            return colorList;
        }
         private List<int> GetFontSizeList()
        {
         List<int> fontSize = new List<int>()
            {
                8,9,10,11,12,13,14,15,16,17,18,19,20
            };
             return fontSize;
         }
         private List<string> GetFontFamilyList()
         {
            List<string> fontStyle = new List<string>()
            {
                 "Arial","Aharoni","Bell MT","Fantasy","Times New Roman","Segoe UI","Verdana" 
            };
            return fontStyle;
         }

        private List<PageColorList> GetPageColorList()
        {
            List<PageColorList> pgColorList = new List<PageColorList>()
            {
                new PageColorList() { color1= "#FFFFFF", color2= "#F9D9D9", color3= "#FFE6CC", color4= "#FFFF99", color5= "#CCFFCC", color6= "#CCFFFF", color7= "#D4D4F9", color8= "#E5CCFF" },
                new PageColorList() { color1= "#FFCCFF", color2= "#FFCCE6", color3= "#E5E5E5", color4= "#FF9999", color5= "#FCC088", color6= "#FFFF33", color7= "#99FF33", color8= "#66FFFF" },
                new PageColorList() { color1= "#7E7EFC", color2= "#CC99FF", color3= "#FF99FF", color4= "#FF66B3", color5= "#262626", color6= "#FF0000", color7= "#FF8000", color8= "#CCCC00" },
                new PageColorList() { color1= "#66CC00", color2= "#00CCCC", color3= "#3333FF", color4= "#7F00FF", color5= "#FF00FF", color6= "#FF0080", color7= "#0C0C0C", color8= "#CC0000" },
                new PageColorList() { color1= "#994C00", color2= "#999900", color3= "#006600", color4= "#009999", color5= "#000066", color6= "#4C0099", color7= "#990099", color8= "#99004D" }
            };
            return pgColorList;
        }

        public List<BorderWidthList> GetBorderList()
        {
            List<BorderWidthList> borderList = new List<BorderWidthList>()
            {
                new BorderWidthList(){ text= "1 px", height= "1px" },
                new BorderWidthList(){ text= "2 px", height= "2px" },
                new BorderWidthList(){ text= "3 px", height= "3px" },
                new BorderWidthList(){ text= "4 px", height= "4px" },
                new BorderWidthList(){ text= "5 px", height= "5px" },
                new BorderWidthList(){ text= "6 px", height= "6px" },
                new BorderWidthList(){ text= "7 px", height= "7px" },
                new BorderWidthList(){ text= "8 px", height= "8px" }
            };
            return borderList;
        }

        private void InitializePalette()
        {
            symbolpalette.Height = "100%";
            symbolpalette.Width = "100%";
            symbolpalette.PaletteItemHeight = 45;
            symbolpalette.PaletteItemWidth = 45;
            symbolpalette.PreviewHeight = 100;
            symbolpalette.PreviewWidth = 100;
            symbolpalette.SelectedPaletteName = "Basic Shapes";
            symbolpalette.ShowPaletteItemText = false;
            symbolpalette.DiagramId = "DiagramContent";
            symbolpalette.Model.Palettes.Add(GenerateBasicShapes());
            symbolpalette.Model.Palettes.Add(GenerateFlowShapes());
            symbolpalette.Model.Palettes.Add(GenerateArrowShapes());
            symbolpalette.Model.Palettes.Add(GenerateElectricalShapes());
            symbolpalette.Model.Palettes.Add(GenerateBpmnShapes());
            symbolpalette.Model.Palettes.Add(GenerateConnectors());
            symbolpalette.Model.Palettes.Add(GenerateSwimLanes());
        }

        private void InitializeDiagram()
        {
            BasicShape manufacturing = CreateNode("manufacturing", 175, 60, 400, 60, "Manufacturing Tablet PC", "#05ADA4");
            manufacturing.Constraints = NodeConstraints.Default | NodeConstraints.AspectRatio;
            manufacturing.Shape = BasicShapes.Path;
            manufacturing.PathData = "M 269.711,29.3333C 269.711,44.061 257.772,56 243.044,56L 158.058,56C 143.33,56 131.391,44.061 131.391,29.3333L 131.391,29.3333C 131.391,14.6057 143.33,2.66669 158.058,2.66669L 243.044,2.66669C 257.772,2.66669 269.711,14.6057 269.711,29.3333 Z";
            AddPort(manufacturing);
            LabelMargin margin = new LabelMargin(0, 0, 0, 0);
            ((Label)manufacturing.Labels[0]).Margin = margin;

            BasicShape simProjection = CreateNode("simProjection", 100, 80, 400, 175, "Dual Sim \n Projection?", "#83A93F");
            simProjection.Shape = BasicShapes.Path;
            simProjection.PathData = "M 253.005,115.687L 200.567,146.071L 148.097,115.687L 200.534,85.304L 253.005,115.687 Z";
            AddPort(simProjection);
            margin = new LabelMargin(0, 0, 0, 0);
            ((Label)simProjection.Labels[0]).Margin = margin;

            BasicShape manufacturingProcess = CreateNode("manufacturingProcess", 100, 80, 400, 300, "Processor \n Installation", "#33AACA");
            AddPort(manufacturingProcess);
            margin = new LabelMargin(0, 0, 0, 0);
            ((Label)manufacturingProcess.Labels[0]).Margin = margin;

            BasicShape dualSim = CreateNode("dualSim", 120, 60, 600, 175, "Single Sim \n Projection \n Added", "#F1605A");
            AddPort(dualSim);
            margin = new LabelMargin(0, 0, 0, 0);
            ((Label)dualSim.Labels[0]).Margin = margin;

            BasicShape touch = CreateNode("touch", 130, 120, 400, 445, "Capacitive\n Touch?", "#83A93F");
            touch.Shape = BasicShapes.Path;
            touch.PathData = "M 253.473,337.392L 200.551,390.313L 147.629,337.392L 200.551,284.47L 253.473,337.392 Z";
            AddPort(touch);
            margin = new LabelMargin(0, 30, 30, 0);
            ((Label)touch.Labels[0]).Margin = margin;

            BasicShape capacitiveTouch = CreateNode("capacitiveTouch", 120, 60, 200, 445, "Capacitive Touch \n Functionalities", "#33AACA");
            AddPort(capacitiveTouch);

            BasicShape resistiveTouch = CreateNode("resistiveTouch", 120, 60, 600, 445, "Resistive Touch \n Functionalities", "#F1605A");
            AddPort(resistiveTouch);
            margin = new LabelMargin(0, 0, 0, 0);
            ((Label)resistiveTouch.Labels[0]).Margin = margin;

            BasicShape standards = CreateNode("standards", 100, 80, 400, 575, "Maintaining \n Standards", "#33AACA");
            AddPort(standards);

            BasicShape price = CreateNode("price", 100, 80, 400, 720, "Fixing Price", "#33AACA");
            AddPort(price);

            BasicShape selling = CreateNode("selling", 135, 60, 400, 850, "Selling Process", "#05ADA4");
            selling.Shape = BasicShapes.Path;
            selling.PathData = "M 269.711,29.3333C 269.711,44.061 257.772,56 243.044,56L 158.058,56C 143.33,56 131.391,44.061 131.391,29.3333L 131.391,29.3333C 131.391,14.6057 143.33,2.66669 158.058,2.66669L 243.044,2.66669C 257.772,2.66669 269.711,14.6057 269.711,29.3333 Z";
            AddPort(selling);
            margin = new LabelMargin(0, 0, 0, 0);
            ((Label)selling.Labels[0]).Margin = margin;



            DiagramContent.PageSettings.PageWidth = 1100;
            DiagramContent.PageSettings.PageHeight = 1200;
            DiagramContent.PageSettings.ShowPageBreak = false;
            DiagramContent.PageSettings.MultiplePage = true;
            DiagramContent.PageSettings.ScrollLimit = ScrollLimit.Infinity;
            List<decimal> intervals = new List<decimal>();
            intervals.Add(.95m);
            intervals.Add(9.05m);
            intervals.Add(0.2m);
            intervals.Add(9.75m);
            DiagramContent.Model.SnapSettings.HorizontalGridlines = new Syncfusion.JavaScript.DataVisualization.Models.Diagram.GridLines();
            DiagramContent.Model.SnapSettings.HorizontalGridlines.SnapInterval.Add(10);
            DiagramContent.Model.SnapSettings.HorizontalGridlines.LinesInterval = intervals;
            DiagramContent.Model.SnapSettings.VerticalGridlines = new Syncfusion.JavaScript.DataVisualization.Models.Diagram.GridLines();
            DiagramContent.Model.SnapSettings.VerticalGridlines.SnapInterval.Add(10);
            DiagramContent.Model.SnapSettings.VerticalGridlines.LinesInterval = intervals;
            DiagramContent.ShowTooltip = true;
            DiagramContent.Model.Nodes.Add(manufacturing);
            DiagramContent.Model.Nodes.Add(simProjection);
            DiagramContent.Model.Nodes.Add(manufacturingProcess);
            DiagramContent.Model.Nodes.Add(dualSim);
            DiagramContent.Model.Nodes.Add(touch);
            DiagramContent.Model.Nodes.Add(capacitiveTouch);
            DiagramContent.Model.Nodes.Add(resistiveTouch);
            DiagramContent.Model.Nodes.Add(standards);
            DiagramContent.Model.Nodes.Add(price);
            DiagramContent.Model.Nodes.Add(selling);
            DiagramContent.Model.SnapSettings.SnapConstraints = SnapConstraints.All & ~SnapConstraints.SnapToLines;


            DiagramContent.OnClientDrop = "drop";
            DiagramContent.OnClientDragEnter = "dragEnter";
            DiagramContent.OnClientSelectionChange = "selectionChange";
            DiagramContent.OnClientNodeCollectionChange = "nodeCollectionChange";
            DiagramContent.OnClientTextChange = "textChange";
            DiagramContent.OnClientDrag = "drag";
            DiagramContent.OnClientSizeChange = "nodeSizeChanging";
            DiagramContent.OnClientConnectorCollectionChange = "connectorCollectionChange";
            DiagramContent.OnClientCreate = "create";
            var labels = new Collection();
            labels.Add(new Label() { FillColor = "white" });
            DiagramContent.Model.DefaultSettings.Connector = new Connector() { CornerRadius = 10, Labels = labels };
            DiagramContent.Model.DefaultSettings.Node = new Node()
            {
                Ports = new Collection(){
                   new Port() { Name= "porta", Offset = new DiagramPoint() {X= 0,Y= 0.5f} },
                   new Port() { Name= "portb",Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                   new Port() { Name= "portc" ,Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
                   new Port() { Name= "portd", Offset = new DiagramPoint() {X= 0.5f,Y= 1 } }
                }
            };
            DiagramContent.ContextMenu = new DiagramContextMenu()
            {
                Items = CustomContextMenuItem()
            };
            DiagramContent.OnClientContextMenuBeforeOpen = "contextMenuBeforeOpen";
            DiagramContent.OnClientContextMenuClick = "contextMenuClick";
            CreateConnector(manufacturing, simProjection, "", "dport", "bport");
            CreateConnector(simProjection, manufacturingProcess, "Yes", "dport", "bport");
            CreateConnector(simProjection, dualSim, "No", "cport", "aport");
            CreateConnector(dualSim, manufacturingProcess, "", "dport", "cport");
            CreateConnector(manufacturingProcess, touch, "", "dport", "bport");
            CreateConnector(touch, capacitiveTouch, "Yes", "aport", "cport");
            CreateConnector(touch, resistiveTouch, "No", "cport", "aport");
            CreateConnector(capacitiveTouch, standards, "", "dport", "aport");
            CreateConnector(resistiveTouch, standards, "", "dport", "cport");
            CreateConnector(standards, price, "", "dport", "bport");
            CreateConnector(price, selling, "", "dport", "bport");

        }
        public List<ContextMenuItem> CustomContextMenuItem()
        {
            List<ContextMenuItem> items = new List<ContextMenuItem>();
            items.Add(new ContextMenuItem()
            {
                Name = "eventType",
                Text = "Event Type",
                CssClass = "cm-no-image",
                SubItems = new List<ContextMenuItem>()
                {
                    createMenuItem("interruptingStart", "Interrupting Start"),
                    createMenuItem("nonInterruptingStart", "NonInterrupting Start"),
                    createMenuItem("interruptingIntermediate", "Interrupting Intermediate"),
                    createMenuItem("nonInterruptingIntermediate", "NonInterrupting Intermediate"),
                    createMenuItem("throwingIntermediate", "Throwing Intermediate"),
                    createMenuItem("endEvent", "End")
                }
            });
            items.Add(new ContextMenuItem()
            {
                Name = "triggerResult",
                Text = "Trigger Result",
                CssClass = "cm-no-image",
                SubItems = new List<ContextMenuItem>() {
                    createMenuItem("noTrigger", "None"),
                    createMenuItem("messageTrigger", "Message"),
                    createMenuItem("timerTrigger", "Timer"),
                    createMenuItem("errorTrigger", "Error"),
                    createMenuItem("escalationTrigger", "Escalation"),
                    createMenuItem("cancelTrigger", "Cancel"),
                    createMenuItem("compensationTrigger", "Compensation"),
                    createMenuItem("conditionalTrigger", "Conditional"),
                    createMenuItem("linkTrigger", "Link"),
                    createMenuItem("signalTrigger", "Signal"),
                    createMenuItem("terminateTrigger", "Terminate"),
                    createMenuItem("multipleTrigger", "Multiple"),
                    createMenuItem("parallelTrigger", "Parallel")
                }
            });
            items.Add(new ContextMenuItem()
            {
                Name = "gateway",
                Text = "Gateway",
                CssClass = "cm-no-image",
                SubItems = new List<ContextMenuItem>() {
                    createMenuItem("noGateway", "None"),
                    createMenuItem("exclusiveGateway", "Exclusive"),
                    createMenuItem("parallelGateway", "Parallel"),
                    createMenuItem("inclusiveGateway", "Inclusive"),
                    createMenuItem("complexGateway", "Complex"),
                    createMenuItem("eventBasedGateway", "Event Based"),
                    createMenuItem("exclusiveeventbased", "Exclusive Event Based"),
                    createMenuItem("paralleleventbased", "Parallel Event Based")
                }
            });
            items.Add(new ContextMenuItem()
            {
                Name = "dataObject",
                Text = "Data Object",
                CssClass = "cm-no-image",
                SubItems = new List<ContextMenuItem>() {
                    createMenuItem("noDataObject", "None"),
                    createMenuItem("input", "Input"),
                    createMenuItem("output", "Output")
                }
            });
            items.Add(new ContextMenuItem()
            {
                Name = "collection",
                Text = "Collection",
                CssClass = "cm-no-image",
                SubItems = new List<ContextMenuItem>() {
                    createMenuItem("noDataObject", "None"),
                    createMenuItem("collection1", "Collection")
                }
            });
            items.Add(new ContextMenuItem()
            {
                Name = "loop",
                Text = "loop",
                CssClass = "cm-no-image",
                SubItems = new List<ContextMenuItem>() {
                    createMenuItem("none", "None"),
                    createMenuItem("standardLoop", "Standard"),
                    createMenuItem("parallelMultiInstanceLoop", "Parallel Multi-Instance"),
                    createMenuItem("sequenceMultiInstanceLoop", "Sequence Multi-Instance")
                }
            });
            items.Add(new ContextMenuItem()
            {
                Name = "taskType",
                Text = "Task Type",
                CssClass = "cm-no-image",
                SubItems = new List<ContextMenuItem>() {
                    createMenuItem("none", "None"),
                    createMenuItem("serviceTask", "Service"),
                    createMenuItem("receiveTask", "Receive"),
                    createMenuItem("sendTask", "Send"),
                    createMenuItem("instantiatingReceiveTask", "Instantiating Receive"),
                    createMenuItem("manualTask", "Manual"),
                    createMenuItem("businessRuleTask", "Business Rule"),
                    createMenuItem("userTask", "User"),
                    createMenuItem("scriptTask", "Script")
                }
            });
            items.Add(new ContextMenuItem()
            {
                Name = "subProcessType",
                Text = "SubProcess Type",
                CssClass = "cm-no-image",
                SubItems = new List<ContextMenuItem>() {
                    createMenuItem("none", "Default"),
                    createMenuItem("event", "Event"),
                    createMenuItem("transaction", "Transaction")
                }
            });
            items.Add(new ContextMenuItem()
            {
                Name = "adhoc",
                Text = "Ad-Hoc",
                CssClass = "cm-no-image",
                SubItems = new List<ContextMenuItem>() {
                    createMenuItem("none", "Nones"),
                    createMenuItem("adhoc1", "Ad-Hoc")
                }
            });
            items.Add(new ContextMenuItem()
            {
                Name = "compensation",
                Text = "Compensation",
                CssClass = "cm-no-image",
                SubItems = new List<ContextMenuItem>() {
                    createMenuItem("none", "None"),
                    createMenuItem("compensation1", "Compensation")
                }
            });
            items.Add(new ContextMenuItem()
            {
                Name = "activityType",
                Text = "Activity Type",
                CssClass = "cm-no-image",
                SubItems = new List<ContextMenuItem>() {
                    createMenuItem("task", "Task"),
                    createMenuItem("collapsedSubProcess", "Collapsed Sub-Process")
                }
            });
            items.Add(new ContextMenuItem()
            {
                Name = "taskCall",
                Text = "Call",
                CssClass = "cm-no-image",
                SubItems = new List<ContextMenuItem>() {
                    createMenuItem("none", "None"),
                    createMenuItem("call", "Call")
                }
            });
            items.Add(new ContextMenuItem()
            {
                Name = "boundary",
                Text = "Boundary",
                CssClass = "cm-no-image",
                SubItems = new List<ContextMenuItem>() {
                    createMenuItem("defaultBoundary", "Default"),
                    createMenuItem("callBoundary", "Call"),
                    createMenuItem("eventBoundary", "Event")
                }
            });
            return items;
        }

        public ContextMenuItem createMenuItem(string name, string text)
        {
            ContextMenuItem item = new ContextMenuItem();
            item.Text = text;
            item.Name = name;
            item.ImageUrl = "../Content/DiagramBuilder/images/" + name + ".png";
            item.CssClass = "cm-image-size";
            return item;
        }


        public void AddPort(Node node, string name, float x, float y)
        {
            Port port = new Port();
            port.Name = name;
            port.Offset = new DiagramPoint(x, y);
            node.Ports.Add(port);
        }

        public void AddPort(Node node)
        {
            AddPort(node, "aport", 0, 0.5f);
            AddPort(node, "bport", 0.5f, 0);
            AddPort(node, "cport", 1, 0.5f);
            AddPort(node, "dport", 0.5f, 1);

        }

        public Palette GenerateBasicShapes()
        {
            Palette basicShapes = new Palette("Basic Shapes");
            NodeConstraints constraints = NodeConstraints.Default | NodeConstraints.AspectRatio;
            basicShapes.Expanded = true;
            basicShapes.TemplateId = "svgTemplate";
            basicShapes.AddInfo = new Dictionary<string, object>();
            (basicShapes.AddInfo as Dictionary<string, object>).Add("source", "../Content/DiagramBuilder/images/basic.png");

            Node triangle = CreateNodes("Triangle", BasicShapes.Triangle, null);
            triangle.Ports.Add(CreatePort("port1", 0.5f, 0));
            triangle.Ports.Add(CreatePort("port2", 0, 1));
            triangle.Ports.Add(CreatePort("port3", 1, 1));

            Node ellipse = CreateNodes("Ellipse", BasicShapes.Ellipse, null);
            ellipse.Ports.Add(CreatePort("port1", 0, 0.5f));
            ellipse.Ports.Add(CreatePort("port2", 0.5f, 0));
            ellipse.Ports.Add(CreatePort("port3", 1, 0.5f));
            ellipse.Ports.Add(CreatePort("port3", 0.5f, 1));

            Node rectangle = CreateNodes("Rectangle", BasicShapes.Rectangle, null);
            rectangle.Ports.Add(CreatePort("port1", 0, 0.5f));
            rectangle.Ports.Add(CreatePort("port2", 0, 0.3f));
            rectangle.Ports.Add(CreatePort("port3", 0, 0.7f));

            rectangle.Ports.Add(CreatePort("port4", 0.5f, 0));
            rectangle.Ports.Add(CreatePort("port5", 0.3f, 0));
            rectangle.Ports.Add(CreatePort("port6", 0.7f, 0));

            rectangle.Ports.Add(CreatePort("port7", 1, 0.5f));
            rectangle.Ports.Add(CreatePort("port8", 1, 0.3f));
            rectangle.Ports.Add(CreatePort("port9", 1, 0.7f));

            rectangle.Ports.Add(CreatePort("port10", 0.5f, 1));
            rectangle.Ports.Add(CreatePort("port11", 0.3f, 1));
            rectangle.Ports.Add(CreatePort("port12", 0.7f, 1));

            Node plus = CreateNodes("Plus", BasicShapes.Plus, null);
            plus.Ports.Add(CreatePort("port1", 0, 0.5f));
            plus.Ports.Add(CreatePort("port2", 0.5f, 0));
            plus.Ports.Add(CreatePort("port3", 1, 0.5f));
            plus.Ports.Add(CreatePort("port4", 0.5f, 1));

            Node star = CreateNodes("Star", BasicShapes.Star, null);
            star.Ports.Add(CreatePort("port1", 0.5f, 0));
            star.Ports.Add(CreatePort("port2", 0, 0.39f));
            star.Ports.Add(CreatePort("port3", 1, 0.39f));
            star.Ports.Add(CreatePort("port4", 0.2f, 1));
            star.Ports.Add(CreatePort("port5", 0.8f, 1));

            Node rightTriangle = CreateNodes("RightTriangle", BasicShapes.RightTriangle, null);
            rightTriangle.Ports.Add(CreatePort("port1", 0.5f, 0.5f));
            rightTriangle.Ports.Add(CreatePort("port2", 0, 0));
            rightTriangle.Ports.Add(CreatePort("port3", 1, 1));
            rightTriangle.Ports.Add(CreatePort("port4", 0, 1));
            rightTriangle.Ports.Add(CreatePort("port5", 0.3f, 0.7f));

            Node diamond = CreateNodes("Diamond", "M 397.784,287.875L 369.5,316.159L 341.216,287.875L 369.5,259.591L 397.784,287.875 Z", null, 40, 40);
            diamond.Ports.Add(CreatePort("port1", 0.5f, 0));
            diamond.Ports.Add(CreatePort("port2", 0, 0.5f));
            diamond.Ports.Add(CreatePort("port3", 1, 0.5f));
            diamond.Ports.Add(CreatePort("port4", 0.5f, 1));

            Node pentagon = CreateNodes("Pentagon", BasicShapes.Pentagon, null);
            pentagon.Ports.Add(CreatePort("port1", 0.5f, 0));
            pentagon.Ports.Add(CreatePort("port2", 0, 0.35f));
            pentagon.Ports.Add(CreatePort("port3", 1, 0.35f));
            pentagon.Ports.Add(CreatePort("port4", 0.2f, 1));
            pentagon.Ports.Add(CreatePort("port5", 0.8f, 1));

            Node heptagon = CreateNodes("Heptagon", BasicShapes.Heptagon, null);
            heptagon.Ports.Add(CreatePort("port1", 0.5f, 0));
            heptagon.Ports.Add(CreatePort("port2", 0.12f, 0.2f));
            heptagon.Ports.Add(CreatePort("port3", 0.88f, 0.2f));
            heptagon.Ports.Add(CreatePort("port4", 0f, 0.62f));
            heptagon.Ports.Add(CreatePort("port7", 1, 0.62f));
            heptagon.Ports.Add(CreatePort("port5", 0.25f, 1));
            heptagon.Ports.Add(CreatePort("port6", 0.75f, 1));

            Node octagon = CreateNodes("Octagon", BasicShapes.Octagon, null);
            octagon.Ports.Add(CreatePort("port1", 0, 0.5f));
            octagon.Ports.Add(CreatePort("port2", 0, 0.3f));
            octagon.Ports.Add(CreatePort("port3", 0, 0.7f));

            octagon.Ports.Add(CreatePort("port4", 0.5f, 0));
            octagon.Ports.Add(CreatePort("port5", 0.3f, 0));
            octagon.Ports.Add(CreatePort("port6", 0.7f, 0));

            octagon.Ports.Add(CreatePort("port7", 1, 0.5f));
            octagon.Ports.Add(CreatePort("port8", 1, 0.3f));
            octagon.Ports.Add(CreatePort("port9", 1, 0.7f));

            octagon.Ports.Add(CreatePort("port10", 0.5f, 1));
            octagon.Ports.Add(CreatePort("port11", 0.3f, 1));
            octagon.Ports.Add(CreatePort("port12", 0.7f, 1));

            Node decagon = CreateNodes("Decagon", BasicShapes.Decagon, null);
            decagon.Ports.Add(CreatePort("port1", 0, 0.5f));
            decagon.Ports.Add(CreatePort("port2", 0.5f, 0));
            decagon.Ports.Add(CreatePort("port3", 1, 0.5f));
            decagon.Ports.Add(CreatePort("port4", 0.5f, 1));
            decagon.Ports.Add(CreatePort("port5", 0.1f, 0.18f));
            decagon.Ports.Add(CreatePort("port6", 1 - .1f, .18f));
            decagon.Ports.Add(CreatePort("port7", .1f, 1 - .18f));
            decagon.Ports.Add(CreatePort("port8", 1 - .1f, 1 - .18f));

            Node trapeZoid = CreateNodes("Trapezoid", BasicShapes.Trapezoid, null);
            trapeZoid.Ports.Add(CreatePort("port1", 0.17f, 0.7f));
            trapeZoid.Ports.Add(CreatePort("port2", 0.075f, .3f));
            trapeZoid.Ports.Add(CreatePort("port3", 0.125f, .5f));

            trapeZoid.Ports.Add(CreatePort("port4", 0.5f, 0));
            trapeZoid.Ports.Add(CreatePort("port5", 0.3f, 0));
            trapeZoid.Ports.Add(CreatePort("port6", 0.7f, 0));

            trapeZoid.Ports.Add(CreatePort("port7", 1 - 0.17f, 0.7f));
            trapeZoid.Ports.Add(CreatePort("port8", 1 - 0.075f, 0.3f));
            trapeZoid.Ports.Add(CreatePort("port9", 1 - 0.125f, 0.5f));

            trapeZoid.Ports.Add(CreatePort("port10", 0.5f, 1));
            trapeZoid.Ports.Add(CreatePort("port11", 0.3f, 1));
            trapeZoid.Ports.Add(CreatePort("port12", 0.7f, 1));

            Node cylinder = CreateNodes("Cylinder", BasicShapes.Cylinder, null);
            cylinder.Ports.Add(CreatePort("port1", 0, 0.5f));
            cylinder.Ports.Add(CreatePort("port2", 0, 0.3f));
            cylinder.Ports.Add(CreatePort("port3", 0, 0.7f));
            cylinder.Ports.Add(CreatePort("port4", 0.5f, 0));
            cylinder.Ports.Add(CreatePort("port5", 0.3f, 0));
            cylinder.Ports.Add(CreatePort("port6", 0.7f, 0));
            cylinder.Ports.Add(CreatePort("port7", 1, 0.5f));
            cylinder.Ports.Add(CreatePort("port8", 1, 0.3f));
            cylinder.Ports.Add(CreatePort("port9", 1, 0.7f));
            cylinder.Ports.Add(CreatePort("port10", 0.5f, 1));
            cylinder.Ports.Add(CreatePort("port11", 0.3f, 1));
            cylinder.Ports.Add(CreatePort("port12", 0.7f, 1));

            Node parallelogram = CreateNodes("Parallelogram", "M 10 0 L 40 0 L 30 40 L 0 40 Z", null);
            parallelogram.Ports.Add(CreatePort("port1", 0.4f, 0));
            parallelogram.Ports.Add(CreatePort("port2", 0.6f, 0));
            parallelogram.Ports.Add(CreatePort("port3", 0.8f, 0));
            parallelogram.Ports.Add(CreatePort("port4", 0.2f, 1));
            parallelogram.Ports.Add(CreatePort("port5", 0.4f, 1));
            parallelogram.Ports.Add(CreatePort("port6", 0.6f, 1));

            Node hexagon = CreateNodes("Hexagon", "M374.5103,299.8633L359.5103,273.8833L374.5103,247.9013L404.5103,247.9013L419.5103,273.8833L404.5103,299.8633L374.5103,299.8633z", null);
            hexagon.Ports.Add(CreatePort("port1", 0.26f, 0));
            hexagon.Ports.Add(CreatePort("port2", 0.74f, 0));
            hexagon.Ports.Add(CreatePort("port3", 0, 0.5f));
            hexagon.Ports.Add(CreatePort("port4", 1, 0.5f));
            hexagon.Ports.Add(CreatePort("port5", 0.26f, 1));
            hexagon.Ports.Add(CreatePort("port6", 0.74f, 1));

            Node row = CreateNodes("Row", "M 0 0 L 10 0 L 10 40 L 0 40 L 0 0 L 0 0 L 40 0 L 40 10 L 0 10 L 0 0 L 0 0 L 10 0 L 10 10 L 40 10 L 40 40 L 10 40 L 10 10 L 0 10 L 0 0 Z", null);
            row.Ports.Add(CreatePort("port1", 0.5f, 0.5f));

            Node column = CreateNodes("Column", "M 0 0 L 10 0 L 10 40 L 0 40 L 0 0 L 10 0 L 30 0 L 30 40 L 10 40 L 10 0 L 30 0 L 40 0 L 40 40 L 30 40 L 30 0 Z", null);
            column.Ports.Add(CreatePort("port1", 0.5f, 0.5f));

            Node twosideFlatCorner = CreateNodes1("TwoSideFlatCorner", "M 60 40 H 10.7 C 6.5 35.8 4.2 33.5 0 29.3 V 0 h 49.3 c 4.2 4.2 6.5 6.5 10.7 10.7 V 40 Z", null, 40, 25);
            twosideFlatCorner.Height = 30;
            twosideFlatCorner.Ports.Add(CreatePort("port1", 0.5f, 0));
            twosideFlatCorner.Ports.Add(CreatePort("port2", 0, 0.5f));
            twosideFlatCorner.Ports.Add(CreatePort("port3", 1, 0.5f));
            twosideFlatCorner.Ports.Add(CreatePort("port4", 0.5f, 1));

            Node twosideRoundedCorner = CreateNodes1("TwoSideRoundedCorner", "M 60 40 H 10.7 C 4.8 40 0 35.2 0 29.3 V 0 h 49.3 C 55.2 0 60 4.8 60 10.7 V 40 Z", null, 40, 25);
            twosideRoundedCorner.Height = 30;
            twosideRoundedCorner.Ports.Add(CreatePort("port1", 0.5f, 0));
            twosideRoundedCorner.Ports.Add(CreatePort("port2", 0, 0.5f));
            twosideRoundedCorner.Ports.Add(CreatePort("port3", 1, 0.5f));
            twosideRoundedCorner.Ports.Add(CreatePort("port4", 0.5f, 1));

            BasicShape roundedRectangle = CreateNodes("RRectangle", BasicShapes.Rectangle, null);
            roundedRectangle.CornerRadius = 5;
            roundedRectangle.Constraints = constraints;
            roundedRectangle.Ports.Add(CreatePort("port1", 0.5f, 0));
            roundedRectangle.Ports.Add(CreatePort("port2", 0, 0.5f));
            roundedRectangle.Ports.Add(CreatePort("port3", 1, 0.5f));
            roundedRectangle.Ports.Add(CreatePort("port4", 0.5f, 1));

            basicShapes.AppendChild(rectangle);
            basicShapes.AppendChild(ellipse);
            basicShapes.AppendChild(triangle);
            basicShapes.AppendChild(rightTriangle);
            basicShapes.AppendChild(diamond);
            basicShapes.AppendChild(pentagon);
            basicShapes.AppendChild(hexagon);
            basicShapes.AppendChild(heptagon);
            basicShapes.AppendChild(octagon);
            basicShapes.AppendChild(decagon);
            basicShapes.AppendChild(parallelogram);
            basicShapes.AppendChild(trapeZoid);
            basicShapes.AppendChild(twosideFlatCorner);
            basicShapes.AppendChild(twosideRoundedCorner);
            basicShapes.AppendChild(roundedRectangle);
            basicShapes.AppendChild(cylinder);
            basicShapes.AppendChild(plus);
            basicShapes.AppendChild(star);
            basicShapes.AppendChild(column);
            basicShapes.AppendChild(row);
            return basicShapes;
        }

        public Palette GenerateFlowShapes()
        {
            Palette flowShapes = new Palette("Flowchart Shapes");
            flowShapes.Expanded = false;
            flowShapes.TemplateId = "svgTemplate";
            flowShapes.AddInfo = new Dictionary<string, object>();
            (flowShapes.AddInfo as Dictionary<string, object>).Add("source", "../Content/DiagramBuilder/images/flow.png");
            NodeConstraints constraints = NodeConstraints.Default | NodeConstraints.AspectRatio;
            var random = new Random();
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "process",
                Width = 40,
                Height = 20,
                OffsetX = 20,
                OffsetY = 20,
                FillColor = "white",
                BorderWidth = 1.5,
                Type = Shapes.Flow,
                Shape = FlowShapes.Process,
                Ports = new Collection(){ 
                           new Port(){ Name= "process"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f} }, 
                           new Port(){Name= "process"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.3f} }, 
                           new Port(){Name= "Rectangle" + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.7f} },
                           new Port() { Name= "process"  + random.Next(100), Offset = new DiagramPoint() { Y= 0, X= 0.5f} }, new Port(){Name= "process"  + random.Next(100), Offset = new DiagramPoint() { Y= 0, X= 0.3f} }, new Port(){Name= "Rectangle"  + random.Next(100), Offset = new DiagramPoint() { Y= 0, X= 0.7f} },
                           new Port() { Name= "process"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} }, new Port(){Name= "process"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.3f} }, new Port(){Name= "Rectangle"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.7f} },
                           new Port() { Name= "process"  + random.Next(100), Offset = new DiagramPoint() { Y= 1, X= 0.5f} }, new Port(){Name= "process"  + random.Next(100), Offset = new DiagramPoint() { Y= 1, X= 0.3f} }, 
                           new Port(){Name= "Rectangle"  + random.Next(100), Offset = new DiagramPoint() { Y= 1, X= 0.7f } }}
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "Decision",
                Width = 40,
                Height = 35,
                OffsetX = 20,
                OffsetY = 20,
                FillColor = "white",
                BorderWidth = 1.5,
                Type = Shapes.Flow,
                Shape = FlowShapes.Decision,
                Ports = new Collection(){ new Port(){ Name= "Decision"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f} },
                           new Port() { Name= "Decision"  + random.Next(100), Offset = new DiagramPoint() { Y= 0, X= 0.5f} },
                           new Port() { Name= "Decision"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
                           new Port() { Name= "Decision"  + random.Next(100), Offset = new DiagramPoint() { Y= 1, X= 0.5f } }}
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "Document",
                Width = 40,
                Height = 30,
                OffsetX = 20,
                OffsetY = 15,
                FillColor = "white",
                BorderWidth = 1.5,
                Type = Shapes.Flow,
                Shape = FlowShapes.Document,
                Ports = new Collection(){ new Port(){ Name= "Document"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0} },
                           new Port() { Name= "Document"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                           new Port() { Name= "Document"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0} },
                           new Port() { Name= "Document"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
                           new Port() { Name= "Document"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 1} },
                           new Port() { Name= "Document"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1} },
                           new Port() { Name= "Document"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 1} },
                           new Port() { Name= "Document"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f } }}
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "DirectData",
                Width = 40,
                Height = 30,
                OffsetX = 20,
                OffsetY = 15,
                FillColor = "white",
                Constraints = constraints,
                BorderWidth = 1.5,
                Type = Shapes.Flow,
                Shape = FlowShapes.DirectData,
                Ports = new Collection(){
                           new Port() { Name= "DirectData"  + random.Next(100), Offset = new DiagramPoint() {X= 0.1f,Y= 0} },
                           new Port() { Name= "DirectData"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                           new Port() { Name= "DirectData"  + random.Next(100), Offset = new DiagramPoint() {X= 0.9f,Y= 0} },
                           new Port() { Name= "DirectData"  + random.Next(100), Offset = new DiagramPoint() {X= 0.9f,Y= 1} },
                           new Port() { Name= "DirectData"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1} },
                           new Port() { Name= "DirectData"  + random.Next(100), Offset = new DiagramPoint() {X= 0.1f,Y= 1} },
                           new Port() { Name= "DirectData"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f} },
                           new Port() { Name= "DirectData"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
                       }
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "SequentialData",
                Width = 40,
                Height = 40,
                OffsetX = 20,
                OffsetY = 20,
                FillColor = "white",
                BorderWidth = 1.5,
                Type = Shapes.Flow,
                Shape = FlowShapes.SequentialData,
                Ports = new Collection(){
                           new Port() { Name= "SequentialData"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                           new Port() { Name= "SequentialData"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
                           new Port() { Name= "SequentialData"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1} },
                           new Port() { Name= "SequentialData"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f} },
                           new Port() { Name= "SequentialData"  + random.Next(100), Offset = new DiagramPoint() {X= 0.152f,Y= 0.15f} },
                           new Port() { Name= "SequentialData"  + random.Next(100), Offset = new DiagramPoint() {X= 0.815f,Y= 0.15f} },
                           new Port() { Name= "SequentialData"  + random.Next(100), Offset = new DiagramPoint() {X= 0.815f,Y= 0.85f} },
                           new Port() { Name= "SequentialData"  + random.Next(100), Offset = new DiagramPoint() {X= 0.152f,Y= 0.85f} },
                           new Port() { Name= "SequentialData"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 1} }
                       }
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "Sort",
                Width = 40,
                Height = 40,
                OffsetX = 20,
                OffsetY = 20,
                FillColor = "white",
                BorderWidth = 1.5,
                Type = Shapes.Flow,
                Shape = FlowShapes.Sort,
                Ports = new Collection(){
                           new Port() { Name= "Sort"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                           new Port() { Name= "Sort"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
                           new Port() { Name= "Sort"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1} },
                           new Port() { Name= "Sort"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f} }
                       }
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "PaperTap",
                Width = 40,
                Height = 30,
                OffsetX = 20,
                OffsetY = 15,
                FillColor = "white",
                BorderWidth = 1.5,
                Type = Shapes.Flow,
                Shape = FlowShapes.PaperTap,
                Ports = new Collection(){
                            new Port() { Name= "PaperTap"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f} },
                       			new Port(){Name  = "PaperTap"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0.1f} },
                       			new Port(){Name  = "PaperTap"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.1f} },
                       			new Port(){Name  = "PaperTap"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
                       			new Port(){Name  = "PaperTap"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.9f} },
                       			new Port(){Name  = "PaperTap"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0.9f} },
                       			new Port(){Name  = "PaperTap"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.9f} },
                       			new Port(){Name  = "PaperTap"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.1f} }
                       }
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "MultiDocument",
                Width = 40,
                Height = 30,
                OffsetX = 20,
                OffsetY = 15,
                FillColor = "white",
                BorderWidth = 1.5,
                Type = Shapes.Flow,
                Shape = FlowShapes.MultiDocument,
                Ports = new Collection(){
                          new Port() { Name= "MultiDocument"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f} },
                           new Port() { Name= "MultiDocument"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0} },
                           new Port() { Name= "MultiDocument"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                           new Port() { Name= "MultiDocument"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0} },
                           new Port() { Name= "MultiDocument"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
                           new Port() { Name= "MultiDocument"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 1} },
                           new Port() { Name= "MultiDocument"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1} },
                           new Port() { Name= "MultiDocument"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 1 } }}
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "Collate",
                Width = 40,
                Height = 40,
                OffsetX = 20,
                OffsetY = 20,
                FillColor = "white",
                BorderWidth = 1.5,
                Type = Shapes.Flow,
                Shape = FlowShapes.Collate,
                Ports = new Collection(){
                           new Port() { Name= "Collate"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0} },
                           new Port() { Name= "Collate"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                           new Port() { Name= "Collate"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0} },
                           new Port() { Name= "Collate"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 1} },
                           new Port() { Name= "Collate"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1} },
                           new Port() { Name= "Collate"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 1 } }}
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "Summing_Junction",
                Width = 40,
                Height = 40,
                OffsetX = 20,
                OffsetY = 20,
                Constraints = constraints,
                FillColor = "white",
                BorderWidth = 1.5,
                Type = Shapes.Flow,
                Shape = FlowShapes.SummingJunction,
                Ports = new Collection(){
                       new Port() { Name= "Summing Junction"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                       new Port() { Name= "Summing Junction"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
                       new Port() { Name= "Summing Junction"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1} },
                       new Port() { Name= "Summing Junction"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f} },
                       new Port() { Name= "Summing Junction"  + random.Next(100), Offset = new DiagramPoint() {X= 0.152f,Y= 0.15f} },
                       new Port() { Name= "Summing Junction"  + random.Next(100), Offset = new DiagramPoint() {X= 0.852f,Y= 0.15f} },
                       new Port() { Name= "Summing Junction"  + random.Next(100), Offset = new DiagramPoint() {X= 0.852f,Y= 0.85f} },
                       new Port() { Name= "Summing Junction"  + random.Next(100), Offset = new DiagramPoint() {X= 0.152f,Y= 0.85f } }

                       }
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "Or",
                Width = 40,
                Height = 40,
                OffsetX = 20,
                OffsetY = 20,
                FillColor = "white",
                Constraints = constraints,
                BorderWidth = 1.5,
                Type = Shapes.Flow,
                Shape = FlowShapes.Or,
                Ports = new Collection(){
                           new Port() { Name= "Or"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                           new Port() { Name= "Or"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
                           new Port() { Name= "Or"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1} },
                           new Port() { Name= "Or"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f} },
                           new Port() { Name= "Or"  + random.Next(100), Offset = new DiagramPoint() {X= 0.152f,Y= 0.15f} },
                           new Port() { Name= "Or"  + random.Next(100), Offset = new DiagramPoint() {X= 0.852f,Y= 0.15f} },
                           new Port() { Name= "Or"  + random.Next(100), Offset = new DiagramPoint() {X= 0.852f,Y= 0.85f} },
                           new Port() { Name= "Or"  + random.Next(100), Offset = new DiagramPoint() {X= 0.152f,Y= 0.85f } }
                       }
            });
            //flowShapes.AppendChild(new FlowShape()
            //{
            //    Name = "Annotation1",
            //    Width = 40,
            //    Height = 40,
            //    OffsetX = 20,
            //    OffsetY = 20,
            //    FillColor = "transparent",
            //    BorderWidth = 2,
            //    Type = Shapes.Flow,
            //    Shape = FlowShapes.Annotation1,
            //    Ports = new Collection(){ new Port(){ Name= "Annotation1"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f} },
            //               new Port() { Name= "Annotation1"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0} },
            //               new Port() { Name= "Annotation1"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
            //               new Port() { Name= "Annotation1"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0} },
            //               new Port() { Name= "Annotation1"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
            //               new Port() { Name= "Annotation1"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 1} },
            //               new Port() { Name= "Annotation1"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1} },
            //               new Port() { Name= "Annotation1"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 1 } } }
            //});
            //flowShapes.AppendChild(new FlowShape()
            //{
            //    Name = "Annotation2",
            //    Width = 40,
            //    Height = 40,
            //    OffsetX = 20,
            //    OffsetY = 20,
            //    FillColor = "transparent",
            //    BorderWidth = 2,
            //    Type = Shapes.Flow,
            //    Shape = FlowShapes.Annotation2,
            //    Ports = new Collection(){
            //               new Port() { Name= "Annotation2"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f} },
            //               new Port() { Name= "Annotation2"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
            //               new Port() { Name= "Annotation2"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0} },
            //               new Port() { Name= "Annotation2"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
            //               new Port() { Name= "Annotation2"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 1} },
            //               new Port() { Name= "Annotation2"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1 } } }
            //});
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "InternalStorage",
                Width = 40,
                Height = 40,
                OffsetX = 20,
                OffsetY = 20,
                FillColor = "white",
                Constraints = constraints,
                BorderWidth = 1.5,
                Type = Shapes.Flow,
                Shape = FlowShapes.InternalStorage,
                Ports = new Collection(){
                       			new Port() { Name= "InternalStorage"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0} },
                            new Port() { Name= "InternalStorage"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                            new Port() { Name= "InternalStorage"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0} },
                            new Port() { Name= "InternalStorage"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
                            new Port() { Name= "InternalStorage"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 1} },
                            new Port() { Name= "InternalStorage"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1} },
                            new Port() { Name= "InternalStorage"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 1} },
                            new Port() { Name= "InternalStorage"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f} }
                       }
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "PredefinedProcess",
                Width = 40,
                Height = 30,
                OffsetX = 20,
                OffsetY = 15,
                FillColor = "white",
                Constraints = constraints,
                BorderWidth = 1.5,
                Type = Shapes.Flow,
                Shape = FlowShapes.PreDefinedProcess,
                Ports = new Collection(){
                       			new Port(){ Name= "PredefinedProcess"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0} },
                            new Port() { Name= "PredefinedProcess"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                            new Port() { Name= "PredefinedProcess"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0} },
                            new Port() { Name= "PredefinedProcess"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
                            new Port() { Name= "PredefinedProcess"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 1} },
                            new Port() { Name= "PredefinedProcess"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1} },
                            new Port() { Name= "PredefinedProcess"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 1} },
                            new Port() { Name= "PredefinedProcess"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f } }
                       }
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "Extract",
                Width = 40,
                Height = 40,
                OffsetX = 20,
                Constraints = constraints,
                OffsetY = 20,
                FillColor = "white",
                BorderWidth = 1.5,
                Type = Shapes.Flow,
                Shape = FlowShapes.Extract,
                Ports = new Collection(){
                           new Port() { Name= "Extract"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                           new Port() { Name= "Extract"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 1} },
                           new Port() { Name= "Extract"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1} },
                           new Port() { Name= "Extract"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 1 } }
                       }
            });
            flowShapes.AppendChild(new BasicShape()
            {
                Name = "ManualOperation",
                Width = 40,
                Height = 40,
                OffsetX = 20,
                OffsetY = 20,
                FillColor = "white",
                Constraints = constraints,
                BorderWidth = 1.5,
                Type = Shapes.Basic,
                Shape = BasicShapes.Path,
                PathData = "M 0 0 L 10 40 L 30 40 L 40 0 Z",
                Ports = new Collection(){
                           new Port() { Name= "ManualOperation"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0} },
                           new Port() { Name= "ManualOperation"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1} },
                           new Port() { Name= "ManualOperation"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                           new Port() { Name= "ManualOperation"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0 } }
                       }
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "Merge",
                Width = 40,
                Height = 40,
                OffsetX = 20,
                Constraints = constraints,
                OffsetY = 20,
                FillColor = "white",
                BorderWidth = 1.5,
                Type = Shapes.Flow,
                Shape = FlowShapes.Merge,
                Ports = new Collection(){
                            new Port() { Name= "Merge"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0} },
                            new Port() { Name= "Merge"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1} },
                            new Port() { Name= "Merge"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                            new Port() { Name= "Merge"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0 } }
                       }
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "Off_Page_Reference",
                Width = 40,
                Height = 40,
                OffsetX = 20,
                OffsetY = 20,
                FillColor = "white",
                BorderWidth = 1.5,
                Type = Shapes.Flow,
                Shape = FlowShapes.OffPageReference,
                Ports = new Collection(){
                            new Port() { Name= "Off Page Reference"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0} },
                            new Port() { Name= "Off Page Reference"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1} },
                            new Port() { Name= "Off Page Reference"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f} },
                            new Port() { Name= "Off Page Reference"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                            new Port() { Name= "Off Page Reference"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0} },
                            new Port() { Name= "Off Page Reference"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f } }
                       }
            });

            flowShapes.AppendChild(new FlowShape()
            {
                Name = "Sequential_Access_Storage",
                Width = 40,
                Constraints = constraints,
                Height = 40,
                OffsetX = 20,
                OffsetY = 20,
                FillColor = "white",
                BorderWidth = 1.5,
                Type = Shapes.Flow,
                Shape = FlowShapes.SequentialAccessStorage,
                Ports = new Collection(){
                   new Port() { Name= "Sequential Access Storage"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                   new Port() { Name= "Sequential Access Storage"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 1} },
                   new Port() { Name= "Sequential Access Storage"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f} },
                   new Port() { Name= "Sequential Access Storage"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
                   new Port() { Name= "Sequential Access Storage"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1 } }
                       }
            });

            flowShapes.AppendChild(new FlowShape()
            {
                Name = "Start",
                Width = 60,
                Height = 30,
                OffsetX = 30,
                OffsetY = 15,
                FillColor = "white",
                BorderWidth = 1.5,
                Type = Shapes.Flow,
                Shape = FlowShapes.Terminator,
                Ports = new Collection(){
                   new Port() { Name= "Start"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0.5f} },
                   new Port() { Name= "Start"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f} },
                   new Port() { Name= "Start"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                   new Port() { Name= "Start"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
                   new Port() { Name= "Start"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1 } }
                       }
            });

            flowShapes.AppendChild(new BasicShape()
            {
                Name = "LoopLimit",
                Width = 40,
                Height = 25,
                OffsetX = 20,
                OffsetY = 12.5,
                FillColor = "white",
                BorderWidth = 1.5,
                Type = Shapes.Basic,
                Shape = BasicShapes.Path,
                PathData = "M 60 35.5 H 0 V 10 C 3.9 6.1 6.1 3.9 10 0 h 40 c 3.9 3.9 6.1 6.1 10 10 V 35.5 Z",
                Ports = new Collection(){
                   new Port() { Name= "LoopLimit"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0.5f} },
                   new Port() { Name= "LoopLimit"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f} },
                   new Port() { Name= "LoopLimit"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                   new Port() { Name= "LoopLimit"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
                   new Port() { Name= "LoopLimit"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1 } }
                       }
            });

            return flowShapes;
        }
        public Palette GenerateArrowShapes()
        {
            Palette arrowShapes = new Palette("Arrow Shapes");
            NodeConstraints constraints = NodeConstraints.Default | NodeConstraints.AspectRatio;
            arrowShapes.Expanded = false;
            arrowShapes.TemplateId = "svgTemplate";
            arrowShapes.AddInfo = new Dictionary<string, object>();
            (arrowShapes.AddInfo as Dictionary<string, object>).Add("source", "../Content/DiagramBuilder/images/arrow.png");
            float x = 0;
            float y = 0;

            BasicShape circularArrow = CreateNodes("CircularArrow", "M 36.4051 25.8226 C 33.7131 10.7321 26.8537 0.000302807 18.8124 0.000302807 C 8.4224 0.000302807 -0.000264486 17.9088 -0.000264486 40.0003 L 3.76239 40.0003 C 3.76239 22.3257 10.5004 7.99918 18.8124 7.99918 C 24.7297 7.99918 29.8477 15.2609 32.3064 25.8226 L 29.3711 25.8226 L 32.0284 32.9101 L 34.6851 40.0003 L 37.3424 32.9101 L 39.9997 25.8226 L 36.4051 25.8226 Z", null, 40, 25);
            circularArrow.Ports.Add(CreatePort("port1", 0.05f, 1));
            circularArrow.Ports.Add(CreatePort("port2", 0.5f, 0));
            circularArrow.Ports.Add(CreatePort("port3", 1 - .14f, 1));

            BasicShape curvedRightArrow = CreateNodes("CurvedRightArrow", "M 0.427222 18.2004 C 2.46327 24.0196 11.7465 28.8797 24.4184 31.2086 L 24.4184 27.9823 L 32.1988 30.9868 L 39.978 33.9912 L 32.1988 36.9949 L 24.4184 40 L 24.4184 36.0366 C 10.0263 33.3938 5.69372 27.4835 5.69372 20.6147 C 5.69372 19.7949 0.150241 18.9901 0.427222 18.2004 Z M 40 0 L 40 4.55684 C 19.8492 4.55684 3.18675 10.5013 0.411611 18.2326 C 0.14497 17.4869 0 16.7268 0 15.9535 C 0 7.1418 17.9077 0 40 0 Z", null, 25, 40);
            curvedRightArrow.Ports.Add(CreatePort("port1", 0, 0.5f));
            curvedRightArrow.Ports.Add(CreatePort("port2", 1, 0.05f));
            curvedRightArrow.Ports.Add(CreatePort("port3", 1, 1 - .14f));

            BasicShape curvedUpArrow = CreateNodes("CurvedUpArrow", "M 33.9917 0.0232741 L 36.9955 7.80245 L 40 15.5817 L 36.0371 15.5817 C 33.3944 29.9738 27.4839 40 20.6151 40 C 19.7952 40 18.9904 39.8511 18.2007 39.5729 C 24.0199 37.5381 28.8801 28.2549 31.2091 15.5817 L 27.9828 15.5817 L 30.9873 7.80245 Z M 0 0 L 4.55692 0 C 4.55692 20.1508 10.5015 36.8133 18.2329 39.5871 C 17.4872 39.855 16.7271 39.9987 15.9538 39.9987 C 7.14192 39.9987 0 22.0924 0 0 Z", null, 40, 25);
            curvedUpArrow.Ports.Add(CreatePort("port1", 0.05f, .0f));
            curvedUpArrow.Ports.Add(CreatePort("port2", .5f, 1));
            curvedUpArrow.Ports.Add(CreatePort("port3", 1 - .14f, 0));

            BasicShape curvedLeftArrow = CreateNodes("CurvedLeftArrow", "M 39.5729 18.2011 C 39.8499 18.9901 40 19.7949 40 20.6154 C 40 27.4835 29.9738 33.3938 15.5818 36.0372 L 15.5818 40 L 7.80127 36.9949 L 0.0220975 33.9912 L 7.80127 30.9874 L 15.5818 27.983 L 15.5818 31.2093 C 28.2536 28.8803 37.5368 24.0196 39.5729 18.2011 Z M 0 0 C 22.0923 0 39.9999 7.14246 39.9999 15.9535 C 39.9999 16.7268 39.8549 17.4869 39.5883 18.2333 C 36.8132 10.5013 20.1507 4.5575 0 4.5575 Z", null, 25, 40);
            curvedLeftArrow.Ports.Add(CreatePort("port1", 0, 0.05f));
            curvedLeftArrow.Ports.Add(CreatePort("port2", 1, 0.5f));
            curvedLeftArrow.Ports.Add(CreatePort("port3", 0, 1 - .14f));

            BasicShape curvedDownArrow = CreateNodes("CurvedDownArrow", "M 15.9538 6.48044 C 16.727 6.48044 17.4872 0.146274 18.2329 0.411633 C 10.5015 3.18796 4.55692 19.8499 4.55692 40 L 0 40 C 0 17.9084 7.14192 6.48044 15.9538 6.48044 Z M 20.6151 0 C 27.4839 0 33.3944 10.0259 36.0371 24.4175 L 40 24.4175 L 36.9955 32.1991 L 33.9917 39.978 L 30.9872 32.1991 L 27.9828 24.4175 L 31.2091 24.4175 C 28.8801 11.7473 24.0199 2.46441 18.2007 0.427129 C 18.9904 0.151437 19.7952 0 20.6151 0 Z", null, 40, 25);
            curvedDownArrow.Ports.Add(CreatePort("port1", .05f, 1));
            curvedDownArrow.Ports.Add(CreatePort("port2", .5f, 0));
            curvedDownArrow.Ports.Add(CreatePort("port3", 1 - .14f, 1));

            BasicShape uTurnArrow = CreateNodes1("UTurnArrow", "M 33.013 19.4659 L 33.013 13.6946 C 33.013 6.13127 25.6214 -7.12077 16.5024 -7.12077 C 7.3914 -7.12077 -0.000294228 6.13127 -0.000294228 13.6946 L -0.000294228 39.9999 L 7.51184 39.9906 L 7.51184 14.0866 C 7.51184 9.96593 11.5371 6.62594 16.5024 6.62594 C 21.4676 6.62594 25.4928 9.96593 25.4928 14.0866 L 25.4928 19.4659 L 17.6192 19.4659 L 23.2111 25.6633 L 28.811 31.8606 L 34.403 25.6633 L 40.0029 19.4659 L 33.013 19.4659 Z", null, 40, 40);
            uTurnArrow.Constraints = constraints;
            uTurnArrow.Ports.Add(CreatePort("port2", 0.15f, 1));
            uTurnArrow.Ports.Add(CreatePort("port3", 0.75f, 0.56f));

            BasicShape jumpingRightArrow = CreateNodes("JumpingRightArrow", "M 23.4622 32.2162 L 17.9489 24.4311 L 23.8682 24.4311 C 19.5962 11.7525 10.6769 2.46354 0.000203451 0.426428 C 1.4482 0.149711 2.92554 -8.74993 4.42952 -8.74993 C 17.0335 -8.74993 27.8789 10.0322 32.7275 24.4311 L 40.0002 24.4311 L 34.4869 32.2162 L 28.9755 39.9999 L 23.4622 32.2162 Z", null);
            jumpingRightArrow.Ports.Add(CreatePort("port1", .73f, 1));

            BasicShape jumpingLeftArrow = CreateNodes("JumpingLeftArrow", "M 16.5394 32.216 L 22.0514 24.432 L 16.1334 24.432 C 20.4041 11.7529 29.3247 2.46363 40.0001 0.424999 C 38.5527 0.14976 37.0761 -4.37512 35.5708 -4.37512 C 22.9681 -4.37512 12.1228 10.0311 7.27275 24.432 L 8.13802 24.432 L 5.51473 32.216 L 11.0261 40 L 16.5394 32.216 Z", null);
            jumpingLeftArrow.Ports.Add(CreatePort("port1", 1 - .73f, 1));

            BasicShape leftArrow = CreateNodes("LeftArrow", "M 0 20 L 20 40 L 20 30 L 40 30 L 40 10 L 20 10 L 20 0 L 0 20 Z", null);
            leftArrow.Ports.Add(CreatePort("port1", 0.5f, 0.5f));

            BasicShape rightArrow = CreateNodes("RightArrow", "M 0 30 L 20 30 L 20 40 L 40 20 L 20 0 L 20 10 L 0 10 Z", null);
            rightArrow.Ports.Add(CreatePort("port1", 0.5f, 0.5f));

            BasicShape doubleArrow = CreateNodes("DoubleArrow", "M 0 20 L 20 40 L 20 30 L 30 30 L 30 40 L 50 20 L 30 0 L 30 10 L 20 10 L 20 0 L 0 20 Z", null);
            doubleArrow.Ports.Add(CreatePort("port1", 0.5f, 0.5f));

            //BasicShape bendLeftArrow = CreateNodes("Bend Left Arrow", "M 7.7 5.5 L 15.4 0 v 6.3 H 46 C 61.3 5.7 60 20 60 20 v 35.6 h -9.6 V 20 c 0 -4.5 -4.4 -4.1 -4.4 -4.1 H 15.4 v 6.2 l -7.7 -5.5 L 0 11 L 7.7 5.5 Z", null);
            //doubleArrow.Ports.Add(CreatePort("port1", 0.5f, 0.5f));
            //BasicShape bendrightArrow = CreateNodes("Bend right Arrow", "M 52.3 5.5 L 44.6 0 v 6.3 H 14 C -1.3 5.7 0 20 0 20 l 0 35.6 h 9.6 V 20 c 0 -4.5 4.4 -4.1 4.4 -4.1 h 30.6 v 6.2 l 7.7 -5.5 L 60 11 L 52.3 5.5 Z", null);
            //doubleArrow.Ports.Add(CreatePort("port1", 0.5f, 0.5f));
            //arrowShapes.AppendChild(bendrightArrow);
            //BasicShape sArrow = CreateNodes("S-Arrow", "M 60 14 L 45.2 0 v 6.2 H 25.6 v 0 C 14.5 6.2 13 15.3 13 15.3 c -2.1 10.6 13.2 25.4 13.2 25.4 H 0 v 15.7 h 31.2 v 0 c 11.1 0 12.6 -9.1 12.6 -9.1 c 2.1 -10.6 -13.2 -25.4 -13.2 -25.4 h 14.6 V 28 L 60 14 Z", null);
            doubleArrow.Ports.Add(CreatePort("port1", 0.5f, 0.5f));
            arrowShapes.AppendChild(circularArrow);
            arrowShapes.AppendChild(curvedRightArrow);
            arrowShapes.AppendChild(curvedUpArrow);
            arrowShapes.AppendChild(curvedLeftArrow);
            arrowShapes.AppendChild(curvedDownArrow);
            arrowShapes.AppendChild(uTurnArrow);
            arrowShapes.AppendChild(jumpingRightArrow);
            arrowShapes.AppendChild(jumpingLeftArrow);
            arrowShapes.AppendChild(leftArrow);
            arrowShapes.AppendChild(rightArrow);
            arrowShapes.AppendChild(doubleArrow);
            Collection points;
            BasicShape ChevronsTopArrow = new BasicShape();
            ChevronsTopArrow.Shape = BasicShapes.Path;
            ChevronsTopArrow.Name = "ChevronsTopArrow";
            ChevronsTopArrow.Width = 40;
            ChevronsTopArrow.Height = 40;
            ChevronsTopArrow.OffsetX = ChevronsTopArrow.Width / 2;
            ChevronsTopArrow.OffsetY = ChevronsTopArrow.Height / 2;
            points = new Collection();
            points.Add(CreatePoint(x, ChevronsTopArrow.Height - 10));
            points.Add(CreatePoint(0, ChevronsTopArrow.Height));
            points.Add(CreatePoint(ChevronsTopArrow.Width - 8, ChevronsTopArrow.Height));
            points.Add(CreatePoint(ChevronsTopArrow.Width - 8, 12));
            points.Add(CreatePoint(ChevronsTopArrow.Width, 12));
            points.Add(CreatePoint(ChevronsTopArrow.Width - 14, 0));
            points.Add(CreatePoint(ChevronsTopArrow.Width - 26, y: 12));
            points.Add(CreatePoint(ChevronsTopArrow.Width - 18, 12));
            points.Add(CreatePoint(ChevronsTopArrow.Width - 18, ChevronsTopArrow.Height - 10));
            ChevronsTopArrow.PathData = getPathData(points); ;
            ChevronsTopArrow.BorderWidth = 1.5;
            ChevronsTopArrow.Ports.Add(CreatePort("port1", 0, 0.95f));
            ChevronsTopArrow.Ports.Add(CreatePort("port1", 0.86f, 0));
            arrowShapes.AppendChild(ChevronsTopArrow);

            BasicShape ChevronsLeftandTopArrow = new BasicShape();
            ChevronsLeftandTopArrow.Shape = BasicShapes.Path;
            ChevronsLeftandTopArrow.Name = "ChevronsLeftandTopArrow";
            ChevronsLeftandTopArrow.Width = 40;
            ChevronsLeftandTopArrow.Height = 40;
            ChevronsLeftandTopArrow.OffsetX = ChevronsLeftandTopArrow.Width / 2;
            ChevronsLeftandTopArrow.OffsetY = ChevronsLeftandTopArrow.Height / 2;
            points = new Collection();
            points.Add(CreatePoint(x, ChevronsLeftandTopArrow.Height - 15));
            points.Add(CreatePoint(10, ChevronsLeftandTopArrow.Height));
            points.Add(CreatePoint(10, ChevronsLeftandTopArrow.Height - 10));
            points.Add(CreatePoint(ChevronsLeftandTopArrow.Width - 10, ChevronsLeftandTopArrow.Height - 10));
            points.Add(CreatePoint(ChevronsLeftandTopArrow.Width - 10, 10));
            points.Add(CreatePoint(ChevronsLeftandTopArrow.Width, 10));
            points.Add(CreatePoint(ChevronsLeftandTopArrow.Width - 15, 0));
            points.Add(CreatePoint(ChevronsLeftandTopArrow.Width - 30, 10));
            points.Add(CreatePoint(ChevronsLeftandTopArrow.Width - 20, 10));
            points.Add(CreatePoint(ChevronsLeftandTopArrow.Width - 20, ChevronsLeftandTopArrow.Height - 20));
            points.Add(CreatePoint(10, ChevronsLeftandTopArrow.Height - 20));
            points.Add(CreatePoint(10, ChevronsLeftandTopArrow.Height - 30));
            ChevronsLeftandTopArrow.PathData = getPathData(points); ;
            ChevronsLeftandTopArrow.BorderWidth = 1.5;
            arrowShapes.AppendChild(ChevronsLeftandTopArrow);


            BasicShape CallOutDownArrow = new BasicShape();
            CallOutDownArrow.Shape = BasicShapes.Path;
            CallOutDownArrow.Name = "CallOutDownArrow";
            CallOutDownArrow.Width = 40;
            CallOutDownArrow.Height = 40;
            CallOutDownArrow.OffsetX = CallOutDownArrow.Width / 2;
            CallOutDownArrow.OffsetY = CallOutDownArrow.Height / 2;
            points = new Collection();
            points.Add(CreatePoint(0, 0));
            points.Add(CreatePoint(CallOutDownArrow.Width, 0));
            points.Add(CreatePoint(CallOutDownArrow.Width, 20));
            points.Add(CreatePoint(CallOutDownArrow.Width / 2 + 5, 20));
            points.Add(CreatePoint(CallOutDownArrow.Width / 2 + 5, CallOutDownArrow.Height - 10));
            points.Add(CreatePoint(CallOutDownArrow.Width / 2 + 15, CallOutDownArrow.Height - 10));
            points.Add(CreatePoint(CallOutDownArrow.Width / 2, CallOutDownArrow.Height));
            points.Add(CreatePoint(CallOutDownArrow.Width / 2 - 15, CallOutDownArrow.Height - 10));
            points.Add(CreatePoint(CallOutDownArrow.Width / 2 - 5, CallOutDownArrow.Height - 10));
            points.Add(CreatePoint(CallOutDownArrow.Width / 2 - 5, 20));
            points.Add(CreatePoint(0, 20));
            CallOutDownArrow.PathData = getPathData(points); ;
            CallOutDownArrow.BorderWidth = 1.5;
            arrowShapes.AppendChild(CallOutDownArrow);

            BasicShape CallOutleftArrow = new BasicShape();
            CallOutleftArrow.Shape = BasicShapes.Path;
            CallOutleftArrow.Name = "CallOutleftArrow";
            CallOutleftArrow.Width = 40;
            CallOutleftArrow.Height = 40;
            CallOutleftArrow.OffsetX = CallOutleftArrow.Width / 2;
            CallOutleftArrow.OffsetY = CallOutleftArrow.Height / 2;
            points = new Collection();
            points.Add(CreatePoint(0, CallOutleftArrow.Height / 2));
            points.Add(CreatePoint(10, CallOutleftArrow.Height / 2 + 15));
            points.Add(CreatePoint(10, CallOutleftArrow.Height / 2 + 5));
            points.Add(CreatePoint(CallOutleftArrow.Width - 20, CallOutleftArrow.Height / 2 + 5));
            points.Add(CreatePoint(CallOutleftArrow.Width - 20, CallOutleftArrow.Height));
            points.Add(CreatePoint(CallOutleftArrow.Width, CallOutleftArrow.Height));
            points.Add(CreatePoint(CallOutleftArrow.Width, 0));
            points.Add(CreatePoint(CallOutleftArrow.Width - 20, 0));
            points.Add(CreatePoint(CallOutleftArrow.Width - 20, CallOutleftArrow.Height / 2 - 5));
            points.Add(CreatePoint(10, CallOutleftArrow.Height / 2 - 5));
            points.Add(CreatePoint(10, CallOutleftArrow.Height / 2 - 15));
            CallOutleftArrow.PathData = getPathData(points); ;
            CallOutleftArrow.BorderWidth = 1.5;
            arrowShapes.AppendChild(CallOutleftArrow);

            BasicShape CallOutrightArrow = new BasicShape();
            CallOutrightArrow.Shape = BasicShapes.Path;
            CallOutrightArrow.Name = "CallOutrightArrow";
            CallOutrightArrow.Width = 40;
            CallOutrightArrow.Height = 40;
            CallOutrightArrow.OffsetX = CallOutrightArrow.Width / 2;
            CallOutrightArrow.OffsetY = CallOutrightArrow.Height / 2;
            points = new Collection();
            points.Add(CreatePoint(0, 0));
            points.Add(CreatePoint(0, CallOutrightArrow.Height));
            points.Add(CreatePoint(20, CallOutrightArrow.Height));
            points.Add(CreatePoint(20, CallOutrightArrow.Height / 2 + 5));
            points.Add(CreatePoint(CallOutrightArrow.Width - 10, CallOutrightArrow.Height / 2 + 5));
            points.Add(CreatePoint(CallOutrightArrow.Width - 10, CallOutrightArrow.Height / 2 + 15));
            points.Add(CreatePoint(CallOutrightArrow.Width, CallOutrightArrow.Height / 2));
            points.Add(CreatePoint(CallOutrightArrow.Width - 10, CallOutrightArrow.Height / 2 - 15));
            points.Add(CreatePoint(CallOutrightArrow.Width - 10, CallOutrightArrow.Height / 2 - 5));
            points.Add(CreatePoint(20, CallOutrightArrow.Height / 2 - 5));
            points.Add(CreatePoint(20, 0));
            CallOutrightArrow.PathData = getPathData(points); ;
            CallOutrightArrow.BorderWidth = 1.5;
            arrowShapes.AppendChild(CallOutrightArrow);

            BasicShape CallOutupArrow = new BasicShape();
            CallOutupArrow.Shape = BasicShapes.Path;
            CallOutupArrow.Name = "CallOutupArrow";
            CallOutupArrow.Width = 40;
            CallOutupArrow.Height = 40;
            CallOutupArrow.OffsetX = CallOutupArrow.Width / 2;
            CallOutupArrow.OffsetY = CallOutupArrow.Height / 2;
            points = new Collection();
            points.Add(CreatePoint(CallOutupArrow.Width / 2, 0));
            points.Add(CreatePoint(CallOutupArrow.Width / 2 + 15, 10));
            points.Add(CreatePoint(CallOutupArrow.Width / 2 + 5, 10));
            points.Add(CreatePoint(CallOutupArrow.Width / 2 + 5, CallOutupArrow.Height - 20));
            points.Add(CreatePoint(CallOutupArrow.Width, CallOutupArrow.Height - 20));
            points.Add(CreatePoint(CallOutupArrow.Width, CallOutupArrow.Height));
            points.Add(CreatePoint(0, CallOutupArrow.Height));
            points.Add(CreatePoint(0, CallOutupArrow.Height - 20));
            points.Add(CreatePoint(CallOutupArrow.Width / 2 - 5, CallOutupArrow.Height - 20));
            points.Add(CreatePoint(CallOutupArrow.Width / 2 - 5, 10));
            points.Add(CreatePoint(CallOutupArrow.Width / 2 - 15, 10));

            CallOutupArrow.PathData = getPathData(points); ;
            CallOutupArrow.BorderWidth = 1.5;
            arrowShapes.AppendChild(CallOutupArrow);

            BasicShape ChevronWide = new BasicShape();
            ChevronWide.Shape = BasicShapes.Path;
            ChevronWide.Name = "ChevronsWide";
            ChevronWide.Width = 40;
            ChevronWide.Height = 25;
            ChevronWide.OffsetX = ChevronWide.Width / 2;
            ChevronWide.OffsetY = ChevronWide.Height / 2;
            // ChevronWide.Constraints = constraints;
            points = new Collection();
            points.Add(CreatePoint(47.9f, 26.7f));
            points.Add(CreatePoint(0, 26.7f));
            points.Add(CreatePoint(14.7f, 13.2f));
            points.Add(CreatePoint(0, 0));
            points.Add(CreatePoint(47.9f, 0));
            points.Add(CreatePoint(60, 13.1f));
            ChevronWide.PathData = getPathData(points); ;
            ChevronWide.BorderWidth = 1.5;
            arrowShapes.AppendChild(ChevronWide);

            //BasicShape LeftandRightArrow = new BasicShape();
            //LeftandRightArrow.Shape = BasicShapes.Path;
            //LeftandRightArrow.Name = "LeftandRightArrow";
            //LeftandRightArrow.Width = 40;
            //LeftandRightArrow.Height = 40;
            //LeftandRightArrow.OffsetX = LeftandRightArrow.Width / 2;
            //LeftandRightArrow.OffsetY = LeftandRightArrow.Height / 2;
            //points = new Collection();

            //points.Add(CreatePoint(53.4f, 4.7f));
            //points.Add(CreatePoint(46.8f, 0));
            //points.Add(CreatePoint(46.8f, 5.4f));
            //points.Add(CreatePoint(18.1f, 5.4f));
            //points.Add(CreatePoint(18.1f, 5.4f));
            //points.Add(CreatePoint(13.2f, 5.4f));
            //points.Add(CreatePoint(13.2f, 0));
            //points.Add(CreatePoint(6.6f, 4.7f));
            //points.Add(CreatePoint(0, 9.5f));
            //points.Add(CreatePoint(6.6f, 14.2f));
            //points.Add(CreatePoint(13.2f, 19));
            //points.Add(CreatePoint(13.2f, 13.5f));
            //points.Add(CreatePoint(41.9f, 13.5f));
            //points.Add(CreatePoint(41.9f, 13.5f));
            //points.Add(CreatePoint(46.8f, 13.5f));
            //points.Add(CreatePoint(46.8f, 19));
            //points.Add(CreatePoint(53.4f, 14.2f));
            //points.Add(CreatePoint(60, 9.5f));
            //LeftandRightArrow.PathData = getPathData(points); ;
            //LeftandRightArrow.BorderWidth = 1.5;
            //arrowShapes.AppendChild(LeftandRightArrow);

            //BasicShape LeftandUpArrow = new BasicShape();
            //LeftandUpArrow.Shape = BasicShapes.Path;
            //LeftandUpArrow.Name = "LeftandUpArrow";
            //LeftandUpArrow.Width = 40;
            //LeftandUpArrow.Height = 40;
            //LeftandUpArrow.OffsetX = LeftandUpArrow.Width / 2;
            //LeftandUpArrow.OffsetY = LeftandUpArrow.Height / 2;
            //points = new Collection();
            //points.Add(CreatePoint(51.2f, 51.8f));
            //points.Add(CreatePoint(51.2f, 19.8f));
            //points.Add(CreatePoint(59.4f, 19.8f));
            //points.Add(CreatePoint(52.3f, 9.9f));
            //points.Add(CreatePoint(45.1f, 0));
            //points.Add(CreatePoint(38, 9.9f));
            //points.Add(CreatePoint(30.9f, 19.8f));
            //points.Add(CreatePoint(39.1f, 19.8f));
            //points.Add(CreatePoint(39.1f, 39.7f));
            //points.Add(CreatePoint(27.3f, 39.7f));
            //points.Add(CreatePoint(27.3f, 39.7f));
            //points.Add(CreatePoint(19.8f, 39.7f));
            //points.Add(CreatePoint(19.8f, 31.5f));
            //points.Add(CreatePoint(9.9f, 38.6f));
            //points.Add(CreatePoint(0, 45.7f));
            //points.Add(CreatePoint(9.9f, 52.9f));
            //points.Add(CreatePoint(19.8f, 60));
            //points.Add(CreatePoint(19.8f, 51.8f));
            //points.Add(CreatePoint(51.2f, 51.8f));
            //LeftandUpArrow.PathData = getPathData(points); ;
            //LeftandUpArrow.BorderWidth = 1.5;
            //arrowShapes.AppendChild(LeftandUpArrow);

            BasicShape RightNotchedArrow = new BasicShape();
            RightNotchedArrow.Shape = BasicShapes.Path;
            RightNotchedArrow.Name = "RightNotchedArrow";
            RightNotchedArrow.Width = 40;
            RightNotchedArrow.Height = 40;
            RightNotchedArrow.OffsetX = RightNotchedArrow.Width / 2;
            RightNotchedArrow.OffsetY = RightNotchedArrow.Height / 2;
            RightNotchedArrow.Constraints = constraints;
            points = new Collection();
            points.Add(CreatePoint(x, (RightNotchedArrow.Height - RightNotchedArrow.Height / 4)));
            points.Add(CreatePoint(RightNotchedArrow.Width - (RightNotchedArrow.Height / 2), RightNotchedArrow.Height - RightNotchedArrow.Height / 4));
            points.Add(CreatePoint(RightNotchedArrow.Width - (RightNotchedArrow.Height / 2), RightNotchedArrow.Height));
            points.Add(CreatePoint(RightNotchedArrow.Width, RightNotchedArrow.Height / 2));
            points.Add(CreatePoint(RightNotchedArrow.Width - (RightNotchedArrow.Height / 2), y));
            points.Add(CreatePoint(RightNotchedArrow.Width - (RightNotchedArrow.Height / 2), RightNotchedArrow.Height / 4));
            points.Add(CreatePoint(x, RightNotchedArrow.Height / 4));
            points.Add(CreatePoint(10, RightNotchedArrow.Height / 2));
            RightNotchedArrow.PathData = getPathData(points); ;
            RightNotchedArrow.BorderWidth = 1.5;
            arrowShapes.AppendChild(RightNotchedArrow);

            BasicShape UpArrow = new BasicShape();
            UpArrow.Shape = BasicShapes.Path;
            UpArrow.Name = "UpArrow";
            UpArrow.Width = 40;
            UpArrow.Height = 40;
            UpArrow.OffsetX = UpArrow.Width / 2;
            UpArrow.OffsetY = UpArrow.Height / 2;
            points = new Collection();
            points.Add(CreatePoint(UpArrow.Width / 2, y));
            points.Add(CreatePoint(0, UpArrow.Width / 4));
            points.Add(CreatePoint(UpArrow.Width / 4, UpArrow.Width / 4));
            points.Add(CreatePoint(UpArrow.Width / 4, UpArrow.Height));
            points.Add(CreatePoint(UpArrow.Width / 2 + UpArrow.Width / 4, UpArrow.Height));
            points.Add(CreatePoint(UpArrow.Width / 2 + UpArrow.Width / 4, UpArrow.Width / 4));
            points.Add(CreatePoint(UpArrow.Width, UpArrow.Width / 4));
            UpArrow.PathData = getPathData(points); ;
            UpArrow.BorderWidth = 1.5;
            arrowShapes.AppendChild(UpArrow);

            BasicShape LStylisedHeadwithFanTail = new BasicShape();
            LStylisedHeadwithFanTail.Shape = BasicShapes.Path;
            LStylisedHeadwithFanTail.Name = "LStylisedHeadwithFanTail";
            LStylisedHeadwithFanTail.Width = 40;
            LStylisedHeadwithFanTail.Height = 40;
            LStylisedHeadwithFanTail.OffsetX = LStylisedHeadwithFanTail.Width / 2;
            LStylisedHeadwithFanTail.OffsetY = LStylisedHeadwithFanTail.Height / 2;
            LStylisedHeadwithFanTail.Constraints = constraints;
            points = new Collection();
            points.Add(CreatePoint(50.5f, 6.8f));
            points.Add(CreatePoint(41.1f, 0));
            points.Add(CreatePoint(45, 9));
            points.Add(CreatePoint(0, 3.2f));
            points.Add(CreatePoint(8.8f, 13.3f));
            points.Add(CreatePoint(0, 24));
            points.Add(CreatePoint(45.1f, 17.6f));
            points.Add(CreatePoint(41.1f, 27.2f));
            points.Add(CreatePoint(50.5f, 20.4f));
            points.Add(CreatePoint(60, 13.6f));
            LStylisedHeadwithFanTail.PathData = getPathData(points); ;
            LStylisedHeadwithFanTail.BorderWidth = 1.5;
            arrowShapes.AppendChild(LStylisedHeadwithFanTail);
            return arrowShapes;
        }
        public Palette GenerateElectricalShapes()
        {
            Palette electricalShapes = new Palette("Electrical Shapes");
            electricalShapes.Expanded = false;
            electricalShapes.TemplateId = "svgTemplate";
            electricalShapes.AddInfo = new Dictionary<string, object>();
            (electricalShapes.AddInfo as Dictionary<string, object>).Add("source", "../Content/DiagramBuilder/images/electrical.png");
            Node and = CreateNodes("And", "M78.582,73.1143000000002L60.427,73.1143000000002L60.427,102.4343L78.582,102.4343C86.678,102.4343,93.242,95.8703000000002,93.242,87.7743000000002C93.242,79.6773000000002,86.678,73.1143000000002,78.582,73.1143000000002zM60.4272,80.0068000000001L46.8342,80.0068000000001M60.4272,95.5410000000002L46.8342,95.5410000000002M106.8345,87.7739000000001L93.2415,87.7739000000001", "white");
            and.Ports.Add(CreatePort("port1", 0, 0.235f));
            and.Ports.Add(CreatePort("port2", 0, 0.76f));
            and.Ports.Add(CreatePort("port3", 1, 0.5f));

            Node buffer = CreateNodes("Buffer", "M170.354,66.6523000000002L199.753,83.6253000000002L170.354,100.5983L170.354,66.6523000000002zM199.7534,83.6255000000001L214.5004,83.6255000000001M154.5,83.6255000000001L170.354,83.6255000000001", "white");
            buffer.Ports.Add(CreatePort("port1", 0, 0.5f));
            buffer.Ports.Add(CreatePort("port2", 1, 0.5f));

            Node dTypeflipFlop = CreateNodes("DTypeFlipFlop", "M293.928,99.2350000000001L261.739,99.2350000000001L261.739,57.0030000000002L293.928,57.0030000000002zM293.9282,66.2734L307.8332,66.2734M293.9282,87.7759000000001L307.8332,87.7759000000001M247.8335,66.2734L261.7395,66.2734M286.7173,85.6835999999998L292.3993,85.6835999999998M247.8335,87.7759000000001L261.7395,87.7759000000001M264.2393,66.6826000000001L264.2393,69.9886000000001L264.8503,69.9886000000001C265.1243,69.9886000000001,265.3683,69.9516000000001,265.5843,69.8776000000001C265.8003,69.8036000000001,265.9823,69.6946000000001,266.1323,69.5516000000001C266.2823,69.4076000000001,266.3973,69.2306000000001,266.4753,69.0196000000001C266.5533,68.8086000000001,266.5933,68.5656000000001,266.5933,68.2916000000001C266.5933,67.2196000000001,266.0263,66.6826000000001,264.8913,66.6826000000001z M263.8703,70.3246000000001L263.8703,66.3436000000001L264.9163,66.3436000000001C265.5973,66.3436000000001,266.1123,66.5066000000001,266.4603,66.8336000000001C266.8073,67.1606000000001,266.9813,67.6426000000001,266.9813,68.2816000000001C266.9813,68.5876000000001,266.9333,68.8676000000001,266.8363,69.1196000000001C266.7393,69.3706000000001,266.5983,69.5866000000001,266.4153,69.7646000000001C266.2323,69.9426000000001,266.0103,70.0806000000001,265.7493,70.1786000000001C265.4883,70.2756000000001,265.1943,70.3246000000001,264.8663,70.3246000000001zM289.6636,90.4398999999999C289.9656,90.5238999999999,290.2156,90.6498999999998,290.4116,90.8178999999999C290.7196,90.5368999999998,290.8736,90.1148999999998,290.8736,89.5508999999999C290.8736,89.2308999999998,290.8196,88.9508999999998,290.7096,88.7108999999999C290.6016,88.4708999999999,290.4416,88.2858999999999,290.2316,88.1528999999998C290.0216,88.0208999999999,289.7866,87.9548999999999,289.5256,87.9548999999999C289.1346,87.9548999999999,288.8106,88.0878999999998,288.5536,88.3558999999998C288.2956,88.6228999999999,288.1666,89.0228999999999,288.1666,89.5538999999999C288.1666,90.0678999999999,288.2946,90.4638999999999,288.5496,90.7388999999999C288.8046,91.0148999999999,289.1296,91.1528999999998,289.5256,91.1528999999998C289.7136,91.1528999999998,289.8896,91.1178999999999,290.0556,91.0468999999999C289.8916,90.9408999999999,289.7186,90.8658999999999,289.5366,90.8198999999998z M290.8166,91.1088999999998C291.0596,91.2768999999999,291.2846,91.3988999999999,291.4896,91.4768999999999L291.3356,91.8408999999998C291.0506,91.7388999999999,290.7676,91.5768999999999,290.4846,91.3548999999999C290.1906,91.5188999999998,289.8676,91.6008999999999,289.5126,91.6008999999999C289.1536,91.6008999999999,288.8296,91.5148999999999,288.5376,91.3418999999999C288.2456,91.1688999999999,288.0206,90.9258999999999,287.8636,90.6118999999998C287.7056,90.2988999999998,287.6266,89.9458999999999,287.6266,89.5538999999999C287.6266,89.1628999999999,287.7056,88.8068999999999,287.8646,88.4858999999999C288.0226,88.1658999999999,288.2486,87.9218999999999,288.5406,87.7548999999999C288.8336,87.5868999999999,289.1606,87.5028999999999,289.5226,87.5028999999999C289.8886,87.5028999999999,290.2186,87.5898999999999,290.5116,87.7638999999999C290.8056,87.9378999999999,291.0286,88.1808999999999,291.1826,88.4928999999999C291.3366,88.8058999999999,291.4136,89.1578999999999,291.4136,89.5508999999999C291.4136,89.8768999999999,291.3646,90.1698999999999,291.2656,90.4298999999998C291.1656,90.6898999999999,291.0166,90.9168999999999,290.8166,91.108899999999M289.6636,69.21C289.9656,69.294,290.2156,69.42,290.4116,69.588C290.7196,69.307,290.8736,68.885,290.8736,68.321C290.8736,68.001,290.8196,67.721,290.7096,67.481C290.6016,67.241,290.4416,67.056,290.2316,66.923C290.0216,66.791,289.7866,66.725,289.5256,66.725C289.1346,66.725,288.8106,66.858,288.5536,67.126C288.2956,67.393,288.1666,67.793,288.1666,68.324C288.1666,68.838,288.2946,69.234,288.5496,69.509C288.8046,69.785,289.1296,69.923,289.5256,69.923C289.7136,69.923,289.8896,69.888,290.0556,69.817C289.8916,69.711,289.7186,69.636,289.5366,69.59z M290.8166,69.879C291.0596,70.047,291.2846,70.169,291.4896,70.247L291.3356,70.611C291.0506,70.509,290.7676,70.347,290.4846,70.125C290.1906,70.289,289.8676,70.371,289.5126,70.371C289.1536,70.371,288.8296,70.285,288.5376,70.112C288.2456,69.939,288.0206,69.696,287.8636,69.382C287.7056,69.069,287.6266,68.716,287.6266,68.324C287.6266,67.933,287.7056,67.577,287.8646,67.256C288.0226,66.936,288.2486,66.692,288.5406,66.525C288.8336,66.357,289.1606,66.273,289.5226,66.273C289.8886,66.273,290.2186,66.36,290.5116,66.534C290.8056,66.708,291.0286,66.951,291.1826,67.263C291.3366,67.576,291.4136,67.928,291.4136,68.321C291.4136,68.647,291.3646,68.94,291.2656,69.2C291.1656,69.46,291.0166,69.687,290.8166,69.879M261.7393,84.3726000000001L267.6343,87.7756000000002L261.7393,91.1796000000002", "white");
            dTypeflipFlop.Ports.Add(CreatePort("port1", 0, 0.22f));
            dTypeflipFlop.Ports.Add(CreatePort("port2", 1, 0.22f));
            dTypeflipFlop.Ports.Add(CreatePort("port3", 0, 0.72f));
            dTypeflipFlop.Ports.Add(CreatePort("port4", 1, 0.72f));

            Node dTypersFlipFlop = CreateNodes("DTypersFlipFlop", "M484.428,94.4369999999999L452.239,94.4369999999999L452.239,52.2049999999999L484.428,52.2049999999999zM484.4282,61.4756000000002L498.3342,61.4756000000002M484.4282,82.9780000000001L498.3342,82.9780000000001M438.334,61.4756000000002L452.239,61.4756000000002M477.2173,80.8852999999999L482.8993,80.8852999999999M438.334,82.9780000000001L452.239,82.9780000000001M454.7393,61.8843000000002L454.7393,65.1903000000002L455.3503,65.1903000000002C455.6243,65.1903000000002,455.8683,65.1533000000002,456.0843,65.0793000000002C456.3003,65.0053000000002,456.4823,64.8963000000002,456.6323,64.7533000000002C456.7823,64.6103000000002,456.8973,64.4323000000002,456.9753,64.2213000000002C457.0533,64.0103000000002,457.0933,63.7673000000002,457.0933,63.4943000000002C457.0933,62.4213000000002,456.5263,61.8843000000002,455.3913,61.8843000000002z M454.3703,65.5263000000002L454.3703,61.5453000000002L455.4163,61.5453000000002C456.0973,61.5453000000002,456.6123,61.7093000000002,456.9603,62.0353000000002C457.3073,62.3623000000002,457.4813,62.8443000000002,457.4813,63.4833000000002C457.4813,63.7903000000002,457.4333,64.0693000000002,457.3363,64.3213000000002C457.2393,64.5723000000002,457.0983,64.7883000000002,456.9153,64.9673000000002C456.7323,65.1453000000002,456.5103,65.2833000000002,456.2493,65.3803000000002C455.9883,65.4773000000002,455.6943,65.5263000000002,455.3663,65.5263000000002zM480.1636,85.6415999999999C480.4656,85.7255999999999,480.7156,85.8515999999999,480.9116,86.0195999999999C481.2196,85.7385999999999,481.3736,85.3165999999999,481.3736,84.7525999999999C481.3736,84.4325999999999,481.3196,84.1525999999999,481.2096,83.9125999999999C481.1016,83.6735999999999,480.9416,83.4875999999999,480.7326,83.3545999999999C480.5216,83.2225999999999,480.2866,83.1565999999999,480.0256,83.1565999999999C479.6346,83.1565999999999,479.3106,83.2895999999999,479.0536,83.5575999999999C478.7956,83.8255999999999,478.6666,84.2245999999999,478.6666,84.7555999999999C478.6666,85.2705999999999,478.7946,85.6655999999999,479.0496,85.9415999999999C479.3046,86.2165999999999,479.6296,86.3545999999999,480.0256,86.3545999999999C480.2136,86.3545999999999,480.3896,86.3195999999999,480.5556,86.2495999999999C480.3916,86.1425999999999,480.2186,86.0675999999999,480.0366,86.0225999999999z M481.3166,86.3105999999999C481.5596,86.4785999999999,481.7846,86.6005999999999,481.9896,86.6785999999999L481.8356,87.0435999999999C481.5506,86.9405999999999,481.2676,86.7785999999999,480.9846,86.5575999999999C480.6906,86.7205999999999,480.3676,86.8035999999999,480.0126,86.8035999999999C479.6536,86.8035999999999,479.3296,86.7165999999999,479.0376,86.5435999999999C478.7456,86.3705999999999,478.5206,86.1275999999999,478.3636,85.8145999999999C478.2056,85.5005999999999,478.1266,85.1485999999999,478.1266,84.7555999999999C478.1266,84.3645999999999,478.2056,84.0095999999999,478.3646,83.6885999999999C478.5226,83.3685999999999,478.7486,83.1235999999999,479.0406,82.9565999999999C479.3336,82.7885999999999,479.6616,82.7055999999999,480.0226,82.7055999999999C480.3886,82.7055999999999,480.7186,82.7915999999999,481.0116,82.9665999999999C481.3056,83.1405999999999,481.5286,83.3825999999999,481.6826,83.6955999999999C481.8366,84.0075999999999,481.9136,84.3605999999999,481.9136,84.7525999999999C481.9136,85.0785999999999,481.8646,85.3715999999999,481.7656,85.6325999999999C481.6656,85.8915999999999,481.5166,86.1185999999999,481.3166,86.3105999999999M480.1636,64.4115999999999C480.4656,64.4955999999999,480.7156,64.6215999999999,480.9116,64.7895999999999C481.2196,64.5085999999999,481.3736,64.0865999999999,481.3736,63.5225999999999C481.3736,63.2025999999999,481.3196,62.9225999999999,481.2096,62.6825999999999C481.1016,62.4435999999999,480.9416,62.2575999999999,480.7326,62.1245999999999C480.5216,61.9925999999999,480.2866,61.9265999999999,480.0256,61.9265999999999C479.6346,61.9265999999999,479.3106,62.0595999999999,479.0536,62.3275999999999C478.7956,62.5955999999999,478.6666,62.9945999999999,478.6666,63.5255999999999C478.6666,64.0405999999999,478.7946,64.4355999999999,479.0496,64.7115999999999C479.3046,64.9865999999999,479.6296,65.1245999999999,480.0256,65.1245999999999C480.2136,65.1245999999999,480.3896,65.0895999999999,480.5556,65.0195999999999C480.3916,64.9125999999999,480.2186,64.8375999999999,480.0366,64.7925999999999z M481.3166,65.0805999999999C481.5596,65.2485999999999,481.7846,65.3705999999999,481.9896,65.4485999999999L481.8356,65.8135999999999C481.5506,65.7105999999999,481.2676,65.5485999999999,480.9846,65.3275999999999C480.6906,65.4905999999999,480.3676,65.5735999999999,480.0126,65.5735999999999C479.6536,65.5735999999999,479.3296,65.4865999999999,479.0376,65.3135999999999C478.7456,65.1405999999999,478.5206,64.8975999999999,478.3636,64.5845999999999C478.2056,64.2705999999999,478.1266,63.9185999999999,478.1266,63.5255999999999C478.1266,63.1345999999999,478.2056,62.7795999999999,478.3646,62.4585999999999C478.5226,62.1385999999999,478.7486,61.8935999999999,479.0406,61.7265999999999C479.3336,61.5585999999999,479.6616,61.4755999999999,480.0226,61.4755999999999C480.3886,61.4755999999999,480.7186,61.5615999999999,481.0116,61.7365999999999C481.3056,61.9105999999999,481.5286,62.1525999999999,481.6826,62.4655999999999C481.8366,62.7775999999999,481.9136,63.1305999999999,481.9136,63.5225999999999C481.9136,63.8485999999999,481.8646,64.1415999999999,481.7656,64.4025999999999C481.6656,64.6615999999999,481.5166,64.8885999999999,481.3166,65.0805999999999M452.2393,79.5747000000001L458.1343,82.9777000000001L452.2393,86.3807000000001M468.3335,43.3501000000001L468.3335,51.8361000000001M468.334,94.4369999999999L468.334,102.923M467.4346,55.6475L468.4956,55.6475C468.7206,55.6475,468.8976,55.6245,469.0246,55.5775C469.1516,55.5315,469.2486,55.4565,469.3146,55.3535C469.3806,55.2515,469.4136,55.1395,469.4136,55.0195C469.4136,54.8425,469.3496,54.6985,469.2216,54.5845C469.0936,54.4715,468.8916,54.4145,468.6146,54.4145L467.4346,54.4145z M466.9416,57.7305L466.9416,54.0015L468.5946,54.0015C468.9266,54.0015,469.1796,54.0355,469.3526,54.1035C469.5256,54.1695,469.6636,54.2885,469.7676,54.4575C469.8706,54.6265,469.9226,54.8145,469.9226,55.0195C469.9226,55.2835,469.8366,55.5075,469.6646,55.6885C469.4946,55.8705,469.2296,55.9855,468.8726,56.0345C469.0026,56.0975,469.1016,56.1585,469.1696,56.2205C469.3136,56.3525,469.4506,56.5175,469.5796,56.7165L470.2276,57.7305L469.6066,57.7305L469.1136,56.9555C468.9696,56.7315,468.8506,56.5605,468.7576,56.4415C468.6646,56.3225,468.5806,56.2395,468.5066,56.1915C468.4336,56.1445,468.3576,56.1115,468.2816,56.0925C468.2266,56.0815,468.1346,56.0755,468.0076,56.0755L467.4346,56.0755L467.4346,57.7305zM466.479,91.3252000000002L466.991,91.2802000000002C467.015,91.4862000000002,467.072,91.6542000000002,467.16,91.7852000000002C467.249,91.9172000000002,467.387,92.0242000000002,467.573,92.1052000000002C467.76,92.1862000000002,467.97,92.2262000000002,468.204,92.2262000000002C468.41,92.2262000000002,468.593,92.1962000000002,468.752,92.1352000000002C468.911,92.0732000000002,469.028,91.9882000000002,469.106,91.8812000000002C469.184,91.7742000000002,469.223,91.6572000000002,469.223,91.5302000000002C469.223,91.4002000000002,469.186,91.2882000000002,469.11,91.1922000000002C469.036,91.0962000000002,468.912,91.0152000000002,468.741,90.9502000000002C468.631,90.9072000000002,468.387,90.8412000000002,468.01,90.7502000000002C467.633,90.6592000000002,467.369,90.5742000000002,467.218,90.4932000000002C467.022,90.3912000000002,466.875,90.2642000000002,466.78,90.1122000000002C466.683,89.9592000000002,466.635,89.7892000000002,466.635,89.6002000000002C466.635,89.3942000000002,466.694,89.2002000000002,466.812,89.0192000000002C466.929,88.8402000000002,467.101,88.7022000000002,467.327,88.6092000000002C467.552,88.5162000000002,467.804,88.4702000000002,468.08,88.4702000000002C468.384,88.4702000000002,468.653,88.5182000000002,468.885,88.6162000000002C469.117,88.7142000000002,469.296,88.8592000000002,469.421,89.0492000000002C469.546,89.2402000000002,469.613,89.4552000000002,469.623,89.6962000000002L469.102,89.7352000000002C469.074,89.4752000000002,468.979,89.2802000000002,468.818,89.1472000000002C468.656,89.0142000000002,468.417,88.9482000000002,468.103,88.9482000000002C467.774,88.9482000000002,467.535,89.0092000000002,467.384,89.1282000000002C467.234,89.2492000000002,467.159,89.3942000000002,467.159,89.5642000000002C467.159,89.7122000000002,467.212,89.8332000000002,467.318,89.9282000000002C467.423,90.0232000000002,467.696,90.1212000000002,468.137,90.2212000000002C468.579,90.3212000000002,468.882,90.4082000000002,469.046,90.4822000000002C469.285,90.5932000000002,469.461,90.7322000000002,469.575,90.9012000000002C469.689,91.0702000000002,469.746,91.2642000000002,469.746,91.4852000000002C469.746,91.7032000000002,469.684,91.9092000000002,469.559,92.1022000000002C469.434,92.2952000000002,469.253,92.4462000000002,469.02,92.5532000000002C468.785,92.6602000000002,468.521,92.7142000000002,468.229,92.7142000000002C467.857,92.7142000000002,467.545,92.6592000000002,467.295,92.5512000000002C467.043,92.4432000000002,466.847,92.2812000000002,466.704,92.0632000000002C466.562,91.8462000000002,466.486,91.5992000000002,466.479,91.3252000000002", "white");
            dTypersFlipFlop.Ports.Add(CreatePort("port1", 0, 0.305f));
            dTypersFlipFlop.Ports.Add(CreatePort("port2", 1, 0.305f));
            dTypersFlipFlop.Ports.Add(CreatePort("port3", 1, 0.665f));
            dTypersFlipFlop.Ports.Add(CreatePort("port4", 0, 0.665f));
            dTypersFlipFlop.Ports.Add(CreatePort("port5", 0.5f, 0));
            dTypersFlipFlop.Ports.Add(CreatePort("port5", 0.5f, 1));

            Node schmittTrigger = CreateNodes("SchmittTrigger", "M366.854,158.5884L396.253,175.5614L366.854,192.5344L366.854,158.5884zM384.3701,172.0488C382.9261,172.0488,381.7541,173.2198,381.7541,174.6648L381.7541,177.0538C381.7541,178.4988,380.5821,179.6698,379.1381,179.6698L369.8951,179.6698C371.3411,179.6698,372.5121,178.4988,372.5121,177.0538L372.5121,174.6648C372.5121,173.2198,373.6821,172.0488,375.1271,172.0488L384.3701,172.0488zM396.2534,175.5615L411.0004,175.5615M351.0005,175.5615L366.8545,175.5615", "white");
            schmittTrigger.Ports.Add(CreatePort("port1", 0, 0.5f));
            schmittTrigger.Ports.Add(CreatePort("port2", 1, 0.5f));

            Node norGate = CreateNodes("NorGate", "M14.5055,0.00562288 C14.3031,0.00562288 14.1078,0.0433293 13.9072,0.0542443 L13.9072,49.959 C14.1078,49.9699 14.3031,50.0079 14.5055,50.0079 C23.223,50.0079 30.29,28.3205 30.29,25.004 C30.29,22.2835 23.223,0.00562288 14.5055,0.00562288 z M13.9074,9.48911 L-0.00120828,9.48911 M13.9074,40.5218 L-0.00120828,40.5218 M36.3023,25.005 L50.0033,25.005 M36.2352,25.005 C36.2352,29.5191 35.0457,33.1879 33.5781,33.1879 C32.1105,33.1879 30.921,29.5191 30.921,25.005 C30.921,20.4908 32.1105,16.8223 33.5781,16.8223 C35.0457,16.8223 36.2352,20.4908 36.2352,25.005 z", "white");
            norGate.Ports.Add(CreatePort("port1", 0, 0.19f));
            norGate.Ports.Add(CreatePort("port2", 0, 0.805f));
            norGate.Ports.Add(CreatePort("port3", 1, 0.5f));

            Node xorGate = CreateNodes("XorGate", "M 10.8067 11.2343 L 0 11.2343 M 10.8067 28.7667 L 0 28.7667 M 30.2381 20.0006 L 40 20.0006 M 13.89 6.09441 C 13.04 5.62968 12.1551 5.34105 11.2419 5.34105 C 11.0944 5.34105 10.9521 5.36258 10.8064 5.36779 L 10.8064 34.6332 C 10.9521 34.6387 11.0944 34.6599 11.2419 34.6599 C 12.1551 34.6599 13.04 34.3769 13.89 33.9226 M 14.4869 0 C 14.285 0 14.09 0.0319609 13.8899 0.037179 L 13.8899 39.9628 C 14.09 39.9681 14.285 40 14.4869 40 C 23.1863 40 30.2386 22.6502 30.2386 20 C 30.2386 17.8253 23.1863 0 14.4869 0 Z", "white");
            xorGate.Ports.Add(CreatePort("port1", 0, 0.28f));
            xorGate.Ports.Add(CreatePort("port2", 0, 0.72f));
            xorGate.Ports.Add(CreatePort("port3", 1, 0.5f));

            Node orGate = CreateNodes("OrGate", "M16.4902,0 C16.2602,0 16.0382,0.0403673 15.8102,0.0468913 L15.8102,49.9641 C16.0382,49.9711 16.2602,50.011 16.4902,50.011 C26.3982,50.011 34.4302,28.3191 34.4302,25.0057 C34.4302,22.2864 26.3982,0 16.4902,0 z M15.8106,13.3355 L0.00256348,13.3355 M15.8106,36.678 L0.00256348,36.678 M34.4298,25.0061 L50.0018,25.0061", "white");
            orGate.Ports.Add(CreatePort("port1", 0, 0.26f));
            orGate.Ports.Add(CreatePort("port2", 0, 0.73f));
            orGate.Ports.Add(CreatePort("port3", 1, 0.5f));

            Node nandGate = CreateNodes("NandGate", "M14.5055,0.00562288 C14.3031,0.00562288 14.1078,0.0433293 13.9072,0.0542443 L13.9072,49.959 C14.1078,49.9699 14.3031,50.0079 14.5055,50.0079 C23.223,50.0079 30.29,28.3205 30.29,25.004 C30.29,22.2835 23.223,0.00562288 14.5055,0.00562288 z M13.9074,9.48911 L-0.00120828,9.48911 M13.9074,40.5218 L-0.00120828,40.5218 M36.3023,25.005 L50.0033,25.005 M36.2352,25.005 C36.2352,29.5191 35.0457,33.1879 33.5781,33.1879 C32.1105,33.1879 30.921,29.5191 30.921,25.005 C30.921,20.4908 32.1105,16.8223 33.5781,16.8223 C35.0457,16.8223 36.2352,20.4908 36.2352,25.005 z", "white");
            nandGate.Ports.Add(CreatePort("port1", 0, 0.19f));
            nandGate.Ports.Add(CreatePort("port2", 0, 0.805f));
            nandGate.Ports.Add(CreatePort("port3", 1, 0.5f));

            Node andGate = CreateNodes("AndGate", "M16.4863,0.00562288 C16.2563,0.00562288 16.0343,0.0433293 15.8063,0.0542443 L15.8063,49.959 C16.0343,49.9699 16.2563,50.0079 16.4863,50.0079 C26.3943,50.0079 34.4263,28.3205 34.4263,25.004 C34.4263,22.2835 26.3943,0.00562288 16.4863,0.00562288 z M15.8067,9.48911 L-0.00131226,9.48911 M15.8067,40.5218 L-0.00131226,40.5218 M34.4257,25.005 L49.9977,25.005", "white");
            andGate.Ports.Add(CreatePort("port1", 0, 0.19f));
            andGate.Ports.Add(CreatePort("port2", 0, 0.805f));
            andGate.Ports.Add(CreatePort("port3", 1, 0.5f));

            Node resistor = CreateNodes("Resistor", "M105.273,325.812L67.507,325.812L67.507,316.494L105.273,316.494zM105.2729,321.1533L116.3899,321.1533M56.3901,321.1533L67.5071,321.1533", "white");
            resistor.Ports.Add(CreatePort("port1", 0, 0.5f));
            resistor.Ports.Add(CreatePort("port2", 1, 0.5f));

            Node resistor1 = CreateNodes("Resistor1", "M0.00195312,24.9833 L12.9799,24.9833 M37.0215,24.9833 L50.0016,24.9833 M37.0208,49.9859 L12.9788,49.9859 L12.9788,-0.0104167 L37.0208,-0.0104167 z", "white");
            resistor1.Ports.Add(CreatePort("port1", 0, 0.5f));
            resistor1.Ports.Add(CreatePort("port2", 1, 0.5f));

            Node potentiometer1 = CreateNodes("Potentiometer1", "M452.2852,314.0801L462.3952,314.0771L465.2992,307.0111L471.1102,321.1491L476.9212,307.0111L482.7322,321.1491L488.5432,307.0111L494.3542,321.1491L500.1652,307.0111L503.0752,314.0901L512.2852,314.0901M484.2896,335.2515L484.2896,321.1865M480.8467,325.6143L484.2897,321.1493L487.7317,325.6143", "white");
            potentiometer1.Ports.Add(CreatePort("port1", 0, 0.25f));
            potentiometer1.Ports.Add(CreatePort("port2", 1, 0.25f));
            potentiometer1.Ports.Add(CreatePort("port3", 0.53f, 1));

            Node potentiometerTrimmer = CreateNodes("PotentiometerTrimmer", "M615.585,323.105L577.819,323.105L577.819,313.786L615.585,313.786zM615.585,318.4453L626.702,318.4453M566.7021,318.4453L577.8191,318.4453M596.7021,324.1357L596.7021,323.2277M596.7021,333.6982L596.7021,325.6222M600.887,325.622L592.518,325.622L592.518,324.136L600.887,324.136z", "white");
            potentiometerTrimmer.Ports.Add(CreatePort("port1", 0, 0.23f));
            potentiometerTrimmer.Ports.Add(CreatePort("port2", 1, 0.23f));
            potentiometerTrimmer.Ports.Add(CreatePort("port3", 0.5f, 1));

            Node potentiometerTrimmer1 = CreateNodes("PotentiometerTrimmer1", "M692.2207,314.1973L702.3307,314.1943L705.2357,307.1283L711.0457,321.2663L716.8577,307.1283L722.6687,321.2663L728.4807,307.1283L734.2907,321.2663L740.1017,307.1283L743.0117,314.2073L752.2207,314.2073M723.4004,335.9604L723.4004,325.0274M729.512,325.027L717.29,325.027L717.29,322.856L729.512,322.856z", "white");
            potentiometerTrimmer1.Ports.Add(CreatePort("port1", 0, 0.25f));
            potentiometerTrimmer1.Ports.Add(CreatePort("port2", 1, 0.25f));
            potentiometerTrimmer1.Ports.Add(CreatePort("port3", 0.52f, 1));

            Node resistorTrimmer1 = CreateNodes("ResistorTrimmer1", "M865.714,320.972L827.948,320.972L827.948,311.653L865.714,311.653zM865.7139,316.313L876.8309,316.313M816.8311,316.313L827.9481,316.313M851.4727,296.2871L861.3197,303.5931M856.3965,299.9399L836.3055,327.0199", "white");
            resistorTrimmer1.Ports.Add(CreatePort("port1", 0, 0.65f));
            resistorTrimmer1.Ports.Add(CreatePort("port2", 1, 0.65f));

            Node resistorTrimmer = CreateNodes("ResistorTrimmer", "M946.334,310.8965L956.444,310.8935L959.348,303.8285L965.159,317.9655L970.971,303.8285L976.781,317.9655L982.593,303.8285L988.403,317.9655L994.215,303.8285L997.124,310.9075L1006.334,310.9075M989.2852,283.0469L1003.6672,293.7159M996.4756,288.3809L967.1346,327.9299", "white");
            resistorTrimmer.Ports.Add(CreatePort("port1", 0, 0.62f));
            resistorTrimmer.Ports.Add(CreatePort("port2", 1, 0.62f));

            Node resistorVariable = CreateNodes("ResistorVariable", "M1123.166,309.783L1085.4,309.783L1085.4,300.464L1123.166,300.464zM1123.166,305.124L1134.283,305.124M1074.2832,305.124L1085.4002,305.124M1094.6689,315.1362L1115.5389,291.2042M1110.3027,293.3345L1115.5387,291.2045L1113.9867,296.8575", "white");
            resistorVariable.Ports.Add(CreatePort("port1", 0, 0.58f));
            resistorVariable.Ports.Add(CreatePort("port2", 1, 0.58f));

            Node resistorInstrumentRelayShunt = CreateNodes("ResistorInstrumentRelayShunt", "M242.548,401.307L204.782,401.307L204.782,391.989L242.548,391.989zM242.5625,396.6475L253.6795,396.6475M193.6797,396.6475L204.7967,396.6475M219.9341,396.6475C219.9341,398.0175,218.8231,399.1275,217.4541,399.1275C216.0831,399.1275,214.9731,398.0175,214.9731,396.6475C214.9731,395.2775,216.0831,394.1675,217.4541,394.1675C218.8231,394.1675,219.9341,395.2775,219.9341,396.6475zM232.3574,396.6475C232.3574,398.0175,231.2474,399.1275,229.8774,399.1275C228.5074,399.1275,227.3964,398.0175,227.3964,396.6475C227.3964,395.2775,228.5074,394.1675,229.8774,394.1675C231.2474,394.1675,232.3574,395.2775,232.3574,396.6475z", "white");
            resistorInstrumentRelayShunt.Ports.Add(CreatePort("port1", 0, 0.5f));
            resistorInstrumentRelayShunt.Ports.Add(CreatePort("port2", 1, 0.5f));

            Node varistorSymmetrical = CreateNodes("VaristorSymmetrical", "M585.0137,411.6792L595.1237,411.6762L598.0277,404.6102L603.8387,418.7482L609.6507,404.6102L615.4607,418.7482L621.2727,404.6102L627.0827,418.7482L632.8947,404.6102L635.8037,411.6892L645.0137,411.6892M614.5146,421.0488L617.8826,430.9158L621.2496,421.0488M635.1553,389.1636L605.8143,428.7116L593.8733,428.7116", "transparent");
            varistorSymmetrical.Ports.Add(CreatePort("port1", 0, 0.54f));
            varistorSymmetrical.Ports.Add(CreatePort("port2", 1, 0.54f));

            Node memoristor = CreateNodes("Memristor", "M1010.334,411.1719L1002.287,411.1719L1002.287,419.2329L996.798,419.2329L996.798,403.1109L991.311,403.1109L991.311,419.2329L985.822,419.2329L985.822,403.1109L980.333,403.1109L980.333,419.2329L974.846,419.2329L974.846,403.1109L969.357,403.1109L969.357,419.2329L963.869,419.2329L963.869,403.1109L958.381,403.1109L958.381,411.1719L950.334,411.1719", "transparent");
            memoristor.Ports.Add(CreatePort("port1", 0, 0.5f));
            memoristor.Ports.Add(CreatePort("port2", 1, 0.5f));

            Node memoristor1 = CreateNodes("Memristor1", "M1141.834,409.9756L1132.271,409.9756L1132.271,417.3596L1127.243,417.3596L1127.243,402.5916L1122.216,402.5916L1122.216,417.3596L1117.189,417.3596L1117.189,402.5916L1112.161,402.5916L1112.161,417.3596L1107.135,417.3596L1107.135,402.5916L1102.107,402.5916L1102.107,417.3596L1097.081,417.3596L1097.081,402.5916L1092.053,402.5916L1092.053,409.9756L1081.834,409.756zM1134.17,418.976L1090.155,418.976L1090.155,400.976L1134.17,400.976z", "transparent");
            memoristor1.Ports.Add(CreatePort("port1", 0, 0.5f));
            memoristor1.Ports.Add(CreatePort("port2", 1, 0.5f));

            Node magmetoresistor = CreateNodes("Magnetoresistor", "M53.0078,480.1865L63.1178,480.1825L66.0218,473.1185L71.8328,487.2555L77.6438,473.1185L83.4558,487.2555L89.2658,473.1185L95.0768,487.2555L100.8878,473.1185L103.7988,480.1975L113.0078,480.1975M103.1499,457.6699L73.8089,497.2199M87.5459,489.1191L81.9759,498.1501M87.5459,489.1191L81.9759,498.1501", null);
            magmetoresistor.Ports.Add(CreatePort("port1", 0, 0.56f));
            magmetoresistor.Ports.Add(CreatePort("port2", 1, 0.56f));

            Node photoconductiveTransducerSymmetrical = CreateNodes("PhotoconductiveTransducerSymmetrical", "M243.7515,461.2246L235.1845,471.0486M238.4751,469.9727L234.9691,471.3987L236.0081,467.6137M239.2524,457.1484L230.6854,466.9724M233.9761,465.8955L230.4701,467.3225L231.5091,463.5365M186.043,485.7324L196.153,485.7284L199.057,478.6644L204.868,492.8014L210.679,478.6644L216.491,492.8014L222.301,478.6644L228.112,492.8014L233.923,478.6644L236.834,485.7434L246.043,485.7434", "white");
            photoconductiveTransducerSymmetrical.Ports.Add(CreatePort("port1", 0, 0.8f));
            photoconductiveTransducerSymmetrical.Ports.Add(CreatePort("port2", 1, 0.8f));

            Node capacitorus = CreateNodes("Capacitorus", "M68.9854,609.7764L68.9854,638.3084M74.356,609.7764L74.356,638.3084M101.6709,624.043L74.3569,624.043M68.9854,624.043L41.6714,624.043", null);
            capacitorus.Ports.Add(CreatePort("port1", 0, 0.5f));
            capacitorus.Ports.Add(CreatePort("port2", 1, 0.5f));

            Node capacitorus1 = CreateNodes("Capacitorus1", "M164.6597,609.9551L164.6597,638.4871M197.3452,624.2207L170.0312,624.2207M164.6597,624.2207L137.3457,624.2207M175.082,609.8477C171.924,613.7857,170.031,618.7807,170.031,624.2207C170.031,629.6607,171.925,634.6577,175.083,638.5947", "white");
            capacitorus1.Ports.Add(CreatePort("port1", 0, 0.5f));
            capacitorus1.Ports.Add(CreatePort("port2", 1, 0.5f));

            Node differentialCapacitor = CreateNodes("DifferentialCapacitor", "M640.4473,608.7969L640.4473,637.3289M645.8184,608.7969L645.8184,637.3289M643.1328,592.4492L643.1328,637.4192M673.1338,623.0635L645.8188,623.0635M640.4473,623.0635L613.1343,623.0635M630.4951,637.5576L655.7711,608.5706M649.4307,611.1504L655.7717,608.5704L653.8917,615.4184", "transparent");
            differentialCapacitor.Ports.Add(CreatePort("port1", 0, 0.68f));
            differentialCapacitor.Ports.Add(CreatePort("port2", 1, 0.68f));

            Node tuningVariableCapacitorus = CreateNodes("TuningVariableCapacitorus", "M728.8008,609.5645L728.8008,637.2725M735.7471,609.5645L735.7471,637.2725M762.2744,623.4189L735.7484,623.4189M728.8008,623.4189L702.2748,623.4189M740.2998,601.293L750.1478,608.598M745.2236,604.9453L721.0756,637.4943", "transparent");
            tuningVariableCapacitorus.Ports.Add(CreatePort("port1", 0, 0.617f));
            tuningVariableCapacitorus.Ports.Add(CreatePort("port2", 1, 0.617f));

            Node tuningVariableCapacitorus1 = CreateNodes("TuningVariableCapacitorus1", "M822.6855,609.4346L822.6855,637.9666M855.3701,623.7002L828.0571,623.7002M822.6855,623.7002L795.3705,623.7002M833.1074,609.3262C829.9494,613.2642,828.0564,618.2602,828.0564,623.7002C828.0564,629.1392,829.9504,634.1372,833.1084,638.0732M835.4111,600.7588L845.5511,608.2798M840.4805,604.5195L815.6145,638.0355", "transparent");
            tuningVariableCapacitorus1.Ports.Add(CreatePort("port1", 0, 0.617f));
            tuningVariableCapacitorus1.Ports.Add(CreatePort("port2", 1, 0.617f));

            Node gangedCapacitorus = CreateNodes("GangedCapacitorus", "M73.5747,689.6504L73.5747,710.6614M78.8423,689.6504L78.8423,710.6614M98.9565,700.1562L78.8425,700.1562M73.5747,700.1562L53.4607,700.1562M66.5625,710.8574L91.1225,682.6934M84.9609,685.2002L91.1219,682.6932L89.2959,689.3462M73.5747,721.4863L73.5747,742.4973M78.8423,721.4863L78.8423,742.4973M98.9565,731.9922L78.8425,731.9922M73.5747,731.9922L53.4607,731.9922M66.5625,742.6934L91.1225,714.5294M84.9609,717.0361L91.1219,714.5291L89.2959,721.1821M66.5625,710.6611L66.5625,714.7531M66.5625,716.667L66.5625,720.76M66.5625,722.459L66.5625,726.552M66.5625,727.6611L66.5625,731.7541M66.5625,733.4531L66.5625,737.5451M66.5625,738.4043L66.5625,742.4973", "transparent");
            gangedCapacitorus.Ports.Add(CreatePort("port1", 0, 0.287f));
            gangedCapacitorus.Ports.Add(CreatePort("port2", 1, 0.287f));
            gangedCapacitorus.Ports.Add(CreatePort("port3", 0, 0.82f));
            gangedCapacitorus.Ports.Add(CreatePort("port4", 1, 0.82f));

            Node multipleCapacitorus = CreateNodes("MultipleCapacitorus", "M177.0234,722.5498L177.0234,750.2938M203.5845,736.4219L177.0235,736.4219M177.0234,690.2939L177.0234,718.0379M203.5845,704.167L177.0235,704.167M171.8013,690.2939L171.8013,750.2939M171.8013,720.2939L145.2403,720.2939", "transparent");
            multipleCapacitorus.Ports.Add(CreatePort("port1", 0, 0.5f));
            multipleCapacitorus.Ports.Add(CreatePort("port2", 1, 0.23f));
            multipleCapacitorus.Ports.Add(CreatePort("port3", 1, 0.77f));

            Node inductorAirCore = CreateNodes("InductorAirCore", "M146.5649,820.1582L137.1319,820.1582C137.1319,817.3352,134.8429,815.0482,132.0219,815.0482C129.1989,815.0482,126.9109,817.3352,126.9109,820.1582C126.9109,817.3352,124.6229,815.0482,121.7989,815.0482C118.9769,815.0482,116.6889,817.3352,116.6889,820.1582C116.6889,817.3352,114.4009,815.0482,111.5779,815.0482C108.7549,815.0482,106.4669,817.3352,106.4669,820.1582C106.4669,817.3352,104.1789,815.0482,101.3569,815.0482C98.5339,815.0482,96.2459,817.3352,96.2459,820.1582L86.5649,820.1582", "transparent");
            inductorAirCore.Ports.Add(CreatePort("port1", 0, 1));
            inductorAirCore.Ports.Add(CreatePort("port2", 1, 1));

            Node transformerIronCore = CreateNodes("TransformerIronCore", "M899.6162,836.9971L899.6162,822.2101C899.6162,818.0961,902.9522,814.7611,907.0652,814.7611C911.1792,814.7611,914.5122,818.0961,914.5122,822.2101C914.5122,818.0961,917.8482,814.7611,921.9622,814.7611C926.0752,814.7611,929.4112,818.0961,929.4112,822.2101C929.4112,818.0961,932.7452,814.7611,936.8582,814.7611C940.9712,814.7611,944.3052,818.0961,944.3052,822.2101C944.3052,818.0961,947.6412,814.7611,951.7552,814.7611C955.8682,814.7611,959.2022,818.0961,959.2022,822.2101L959.2022,836.9971M959.2021,776.9971L959.2021,791.7861C959.2021,795.8991,955.8681,799.2331,951.7531,799.2331C947.6411,799.2331,944.3061,795.8991,944.3061,791.7861C944.3061,795.8991,940.9701,799.2331,936.8581,799.2331C932.7451,799.2331,929.4091,795.8991,929.4091,791.7861C929.4091,795.8991,926.0751,799.2331,921.9621,799.2331C917.8471,799.2331,914.5131,795.8991,914.5131,791.7861C914.5131,795.8991,911.1791,799.2331,907.0631,799.2331C902.9521,799.2331,899.6161,795.8991,899.6161,791.7861L899.6161,776.9971M899.6162,803.8037L959.2022,803.8037M899.6162,806.9971L959.2022,806.9971M899.6162,810.1924L959.2022,810.1924", "transparent");
            transformerIronCore.Ports.Add(CreatePort("port1", 0, 0));
            transformerIronCore.Ports.Add(CreatePort("port2", 1, 0));
            transformerIronCore.Ports.Add(CreatePort("port3", 0, 1));
            transformerIronCore.Ports.Add(CreatePort("port4", 1, 1));

            Node Spdt = CreateNodes("Spdt", "M215.1401,941.3369C215.1401,942.3939,214.2841,943.2509,213.2261,943.2509C212.1681,943.2509,211.3121,942.3939,211.3121,941.3369C211.3121,940.2799,212.1681,939.4229,213.2261,939.4229C214.2841,939.4229,215.1401,940.2799,215.1401,941.3369zM211.312,941.3369L195.216,941.3369M234.6821,927.9443C234.6821,926.8873,235.5381,926.0303,236.5961,926.0303C237.6541,926.0303,238.5101,926.8873,238.5101,927.9443C238.5101,929.0023,237.6541,929.8593,236.5961,929.8593C235.5381,929.8593,234.6821,929.0023,234.6821,927.9443zM238.5103,927.9443L254.6073,927.9443M235.2915,941.3369C235.2915,940.2789,236.1485,939.4229,237.2055,939.4229C238.2635,939.4229,239.1195,940.2789,239.1195,941.3369C239.1195,942.3939,238.2635,943.2509,237.2055,943.2509C236.1485,943.2509,235.2915,942.3939,235.2915,941.3369zM239.1196,941.3369L255.2166,941.3369M215.1401,941.376L237.1571,930.12", "transparent");
            Spdt.Ports.Add(CreatePort("port1", 1, 0.11f));
            Spdt.Ports.Add(CreatePort("port2", 0, 0.885f));
            Spdt.Ports.Add(CreatePort("port3", 1, 0.885f));

            Node PushButtonOn = CreateNodes("PushButtonOn", "M552.5669,941.3682C552.5669,940.3412,553.3989,939.5092,554.4259,939.5092C555.4539,939.5092,556.2859,940.3412,556.2859,941.3682C556.2859,942.3952,555.4539,943.2272,554.4259,943.2272C553.3989,943.2272,552.5669,942.3952,552.5669,941.3682zM556.2856,941.3682L571.9206,941.3682M531.2749,941.3682C531.2749,942.3952,530.4429,943.2272,529.4159,943.2272C528.3889,943.2272,527.5559,942.3952,527.5559,941.3682C527.5559,940.3412,528.3889,939.5092,529.4159,939.5092C530.4429,939.5092,531.2749,940.3412,531.2749,941.3682zM527.5562,941.3682L511.9202,941.3682M529.4155,938.2959L555.1005,938.2959M538.4683,926.0537L546.0473,926.0537M542.2573,938.2959L542.2573,926.0539", "transparent");
            PushButtonOn.Ports.Add(CreatePort("port1", 0.5f, 0));
            PushButtonOn.Ports.Add(CreatePort("port2", 0, 0.886f));
            PushButtonOn.Ports.Add(CreatePort("port3", 1, 0.886f));

            Node diode = CreateNodes("Diode", "M35.2441,25 L22.7161,49.9937 L22.7161,0.00657536 L35.2441,25 z M22.7167,25 L-0.00131226,25 M35.2441,49.6337 L35.2441,0.368951 M35.2441,25 L49.9981,25", "transparent");
            diode.Ports.Add(CreatePort("port1", 0, 0.5f));
            diode.Ports.Add(CreatePort("port2", 1, 0.5f));

            Node transorb2 = CreateNodes("Transorb2", "M335.7134,1140.3271L325.2284,1140.3271M334.6646,1128.4541L355.2276,1140.3271L334.6646,1152.1991zM374.7427,1140.3262L385.2277,1140.3262M375.7915,1152.1992L355.2285,1140.3272L375.7915,1128.4542zM349.2407,1125.8291L355.2357,1129.0181L355.2357,1152.7641L360.8277,1155.0881", "white");
            transorb2.Ports.Add(CreatePort("port1", 0, 0.5f));
            transorb2.Ports.Add(CreatePort("port2", 1, 0.5f));

            Node breakdown = CreateNodes("Breakdown", "M472.6069,1070.7139L472.6069,1046.8469L467.7129,1046.8469M492.23,1058.7803L472.364,1058.7803M452.0962,1058.7803L432.2302,1058.7803M452.0962,1046.8467L472.7652,1058.7807L452.0962,1070.7137z    ", "white");
            breakdown.Ports.Add(CreatePort("port1", 0, 0.5f));
            breakdown.Ports.Add(CreatePort("port2", 1, 0.5f));

            Node ac = CreateNodes("Ac", "M191.8989,1257.0439C191.8989,1273.6119,178.4669,1287.0439,161.8989,1287.0439C145.3309,1287.0439,131.8989,1273.6119,131.8989,1257.0439C131.8989,1240.4759,145.3309,1227.0439,161.8989,1227.0439C178.4669,1227.0439,191.8989,1240.4759,191.8989,1257.0439zM180.1567,1257.0664C178.6847,1260.6584,175.1547,1263.1894,171.0327,1263.1894C166.9017,1263.1894,163.3647,1260.6474,161.8987,1257.0444C160.4327,1253.4404,156.8957,1250.9004,152.7647,1250.9004C148.6427,1250.9004,145.1127,1253.4314,143.6407,1257.0234", "white");
            ac.Ports.Add(CreatePort("port1", 0.5f, 0));
            ac.Ports.Add(CreatePort("port2", 1, 0.5f));
            ac.Ports.Add(CreatePort("port3", 0.5f, 1));
            ac.Ports.Add(CreatePort("port4", 0, 0.5f));
            ac.Ports.Add(CreatePort("port5", 0.152f, 0.15f));
            ac.Ports.Add(CreatePort("port6", 0.852f, 0.15f));
            ac.Ports.Add(CreatePort("port7", 0.852f, 0.85f));
            ac.Ports.Add(CreatePort("port8", 0.152f, 0.85f));

            Node current = CreateNodes("Current", "M270.0972,1258.3525C270.0972,1268.2885,262.0432,1276.3415,252.1082,1276.3415C242.1722,1276.3415,234.1182,1268.2885,234.1182,1258.3525C234.1182,1248.4175,242.1722,1240.3635,252.1082,1240.3635C262.0432,1240.3635,270.0972,1248.4175,270.0972,1258.3525zM270.0962,1234.3311C270.0962,1244.2661,262.0412,1252.3201,252.1082,1252.3201C242.1722,1252.3201,234.1182,1244.2661,234.1182,1234.3311C234.1182,1224.3951,242.1722,1216.3421,252.1082,1216.3421C262.0412,1216.3421,270.0962,1224.3951,270.0962,1234.3311z", "white");
            current.Ports.Add(CreatePort("port1", 0.5f, 0));
            current.Ports.Add(CreatePort("port2", 0.5f, 1));

            Node dependent1 = CreateNodes("Dependent1", "M727.6904,1274.3203L697.6904,1244.3213L727.6904,1214.3213L757.6904,1244.3213L727.6904,1274.3203zM727.6904,1225.541L727.6904,1263.024M734.4443,1253.2998L727.6883,1263.0998L720.9363,1253.2998", "transparent");
            dependent1.Ports.Add(CreatePort("port1", 0, 0.5f));
            dependent1.Ports.Add(CreatePort("port2", 0.5f, 0));
            dependent1.Ports.Add(CreatePort("port3", 1, 0.5f));
            dependent1.Ports.Add(CreatePort("port4", 0.5f, 1));

            Node noise1 = CreateNodes("Noise", "M948.6221,1248.3701C948.6221,1264.9381,935.1901,1278.3701,918.6221,1278.3701C902.0541,1278.3701,888.6221,1264.9381,888.6221,1248.3701C888.6221,1231.8021,902.0541,1218.3701,918.6221,1218.3701C935.1901,1218.3701,948.6221,1231.8021,948.6221,1248.3701zM918.6221,1229.0684L918.6221,1250.4084M898.3252,1243.8145L918.6222,1250.4085M906.0791,1267.6738L918.6221,1250.4078M931.167,1267.6738L918.622,1250.4078M938.9189,1243.8145L918.6219,1250.4085", "white");
            noise1.Ports.Add(CreatePort("port1", 0.5f, 0));
            noise1.Ports.Add(CreatePort("port2", 1, 0.5f));
            noise1.Ports.Add(CreatePort("port3", 0.5f, 1));
            noise1.Ports.Add(CreatePort("port4", 0, 0.5f));
            noise1.Ports.Add(CreatePort("port5", 0.152f, 0.15f));
            noise1.Ports.Add(CreatePort("port6", 0.852f, 0.15f));
            noise1.Ports.Add(CreatePort("port7", 0.852f, 0.85f));
            noise1.Ports.Add(CreatePort("port8", 0.152f, 0.85f));

            Node bjtnpn = CreateNodes("Bjtnpn", "M106.7124,1391.4395C106.7124,1403.7695,96.7164,1413.7655,84.3854,1413.7655C72.0554,1413.7655,62.0594,1403.7695,62.0594,1391.4395C62.0594,1379.1085,72.0554,1369.1125,84.3854,1369.1125C96.7164,1369.1125,106.7124,1379.1085,106.7124,1391.4395zM93.9116,1402.9111L98.6226,1408.6261L91.2406,1408.0031L93.9116,1402.9111zM92.5767,1405.4561L77.4697,1397.5341M46.7124,1391.4395L77.4114,1391.4395M77.4116,1379.0049L77.4116,1403.8739M77.4116,1385.0312L98.6546,1374.2672M98.6548,1374.2676L98.6548,1363.1336M98.6548,1419.4092L98.6548,1408.5632", "white");
            bjtnpn.Ports.Add(CreatePort("port1", 0, 0.5f));
            bjtnpn.Ports.Add(CreatePort("port2", 0.86f, 0));
            bjtnpn.Ports.Add(CreatePort("port3", 0.86f, 1));

            Node jfetpnp = CreateNodes("Jfetpnp", "M294.5259,1392.6416C294.5259,1406.6976,283.1309,1418.0906,269.0759,1418.0906C255.0199,1418.0906,243.6269,1406.6976,243.6269,1392.6416C243.6269,1378.5856,255.0199,1367.1916,269.0759,1367.1916C283.1309,1367.1916,294.5259,1378.5856,294.5259,1392.6416zM256.0181,1404.9238L264.7301,1401.2258L256.1771,1397.1698L256.0181,1404.9238zM256.0991,1401.0479L234.5261,1400.6079M265.4282,1377.0986L265.4282,1405.4466M265.394,1401.2402L280.488,1401.2402L280.488,1425.4392M265.394,1381.3047L280.488,1381.3047L280.488,1357.1047", null);
            jfetpnp.Ports.Add(CreatePort("port1", 0, 0.63f));
            jfetpnp.Ports.Add(CreatePort("port2", 0.765f, 0));
            jfetpnp.Ports.Add(CreatePort("port3", 0.765f, 1));

            Node jjfetpnp = CreateNodes("Jjfetpnp1", "M384.7749,1392.4746C384.7749,1404.8156,374.7699,1414.8206,362.4289,1414.8206C350.0869,1414.8206,340.0839,1404.8156,340.0839,1392.4746C340.0839,1380.1326,350.0869,1370.1286,362.4289,1370.1286C374.7699,1370.1286,384.7749,1380.1326,384.7749,1392.4746zM349.2114,1396.0645L341.5624,1399.3125L349.0714,1402.8735L349.2114,1396.0645zM341.2612,1399.3213L332.0912,1399.3213M358.9175,1399.4648L349.2095,1399.4648M359.2241,1378.8271L359.2241,1403.7181M359.2153,1400.0244L372.4673,1400.0244L372.4673,1421.2714M359.2153,1382.5195L372.4673,1382.5195L372.4673,1361.2715", "transparent");
            jjfetpnp.Ports.Add(CreatePort("port1", 0, 0.63f));
            jjfetpnp.Ports.Add(CreatePort("port2", 0.765f, 0));
            jjfetpnp.Ports.Add(CreatePort("port3", 0.765f, 1));

            Node mosfetInductivechannelp = CreateNodes("MosfetInductiveChannelp", "M759.0615,1392.4746C759.0615,1404.8156,749.0575,1414.8206,736.7155,1414.8206C724.3755,1414.8206,714.3705,1404.8156,714.3705,1392.4746C714.3705,1380.1326,724.3755,1370.1286,736.7155,1370.1286C749.0575,1370.1286,759.0615,1380.1326,759.0615,1392.4746zM736.0322,1395.4912L743.6222,1392.1092L736.0522,1388.6802L736.0322,1395.4912zM732.335,1396.7295L732.335,1403.7175M732.335,1387.5996L732.335,1394.5866M732.335,1378.8115L732.335,1385.7985M732.3252,1400.0244L745.5772,1400.0244L745.5772,1421.2714M730.3037,1378.8115L730.3037,1403.4305L709.0577,1403.4305M743.6104,1392.0859L745.5774,1392.0859L745.5774,1399.7229M732.3252,1382.5195L745.5772,1382.5195L745.5772,1361.2715M735.9131,1392.1094L732.5811,1392.1094", "white");
            mosfetInductivechannelp.Ports.Add(CreatePort("port1", 0, 0.7f));
            mosfetInductivechannelp.Ports.Add(CreatePort("port2", 0.73f, 0));
            mosfetInductivechannelp.Ports.Add(CreatePort("port3", 0.73f, 1));

            Node dualGateMosfetnDualGateMosfetn = CreateNodes("DualGateMosfetnDualGateMosfetn", "M1040.7822,1392.4746C1040.7822,1404.8156,1030.7782,1414.8206,1018.4362,1414.8206C1006.0962,1414.8206,996.0912,1404.8156,996.0912,1392.4746C996.0912,1380.1326,1006.0962,1370.1286,1018.4362,1370.1286C1030.7782,1370.1286,1040.7822,1380.1326,1040.7822,1392.4746zM1021.7236,1388.6816L1014.0756,1391.9286L1021.7236,1395.4906L1021.7236,1388.6816zM1014.0537,1378.8271L1014.0537,1403.7181M1014.0537,1400.0244L1027.3077,1400.0244L1027.3077,1421.2714M1012.0244,1394.8506L1012.0244,1402.3526L990.7764,1402.3526M1012.0244,1379.8896L1012.0244,1387.3916L990.7764,1387.3916M1021.708,1392.0859L1027.308,1392.0859L1027.308,1400.0349M1014.0537,1382.5195L1027.3077,1382.5195L1027.3077,1361.2715", "white");
            dualGateMosfetnDualGateMosfetn.Ports.Add(CreatePort("port1", 0, 0.43f));
            dualGateMosfetnDualGateMosfetn.Ports.Add(CreatePort("port2", 0, 0.685f));
            dualGateMosfetnDualGateMosfetn.Ports.Add(CreatePort("port3", 0.73f, 0));
            dualGateMosfetnDualGateMosfetn.Ports.Add(CreatePort("port4", 0.73f, 1));

            Node oscilloscope = CreateNodes("Oscilloscope", "M450.1704,1516.0322C450.1704,1532.6002,436.7384,1546.0322,420.1704,1546.0322C403.6024,1546.0322,390.1704,1532.6002,390.1704,1516.0322C390.1704,1499.4642,403.6024,1486.0322,420.1704,1486.0322C436.7384,1486.0322,450.1704,1499.4642,450.1704,1516.0322zM399.5942,1523.6045L408.9692,1508.4595L408.9692,1523.6045L418.3442,1508.4595L418.3442,1523.6045L427.7192,1508.4595L427.7192,1523.6045L437.0942,1508.4595L437.0942,1523.6045L442.6492,1514.6305", "white");
            oscilloscope.Ports.Add(CreatePort("port1", 0.5f, 0));
            oscilloscope.Ports.Add(CreatePort("port2", 1, 0.5f));
            oscilloscope.Ports.Add(CreatePort("port3", 0.5f, 1));
            oscilloscope.Ports.Add(CreatePort("port4", 0, 0.5f));
            oscilloscope.Ports.Add(CreatePort("port5", 0.152f, 0.15f));
            oscilloscope.Ports.Add(CreatePort("port6", 0.852f, 0.15f));
            oscilloscope.Ports.Add(CreatePort("port7", 0.852f, 0.85f));
            oscilloscope.Ports.Add(CreatePort("port8", 0.152f, 0.85f));
            Node SingleGenerator = CreateNodes("SingleGenerator", "M557.5435,1516.0322C557.5435,1532.6002,544.1115,1546.0322,527.5435,1546.0322C510.9755,1546.0322,497.5435,1532.6002,497.5435,1516.0322C497.5435,1499.4642,510.9755,1486.0322,527.5435,1486.0322C544.1115,1486.0322,557.5435,1499.4642,557.5435,1516.0322zM540.5952,1498.54C539.5992,1501.132,537.1152,1502.993,534.1682,1503.059C531.2152,1503.124,528.6472,1501.361,527.5432,1498.808C526.4392,1496.255,523.8712,1494.494,520.9192,1494.56C517.9722,1494.623,515.4882,1496.486,514.4912,1499.078M515.5601,1537.5088L523.5491,1526.4478L523.5491,1537.5088L531.5381,1526.4478L531.5381,1537.5088L539.5271,1526.4478L539.5271,1537.5088M521.188,1510.959L521.188,1508.136L527.645,1508.136L527.645,1522.651L533.899,1522.651L533.899,1520.039", "white");
            SingleGenerator.Ports.Add(CreatePort("port1", 0.5f, 0));
            SingleGenerator.Ports.Add(CreatePort("port2", 1, 0.5f));
            SingleGenerator.Ports.Add(CreatePort("port3", 0.5f, 1));
            SingleGenerator.Ports.Add(CreatePort("port4", 0, 0.5f));
            SingleGenerator.Ports.Add(CreatePort("port5", 0.152f, 0.15f));
            SingleGenerator.Ports.Add(CreatePort("port6", 0.852f, 0.15f));
            SingleGenerator.Ports.Add(CreatePort("port7", 0.852f, 0.85f));
            SingleGenerator.Ports.Add(CreatePort("port8", 0.152f, 0.85f));

            Node loopAntenna = CreateNodes("LoopAntenna", "M278.8193,1675.6992L278.8193,1664.1412C270.3793,1659.9752,264.5733,1651.2822,264.5733,1641.2322C264.5733,1627.1302,276.0043,1615.6992,290.1053,1615.6992C304.2073,1615.6992,315.6383,1627.1302,315.6383,1641.2322C315.6383,1651.2122,309.9103,1659.8562,301.5633,1664.0542L301.5633,1675.6992", null);
            loopAntenna.Ports.Add(CreatePort("port1", 0.28f, 1));
            loopAntenna.Ports.Add(CreatePort("port2", 0.73f, 1));

            Node electricalMotor = CreateNodes("ElectricalMotor", "M349.293,1641.6387L363.986,1641.6387M394.5996,1641.6387L409.2926,1641.6387M394.5996,1641.6387C394.5996,1650.0927,387.7456,1656.9457,379.2926,1656.9457C370.8396,1656.9457,363.9866,1650.0927,363.9866,1641.6387C363.9866,1633.1847,370.8396,1626.3317,379.2926,1626.3317C387.7456,1626.3317,394.5996,1633.1847,394.5996,1641.6387zM374.7314,1646.4189L374.7314,1636.8579L376.6364,1636.8579L378.8994,1643.6279C379.1064,1644.2589,379.2594,1644.7299,379.3554,1645.0419C379.4644,1644.6939,379.6334,1644.1849,379.8634,1643.5109L382.1534,1636.8579L383.8544,1636.8579L383.8544,1646.4189L382.6354,1646.4189L382.6354,1638.4169L379.8574,1646.4189L378.7164,1646.4189L375.9524,1638.2799L375.9524,1646.4189z", "white");
            electricalMotor.Ports.Add(CreatePort("port1", 0, 0.5f));
            electricalMotor.Ports.Add(CreatePort("port2", 1, 0.5f));

            Node coAx = CreateNodes("CoAx", "M439.4756,1641.5166L451.3476,1641.5166M487.6035,1641.5166L499.4755,1641.5166M487.604,1646.187L451.348,1646.187L451.348,1636.848L487.604,1636.848zM484.7822,1641.5166C484.7822,1649.9706,477.9292,1656.8236,469.4752,1656.8236C461.0222,1656.8236,454.1692,1649.9706,454.1692,1641.5166C454.1692,1633.0636,461.0222,1626.2096,469.4752,1626.2096C477.9292,1626.2096,484.7822,1633.0636,484.7822,1641.5166z", "white");
            coAx.Ports.Add(CreatePort("port1", 0, 0.5f));
            coAx.Ports.Add(CreatePort("port2", 1, 0.5f));

            Node illuminatingBulb = CreateNodes("IlluminatingBulb", "M87.9678,1724.0029C87.9678,1735.8679,78.3488,1745.4869,66.4838,1745.4869C54.6178,1745.4869,44.9978,1735.8679,44.9978,1724.0029C44.9978,1712.1369,54.6178,1702.5179,66.4838,1702.5179C78.3488,1702.5179,87.9678,1712.1369,87.9678,1724.0029zM96.6758,1724.0625L82.7628,1724.0625C82.7628,1714.9895,75.4058,1707.6325,66.3328,1707.6325C57.2598,1707.6325,49.9038,1714.9895,49.9038,1724.0625L36.6758,1724.0625", null);
            illuminatingBulb.Ports.Add(CreatePort("port1", 0, 0.5f));
            illuminatingBulb.Ports.Add(CreatePort("port2", 1, 0.5f));

            Node neonLamp = CreateNodes("NeonLamp", "M184.8047,1723.1689C184.8047,1735.0219,175.1967,1744.6299,163.3437,1744.6299C151.4917,1744.6299,141.8827,1735.0219,141.8827,1723.1689C141.8827,1711.3159,151.4917,1701.7079,163.3437,1701.7079C175.1967,1701.7079,184.8047,1711.3159,184.8047,1723.1689zM157.3125,1727.8232C157.3125,1728.9442,156.4025,1729.8542,155.2825,1729.8542C154.1605,1729.8542,153.2495,1728.9442,153.2495,1727.8232C153.2495,1726.7022,154.1605,1725.7922,155.2825,1725.7922C156.4025,1725.7922,157.3125,1726.7022,157.3125,1727.8232zM159.126,1709.7041L159.126,1736.6341M167.5605,1709.7041L167.5605,1736.6341M193.3438,1723.1689L167.5618,1723.1689M159.126,1723.1689L133.344,1723.1689", "white");
            neonLamp.Ports.Add(CreatePort("port1", 0, 0.5f));
            neonLamp.Ports.Add(CreatePort("port2", 1, 0.5f));

            Node muxDemux = CreateNodes("MuxDemux", "M749.9727,1733.3428L728.8617,1745.7808L728.8617,1690.0028L749.9727,1702.4418L749.9727,1733.3428zM728.8613,1693.6689L720.4173,1693.6689M728.8613,1698.5576L720.4173,1698.5576M728.8613,1703.4473L720.4173,1703.4473M728.8613,1708.3359L720.4173,1708.3359M728.8613,1713.2256L720.4173,1713.2256M728.8613,1718.1143L720.4173,1718.1143M758.417,1717.8916L749.973,1717.8916M728.8613,1723.0029L720.4173,1723.0029M728.8613,1727.8916L720.4173,1727.8916M728.8613,1732.7812L720.4173,1732.7812M728.8613,1737.6709L720.4173,1737.6709M728.8613,1742.5596L720.4173,1742.5596M736.1943,1741.5576L736.1943,1750.0026", "white");
            muxDemux.Ports.Add(CreatePort("port1", 1, 0.47f));
            muxDemux.Ports.Add(CreatePort("port2", 0.415f, 1));

            Node quantizer = CreateNodes("Quantizer", "M178.423,1845.019L118.423,1845.019L118.423,1785.019L178.423,1785.019zM157.21,1799.5381L148.376,1799.5381L148.376,1830.4991L139.636,1830.4991M139.6357,1815.0186L157.2097,1815.0186", "white");
            quantizer.Ports.Add(CreatePort("port1", 0, 0.5f));
            quantizer.Ports.Add(CreatePort("port2", 0.5f, 0));
            quantizer.Ports.Add(CreatePort("port3", 1, 0.5f));
            quantizer.Ports.Add(CreatePort("port4", 0.5f, 1));

            Node integrator = CreateNodes("Integrator", "M462.2393,1810.5029C462.2393,1827.0709,448.8083,1840.5029,432.2413,1840.5029C415.6733,1840.5029,402.2393,1827.0709,402.2393,1810.5029C402.2393,1793.9349,415.6733,1780.5029,432.2413,1780.5029C448.8083,1780.5029,462.2393,1793.9349,462.2393,1810.5029zM421.6416,1826.0381C421.6416,1828.9641,424.0136,1831.3371,426.9416,1831.3371C429.8696,1831.3371,432.2416,1828.9641,432.2416,1826.0381L432.2416,1794.9701C432.2416,1792.0441,434.6126,1789.6711,437.5396,1789.6711C440.4646,1789.6711,442.8366,1792.0441,442.8366,1794.9701", "white");
            integrator.Ports.Add(CreatePort("port1", 0, 0.5f));
            integrator.Ports.Add(CreatePort("port2", 0.5f, 0));
            integrator.Ports.Add(CreatePort("port3", 1, 0.5f));
            integrator.Ports.Add(CreatePort("port4", 0.5f, 1));

            Node fliter = CreateNodes("Fliter", "M841.591,1845.39L779.734,1845.39L779.734,1783.533L841.591,1783.533zM834.3691,1805.6846C832.4591,1808.7556,827.8751,1810.9186,822.5231,1810.9186C817.1591,1810.9186,812.5661,1808.7476,810.6621,1805.6646C808.7581,1802.5846,804.1651,1800.4146,798.8021,1800.4146C793.4491,1800.4146,788.8651,1802.5786,786.9551,1805.6476M834.3691,1814.4795C832.4591,1817.5495,827.8751,1819.7125,822.5231,1819.7125C817.1591,1819.7125,812.5661,1817.5405,810.6621,1814.4595C808.7581,1811.3795,804.1651,1809.2085,798.8021,1809.2085C793.4491,1809.2085,788.8651,1811.3725,786.9551,1814.4435M834.3691,1823.2744C832.4591,1826.3434,827.8751,1828.5064,822.5231,1828.5064C817.1591,1828.5064,812.5661,1826.3354,810.6621,1823.2544C808.7581,1820.1734,804.1651,1818.0034,798.8021,1818.0034C793.4491,1818.0034,788.8651,1820.1664,786.9551,1823.2374M806.8936,1807.167L815.7096,1803.658M806.2539,1824.0068L815.0719,1820.4968", "white");
            fliter.Ports.Add(CreatePort("port1", 0, 0.5f));
            fliter.Ports.Add(CreatePort("port2", 0.5f, 0));
            fliter.Ports.Add(CreatePort("port3", 1, 0.5f));
            fliter.Ports.Add(CreatePort("port4", 0.5f, 1));

            Node thermistorwithIndependentintegralheater = CreateNodes("ThermistorwithIndependentintegralheater", "M500.0996,1910.5146C491.6196,1918.9936,477.8716,1918.9936,469.3886,1910.5146C460.9086,1902.0326,460.9086,1888.2856,469.3886,1879.8026C477.8716,1871.3246,491.6196,1871.3246,500.0996,1879.8026C508.5816,1888.2856,508.5816,1902.0326,500.0996,1910.5146zM507.6094,1872.292L500.0044,1879.899M469.2783,1910.624L461.6733,1918.231L451.9553,1918.231M457.5332,1895.1592L466.7042,1895.1552L469.3392,1889.7342L474.6072,1900.5832L479.8812,1889.7342L485.1512,1900.5832L490.4222,1889.7342L495.6902,1900.5832L500.9642,1889.7342L503.6012,1895.1672L511.9552,1895.1672M480.5479,1925.8174L480.5479,1915.9714L484.5999,1910.6634L488.9449,1915.9714L488.9449,1925.8174M479.6318,1877.8096L480.7988,1880.6436M488.4424,1877.8096L489.6104,1880.6436M481.6953,1879.8232L481.7403,1880.0922C481.6543,1880.1102,481.5773,1880.1192,481.5093,1880.1192C481.3983,1880.1192,481.3123,1880.1022,481.2523,1880.0672C481.1903,1880.0322,481.1473,1879.9852,481.1233,1879.9282C481.0973,1879.8722,481.0863,1879.7512,481.0863,1879.5682L481.0863,1878.5322L480.8623,1878.5322L480.8623,1878.2962L481.0863,1878.2962L481.0863,1877.8502L481.3893,1877.6672L481.3893,1878.2962L481.6953,1878.2962L481.6953,1878.5322L481.3893,1878.5322L481.3893,1879.5852C481.3893,1879.6732,481.3943,1879.7272,481.4053,1879.7532C481.4143,1879.7782,481.4323,1879.7982,481.4573,1879.8122C481.4823,1879.8272,481.5163,1879.8342,481.5613,1879.8342C481.5953,1879.8342,481.6403,1879.8312,481.6953,1879.8232M482.2246,1879.0234L483.2286,1879.0234C483.2146,1878.8704,483.1786,1878.7584,483.1156,1878.6814C483.0186,1878.5634,482.8916,1878.5044,482.7376,1878.5044C482.5976,1878.5044,482.4796,1878.5524,482.3826,1878.6464C482.2876,1878.7404,482.2356,1878.8664,482.2246,1879.0234 M483.2266,1879.5164L483.5406,1879.5544C483.4916,1879.7394,483.4006,1879.8814,483.2646,1879.9834C483.1306,1880.0854,482.9586,1880.1354,482.7506,1880.1354C482.4866,1880.1354,482.2786,1880.0554,482.1246,1879.8934C481.9706,1879.7314,481.8936,1879.5034,481.8936,1879.2114C481.8936,1878.9074,481.9706,1878.6724,482.1266,1878.5044C482.2816,1878.3374,482.4846,1878.2544,482.7336,1878.2544C482.9726,1878.2544,483.1696,1878.3364,483.3236,1878.5014C483.4756,1878.6654,483.5516,1878.8954,483.5516,1879.1924C483.5516,1879.2114,483.5516,1879.2384,483.5496,1879.2724L482.2076,1879.2724C482.2196,1879.4714,482.2766,1879.6224,482.3756,1879.7274C482.4756,1879.8334,482.6016,1879.8854,482.7506,1879.8854C482.8646,1879.8854,482.9586,1879.8564,483.0386,1879.7974C483.1186,1879.7394,483.1786,1879.6454,483.2266,1879.5164M483.9258,1880.0957L483.9258,1878.2957L484.1988,1878.2957L484.1988,1878.5477C484.2528,1878.4597,484.3298,1878.3887,484.4228,1878.3347C484.5178,1878.2827,484.6238,1878.2547,484.7438,1878.2547C484.8778,1878.2547,484.9868,1878.2827,485.0708,1878.3377C485.1558,1878.3937,485.2168,1878.4717,485.2508,1878.5717C485.3958,1878.3607,485.5808,1878.2547,485.8078,1878.2547C485.9868,1878.2547,486.1238,1878.3057,486.2218,1878.4037C486.3168,1878.5027,486.3638,1878.6547,486.3638,1878.8607L486.3638,1880.0957L486.0608,1880.0957L486.0608,1878.9607C486.0608,1878.8397,486.0498,1878.7517,486.0308,1878.6987C486.0108,1878.6457,485.9748,1878.6017,485.9228,1878.5687C485.8708,1878.5357,485.8118,1878.5187,485.7388,1878.5187C485.6138,1878.5187,485.5088,1878.5617,485.4248,1878.6457C485.3418,1878.7307,485.3008,1878.8647,485.3008,1879.0497L485.3008,1880.0957L484.9928,1880.0957L484.9928,1878.9257C484.9928,1878.7897,484.9708,1878.6887,484.9208,1878.6197C484.8708,1878.5527,484.7888,1878.5187,484.6768,1878.5187C484.5908,1878.5187,484.5118,1878.5417,484.4388,1878.5867C484.3638,1878.6317,484.3128,1878.6987,484.2798,1878.7857C484.2458,1878.8717,484.2308,1878.9967,484.2308,1879.1617L484.2308,1880.0957zM487.0918,1879.2051C487.0918,1879.4361,487.1398,1879.6081,487.2328,1879.7191C487.3268,1879.8291,487.4408,1879.8861,487.5738,1879.8861C487.7098,1879.8861,487.8248,1879.8291,487.9228,1879.7141C488.0198,1879.5991,488.0678,1879.4211,488.0678,1879.1811C488.0678,1878.9501,488.0198,1878.7781,487.9268,1878.6661C487.8318,1878.5501,487.7188,1878.4931,487.5878,1878.4931C487.4588,1878.4931,487.3438,1878.5561,487.2438,1878.6761C487.1418,1878.7981,487.0918,1878.9751,487.0918,1879.2051 M486.8168,1880.7851L486.8168,1878.2961L487.0948,1878.2961L487.0948,1878.5301C487.1598,1878.4371,487.2348,1878.3701,487.3168,1878.3231C487.4008,1878.2781,487.4988,1878.2551,487.6168,1878.2551C487.7708,1878.2551,487.9048,1878.2951,488.0248,1878.3741C488.1418,1878.4531,488.2308,1878.5631,488.2888,1878.7091C488.3498,1878.8521,488.3798,1879.0111,488.3798,1879.1831C488.3798,1879.3671,488.3478,1879.5321,488.2798,1879.6791C488.2138,1879.8271,488.1168,1879.9401,487.9918,1880.0181C487.8658,1880.0971,487.7328,1880.1361,487.5948,1880.1361C487.4918,1880.1361,487.4028,1880.1141,487.3208,1880.0711C487.2408,1880.0281,487.1738,1879.9751,487.1218,1879.9091L487.1218,1880.7851z", "white");
            thermistorwithIndependentintegralheater.Ports.Add(CreatePort("port1", 0.08f, 0.43f));
            thermistorwithIndependentintegralheater.Ports.Add(CreatePort("port2", 1, 0.43f));

            Node electretMicrophone = CreateNodes("ElectretMicrophone", "M154.4277,2000.8115L154.4277,2056.8365M206.4277,2028.8232C206.4277,2043.1822,194.7867,2054.8232,180.4277,2054.8232C166.0687,2054.8232,154.4277,2043.1822,154.4277,2028.8232C154.4277,2014.4642,166.0687,2002.8232,180.4277,2002.8232C194.7867,2002.8232,206.4277,2014.4642,206.4277,2028.8232zM192.9297,2024.1396L167.9247,2024.1396M192.9297,2032.9727L167.9247,2032.9727M180.4268,2054.8232L180.4268,2032.9722M180.4268,2024.4277L180.4268,2002.2397", "white");
            electretMicrophone.Ports.Add(CreatePort("port1", 0, 0.5f));
            electretMicrophone.Ports.Add(CreatePort("port2", 1, 0.5f));

            Node loudSpeaker = CreateNodes("LoudSpeaker", "M215.3652,2111.958L230.1482,2089.913L230.1482,2160.905L215.3652,2138.735L215.3652,2111.958zM208.531,2138.822L215.365,2138.822L215.365,2111.995L208.531,2111.995zM191.5313,2131.4707L208.5313,2131.4707M191.5313,2119.3467L208.5313,2119.3467", "transparent");
            loudSpeaker.Ports.Add(CreatePort("port1", 0, 0.42f));
            loudSpeaker.Ports.Add(CreatePort("port2", 0, 0.58f));
            loudSpeaker.Ports.Add(CreatePort("port3", 1, 0.5f));

            Node headPhone = CreateNodes("HeadPhone", "M443.3447,2114.6855C443.3447,2103.6025,452.3277,2094.6195,463.4107,2094.6195C474.4927,2094.6195,483.4777,2103.6025,483.4777,2114.6855M453.0811,2118.1865C453.0811,2122.7705,450.7771,2126.4855,447.9351,2126.4855C445.0941,2126.4855,442.7901,2122.7705,442.7901,2118.1865C442.7901,2113.6045,445.0941,2109.8875,447.9351,2109.8875C450.7771,2109.8875,453.0811,2113.6045,453.0811,2118.1865zM483.9521,2118.1865C483.9521,2122.7705,481.6481,2126.4855,478.8061,2126.4855C475.9651,2126.4855,473.6611,2122.7705,473.6611,2118.1865C473.6611,2113.6045,475.9651,2109.8875,478.8061,2109.8875C481.6481,2109.8875,483.9521,2113.6045,483.9521,2118.1865z", "transparent");
            headPhone.Ports.Add(CreatePort("port1", 0, 0.75f));
            headPhone.Ports.Add(CreatePort("port2", 1, 0.75f));

            Node triode = CreateNodes("Triode", "M380.7852,2248.5801C380.7852,2261.8081,370.0612,2272.5311,356.8342,2272.5311C343.6062,2272.5311,332.8832,2261.8081,332.8832,2248.5801C332.8832,2235.3521,343.6062,2224.6291,356.8342,2224.6291C370.0612,2224.6291,380.7852,2235.3521,380.7852,2248.5801zM362.7969,2235.0732L350.8709,2235.0732M356.833,2235.2109L356.833,2224.6289M347.9189,2247.8828L337.3369,2247.8828M362.125,2247.8828L351.543,2247.8828M376.332,2247.8828L365.75,2247.8828M349.2344,2284.6289L349.2344,2269.4289C349.2344,2265.2319,352.6364,2261.8289,356.8344,2261.8289C361.0314,2261.8289,364.4334,2265.2319,364.4334,2269.4289L364.4334,2284.6289M346.5684,2263.0947L351.7014,2258.2007L361.9664,2258.2007L367.0994,2263.0947", "transparent");
            triode.Ports.Add(CreatePort("port2", 0.343f, 1));
            triode.Ports.Add(CreatePort("port3", 0.657f, 1));

            Node photoCell = CreateNodes("PhotoCell", "M462.417,2357.1553C462.417,2367.7313,453.844,2376.3053,443.268,2376.3053C432.691,2376.3053,424.118,2367.7313,424.118,2357.1553C424.118,2346.5803,432.691,2338.0063,443.268,2338.0063C453.844,2338.0063,462.417,2346.5803,462.417,2357.1553zM448.0352,2346.3564L438.5002,2346.3564M443.2666,2346.4668L443.2666,2338.0058M437.1914,2385.9775L437.1914,2373.8255C437.1914,2370.4695,439.9114,2367.7485,443.2674,2367.7485C446.6244,2367.7485,449.3434,2370.4695,449.3434,2373.8255L449.3434,2385.9775M435.0596,2368.7607L439.1636,2364.8487L447.3726,2364.8487L451.4746,2368.7607M458.7822,2333.9385L456.6912,2335.0915L457.2072,2332.7595L458.7822,2333.9385zM457.9395,2333.4238L463.5105,2325.9778M462.1924,2337.3291L460.1014,2338.4821L460.6174,2336.1501L462.1924,2337.3291zM461.3486,2336.8145L466.9206,2329.3685", "transparent");
            photoCell.Ports.Add(CreatePort("port1", 0.45f, 0.2f));
            photoCell.Ports.Add(CreatePort("port2", 0.31f, 1));
            photoCell.Ports.Add(CreatePort("port3", 0.59f, 1));

            Node pulse1 = CreateNodes("Pulse1", "M655.4629,2241.5264L668.1399,2241.5264L668.1399,2301.5264L692.9519,2301.5264L692.9519,2241.5264L704.1599,2241.5264", "transparent");
            Node pulse2 = CreateNodes("Pulse2", "M803.002,2301.5264L790.325,2301.5264L790.325,2241.5264L765.513,2241.5264L765.513,2301.5264L754.305,2301.5264", "transparent");
            Node sawtooth = CreateNodes("Sawtooth", "M847.4951,2287.6797L867.4951,2255.3717L867.4951,2287.6797L887.4961,2255.3717L887.4961,2287.6797L907.4951,2255.3717L907.4951,2287.6797", "transparent");
            Node sineWave = CreateNodes("SineWave", "M1006.3359,2271.5264C1006.3359,2282.5164,999.6209,2291.4244,991.3369,2291.4244C983.0529,2291.4244,976.3369,2282.5164,976.3369,2271.5264C976.3369,2260.5364,969.6199,2251.6284,961.3369,2251.6284C953.0529,2251.6284,946.3359,2260.5364,946.3359,2271.5264", "transparent");
            Node choppedSquareWave = CreateNodes("ChoppedSquareWave", "M1045.1777,2270.2021L1052.6117,2245.2841L1067.4797,2245.2841L1082.8767,2297.7681L1097.7447,2297.7681L1105.1777,2272.8511", "transparent");
            Node squareWave = CreateNodes("SquareWave", "M699.0186,2359.0195L699.0186,2334.9275L729.4726,2334.9275L729.4726,2389.0195L759.0186,2389.0195L759.0186,2361.9735", "transparent");
            Node step1 = CreateNodes("Step1", "M824.1846,2334.9277L854.6386,2334.9277L854.6386,2389.0197L884.1846,2389.0197", "transparent");
            Node step2 = CreateNodes("Step2", "M1024.6758,2334.9277L994.2218,2334.9277L994.2218,2389.0197L964.6758,2389.0197", "transparent");
            electricalShapes.AppendChild(and);
            electricalShapes.AppendChild(buffer);
            electricalShapes.AppendChild(dTypeflipFlop);
            electricalShapes.AppendChild(dTypersFlipFlop);
            electricalShapes.AppendChild(schmittTrigger);
            electricalShapes.AppendChild(norGate);
            electricalShapes.AppendChild(xorGate);
            electricalShapes.AppendChild(orGate);
            electricalShapes.AppendChild(nandGate);
            electricalShapes.AppendChild(andGate);
            electricalShapes.AppendChild(resistor);
            electricalShapes.AppendChild(resistor1);
            electricalShapes.AppendChild(potentiometer1);
            electricalShapes.AppendChild(potentiometerTrimmer);
            electricalShapes.AppendChild(potentiometerTrimmer1);
            electricalShapes.AppendChild(resistorTrimmer1);
            electricalShapes.AppendChild(resistorTrimmer);
            electricalShapes.AppendChild(resistorVariable);
            electricalShapes.AppendChild(resistorInstrumentRelayShunt);
            electricalShapes.AppendChild(varistorSymmetrical);
            electricalShapes.AppendChild(memoristor);
            electricalShapes.AppendChild(memoristor1);
            electricalShapes.AppendChild(magmetoresistor);
            electricalShapes.AppendChild(photoconductiveTransducerSymmetrical);
            electricalShapes.AppendChild(capacitorus);
            electricalShapes.AppendChild(capacitorus1);
            electricalShapes.AppendChild(differentialCapacitor);
            electricalShapes.AppendChild(tuningVariableCapacitorus);
            electricalShapes.AppendChild(tuningVariableCapacitorus1);
            electricalShapes.AppendChild(gangedCapacitorus);
            electricalShapes.AppendChild(multipleCapacitorus);
            electricalShapes.AppendChild(inductorAirCore);
            electricalShapes.AppendChild(transformerIronCore);
            electricalShapes.AppendChild(Spdt);
            electricalShapes.AppendChild(PushButtonOn);
            electricalShapes.AppendChild(diode);
            electricalShapes.AppendChild(transorb2);
            electricalShapes.AppendChild(breakdown);
            electricalShapes.AppendChild(ac);
            electricalShapes.AppendChild(current);
            electricalShapes.AppendChild(dependent1);
            electricalShapes.AppendChild(noise1);
            electricalShapes.AppendChild(bjtnpn);
            electricalShapes.AppendChild(jfetpnp);
            electricalShapes.AppendChild(jjfetpnp);
            electricalShapes.AppendChild(mosfetInductivechannelp);
            electricalShapes.AppendChild(dualGateMosfetnDualGateMosfetn);
            electricalShapes.AppendChild(oscilloscope);
            electricalShapes.AppendChild(SingleGenerator);
            electricalShapes.AppendChild(loopAntenna);
            electricalShapes.AppendChild(electricalMotor);
            electricalShapes.AppendChild(coAx);
            electricalShapes.AppendChild(illuminatingBulb);
            electricalShapes.AppendChild(neonLamp);
            electricalShapes.AppendChild(muxDemux);
            electricalShapes.AppendChild(quantizer);
            electricalShapes.AppendChild(integrator);
            electricalShapes.AppendChild(fliter);
            electricalShapes.AppendChild(thermistorwithIndependentintegralheater);
            electricalShapes.AppendChild(electretMicrophone);
            electricalShapes.AppendChild(loudSpeaker);
            electricalShapes.AppendChild(headPhone);
            electricalShapes.AppendChild(triode);
            electricalShapes.AppendChild(photoCell);
            electricalShapes.AppendChild(sawtooth);
            electricalShapes.AppendChild(pulse1);
            electricalShapes.AppendChild(pulse2);
            electricalShapes.AppendChild(sineWave);
            electricalShapes.AppendChild(choppedSquareWave);
            electricalShapes.AppendChild(squareWave);
            electricalShapes.AppendChild(step1);
            electricalShapes.AppendChild(step2);
            return electricalShapes;
        }
        public string getPathData(Collection points)
        {
            string str = "";
            for (int i = 0; i < points.Count; i++)
            {
                DiagramPoint point = points[i] as DiagramPoint;
                if (i == 0)
                {
                    str = "M" + point.X.ToString() + "," + point.Y.ToString();
                }
                else
                {
                    str += "L" + point.X.ToString() + "," + point.Y.ToString();
                }
                if (i == (points.Count - 1))
                {
                    str += "z";
                }
            }
            return str;
        }

        public Palette GenerateBpmnShapes()
        {
            Palette bpmnShapes = new Palette("BPMN Shapes");
            NodeConstraints constraints = NodeConstraints.Default | NodeConstraints.AspectRatio;
            bpmnShapes.Expanded = false;
            bpmnShapes.TemplateId = "svgTemplate";
            bpmnShapes.AddInfo = new Dictionary<string, object>();
            (bpmnShapes.AddInfo as Dictionary<string, object>).Add("source", "../Content/DiagramBuilder/images/bpmn.png");
            BPMNNode bpmnStart = CreateBpmnNodes("BPMNStart", BPMNShapes.Event, "white", "black");
            bpmnStart.Event = BPMNEvents.Start;
            bpmnStart.Constraints = constraints;

            BPMNNode intermediate = CreateBpmnNodes("Intermediate", BPMNShapes.Event, "white", "black");
            intermediate.Event = BPMNEvents.Intermediate;
            intermediate.Constraints = constraints;

            BPMNNode end = CreateBpmnNodes("End", BPMNShapes.Event, "white", "black");
            end.Event = BPMNEvents.End;
            end.Constraints = constraints;

            BPMNNode gateway = CreateBpmnNodes("Gateway", BPMNShapes.Gateway, "white", "black");

            BPMNNode task = CreateBpmnNodes("Task", BPMNShapes.Activity, "white", "black");
            task.Activity = BPMNActivity.Task;
           
            BPMNNode subprocessEvent = CreateBpmnNodes("SubProcessEvent", BPMNShapes.Activity, "white", "black");
            subprocessEvent.Activity = BPMNActivity.SubProcess;
            subprocessEvent.SubProcess.Type = BPMNSubProcessTypes.Event;
            subprocessEvent.SubProcess.Event = BPMNEvents.Start;
            subprocessEvent.Width = 100; subprocessEvent.Height = 100; subprocessEvent.OffsetX = 50; subprocessEvent.OffsetY = 50;

            BPMNNode subprocessTransaction = CreateBpmnNodes("SubprocessTransaction", BPMNShapes.Activity, "white", "black");
            subprocessTransaction.Activity = BPMNActivity.SubProcess;
            subprocessTransaction.SubProcess.Type = BPMNSubProcessTypes.Transaction;
            subprocessTransaction.SubProcess.Collapsed = true;
            subprocessTransaction.Width = 100; subprocessTransaction.Height = 100; subprocessTransaction.OffsetX = 50; subprocessTransaction.OffsetY = 50;

            BPMNNode message = CreateBpmnNodes("Message", BPMNShapes.Message, "white", "black");
            message.Height = 30; message.Width = 40; message.OffsetX = 20; message.OffsetY = 15;
            BPMNNode dataSource = CreateBpmnNodes("DataSource", BPMNShapes.DataSource, "white", "black");

            BPMNNode dataObject = CreateBpmnNodes("DataObject", BPMNShapes.DataObject, "white", "black");

            BPMNNode group = CreateBpmnNodes("Group", BPMNShapes.Group, "white", "black");
            group.Width = 100; group.Height = 100; group.OffsetX = 50; group.OffsetY = 50;

            Connector sequenceFlow = new Connector();
            sequenceFlow.Name = "Sequenceflow";
            sequenceFlow.SourcePoint = new DiagramPoint(0, 0);
            sequenceFlow.TargetPoint = new DiagramPoint(40, 40);
            sequenceFlow.LineWidth = 2;
            sequenceFlow.Segments = new Collection();
            sequenceFlow.Segments.Add(new Segment(Segments.Straight));
            sequenceFlow.TargetDecorator.Shape = DecoratorShapes.Arrow;
            sequenceFlow.Labels.Add(new Label { Text = "", FontColor = "black" });

            Connector associationFlow = new Connector();
            associationFlow.Name = "Associationflow";
            associationFlow.SourcePoint = new DiagramPoint(0, 0);
            associationFlow.TargetPoint = new DiagramPoint(40, 40);
            associationFlow.LineWidth = 2;
            associationFlow.LineDashArray = "2 2";
            associationFlow.Segments = new Collection();
            associationFlow.Segments.Add(new Segment(Segments.Straight));
            associationFlow.Labels.Add(new Label { Text = "", FontColor = "black" });

            Connector messageFlow = new Connector();
            messageFlow.Name = "Messageflow";
            messageFlow.SourcePoint = new DiagramPoint(0, 0);
            messageFlow.TargetPoint = new DiagramPoint(40, 40);
            messageFlow.LineWidth = 2;
            messageFlow.LineDashArray = "4 4";
            messageFlow.Segments = new Collection();
            messageFlow.Segments.Add(new Segment(Segments.Straight));
            messageFlow.SourceDecorator.Shape = DecoratorShapes.Circle;
            messageFlow.SourceDecorator.FillColor = "white";
            messageFlow.TargetDecorator.Shape = DecoratorShapes.Arrow;
            messageFlow.TargetDecorator.FillColor = "white";
            messageFlow.Labels.Add(new Label { Text = "", FontColor = "black" });

            AddPort(bpmnStart); bpmnShapes.AppendChild(bpmnStart);
            AddPort(intermediate); bpmnShapes.AppendChild(intermediate);
            AddPort(end); bpmnShapes.AppendChild(end);
            AddPort(gateway); bpmnShapes.AppendChild(gateway);
            AddPort(task); bpmnShapes.AppendChild(task);
            AddPort(subprocessEvent); bpmnShapes.AppendChild(subprocessEvent);
            AddPort(subprocessTransaction); bpmnShapes.AppendChild(subprocessTransaction);
            AddPort(message); bpmnShapes.AppendChild(message);
            AddPort(dataSource); bpmnShapes.AppendChild(dataSource);
            AddPort(dataObject); bpmnShapes.AppendChild(dataObject);
            AddPort(group); bpmnShapes.AppendChild(group);
            bpmnShapes.AppendChild(sequenceFlow);
            bpmnShapes.AppendChild(associationFlow);
            bpmnShapes.AppendChild(messageFlow);
            return bpmnShapes;
        }

        public Palette GenerateConnectors()
        {
            Palette connectors = new Palette("Connectors");
            connectors.Expanded = false;
            connectors.TemplateId = "svgTemplate";
            connectors.AddInfo = new Dictionary<string, object>();
            (connectors.AddInfo as Dictionary<string, object>).Add("source", "../Content/DiagramBuilder/images/connector.png");
            Connector orthogonalLine1 = CreateConnectors("orthogonalLine1", DecoratorShapes.Arrow, new Segment(Segments.Orthogonal), null);
            Connector orthogonalLine2 = CreateConnectors("orthogonalLine2", DecoratorShapes.Arrow, new Segment(Segments.Orthogonal), "4 4");
            Connector orthogonalLine3 = CreateConnectors("orthogonalLine3", DecoratorShapes.None, new Segment(Segments.Orthogonal), null);
            Connector orthogonalLine4 = CreateConnectors("orthogonalLine4", DecoratorShapes.None, new Segment(Segments.Orthogonal), "4 4");
            Connector straightLine1 = CreateConnectors("straightLine1", DecoratorShapes.Arrow, new Segment(Segments.Straight), null);
            Connector straightLine2 = CreateConnectors("straightLine2", DecoratorShapes.Arrow, new Segment(Segments.Straight), "4 4");
            Connector straightLine3 = CreateConnectors("straightLine3", DecoratorShapes.None, new Segment(Segments.Straight), null);
            Connector straightLine4 = CreateConnectors("straightLine4", DecoratorShapes.None, new Segment(Segments.Straight), "4 4");
            Connector bezierLine1 = CreateConnectors("bezierLine1", DecoratorShapes.None, new Segment(Segments.Bezier), null);
            Connector bezierLine2 = CreateConnectors("bezierLine2", DecoratorShapes.None, new Segment(Segments.Bezier), "4 4");
            Connector bezierLine3 = CreateConnectors("bezierLine3", DecoratorShapes.Arrow, new Segment(Segments.Bezier), null);
            Connector bezierLine4 = CreateConnectors("bezierLine4", DecoratorShapes.Arrow, new Segment(Segments.Bezier), "4 4");
            connectors.AppendChild(orthogonalLine1);
            connectors.AppendChild(orthogonalLine2);
            connectors.AppendChild(orthogonalLine3);
            connectors.AppendChild(orthogonalLine4);
            connectors.AppendChild(straightLine1);
            connectors.AppendChild(straightLine2);
            connectors.AppendChild(straightLine3);
            connectors.AppendChild(straightLine4);
            connectors.AppendChild(bezierLine1);
            connectors.AppendChild(bezierLine2);
            return connectors;
        }
        public Palette GenerateSwimLanes()
        {
            Palette swimLanes = new Palette("Swimlane Shapes");
            swimLanes.Expanded = true;
            swimLanes.TemplateId = "svgTemplate";
            swimLanes.AddInfo = new Dictionary<string, object>();
            (swimLanes.AddInfo as Dictionary<string, object>).Add("source", "../Content/DiagramBuilder/images/swimlane.png");
            Lane stackCanvas1 = CreateSwimLane("stackCanvas1", "horizontal", 140, 60);
            Lane stackCanvas2 = CreateSwimLane("stackCanvas2", "vertical", 60, 140);
            swimLanes.Items.Add(stackCanvas1);
            swimLanes.Items.Add(stackCanvas2);
            GenerateSwimlanePhase(swimLanes, "verticalPhase", "vertical");
            GenerateSwimlanePhase(swimLanes, "horizontalPhase", "horizontal");
            return swimLanes;
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

        private DiagramPoint CreatePoint(double x, double y)
        {
            return new DiagramPoint((float)x, (float)y);
        }
        private BasicShape CreateNode(String name, double width, double height, double offsetx, double offsety, string labelText, string fillColor)
        {
            BasicShape node = new BasicShape();
            node.Name = name;
            node.Width = width;
            node.Height = height;
            node.OffsetX = offsetx;
            node.OffsetY = offsety;
            node.FillColor = fillColor;
            node.BorderColor = "#000000";
            Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label label = new Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label();
            label.Text = labelText;
            label.FontColor = "white";
            label.Name = name + "_label";
            node.Labels.Add(label);
            return node;
        }

        private BasicShape CreateNodes1(string name, string pathData, string color, double width, double height)
        {
            BasicShape node = new BasicShape();
            node.Name = name;
            node.Width = width;
            node.Height = height;
            node.OffsetX = node.Width / 2;
            node.OffsetY = node.Height / 2;
            node.Shape = BasicShapes.Path;
            node.PathData = pathData;
            node.FillColor = color != null ? color : "white";
            node.BorderWidth = 1.5;
            Label label = new Label();
            label.FontColor = "black";
            node.Labels.Add(label);
            return node;
        }
        private BasicShape CreateNodes(string name, string pathData, string color, double width = 40, double height = 40)
        {
            BasicShape node = new BasicShape();
            node.Name = name;
            node.Width = width;
            node.Height = height;
            node.OffsetX = node.Width / 2;
            node.OffsetY = node.Height / 2;
            node.Shape = BasicShapes.Path;
            node.PathData = pathData;
            node.FillColor = color != null ? color : "white";
            node.BorderWidth = 1.5;
            Label label = new Label();
            label.FontColor = "black";
            node.Labels.Add(label);
            return node;
        }

        private BasicShape CreateNodes(string name, BasicShapes basicShape, string color)
        {
            BasicShape node = new BasicShape();
            node.Name = name;
            node.Width = 40;
            node.Height = 40;
            node.OffsetX = node.Width / 2;
            node.OffsetY = node.Height / 2;
            node.Shape = basicShape;
            node.FillColor = color != null ? color : "white";
            node.BorderWidth = 1.5;
            Label label = new Label();
            label.FontColor = "black";
            node.Labels.Add(label);
            return node;
        }

        private FlowShape CreateFlowNodes(string name, FlowShapes flowShape, string color)
        {
            FlowShape node = new FlowShape();
            node.Name = name;
            node.Width = 40;
            node.Height = 40;
            node.OffsetX = node.Width / 2;
            node.OffsetY = node.Height / 2;
            node.Shape = flowShape;
            node.FillColor = color != null ? color : "white";
            node.BorderWidth = 1.5;
            Label label = new Label();
            label.FontColor = "black";
            node.Labels.Add(label);
            return node;
        }

        private BPMNNode CreateBpmnNodes(string name, BPMNShapes bpmnShape, string fillColor, string border)
        {
            BPMNNode node = new BPMNNode();
            node.Name = name;
            node.Width = 40;
            node.Height = 40;
            node.OffsetX = node.Width / 2;
            node.OffsetY = node.Height / 2;
            node.Shape = bpmnShape;
            node.FillColor = fillColor != null ? fillColor : "white";
            node.BorderWidth = 1.5;
            node.BorderColor = border;
            Label label = new Label();
            label.FontColor = "black";
            node.Labels.Add(label);
            return node;
        }

        private void CreateConnector(Node targetNode, Node sourceNode, string labelText, string sourcePort, string targetPort)
        {
            Connector connector = new Connector();
            connector.Name = "line" + DiagramContent.Model.Connectors.Count + 1;
            connector.Segments = new Collection();
            Segment seg = new Syncfusion.JavaScript.DataVisualization.Models.Diagram.Segment(Segments.Orthogonal);
            connector.Segments.Add(seg);
            connector.SourcePoint = new DiagramPoint(0, 0);
            connector.TargetPoint = new DiagramPoint(10, 10);
            connector.TargetNode = targetNode.Name;
            connector.SourceNode = sourceNode.Name;
            connector.SourcePort = targetPort;
            connector.TargetPort = sourcePort;
            connector.LineWidth = 2;
            if (labelText != "")
            {
                Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label label = new Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label();
                label.FontColor = "black";
                label.FillColor = "white";
                label.Text = labelText;
                connector.Labels.Add(label);
            }
            connector.SourceDecorator.Shape = DecoratorShapes.Arrow;
            connector.SourceDecorator.Width = 10;
            connector.SourceDecorator.Height = 10;
            connector.TargetDecorator.Shape = DecoratorShapes.None;
            DiagramContent.Model.Connectors.Add(connector);
        }


        private Connector CreateConnectors(string name, DecoratorShapes decoratorShapes, Segment seg, string lineDashArray)
        {
            Connector connector = new Connector();
            connector.Name = name;
            connector.Segments = new Collection();
            connector.Segments.Add(seg);
            connector.SourcePoint = new DiagramPoint(0, 0);
            connector.TargetPoint = new DiagramPoint(40, 40);
            connector.TargetDecorator = new Decorator();
            connector.TargetDecorator.Shape = decoratorShapes;
            connector.LineWidth = 2;
            connector.LineDashArray = lineDashArray;
            connector.Labels.Add(new Label { Text = "", FontColor = "black" });
            return connector;
        }
        private Lane CreateSwimLane(string name, string orientation, int width, int height)
        {
            Lane swimLane = new Lane();
            swimLane.Name = name;
            swimLane.Header.FillColor = "#C7D4DF";
            swimLane.Header.FontSize = 11;
            swimLane.Width = width;
            swimLane.Height = height;
            swimLane.Orientation = orientation;
            swimLane.FillColor = "#f5f5f5";
            swimLane.OffsetX = width / 2;
            swimLane.OffsetY = height / 2;
            return swimLane;
        }
        private Port CreatePort(string name, float offsetx, float offsety)
        {
            Port port = new Port();
            port.Name = name;
            port.Offset = new DiagramPoint(offsetx, offsety);
            return port;
        }
    }

    public class ColorList
    {
        public string color1 { get; set; }
        public string color2 { get; set; }
        public string color3 { get; set; }
    }

    public class PageColorList : ColorList
    {
        public string color4 { get; set; }
        public string color5 { get; set; }
        public string color6 { get; set; }
        public string color7 { get; set; }
        public string color8 { get; set; }
    }

    public class BorderWidthList
    {
        public string text { get; set; }
        public string height { get; set; }
    }
}