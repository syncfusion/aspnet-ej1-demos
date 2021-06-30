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
    public partial class HierarchicalLayout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DiagramWebControl1.PageSettings.ScrollLimit = ScrollLimit.Diagram;
            DiagramWebControl1.Layout.Type = LayoutTypes.HierarchicalTree;
            DiagramWebControl1.Layout.HorizontalSpacing = 25;
            DiagramWebControl1.Layout.VerticalSpacing = 35;
            DiagramWebControl1.Layout.Margin.Left =  0;
            DiagramWebControl1.Layout.Margin.Top = 10;
            DiagramWebControl1.DataSourceSettings.DataSource = GetHierarchicalLayout();
            DiagramWebControl1.DataSourceSettings.Parent = "ReportingPerson";
            DiagramWebControl1.DataSourceSettings.Id = "Name";
            DiagramWebControl1.Model.DefaultSettings.Node = new Node()
            {
                Constraints = NodeConstraints.Select | NodeConstraints.PointerEvents,
                FillColor = "#88C65C",
                Width = 115,
                Height = 45,
                BorderWidth = 1,
                BorderColor = "black",

            };
            Label label = new Label() { FontColor = "white", Margin = new LabelMargin() { Left = 10, Right = 10 }, FontSize = 12 };
            DiagramWebControl1.Model.DefaultSettings.Node.Labels.Add(label);
            DiagramWebControl1.Model.DefaultSettings.Connector = new Connector()
            {
                LineColor = "#000000",
                Constraints = ConnectorConstraints.None,
                Segments = new Collection() { new Segment(Segments.Orthogonal) },
                TargetDecorator = new Decorator() { Shape = DecoratorShapes.Arrow }
            };
            DiagramWebControl1.SelectedItems.Constraints = ~SelectorConstraints.Rotator;
            DiagramWebControl1.Model.SelectionChange = "selectionChange";
            DiagramWebControl1.SnapSettings.SnapConstraints = SnapConstraints.None;
            DiagramWebControl1.EnableContextMenu = false;
            DiagramWebControl1.Tool = Tool.SingleSelect;
            DiagramWebControl1.NodeTemplate = "nodeTemplate";
        }

        public Array GetHierarchicalLayout()
        {
            string allText = System.IO.File.ReadAllText(Server.MapPath("~/App_Data/HierarchicalLayout.json"));
            Dictionary<string, object> requestArgs = (Dictionary<string, object>)new JavaScriptSerializer().DeserializeObject(allText);
            requestArgs = (Dictionary<string, object>)requestArgs["root"];
            return (Array)requestArgs.Values.ElementAt(0);
        }
    }
}