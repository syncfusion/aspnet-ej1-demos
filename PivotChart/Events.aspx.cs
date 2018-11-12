using Syncfusion.JavaScript.Web;
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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void PivotChart1_DrillSuccess(object sender, PivotChartEventArgs e)
        {
            this.EventLog.InnerText += e.EventType + " event is triggered" + Environment.NewLine;
        }
    }
}