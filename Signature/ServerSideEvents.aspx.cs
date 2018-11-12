using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.Signature
{
    public partial class ServerSideEvents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void signature_Change(object sender, Syncfusion.JavaScript.Web.SignatureEventArgs e)
        {
            this.EventLog.InnerHtml = "\n Signature has been <span class='eventTitle'>Changed</span>.\r\n<br/>" + this.EventLog.InnerHtml;
        }
        protected void clearbutton_Click(object Sender, Syncfusion.JavaScript.Web.ButtonEventArgs e)
        {
            this.EventLog.InnerHtml = string.Empty;
        }
    }
}