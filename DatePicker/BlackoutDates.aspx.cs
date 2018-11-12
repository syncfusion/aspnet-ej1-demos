using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.DatePicker
{
    public partial class BlackoutDates : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<object> blackoutDates = new List<object>();
            blackoutDates.Add(new DateTime(2018, 5, 10));
            blackoutDates.Add(new DateTime(2018, 5, 15));
            blackoutDates.Add(new DateTime(2018, 5, 20));
            blackoutDates.Add(new DateTime(2018, 5, 22));
            blackoutDates.Add(new DateTime(2018, 6, 12));
            blackoutDates.Add(new DateTime(2018, 6, 24));
            this.datepick.BlackoutDates = blackoutDates;
        }
    }
}