#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
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
    public partial class Tma : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Setting Range for PrimaryYAxis
            this.container.PrimaryYAxis.Range.Max = 75;
            this.container.PrimaryYAxis.Range.Min = 55;
            this.container.PrimaryYAxis.Range.Interval = 5;

            //Settig Range for Opposed YAxis
            this.container.Axes[0].Range.Max = 75;
            this.container.Axes[0].Range.Min = 55;
            this.container.Axes[0].Range.Interval = 5;
        }
    }
}