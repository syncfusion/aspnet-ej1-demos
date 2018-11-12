using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.ProgressBar
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ProgressBar1.Percentage = 45;
            ProgressBar1.Text = ProgressBar1.Percentage + "%";
        }
    }
}