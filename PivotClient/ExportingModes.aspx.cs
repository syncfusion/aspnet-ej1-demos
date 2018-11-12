using Syncfusion.EJ.Export;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser
{
    public partial class ExportingModes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void PivotClient1_ServerExporting(object sender, Syncfusion.JavaScript.Web.PivotClientEventArgs e)
        {
            PivotClientExport olapClient = new PivotClientExport();
            dynamic args = e.Arguments;
            olapClient.ExportPivotClient(string.Empty, args["args"].ToString(), HttpContext.Current.Response);
        }
    }
}