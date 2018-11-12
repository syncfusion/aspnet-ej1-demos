using Syncfusion.JavaScript.DataVisualization;
using Syncfusion.JavaScript.DataVisualization.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.Chart
{
    public partial class FlexibleAxis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Setting Range for PrimaryYAxis
            this.Chart1.PrimaryYAxis.Range.Min =83;
            this.Chart1.PrimaryYAxis.Range.Max = 87;
            this.Chart1.PrimaryYAxis.Range.Interval = 1;
            this.Chart1.Axes[0].Range.Min =82;
            this.Chart1.Axes[0].Range.Max = 88;
            this.Chart1.Axes[0].Range.Interval = 2;

        }
    }
}