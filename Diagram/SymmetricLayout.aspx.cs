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
    public partial class SymmetricLayout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DiagramWebControl1.PageSettings.ScrollLimit = ScrollLimit.Diagram;
            DiagramWebControl1.Layout.Type = LayoutTypes.SymmetricLayout;
            DiagramWebControl1.Layout.SpringLength = 80;
            DiagramWebControl1.Layout.MaxIteration = 500;
            DiagramWebControl1.Layout.SpringFactor = .8F;
            DiagramWebControl1.Layout.Margin.Left = 0;
            DiagramWebControl1.Layout.Margin.Top = 20;

            Collection Nodes = new Collection();
            Collection Connectors = new Collection();
            populateNodes(Nodes, Connectors);
            DiagramWebControl1.Model.Nodes = Nodes;
            DiagramWebControl1.Model.Connectors = Connectors;
            DiagramWebControl1.Model.DefaultSettings.Node = new Node()
            {
                Constraints = NodeConstraints.Default & ~NodeConstraints.Drag,
            };

            DiagramWebControl1.Model.DefaultSettings.Connector = new Connector()
            {
                Constraints = ConnectorConstraints.Default & ConnectorConstraints.Select,
            };
            DiagramWebControl1.EnableContextMenu = false;
        }

        private Connector ConnectNodes(BasicShape ParentNode, BasicShape ChildNode)
        {
            Connector connector = new Connector()
            {
                Name = ParentNode.Name + ChildNode.Name,
                SourceNode = ParentNode.Name,
                TargetNode = ChildNode.Name,
                LineColor = "black",
                TargetDecorator = new Decorator() { Shape = DecoratorShapes.None }
            };
            return connector;
        }

        private Collection populateNodes(Collection Nodes, Collection Connectors)
        {
            BasicShape ParentRect = GetRectangle("p");
            Nodes.Add(ParentRect);
            for (int i = 0; i < 2; i++)
            {
                BasicShape ChildRect = GetRectangle("c" + i);
                Nodes.Add(ChildRect);
                for (int j = 0; j < 2; j++)
                {
                    BasicShape ChildRect_j = GetRectangle("c" + i + j);
                    Nodes.Add(ChildRect_j);
                    for (int k = 0; k < 6; k++)
                    {
                        BasicShape ChildRect_k = GetRectangle("c" + i + j + k); ;
                        Nodes.Add(ChildRect_k);
                        Connectors.Add(ConnectNodes(ChildRect_j, ChildRect_k));

                    }
                    Connectors.Add(ConnectNodes(ChildRect, ChildRect_j));

                }
                Connectors.Add(ConnectNodes(ParentRect, ChildRect));
            }

            return Nodes;
        }

        private BasicShape GetRectangle(string name)
        {
            BasicShape node = new BasicShape() { Name = name, Height = 25, Width = 25, BorderColor = "#5e5e5e", BorderWidth = 1, FillColor = "#ff6329", Shape = BasicShapes.Ellipse };
            return node;
        }
    }
}