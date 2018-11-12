using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.Chart
{
    public partial class VerticalChart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Chart1.PrimaryYAxis.Range.Min = -15;
            this.Chart1.PrimaryYAxis.Range.Max = 15;
            this.Chart1.PrimaryYAxis.Range.Interval = 5;

            this.Chart1.Axes[0].Range.Min = -15;
            this.Chart1.Axes[0].Range.Max = 15;
            this.Chart1.Axes[0].Range.Interval = 5;
        }
    }
}