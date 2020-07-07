#region Copyright Syncfusion Inc. 2001-2020.
// Copyright Syncfusion Inc. 2001-2020. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
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
    public partial class StackingBar3D : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Setting Range for PrimaryXAxis
            this.Chart1.PrimaryXAxis.Range.Max = 2015;
            this.Chart1.PrimaryXAxis.Range.Min = 2008;
            this.Chart1.PrimaryXAxis.Range.Interval = 1;

            //Setting Range for PriamryYAxis
            this.Chart1.PrimaryYAxis.Range.Max = 20;
            this.Chart1.PrimaryYAxis.Range.Min = 0;
            this.Chart1.PrimaryYAxis.Range.Interval = 2;
        }
    }

}


