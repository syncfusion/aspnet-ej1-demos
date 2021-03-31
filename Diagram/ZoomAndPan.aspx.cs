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
using System.Web.UI;
using System.Web.UI.WebControls;
using Label = Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label;
namespace WebSampleBrowser.Diagram
{
    public partial class ZoomAndPan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DiagramWebControl1.Model.Height = "500px";
            DiagramWebControl1.Model.Width = "100%";
            DiagramWebControl1.Model.PageSettings.ScrollLimit = ScrollLimit.Diagram;
            DiagramWebControl1.Model.PageSettings.PageHeight = 500;
            DiagramWebControl1.Model.PageSettings.PageWidth = 635;
            DiagramWebControl1.Model.PageSettings.PageOrientation = PageOrientation.Landscape;
            DiagramWebControl1.Model.SnapSettings.SnapConstraints = SnapConstraints.None;
            DiagramWebControl1.Model.EnableContextMenu = false;
            DiagramWebControl1.Model.PageSettings.PageBackgroundColor = "transparent";
            DiagramWebControl1.Model.BackgroundImage.Source = "../content/images/Employee/ZoomImage.jpg";
            DiagramWebControl1.Model.BackgroundImage.Alignment = ImageAlignment.XMinYMid;
            DiagramWebControl1.Model.BackgroundImage.Scale = ScaleConstraints.Slice;
        }
    }
}