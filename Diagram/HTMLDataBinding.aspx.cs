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
    public partial class HTMLDataBinding : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HTMLBinding.Model.Width = "100%";
                HTMLBinding.Model.Height = "490px";
                HTMLBinding.Model.DataSourceSettings.Parent = "ReportingPerson";
                HTMLBinding.Model.DataSourceSettings.Id = "Id";
                HTMLBinding.Model.DefaultSettings.Node = new Node()
                {
                    Width = 100,
                    Height = 40,
                    BorderColor = "transparent"
                };
                Label label = new Label() { FontColor = "#ffffff" };
                HTMLBinding.Model.DefaultSettings.Node.Labels.Add(label);
                HTMLBinding.Model.DefaultSettings.Connector = new Connector()
                {
                    Segments = new Collection() { new Segment(Segments.Orthogonal) },
                    TargetDecorator = new Decorator() { Shape = DecoratorShapes.Arrow, BorderColor = "#4F4F4F", FillColor = "#4F4F4F" }
                };
                HTMLBinding.Model.SnapSettings.SnapConstraints = SnapConstraints.None;
                HTMLBinding.Model.EnableContextMenu = false;
                HTMLBinding.Model.NodeTemplate = "nodeTemplate";
            }

        }
    }
}