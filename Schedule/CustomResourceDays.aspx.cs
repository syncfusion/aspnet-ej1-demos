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
    public partial class CustomResourceDays : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Rooms> Rooms = new List<Rooms>();
            Rooms.Add(new Rooms { text = "ROOM 1", id = "1", color = "#cb6bb2", groupId = "1" });
            Rooms.Add(new Rooms { text = "ROOM 2", id = "2", color = "#56ca85", groupId = "1" });

            List<Owners> Owner = new List<Owners>();
            Owner.Add(new Owners { text = "Nancy", id = "1", groupId = "1", color = "#ffaa00", on = "10", off = "18", customDays = new List<string> {"monday","wednesday","friday"} });
            Owner.Add(new Owners { text = "Steven", id = "3", groupId = "2", color = "#f8a398", on = "6", off = "10", customDays = new List<string> { "tuesday", "thursday" } });
            Owner.Add(new Owners { text = "Michael", id = "5", groupId = "1", color = "#7499e1", on = "11", off = "15", customDays = new List<string> { "sunday", "tuesday", "thursday", "saturday" } });

            Schedule1.Resources[0].ResourceSettings.DataSource = Rooms;
            Schedule1.Resources[1].ResourceSettings.DataSource = Owner;

            this.nancyworkdays.SelectedIndices = new List<int> { 1, 3, 5};
            this.michaelworkdays.SelectedIndices = new List<int> { 0, 2, 4, 6 };
            this.stevenworkdays.SelectedIndices = new List<int> { 2, 4 };
        }

        public class Rooms
        {
            public string text { set; get; }
            public string id { set; get; }
            public string groupId { set; get; }
            public string color { set; get; }
        }

        public class Owners
        {
            public string text { set; get; }
            public string id { set; get; }
            public string groupId { set; get; }
            public string color { set; get; }
            public string on { set; get; }
            public string off { set; get; }
            public List<String> customDays { set; get; }
        }
    }
}