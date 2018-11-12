using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser
{
    public partial class ClientGroupingBar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.PivotGrid1.Model.DataSource.Filters[0].FilterItems.Values = new List<string>() { "FY 2005" };
        }
    }
}