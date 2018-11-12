using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Syncfusion.JavaScript.Web;
using Syncfusion.JavaScript.Shared;
using Syncfusion.JavaScript.Models;


namespace WebSampleBrowser.ProgressBar
{
    public partial class rtl : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ProgressBar1.Percentage = 35;
            ProgressBar1.Text = ProgressBar1.Percentage + "%";
        }
    }
}