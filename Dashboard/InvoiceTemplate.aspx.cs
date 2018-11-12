using Syncfusion.JavaScript.Models.ReportViewer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.Dashboard
{
    public partial class InvoiceTemplate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.ReportViewer1.Parameters = new List<ReportParameter>();
            this.ReportViewer1.Parameters.Add(new ReportParameter() { Name = "InvoiceID", Labels = new List<string>() { "InvoiceID" }, Values = new List<string>() { "10250" } });
            this.ReportViewer1.ReportServiceUrl = VirtualPathUtility.ToAbsolute("~/api/SSRSReport");
        }
    }
}