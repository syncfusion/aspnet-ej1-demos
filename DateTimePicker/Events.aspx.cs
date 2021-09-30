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

namespace WebSampleBrowser.DateTimePicker
{
    public partial class events : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void dateTime_FocusOut(object sender, Syncfusion.JavaScript.Web.DateTimePickerFocusOutEventArgs e)
        {
            this.EventLog.InnerHtml = "DateTimePicker &nbsp;<span class='eventTitle'> was Focused out</span>.\r\n<br/>" + this.EventLog.InnerHtml; 
        }

        protected void Clear_Click(object Sender, Syncfusion.JavaScript.Web.ButtonEventArgs e)
        {
            this.EventLog.InnerHtml = string.Empty;
        }

        protected void dateTime_Change(object sender, Syncfusion.JavaScript.Web.DateTimePickerChangeEventArgs e)
        {
            this.EventLog.InnerHtml = "Value has been changed from &nbsp;<span class='eventTitle'>" + e.PreValue + " </span> to <span class='eventTitle'>" + e.Value + " </span> .\r\n<br/>" + this.EventLog.InnerHtml; 
        }
    }
}