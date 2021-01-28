#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.JavaScript.DataVisualization;
using Syncfusion.JavaScript.DataVisualization.Models;
using Syncfusion.JavaScript.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.RangeNavigator
{
    public partial class RangeCustom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.rangecustomtheme.ValueAxisSettings.Range.Min = 0;
            this.rangecustomtheme.ValueAxisSettings.Range.Max = 50;
            this.rangecustomtheme.ValueAxisSettings.Range.Interval = 10;
            this.rangecustomtheme2.ValueAxisSettings.Range.Min = 0;
            this.rangecustomtheme2.ValueAxisSettings.Range.Max = 50;
            this.rangecustomtheme2.ValueAxisSettings.Range.Interval = 10;
        }
    }
}