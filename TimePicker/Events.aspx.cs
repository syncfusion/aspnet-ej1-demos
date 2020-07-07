#region Copyright Syncfusion Inc. 2001-2020.
// Copyright Syncfusion Inc. 2001-2020. All rights reserved.
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

namespace WebSampleBrowser.TimePicker
{
	public partial class events : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void time_FocusOut(object sender, Syncfusion.JavaScript.Web.TimePickerEventArgs e)
        {
            this.EventLog.InnerHtml = " TimePicker <span class='eventTitle'>focussed out</span>.\r\n<br/>" + this.EventLog.InnerHtml;
        }

        protected void Clear_Click(object Sender, Syncfusion.JavaScript.Web.ButtonEventArgs e)
        {
            this.EventLog.InnerHtml = string.Empty;
        }

        protected void time_Select(object sender, Syncfusion.JavaScript.Web.TimePickerEventArgs e)
        {
            this.EventLog.InnerHtml = " Selected Time is <span class='eventTitle'>" + time.Value + "</span>.\r\n<br/>" + this.EventLog.InnerHtml;
        }
	}
}