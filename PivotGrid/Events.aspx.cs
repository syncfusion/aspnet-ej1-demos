using Syncfusion.JavaScript.Web;
using Syncfusion.JavaScript.Web.Olap;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser
{
    public partial class Events : System.Web.UI.Page
    {
        

        protected void PivotGridEvent(object sender, PivotGridEventArgs e)
        {
            this.EventLog.InnerText += e.EventType + " event is triggered\n";
        }
    }
}