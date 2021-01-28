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

namespace WebSampleBrowser.Buttons
{
    public class groupfields
    {
        public string text { get; set; }
        public string contentType { get; set; }
        public string selected { get; set; }
    }
    public partial class GroupButton : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<groupfields> sites = new List<groupfields>();
            sites.Add(new groupfields { text = "Day",contentType="textonly"});
            sites.Add(new groupfields { text = "Work Week", contentType = "textonly" });
            sites.Add(new groupfields { text = "Week", contentType = "textonly" });
            sites.Add(new groupfields { text = "Month", contentType = "textonly", selected = "selected" });
            sites.Add(new groupfields { text = "Year", contentType = "textonly" });

            this.groupButton.DataSource = sites;
        }
    }
}