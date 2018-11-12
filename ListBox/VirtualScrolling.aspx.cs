using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.ListBox
{
    public partial class VirtualScrolling : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.selectlang.DataSource = "//js.syncfusion.com/ejServices/wcf/NorthWind.svc/";
            this.selectlang.Query = "ej.Query().from('Customers')";  
        }
    }
  
}