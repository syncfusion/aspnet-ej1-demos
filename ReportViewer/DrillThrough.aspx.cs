using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.ReportViewer
{
    public partial class DrillThrough : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.ReportViewer1.ToolbarSettings.Items = Syncfusion.JavaScript.ReportViewerEnums.ToolbarItems.All & ~Syncfusion.JavaScript.ReportViewerEnums.ToolbarItems.Parameters;
            this.ReportViewer1.ReportServiceUrl = VirtualPathUtility.ToAbsolute("~/api/RDLCReport");
        }
    }
}