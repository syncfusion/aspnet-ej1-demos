using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Syncfusion.JavaScript.Web;
using Syncfusion.JavaScript.DataVisualization.DiagramEnums;
using Syncfusion.JavaScript.DataVisualization.Models;
using Syncfusion.JavaScript.DataVisualization.Models.Collections;
using Syncfusion.JavaScript.DataVisualization.Models.Diagram;
using Syncfusion.JavaScript.Shared.Serializer;

namespace WebSampleBrowser.Diagram
{
    public partial class DrawingTools : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Diagram1.OnClientNodeCollectionChange = "nodeCollectionChange";
        }
       
    }
}