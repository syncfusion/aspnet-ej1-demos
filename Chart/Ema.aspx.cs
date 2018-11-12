using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.Chart
{
    public partial class Ema: System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Setting Range for PrimaryYAxis
            this.Chart1.PrimaryYAxis.Range.Min = 55;
            this.Chart1.PrimaryYAxis.Range.Max = 75;
            this.Chart1.PrimaryYAxis.Range.Interval = 5;
            
            //Setting Range for Opposed YAxis
            this.Chart1.Axes[0].Range.Min = 55;
            this.Chart1.Axes[0].Range.Max = 75;
            this.Chart1.Axes[0].Range.Interval = 5;
          
        }
    }
}