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
namespace WebSampleBrowser.Diagram
{
    public partial class MultipleParent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DiagramWebControl1.PageSettings.ScrollLimit = ScrollLimit.Diagram;
            DiagramWebControl1.Layout.Type = LayoutTypes.HierarchicalTree;
            DiagramWebControl1.Layout.HorizontalSpacing = 40;
            DiagramWebControl1.Layout.VerticalSpacing = 40;
            DiagramWebControl1.Layout.Margin.Left = 0;
            DiagramWebControl1.Layout.Margin.Top = 20;
            DiagramWebControl1.DataSourceSettings.DataSource = GetMultipleParent();
            DiagramWebControl1.DataSourceSettings.Parent = "ReportingPerson";
            DiagramWebControl1.DataSourceSettings.Id = "Name";
            DiagramWebControl1.Model.DefaultSettings.Node = new BasicShape()
            {
                Constraints = NodeConstraints.Select | NodeConstraints.PointerEvents,
                FillColor = "#88C65C",
                Width = 40,
                Height = 40,
                BorderWidth = 1,
                BorderColor = "#5e5e5e",
                CornerRadius=7,
            };
         
            DiagramWebControl1.Model.DefaultSettings.Connector = new Connector()
            {
                LineColor = "#000000",
                Constraints = ConnectorConstraints.None,
                Segments = new Collection() { new Segment(Segments.Orthogonal) },
                TargetDecorator = new Decorator() { Shape = DecoratorShapes.Arrow, Width = 5, Height = 5 },
                CornerRadius=10
                 
            };
            DiagramWebControl1.SelectedItems.Constraints = ~SelectorConstraints.Rotator;
            DiagramWebControl1.Model.SelectionChange = "selectionChange";
            DiagramWebControl1.SnapSettings.SnapConstraints = SnapConstraints.None;
            DiagramWebControl1.EnableContextMenu = false;
            DiagramWebControl1.Tool = Tool.SingleSelect;
            DiagramWebControl1.OnClientCreate = "diagramCreate";

        }

        public Array GetMultipleParent()
        {
            string allText = System.IO.File.ReadAllText(Server.MapPath("~/App_Data/MultipleParent.json"));
            Dictionary<string, object> requestArgs = (Dictionary<string, object>)new JavaScriptSerializer().DeserializeObject(allText);
            requestArgs = (Dictionary<string, object>)requestArgs["root"];
            return (Array)requestArgs.Values.ElementAt(0);
        }
    }
}