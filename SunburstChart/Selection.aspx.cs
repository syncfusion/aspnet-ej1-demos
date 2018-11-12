using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.Sunburst
{
    public partial class Selection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.container.DataSource = SelectionData.GetSelectionDataList();
        }
    }
}