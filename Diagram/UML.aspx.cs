#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.JavaScript.DataVisualization.DiagramEnums;
using Syncfusion.JavaScript.DataVisualization.Models.Diagram;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Syncfusion.JavaScript.DataVisualization.Models.Collections;
using System.Web.Script.Serialization;

namespace WebSampleBrowser.Diagram
{
    public partial class UML : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ConnectNode("Patient", "Person", UMLRelationships.Association);
                ConnectNode("Person", "Hospital", UMLRelationships.Association);
                ConnectNode("Department", "Hospital", UMLRelationships.Composition);
                ConnectNode("OperationStaff", "Patient", UMLRelationships.Association);
                ConnectNode("Doctor", "OperationStaff", UMLRelationships.Association);
                ConnectNode("Nurse", "OperationStaff", UMLRelationships.Association);
                ConnectNode("Surgeon", "Doctor", UMLRelationships.Association);
                ConnectNode("FrontDeskStaff", "AdministrativeStaff", UMLRelationships.Association);
                ConnectNode("Technician", "TechnicalStaff", UMLRelationships.Association);
                ConnectNode("Technologist", "TechnicalStaff", UMLRelationships.Association);
                ConnectNode("SurgicalTechnologist", "Technologist", UMLRelationships.Association);
                ConnectNode("Staff", "Department", UMLRelationships.Association);
                ConnectNode("Staff", "Person", UMLRelationships.Association);
                ConnectNode("OperationStaff", "Staff", UMLRelationships.Association);
                ConnectNode("AdministrativeStaff", "Staff", UMLRelationships.Association);
                ConnectNode("TechnicalStaff", "Staff", UMLRelationships.Association);
                DiagramWebControl1.Model.DefaultSettings.Node = new Node()
                {
                    Constraints = NodeConstraints.Default,
                    FillColor = "#26A0DA",
                    BorderColor = "white",
                    BorderWidth = 2,
                    Labels = new Collection() {
                                new Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label() { FontColor = "white", FontFamily = "Segoe UI" },
                                new Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label() { FontColor = "white", FontFamily = "Segoe UI" }
                             }
                };
                DiagramWebControl1.Model.DefaultSettings.Connector = new Connector()
                {
                    Constraints = ConnectorConstraints.None,
                    Segments = new Collection() { new Segment(Segments.Straight) },
                    TargetDecorator = new Decorator() { Height = 10, Width = 10, FillColor = "#666666" }
                };
                DiagramWebControl1.Model.NodeTemplate = "nodeTemplate";
                DiagramWebControl1.Model.DataSourceSettings.DataSource = GetUMLData();
            }
        }
        public object GetUMLData()
        {
            string allText = System.IO.File.ReadAllText(Server.MapPath("~/App_Data/UML.json"));
            Dictionary<string, object> requestArgs = (Dictionary<string, object>)new JavaScriptSerializer().DeserializeObject(allText);
            return requestArgs["data"];
        }
        private void ConnectNode(String sourceNode, String targetNode, UMLRelationships relationship)
        {
            Connector connector = new Connector();
            connector.Name = "connector" + DiagramWebControl1.Connectors.Count + 1;
            connector.TargetNode = targetNode;
            connector.SourceNode = sourceNode;
            connector.Segments = new Collection() { new Segment() { Type = Segments.Straight } };
            connector.Shape = new UMLConnectorShape()
            {
              Relationship = relationship
            };
            connector.Constraints = ConnectorConstraints.None;
            DiagramWebControl1.Connectors.Add(connector);
        }
    }
}