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
    public partial class StackingBar1003D : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Setting Range for PriamryXAxis
            this.Chart1.PrimaryXAxis.Range.Max = 2012;
            this.Chart1.PrimaryXAxis.Range.Min = 2005;
            this.Chart1.PrimaryXAxis.Range.Interval = 1;
        }
    }
}