using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.DatePicker
{
    public partial class events : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void datepickerevents_Select(object sender, Syncfusion.JavaScript.Web.DatePickerSelectEventArgs e)
        {
            this.EventLog.InnerHtml = e.Value + "&nbsp;<span class='eventTitle'>was selected</span>.\r\n<br/>" + this.EventLog.InnerHtml;
  
        }

        protected void Clear_Click(object Sender, Syncfusion.JavaScript.Web.ButtonEventArgs e)
        {
            this.EventLog.InnerHtml = string.Empty;
        }
    }
}