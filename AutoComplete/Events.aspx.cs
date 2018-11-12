using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.AutoComplete
{
    public partial class Events : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.selectColor.DataSource = Colors.GetColors();
        }

        protected void selectColor_ValueSelect(object sender, Syncfusion.JavaScript.Web.AutocompleteSelectEventArgs e)
        {
            this.EventLog.InnerHtml = e.Value + "&nbsp;<span class='eventTitle'>was selected</span>.\r\n<br/>" + this.EventLog.InnerHtml;
        }

        protected void selectColor_FocusOut(object sender, Syncfusion.JavaScript.Web.AutocompleteEventArgs e)
        {
            this.EventLog.InnerHtml = "Autocomplete &nbsp;<span class='eventTitle'>was Focused out</span>.\r\n<br/>" + this.EventLog.InnerHtml;
        }

        protected void Clear_Click(object Sender, Syncfusion.JavaScript.Web.ButtonEventArgs e)
        {
            this.EventLog.InnerHtml = string.Empty;
        }
    }
}