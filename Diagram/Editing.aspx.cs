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
using Syncfusion.JavaScript.DataVisualization.DiagramEnums;
using Syncfusion.JavaScript.DataVisualization.Models.Collections;
using Syncfusion.JavaScript.DataVisualization.Models;
using System.Web.Configuration;
using System.Data;
using System.Web.Http;
using System.Web.Services;

namespace WebSampleBrowser.Diagram
{
    public partial class Editing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Diagram1.Model.Height = "550px";
                Diagram1.Model.Width = "700px";
                Diagram1.Model.DataSourceSettings = new DataSourceSettings()
                {
                    DataSource = DiagramContext.HierarchicalDatas.ToList(),
                    Id = "Name",
                    CustomFields = new List<string>() 
                {
                    "Description",
                    "Color"
                },
                    CrudAction = new CRUDAction()
                    {
                        Create = "Editing.aspx/InsertShape",
                        Update = "Editing.aspx/UpdateShape",
                        Destroy = "Editing.aspx/DeleteShape"
                    },
                    ConnectionDataSource = new ConnectionDataSourceSettings()
                    {
                        DataSource = DiagramContext.HierarchicalDetails.ToList(),
                        Id = "Name",
                        SourceNode = "SourceNode",
                        TargetNode = "TargetNode",
                        CrudAction = new CRUDAction()
                        {
                            Create = "Editing.aspx/InsertConnector",
                            Update = "Editing.aspx/UpdateConnector",
                            Destroy = "Editing.aspx/DeleteConnector"
                        }
                    }
                };
                Diagram1.Model.Layout = new  Syncfusion.JavaScript.DataVisualization.Models.Diagram.Layout()
                {
                    Type = LayoutTypes.HierarchicalTree,
                    HorizontalSpacing = 40,
                    VerticalSpacing = 40,
                    Margin = new Margin()
                    {
                        Top = 50
                    }
                };
                Diagram1.Model.DefaultSettings.Node = new Node()
                {
                    Width = 100,
                    Height = 50,
                    Constraints = (NodeConstraints.Default & ~NodeConstraints.Interaction) | (NodeConstraints.Select | NodeConstraints.PointerEvents),
                    BorderColor = "black",
                    BorderWidth = 1,
                    Labels = new Collection() { new Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label() { FontColor = "white", FontSize = 12 } }
                };
                Diagram1.Model.DefaultSettings.Connector = new Connector()
                {
                    LineColor = "#000000",
                    Constraints = ConnectorConstraints.Default & ~ConnectorConstraints.Drag,
                    Segments = new Collection() { new Segment() { Type = Segments.Orthogonal } }
                };
                Diagram1.Model.NodeTemplate = "nodeTemplate";
                Diagram1.Model.ConnectorSourceChange = "connectionChange";
                Diagram1.Model.ConnectorTargetChange = "connectionChange";
                Diagram1.Model.SelectionChange = "selectionChange";
            }
        }

        [WebMethod]
        public static void InsertShape(List<HierarchicalData> data)
        {
            foreach (HierarchicalData hdata in data)
            {
                DiagramContext.HierarchicalDatas.InsertOnSubmit(hdata);
                DiagramContext.SubmitChanges();
            }
        }

        [WebMethod]
        public static void UpdateShape(List<HierarchicalData> data)
        {
            foreach (HierarchicalData hdata in data)
            {
                HierarchicalData originalData = DiagramContext.HierarchicalDatas.Single(h => h.Name == hdata.Name);
                originalData.Description = hdata.Description;
                originalData.Color = hdata.Color;
                DiagramContext.SubmitChanges();
            }
        }

        [WebMethod]
        public static void DeleteShape(List<HierarchicalData> data)
        {
            foreach (HierarchicalData hdata in data)
            {
                HierarchicalData originalData = DiagramContext.HierarchicalDatas.Single(h => h.Name == hdata.Name);
                DiagramContext.HierarchicalDatas.DeleteOnSubmit(originalData);
                DiagramContext.SubmitChanges();
            }
        }

        [WebMethod]
        public static void InsertConnector(List<HierarchicalDetail> data)
        {
            foreach (HierarchicalDetail hdata in data)
            {
                DiagramContext.HierarchicalDetails.InsertOnSubmit(hdata);
                DiagramContext.SubmitChanges();
            }
        }

        [WebMethod]
        public static void UpdateConnector(List<HierarchicalDetail> data)
        {
            foreach (HierarchicalDetail hdata in data)
            {
                HierarchicalDetail originalData = DiagramContext.HierarchicalDetails.Single(h => h.Name == hdata.Name);
                originalData.SourceNode = hdata.SourceNode;
                originalData.TargetNode = hdata.TargetNode;
                DiagramContext.SubmitChanges();
            }
        }

        [WebMethod]
        public static void DeleteConnector(List<HierarchicalDetail> data)
        {
            foreach (HierarchicalDetail hdata in data)
            {
                HierarchicalDetail originalData = DiagramContext.HierarchicalDetails.Single(h => h.Name == hdata.Name);
                DiagramContext.HierarchicalDetails.DeleteOnSubmit(originalData);
                DiagramContext.SubmitChanges();
            }
        }

        private static DiagramDataDataContext _diagramContext;
        public static DiagramDataDataContext DiagramContext
        {
            get
            {
                if (_diagramContext == null)
                    _diagramContext = new DiagramDataDataContext();
                return _diagramContext;
            }
        }
    }
}