#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
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
    public partial class Highlight : System.Web.UI.Page
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