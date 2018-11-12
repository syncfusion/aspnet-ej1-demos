using Syncfusion.EJ.Export;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser
{
    public partial class Paging : System.Web.UI.Page
    {

        protected void PivotClient_ServerExporting(object sender, Syncfusion.JavaScript.Web.PivotClientEventArgs e)
        {
            PivotClientExport olapClient = new PivotClientExport();
            dynamic args = e.Arguments;
            olapClient.ExportPivotClient(string.Empty, args["args"].ToString(), HttpContext.Current.Response);
        }
    }
}