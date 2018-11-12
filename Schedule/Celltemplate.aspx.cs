using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.Schedule
{
    public partial class Celltemplate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<WebSampleBrowser.Schedule.multipleresource.Rooms> Rooms = new List<WebSampleBrowser.Schedule.multipleresource.Rooms>();
            Rooms.Add(new WebSampleBrowser.Schedule.multipleresource.Rooms { text = "Star Hotel", id = "1", color = "#cb6bb2", groupId="1" });

            List<WebSampleBrowser.Schedule.multipleresource.Rooms> Owner = new List<WebSampleBrowser.Schedule.multipleresource.Rooms>();
            Owner.Add(new WebSampleBrowser.Schedule.multipleresource.Rooms { text = "Party Hall-A", id = "1", groupId = "1", color = "#ffaa00" });
            Owner.Add(new WebSampleBrowser.Schedule.multipleresource.Rooms { text = "Party Hall-B", id = "3", groupId = "1", color = "#f8a398" });
            
            Schedule1.Resources[0].ResourceSettings.DataSource = Rooms;
            Schedule1.Resources[1].ResourceSettings.DataSource = Owner;
        }
    }
}