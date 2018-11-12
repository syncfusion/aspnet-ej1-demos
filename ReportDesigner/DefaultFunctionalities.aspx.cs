using Syncfusion.JavaScript.Models.ReportDesigner;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.ReportDesigner
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /// <summary>
            /// ReportDesigner1 control.
            /// </summary>
            /// <remarks>
            /// Auto-generated field.
            /// To modify move field declaration from designer file to code-behind file.
            /// </remarks>
            this.ReportDesigner1.ServiceUrl = VirtualPathUtility.ToAbsolute("~/api/ReportDesigner");
        }
    }
}