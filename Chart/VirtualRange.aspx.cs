using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.Chart
{
    public partial class VirtualRange : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.container.PrimaryXAxis.ScrollbarSettings.Range.Min = new DateTime(2009,1,1);
            this.container.PrimaryXAxis.ScrollbarSettings.Range.Max = new DateTime(2014,1,1);
        }
    }
}