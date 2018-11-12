using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.UploadBox
{
    public partial class Events : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Upload1_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            this.EventLog.InnerHtml = "<span class='eventTitle'>UploadBox Created</span>.\r\n<br/>" + this.EventLog.InnerHtml;
        }

        protected void Clear_Click(object Sender, Syncfusion.JavaScript.Web.ButtonEventArgs e)
        {
            this.EventLog.InnerHtml = string.Empty;
        }

        protected void Upload1_Complete(object sender, Syncfusion.JavaScript.Web.UploadBoxCompleteEventArgs e)
        {
            this.EventLog.InnerHtml = "<span class='eventTitle'>Files Successfully uploaded</span>.\r\n<br/>" + this.EventLog.InnerHtml;
        }        
    }
}