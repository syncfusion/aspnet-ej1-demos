using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Syncfusion.JavaScript.Web;

namespace WebSampleBrowser.Schedule
{
    public partial class HideWeekend : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.orientation.SelectedIndices = new List<int> { 0 };
            this.workingdays.SelectedIndices = new List<int> { 1, 2, 3, 4, 5 };
        }
    }
}