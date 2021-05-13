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

namespace WebSampleBrowser.Schedule
{
    public partial class QueryCellInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<multipleresource.Rooms> owner = new List<WebSampleBrowser.Schedule.multipleresource.Rooms>();
            List<multipleresource.Rooms> rooms = new List<WebSampleBrowser.Schedule.multipleresource.Rooms>();
            rooms.Add(new multipleresource.Rooms { text = "Floor 1", id = "1", color = "#cb6bb2" });
            rooms.Add(new multipleresource.Rooms { text = "Floor 2", id = "2", color = "#56ca85" });

            owner.Add(new multipleresource.Rooms { text = "101 Hall", id = "1", groupId = "1", color = "#ffaa00" });
            owner.Add(new multipleresource.Rooms { text = "102 Hall", id = "2", groupId = "1", color = "#f8a398" });
            owner.Add(new multipleresource.Rooms { text = "103 Hall", id = "3", groupId = "2", color = "#7499e1" });

            Schedule1.Resources[0].ResourceSettings.DataSource = rooms;
            Schedule1.Resources[1].ResourceSettings.DataSource = owner;
        }
    }
}