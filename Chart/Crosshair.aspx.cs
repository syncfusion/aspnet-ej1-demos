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
    public partial class Crosshair : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Setting Range for PrimaryYAxis
            this.Chart1.PrimaryYAxis.Range.Min = 10;
            this.Chart1.PrimaryYAxis.Range.Max = 90;
            this.Chart1.PrimaryYAxis.Range.Interval = 10;

            //Setting Range for Opposed YAxis
            this.Chart1.Axes[1].Range.Min = 0;
            this.Chart1.Axes[1].Range.Max = 160;
            this.Chart1.Axes[1].Range.Interval = 20;

           

        }
    }
}