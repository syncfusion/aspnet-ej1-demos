using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Syncfusion.JavaScript.DataVisualization;
using Syncfusion.JavaScript.DataVisualization.Models;

namespace WebSampleBrowser.Chart
{
    public partial class LabelTemplate1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Setting Range for PrimaryXAxis
            this.Chart1.PrimaryXAxis.Range.Min = 2005;
            this.Chart1.PrimaryXAxis.Range.Max = 2011;
            this.Chart1.PrimaryXAxis.Range.Interval = 1;

            //Setting Range for PrimaryYAxis
            this.Chart1.PrimaryYAxis.Range.Min = 16;
            this.Chart1.PrimaryYAxis.Range.Max = 44;
            this.Chart1.PrimaryYAxis.Range.Interval = 4;

          
        }
       

    }
}