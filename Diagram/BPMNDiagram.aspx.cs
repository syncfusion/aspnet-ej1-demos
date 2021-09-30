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
    public partial class BPMNDiagram : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                createSymbolPalette();
                GenerateDiagram();
                GeneratePalette();
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

        private BPMNNode CreateBasicBPMN(String name, BPMNShapes shape, double width, double height)
        {
            BPMNNode node = new BPMNNode();
            node.Name = name;
            node.Shape = shape;
            node.Width = width;
            node.Height = height;
            return node;
        }
        private BPMNNode CreateTaskBPMN(String name, BPMNShapes shape, double width, double height)
        {
            BPMNNode node = new BPMNNode();
            node.Name = name;
            node.Shape = shape;
            node.Width = width;
            node.Height = height;
            node.Activity = BPMNActivity.Task;
            return node;
        }
        private BPMNNode CreateTaskBPMN(String name, BPMNShapes shape, double width, double height, bool eventBased)
        {
            BPMNNode node = new BPMNNode();
            node.Name = name;
            node.Shape = shape;
            node.Width = width;
            node.Height = height;
            node.Activity = BPMNActivity.SubProcess;
            if (eventBased)
                node.SubProcess = new BPMNSubProcess() { Type = BPMNSubProcessTypes.Event, Event = BPMNEvents.Start };
            else node.SubProcess = new BPMNSubProcess() { Type = BPMNSubProcessTypes.Transaction, Collapsed = true };
            return node;
        }

        private BPMNNode CreateSubProcessBPMN(String name, BPMNShapes shape, double width, double height, string BPMNSubProcess)
        {
            BPMNNode node = new BPMNNode();
            node.Name = name;
            node.Shape = shape;
            node.Width = width;
            node.Height = height;
            node.Activity = BPMNActivity.SubProcess;
            if (BPMNSubProcess == "SubprocessEventBased")
                node.SubProcess = new BPMNSubProcess() { Type = BPMNSubProcessTypes.Event, Event = BPMNEvents.Start };
            else
                node.SubProcess = new BPMNSubProcess() { Type = BPMNSubProcessTypes.Transaction, Collapsed = true };
            return node;
        }

        private BPMNNode CreateTriggerBPMN(String name, BPMNShapes shape, double width, double height, BPMNTriggers triggers)
        {
            BPMNNode node = new BPMNNode();
            node.Name = name;
            node.Shape = shape;
            node.Width = width;
            node.Height = height;
            node.Activity = BPMNActivity.SubProcess;
            node.Shape = shape;
            node.Event = BPMNEvents.Start;
            node.Trigger = triggers;
            return node;
        }

        private BPMNNode CreateExclusiveBPMN(String name, BPMNShapes shape, double width, double height, BPMNGateways gateway)
        {
            BPMNNode node = new BPMNNode();
            node.Name = name + "GateWays" + name; ;
            node.Width = width;
            node.Height = height; 
            node.Activity = BPMNActivity.SubProcess;
            node.Shape = BPMNShapes.Gateway;
            node.Event = BPMNEvents.Start;
            node.Gateway = gateway;
            return node;
        }

        private BPMNNode CreateServiceBPMN(String name, BPMNShapes shape, double width, double height, BPMNTasks BPMNTask)
        {
            BPMNNode node = new BPMNNode();
            node.Name = name + "GateWays" + name; ;
            node.Width = width;
            node.Height = height; 
            node.Activity = BPMNActivity.SubProcess;
            node.Shape = BPMNShapes.Activity;
            node.Event = BPMNEvents.Start;
            node.Activity = BPMNActivity.Task;
            node.Task = new BPMNTask() { Type = BPMNTask };
            return node;
        }

        private BPMNNode CompensationCallListBPMN(String name, BPMNShapes shape, double width, double height, bool subprocess)
        {
            BPMNNode node = new BPMNNode();
            node.Name = name + "GateWays" + name; ;
            node.Width = width;
            node.Height = height; 
            node.Activity = BPMNActivity.SubProcess;
            node.Shape = BPMNShapes.Activity;
            node.Event = BPMNEvents.Start;
            if (subprocess)
            {
                node.Activity = BPMNActivity.SubProcess;
                node.SubProcess = new BPMNSubProcess() { Loop = BPMNLoops.Standard };
            }
            else
            {
                node.Activity = BPMNActivity.Task;
                node.Task = new BPMNTask() { Compensation = true };
            }
            return node;
        }

        public void GeneratePalette()
        {
            Palette palette = new Palette() { Name = "BPMN Shapes", Expanded = true };
            Collection items = new Collection();
            items.Add(CreateBasicBPMN("Event", BPMNShapes.Event, 100, 100));
            items.Add(CreateBasicBPMN("Gateway", BPMNShapes.Gateway, 100, 100));
            items.Add(CreateBasicBPMN("Message", BPMNShapes.Message, 100, 100));
            items.Add(CreateBasicBPMN("DataSource", BPMNShapes.DataSource, 100, 100));
            items.Add(CreateBasicBPMN("DataObject", BPMNShapes.DataSource, 100, 100));
            items.Add(CreateBasicBPMN("Group", BPMNShapes.Group, 100, 100));
            items.Add(CreateTaskBPMN("Task", BPMNShapes.Activity, 100, 100));
            items.Add(CreateTaskBPMN("SubprocessEventBased", BPMNShapes.Activity, 100, 100, true));
            items.Add(CreateTaskBPMN("SubprocessTransaction", BPMNShapes.Activity, 100, 100, false));
            items.Add(CreateTriggerBPMN("None", BPMNShapes.Event, 100, 100, BPMNTriggers.None));
            items.Add(CreateTriggerBPMN("Message", BPMNShapes.Event, 100, 100, BPMNTriggers.Message));
            items.Add(CreateTriggerBPMN("Timer", BPMNShapes.Event, 100, 100, BPMNTriggers.Timer));
            items.Add(CreateExclusiveBPMN("Exclusive", BPMNShapes.Gateway, 100, 100, BPMNGateways.Exclusive));
            items.Add(CreateExclusiveBPMN("Inclusive", BPMNShapes.Gateway, 100, 100, BPMNGateways.Inclusive));
            items.Add(CreateServiceBPMN("Service", BPMNShapes.Gateway, 100, 100, BPMNTasks.Service));
            items.Add(CreateServiceBPMN("Receive", BPMNShapes.Gateway, 100, 100, BPMNTasks.Receive));
            items.Add(CompensationCallListBPMN("compensation_compensation1", BPMNShapes.Gateway, 100, 100, false));
            items.Add(CompensationCallListBPMN("callList12", BPMNShapes.Gateway, 100, 100, true));

            palette.Items = items;
            symbolpalette.Palettes.Add(palette);
        }
        public void GenerateDiagram()
        {
            DiagramContent.Height = "600px";
            DiagramContent.Width = "100%";
            DiagramContent.OnClientSelectionChange = "diagramSelectionChange";
            DiagramContent.SelectedItems.Constraints = SelectorConstraints.All ^ SelectorConstraints.Rotator;

            BPMNNode node = CreateBPMN("node1", BPMNShapes.Event, 60, 60, 250, 40, "Select Support Ticket");
            node.Event = BPMNEvents.Start;

            CreateBPMN("node2", BPMNShapes.Activity, 110, 70, 250, 140, "Handle Support Ticket");
            node.Activity = BPMNActivity.Task;
            node = CreateBPMN("node3", BPMNShapes.Gateway, 90, 70, 250, 245, "");
            node.Gateway = BPMNGateways.Exclusive;

            node = CreateBPMN("node4", BPMNShapes.Activity, 110, 70, 100, 350, "Respond to customer");
            node.Activity = BPMNActivity.Task;
            node.Task.Type = BPMNTasks.Service;

            node = CreateBPMN("node5", BPMNShapes.Activity, 110, 70, 250, 350, "Close ticket");
            node.Activity = BPMNActivity.Task;
            node.Task.Type = BPMNTasks.Service;

            node = CreateBPMN("node6", BPMNShapes.Activity, 110, 70, 390, 350, "Escalate ticket");
            node.Activity = BPMNActivity.Task;
            node.Task.Type = BPMNTasks.Service;

            node = CreateBPMN("node7", BPMNShapes.Event, 60, 60, 100, 460, "");
            node.Event = BPMNEvents.End;

            node = CreateBPMN("node8", BPMNShapes.Event, 60, 60, 250, 460, "");
            node.Event = BPMNEvents.End;

            node = CreateBPMN("node9", BPMNShapes.Event, 60, 60, 390, 460, "");
            node.Event = BPMNEvents.End;

            ConnNode(DiagramContent.Connectors, "node1", "node2");

            ConnNode(DiagramContent.Connectors, "node2", "node3");

            Collection segments = new Collection() { 
                new Segment(){Type=Segments.Orthogonal}
                            };
            Label label = new Label() { Text = "Respond", FillColor = "white", Wrapping = TextWrapping.Wrap };

            ConnNode(DiagramContent.Connectors, "node3", "node4", segments, label);

            segments = new Collection() { 
                new Segment(){Type=Segments.Orthogonal}
            };
            label = new Label() { Text = "Close", FillColor = "white", Wrapping = TextWrapping.Wrap };
            ConnNode(DiagramContent.Connectors, "node3", "node5", segments, label);

            segments = new Collection() { 
                new Segment(){Type=Segments.Orthogonal}
            };
            label = new Label() { Text = "Escalate", FillColor = "white" };
            ConnNode(DiagramContent.Connectors, "node3", "node6", segments, label);

            ConnNode(DiagramContent.Connectors, "node4", "node7");
            ConnNode(DiagramContent.Connectors, "node5", "node8");
            ConnNode(DiagramContent.Connectors, "node6", "node9");

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
            DiagramContent.Nodes.Add(node);
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
            DiagramContent.Connectors.Add(connector);
        }

    }
}