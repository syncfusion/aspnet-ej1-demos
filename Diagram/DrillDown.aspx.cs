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
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Label = Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label;

namespace WebSampleBrowser.Diagram
{
    public partial class DrillDown : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ImageNode node = new ImageNode();
            node.Name = "Image1";
            node.Source = "../Content/diagram/drilldown/image2.png";
            Dictionary<string, object> addinfo = new Dictionary<string, object>();
            addinfo.Add("toolvalue", "Click on node to drill down");
            node.AddInfo = addinfo;
            DiagramWebControl1.Model.Nodes.Add(node);
            DiagramWebControl1.Model.Layout.Type = LayoutTypes.HierarchicalTree;
            DiagramWebControl1.Model.Layout.Margin = new Margin() { Top = 60 };
            DiagramWebControl1.Model.Layout.VerticalSpacing = 60;
            TextNode text = new TextNode();
            text.Name = "textNode";
            text.Width = 200;
            text.Height = 60;
            text.Constraints = NodeConstraints.None;
            text.OffsetX = 310;
            text.OffsetY = 30;
            text.ExcludeFromLayout = true;
            text.TextBlock.Text = "Coevals Diagram";
            text.TextBlock.FontColor = "blue";
            text.TextBlock.FontSize = 20;
            text.TextBlock.FontFamily = "Segoe UI";
            DiagramWebControl1.Model.Nodes.Add(text);

            DiagramWebControl1.Model.DefaultSettings.Node = new ImageNode()
            {
                Width = 50,
                Height = 50,
                BorderColor = "transparent",
                Labels = new Collection() { new Label() { ReadOnly = true } }
            };
            DiagramWebControl1.Model.DefaultSettings.Connector = new Connector() { Segments = new Collection() { new Segment() { Type = Segments.Orthogonal } } };
            DiagramWebControl1.OnClientClick = "click";
            DiagramWebControl1.Model.SelectedItems.Constraints = SelectorConstraints.None;
            DiagramWebControl1.OnClientDoubleClick = "doubleclick";
             
        }

        [WebMethod]
        public static Array getData()
        {
            return GetDrillDownData();
        }

        public static Array GetDrillDownData()
        {
            string allText = System.IO.File.ReadAllText(System.Web.HttpContext.Current.Server.MapPath("~/App_Data/DrillDown.json"));
            Dictionary<string, object> requestArgs = (Dictionary<string, object>)new JavaScriptSerializer().DeserializeObject(allText);
            requestArgs = (Dictionary<string, object>)requestArgs["root"];
            return (Array)requestArgs.Values.ElementAt(0);
        }
    }
}