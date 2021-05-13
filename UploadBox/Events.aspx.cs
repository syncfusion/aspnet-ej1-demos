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

namespace WebSampleBrowser.UploadBox
{
    public partial class Events : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Upload1_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            this.EventLog.InnerHtml = "<span class='eventTitle'>UploadBox Created</span>.\r\n<br/>" + this.EventLog.InnerHtml;
        }

        protected void Clear_Click(object Sender, Syncfusion.JavaScript.Web.ButtonEventArgs e)
        {
            this.EventLog.InnerHtml = string.Empty;
        }

        protected void Upload1_Complete(object sender, Syncfusion.JavaScript.Web.UploadBoxCompleteEventArgs e)
        {
            this.EventLog.InnerHtml = "<span class='eventTitle'>Files Successfully uploaded</span>.\r\n<br/>" + this.EventLog.InnerHtml;
        }        
    }
}