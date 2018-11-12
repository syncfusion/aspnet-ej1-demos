using Syncfusion.JavaScript.DataVisualization;
using Syncfusion.JavaScript.DataVisualization.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.RangeNavigator
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            #region Chart

            //Setting Range for PrimaryYAxis
            this.Chart1.PrimaryYAxis.Range.Min = 60;
            this.Chart1.PrimaryYAxis.Range.Max = 160;
            this.Chart1.PrimaryYAxis.Range.Interval = 20;

            #endregion
        }
    }
}