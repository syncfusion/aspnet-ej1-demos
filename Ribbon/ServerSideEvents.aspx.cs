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

namespace WebSampleBrowser.Ribbon
{
    public partial class Serversideevents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var fontlist = new List<string> { "Segoe UI", "Arial", "Times New Roman", "Tahoma", "Helvetica" };
			var fontsize = new List<string>() { "1pt", "2pt", "3pt", "4pt", "5pt" };           
            this.fontfamily.DropdownSettings.DataSource = fontlist;
            this.fontsize.DropdownSettings.DataSource = fontsize;
        }
        public string span = "<span class='serverEvent' style='display: inline-block;'> <span class='eventTitle'>";

        protected void Clear_OnClick(object sender, ButtonEventArgs e)
        {           
            serverEvent.InnerHtml = "";
        }
        protected void OnGroupClick(object sender, RibbonGroupClickEventArgs e)
        {
            serverEvent.InnerHtml = serverEvent.InnerHtml + span + "ongroupclick</span> event called</span><hr>";           
        }

        protected void onTabSelect(object sender, RibbonEventArgs e)
        {
            serverEvent.InnerHtml = serverEvent.InnerHtml + span + "Ribbon Tab"+e.CurrentTabIndex+"</span>is Selected</span><hr>";
        }
    }
}