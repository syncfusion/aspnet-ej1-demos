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
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using Label = Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label;

namespace WebSampleBrowser.Diagram
{
    public partial class MindMap : System.Web.UI.Page
    {
        Node root = new Node();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                root.OffsetX = 650;
                root.OffsetY = 325;
                DiagramWebControl1.Model.EnableContextMenu = false;
                DiagramWebControl1.Model.Layout.Orientation = LayoutOrientations.LeftToRight;
                DiagramWebControl1.Model.Layout.HorizontalSpacing = 30;
                DiagramWebControl1.Model.Layout.VerticalSpacing = 60;
                DiagramWebControl1.Model.Layout.Type = LayoutTypes.HierarchicalTree;
                DiagramWebControl1.Model.SnapSettings.SnapConstraints = SnapConstraints.None;
                DiagramWebControl1.Model.EnableContextMenu = false;
                DiagramWebControl1.Model.SelectedItems.Constraints = SelectorConstraints.UserHandles;
                DiagramWebControl1.Model.Constraints = DiagramConstraints.Default & ~DiagramConstraints.Undoable;
                GenerateNodes(GetMindMapData());
            }
        }

        public Dictionary<string, object> GetMindMapData()
        {
            string allText = System.IO.File.ReadAllText(Server.MapPath("~/App_Data/MindMap.json"));
            Dictionary<string, object> requestArgs = (Dictionary<string, object>)new JavaScriptSerializer().DeserializeObject(allText);
            return requestArgs;
        }

        private Node GenerateNodes(Dictionary<string, object> requestArgs)
        {
            Node node = addNode(requestArgs["type"].ToString(), requestArgs["text"].ToString(), requestArgs["fill"].ToString());
            if (requestArgs["type"].ToString() == "root")
            {
                root = node;
                DiagramWebControl1.Model.Layout.FixedNode = root.Name;
            }
            if (requestArgs.ContainsKey("branches"))
            {
                object[] branches = requestArgs["branches"] as object[];
                if (branches != null)
                {
                    foreach (object obj1 in branches)
                    {
                        Dictionary<string, object> branch = (Dictionary<string, object>)obj1;
                        Node child = GenerateNodes(branch);
                        Connect(node, child);
                    }
                }
            }
            return node;
        }

        //Adding  node
        private Node addNode(string type, string text, string fill)
        {
            if (type == "right" || type == "left" || type == "root")
            {
                BasicShape node = new BasicShape();                
                node.Ports.Add(GetPort(0, 0.5f, node));
                node.Ports.Add(GetPort(1, 0.5f, node));
                node.Shape = BasicShapes.Rectangle;
                node.CornerRadius = 5;
                initializeNode(node, type, text, fill);
                return node;
            }
            else
            {
                NativeNode node = new NativeNode();
                node.Ports.Add(GetPort(0, 1, node));
                node.Ports.Add(GetPort(1, 1, node));
                node.TemplateId = "nativeContent";
                node.Scale = ScaleConstraints.Stretch;
                initializeNode(node, type, text, fill);
                return node;
            }
        }

        private void initializeNode(Node node, string type, string text, string fill)
        {
            node.Name = "node_" + DiagramWebControl1.Model.Nodes.Count;
            LabelMargin margin = new LabelMargin(5, 5, 5, 5);
            Label label = new Label();
            label.Text = text;
            label.Name = node.Name + "_label";
            label.Wrapping = TextWrapping.NoWrap;
            label.Margin = margin;
            label.Bold = true;
            label.FontFamily = "Segoe UI";
            node.Labels.Add(label);
            node.FillColor = fill;
            node.Visible = false;
            node.MinWidth = 50;
            node.MinHeight = 30;
            node.Constraints = node.Constraints & ~(NodeConstraints.Drag | NodeConstraints.Rotate);
            if (node is NativeNode)
            {
                (node as NativeNode).Scale = ScaleConstraints.Stretch;
            }
            if (type == "root")
            {
                node.Constraints = node.Constraints & ~NodeConstraints.Delete;
            }
            Dictionary<string, object> addInfo = new Dictionary<string, object>();
            addInfo.Add("type", type);
            node.AddInfo = addInfo;

            DiagramWebControl1.Model.Nodes.Add(node);
        }
        //Adding a connection
        private void Connect(Node tail, Node head)
        {
            Connector conn = new Connector();
            conn.Segments = new Collection();
            Segment seg = new Syncfusion.JavaScript.DataVisualization.Models.Diagram.Segment(Segments.Bezier);
            conn.Segments.Add(seg);
            conn.Constraints = conn.Constraints & ~(ConnectorConstraints.Select);
            conn.Name = "connector_" + DiagramWebControl1.Model.Connectors.Count;
            conn.TargetNode = head.Name;
            conn.SourceNode = tail.Name;
            conn.Visible = false;
            Dictionary<string, object> addInfo = head.AddInfo as Dictionary<string, object>;
            if (addInfo["type"].ToString() == "right" || addInfo["type"].ToString() == "subright")
            {
                conn.SourcePort = (tail.Ports[1] as Port).Name;
                conn.TargetPort = (head.Ports[0] as Port).Name;
            }
            else if (addInfo["type"].ToString() == "left" || addInfo["type"].ToString() == "subleft")
            {
                conn.SourcePort = (tail.Ports[0] as Port).Name;
                conn.TargetPort = (head.Ports[1] as Port).Name;
            }
            conn.TargetDecorator.Shape = DecoratorShapes.None;
            DiagramWebControl1.Model.Connectors.Add(conn);
        }

        //creating port
        private Port GetPort(float offsetx, float offsety, Node node)
        {
            Port port = new Port();
            port.Name = "port_" + node.Ports.Count;
            port.Offset = new DiagramPoint(offsetx, offsety);
            port.Visibility = PortVisibility.Hidden;
            return port;
        }
    }
}