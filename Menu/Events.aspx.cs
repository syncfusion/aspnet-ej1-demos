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

namespace WebSampleBrowser.Menu
{
    public partial class Events : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void menuEvents_ItemClick(object sender, Syncfusion.JavaScript.Web.MenuEventArgs e)
        {

            this.EventLog.InnerHtml = string.Format("{0}{1}{2}", e.ID , "&nbsp;<span class='eventTitle'>was selected</span>.\r\n<br/>", this.EventLog.InnerHtml);
        }
       

        protected void ClearButton_Click(object Sender, Syncfusion.JavaScript.Web.ButtonEventArgs e)
        {
            this.EventLog.InnerHtml = string.Empty;
        }
    }
}