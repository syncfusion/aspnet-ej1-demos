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

namespace WebSampleBrowser.Dialog
{
    public partial class Events : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dlgOpen.Visible = false;
        }

        protected void clearbutton_Click(object Sender, Syncfusion.JavaScript.Web.ButtonEventArgs e)
        {
            this.EventLog.InnerHtml = string.Empty;
        }
        protected void eventDialog_Init(object sender, EventArgs e)
        {
            this.EventLog.InnerHtml = "\n Dialog has been <span class='eventTitle'>created</span>.\r\n<br/>" + this.EventLog.InnerHtml;
        }       
        protected void eventDialog_Close(object sender, EventArgs e)
        {
            this.EventLog.InnerHtml = "\n Dialog has been <span class='eventTitle'>closed</span>.\r\n<br/>" + this.EventLog.InnerHtml;
            dlgOpen.Visible = true;
        }
    }
}