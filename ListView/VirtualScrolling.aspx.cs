using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.ListView
{
    public partial class VirtualScrolling : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.List1.DataSource = "//js.syncfusion.com/ejServices/wcf/NorthWind.svc/";
            this.List1.Query = "ej.Query().from('Customers')";
        }
    }
}