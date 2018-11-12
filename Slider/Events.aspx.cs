using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.Slider
{
    public partial class Events : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void sliderEvents_ChangeEvent(object sender, Syncfusion.JavaScript.Web.SliderEventArgs e)
        {
            this.EventLog.InnerHtml = "Slider value has been <span class='eventTitle'>changed</span> to " + e.Value + ".\r\n<br/>" + this.EventLog.InnerHtml;            
        }

        protected void Clear_Click(object Sender, Syncfusion.JavaScript.Web.ButtonEventArgs e)
        {
            this.EventLog.InnerHtml = string.Empty;
        }       
    }
}