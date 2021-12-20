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
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using Label = Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label;

namespace WebSampleBrowser.Diagram
{
    public partial class BusinessOrgChart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BusinessChart.Model.DataSourceSettings.DataSource = GetBusinessChartData();
                BusinessChart.Model.DataSourceSettings.Parent = "Manager";
                BusinessChart.Model.DataSourceSettings.Id = "Id";
                BusinessChart.Model.Layout.GetLayoutInfo = "getLayoutInfo";
                BusinessChart.Model.DefaultSettings.Node = new Node() { Width = 150, Height = 50, BorderColor = "transparent" };
                Label label = new Label() { FontColor = "#ffffff", Margin = new LabelMargin() { Left = 5, Right = 5 } };
                BusinessChart.Model.DefaultSettings.Node.Labels.Add(label);
                BusinessChart.Model.DefaultSettings.Connector = new Connector()
                {
                    Segments = new Collection() { new Segment(Segments.Orthogonal) },
                    TargetDecorator = new Decorator() { Shape = DecoratorShapes.None },
                    Constraints = ConnectorConstraints.None
                };
                BusinessChart.Model.NodeTemplate = "nodeTemplate";
            }
        }
        public Array GetBusinessChartData()
        {
            string allText = System.IO.File.ReadAllText(Server.MapPath("~/App_Data/BusinessChart.json"));
            Dictionary<string, object> requestArgs = (Dictionary<string, object>)new JavaScriptSerializer().DeserializeObject(allText);
            requestArgs = (Dictionary<string, object>)requestArgs["root"];
            return (Array)requestArgs.Values.ElementAt(0);
        }
    }
}