using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.Rating
{
    public partial class precision : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Rating1.Precision = Syncfusion.JavaScript.Precision.Full;
            Rating2.Precision = Syncfusion.JavaScript.Precision.Half;
            Rating3.Precision = Syncfusion.JavaScript.Precision.Exact;
            
        }
    }
}