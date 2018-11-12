using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.Schedule
{
    public partial class FirstDayOfWeek : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.workweeks.SelectedIndices = new List<int> { 1,2,3,4,5};
            this.dayofweek.SelectedIndices = new List<int> { 1 };
        }
    }
}