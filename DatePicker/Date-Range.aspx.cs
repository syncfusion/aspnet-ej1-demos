using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.DatePicker
{
    public partial class date_range : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.daterange1.Value = DateTime.Now;
            this.daterange2.Value = DateTime.Now.AddDays(7);
            this.daterange1.MinDate = DateTime.Now.AddDays(-7);
            this.daterange1.MaxDate = DateTime.Now.AddMonths(3);
            this.daterange2.MinDate = DateTime.Now.AddDays(-7);
            this.daterange2.MaxDate = DateTime.Now.AddMonths(3);

         }
    }
}