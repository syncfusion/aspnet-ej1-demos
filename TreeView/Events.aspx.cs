using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.TreeView
{
    public partial class clientevents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void treeView_NodeSelected(object sender, Syncfusion.JavaScript.Web.TreeViewEventArgs e)
        {
            this.EventLog.InnerHtml = e.NodeText + "<span class='eventTitle'> was selected</span>.\r\n<br/>" + this.EventLog.InnerHtml;
        }

        protected void treeView_NodeChecked(object sender, Syncfusion.JavaScript.Web.TreeViewEventArgs e)
        {
            this.EventLog.InnerHtml = e.NodeText + "<span class='eventTitle'> was Checked</span>.\r\n<br/>" + this.EventLog.InnerHtml;
        }

        protected void Clear_Click(object Sender, Syncfusion.JavaScript.Web.ButtonEventArgs e)
        {
            this.EventLog.InnerHtml = string.Empty;
        }
    }
}