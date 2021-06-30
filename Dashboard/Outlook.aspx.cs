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

namespace WebSampleBrowser.Dashboard
{
    public partial class Outlook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.searchAuto.DataSource = OutlookData.GetContactList();
            this.autoTo.DataSource = OutlookData.GetContactList();
            this.autoCc.DataSource = OutlookData.GetContactList();
        }
        public class OutlookData
        {
            public string text { get; set; }

            public static List<OutlookData> GetContactList()
            {
                List<OutlookData> contact = new List<OutlookData>();
                contact.Add(new OutlookData { text = "Nancy@syncfusion.com" });
                contact.Add(new OutlookData { text = "Andrew@syncfusion.com" });
                contact.Add(new OutlookData { text = "Janet@syncfusion.com" });
                contact.Add(new OutlookData { text = "Margaret@syncfusion.com" });
                contact.Add(new OutlookData { text = "Steven@syncfusion.com" });
                contact.Add(new OutlookData { text = "Robert@syncfusion.com" });
                contact.Add(new OutlookData { text = "Michael@syncfusion.com" });
                contact.Add(new OutlookData { text = "Laura@syncfusion.com" });
                return contact;
            }
        }
    }
}