using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.Dialog
{
    public partial class Events : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dlgOpen.Visible = false;
        }

        protected void clearbutton_Click(object Sender, Syncfusion.JavaScript.Web.ButtonEventArgs e)
        {
            this.EventLog.InnerHtml = string.Empty;
        }
        protected void eventDialog_Init(object sender, EventArgs e)
        {
            this.EventLog.InnerHtml = "\n Dialog has been <span class='eventTitle'>created</span>.\r\n<br/>" + this.EventLog.InnerHtml;
        }       
        protected void eventDialog_Close(object sender, EventArgs e)
        {
            this.EventLog.InnerHtml = "\n Dialog has been <span class='eventTitle'>closed</span>.\r\n<br/>" + this.EventLog.InnerHtml;
            dlgOpen.Visible = true;
        }
    }
}