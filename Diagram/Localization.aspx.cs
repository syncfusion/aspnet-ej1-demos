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

namespace WebSampleBrowser.Diagram
{
    public partial class Localization : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DiagramWebControl1.Model.Width = "100%";
            DiagramWebControl1.Model.Height = "600px";
            DiagramWebControl1.Model.DefaultSettings.Node = new Node() { Width = 188, Height = 102 };
            DiagramWebControl1.Model.DefaultSettings.Connector = new Connector() { Segments = new Collection() { new Segment(Segments.Orthogonal) } };   
            DiagramWebControl1.Model.EnableContextMenu = true;
        }
    }
}