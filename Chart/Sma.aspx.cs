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

namespace WebSampleBrowser.Chart
{
    public partial class sma : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Setting Range for PriamryYAxis
            this.Chart1.PrimaryYAxis.Range.Max = 75;
            this.Chart1.PrimaryYAxis.Range.Min = 55;
            this.Chart1.PrimaryYAxis.Range.Interval = 5;

            //Setting Range for Opposed YAxis
            this.Chart1.Axes[0].Range.Max = 75;
            this.Chart1.Axes[0].Range.Min = 55;
            this.Chart1.Axes[0].Range.Interval = 5;
        }
    }
}