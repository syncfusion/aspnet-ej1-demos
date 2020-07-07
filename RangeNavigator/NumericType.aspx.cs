#region Copyright Syncfusion Inc. 2001-2020.
// Copyright Syncfusion Inc. 2001-2020. All rights reserved.
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
    public partial class NumericType : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            #region Chart

           //Setting Range for PrimaryYAxis
            this.Chart1.PrimaryYAxis.Range.Min = 70;
            this.Chart1.PrimaryYAxis.Range.Max = 140;
            this.Chart1.PrimaryYAxis.Range.Interval = 10;

            #endregion
        }
    }
}