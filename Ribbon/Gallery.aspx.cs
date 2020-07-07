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

namespace WebSampleBrowser.Ribbon
{
    public partial class Gallery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var fontlist = new List<string> { "Segoe UI", "Arial", "Times New Roman", "Tahoma", "Helvetica" };
            var fontsize = new List<string>() { "1pt", "2pt", "3pt", "4pt", "5pt" };
            this.fontfamily.DropdownSettings.DataSource = fontlist;
            this.fontsize.DropdownSettings.DataSource = fontsize;
        }
    }
}