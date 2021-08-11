#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.JavaScript.DataVisualization.DiagramEnums;
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
    public partial class SQLBinding : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DiagramWebControl1.Model.Width = "100%";
                DiagramWebControl1.Model.Height = "490px";
                DiagramWebControl1.Model.Layout.Type = LayoutTypes.HierarchicalTree;
                DiagramWebControl1.Model.Layout.Margin.Top = 50;
                DiagramWebControl1.Model.Layout.HorizontalSpacing = 60;
                DiagramWebControl1.Model.Layout.VerticalSpacing = 50;
                Label label = new Label();
                label.Name = "label1";
                label.FontColor = "white";
                label.Offset = new DiagramPoint(0.5f, 0.3f);
                Label label1 = new Label();
                label1.Name = "label2";
                label1.FontColor = "white";
                label1.Offset = new DiagramPoint(0.5f, 0.6f);
                Node node = new Node();
                node.Width = 140;
                node.Height = 50;
                node.FillColor="darkCyan";
                node.BorderColor = "#3F3F3F";
                node.BorderWidth = 1;
                node.Labels = new Collection();
                node.Labels.Add(label);
                node.Labels.Add(label1);

                DiagramWebControl1.Model.DefaultSettings.Node = node;
                DiagramWebControl1.Model.DefaultSettings.Connector = new Connector() { Segments = new Collection() { new Segment(Segments.Orthogonal) } };
                DiagramWebControl1.Model.SnapSettings.SnapConstraints = SnapConstraints.None;
                DiagramWebControl1.Model.EnableContextMenu = false;
            }
        }

        private Node CreateDefaultNode(string text, string fill)
        {
            BasicShape node = new BasicShape();
            node.Shape = BasicShapes.Rectangle;
            node.FillColor = fill;
            node.Width = 120;
            node.Height = 70;
            node.BorderWidth = 0;
            Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label label = new Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label();
            label.Offset = new DiagramPoint(0.5F, 0.3F);
            label.FontColor = "white";
            node.Labels.Add(label);

            Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label label1 = new Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label();
            label1.Offset = new DiagramPoint(0.5F, 0.6F);
            label1.FontColor = "white";
            node.Labels.Add(label1);
            return node;
        }
    }
}