using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.Dialog
{
    public partial class CustomAction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<string> actionlist = new List<string>();
            actionlist.Add("close");
            actionlist.Add("collapsible");
            actionlist.Add("maximize");
            actionlist.Add("minimize");
            actionlist.Add("pin");

            dialogIcon.ActionButtons = actionlist;
        }
    }
}