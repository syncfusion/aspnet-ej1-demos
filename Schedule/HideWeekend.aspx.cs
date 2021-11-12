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
using Syncfusion.JavaScript.Web;

namespace WebSampleBrowser.Schedule
{
    public partial class HideWeekend : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.orientation.SelectedIndices = new List<int> { 0 };
            this.workingdays.SelectedIndices = new List<int> { 1, 2, 3, 4, 5 };
        }
    }
}