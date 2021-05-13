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

namespace WebSampleBrowser
{
    public partial class ClientGroupingBar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.PivotGrid1.Model.DataSource.Filters[0].FilterItems.Values = new List<string>() { "FY 2005" };
        }
    }
}