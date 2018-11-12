using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Syncfusion.JavaScript.Web;

namespace WebSampleBrowser.Schedule
{
    public partial class API : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            for (int i = 0; i <= 24; i++)
            {
                ddlBusinessStartHour.Items.Add(new DropDownListItem() { Text = i.ToString(), Value = i.ToString() });
                ddlBusinessEndHour.Items.Add(new DropDownListItem() { Text = i.ToString(), Value = i.ToString() });
            }
            ddlBusinessStartHour.SelectedIndex = 9;
            ddlBusinessEndHour.SelectedIndex = 19;
        }
    }
}