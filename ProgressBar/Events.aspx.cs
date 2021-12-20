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

namespace WebSampleBrowser.ProgressBar
{
    public partial class events : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ProgressBar1.Percentage = 10;
                ProgressBar1.Text = ProgressBar1.Percentage + "%";
            }
        }

        protected void ProgressBar1_Complete(object Sender, Syncfusion.JavaScript.Web.ProgressBarEventArgs e)
        {
            this.startButton.ToggleState = false;
            this.startButton.DefaultText = "Restart";
            this.EventLog.InnerHtml = "Progressbar has been <span class='eventTitle'>Completed</span>.</br>" + this.EventLog.InnerHtml;
        }

        protected void Clear_Click(object Sender, Syncfusion.JavaScript.Web.ButtonEventArgs e)
        {
            this.EventLog.InnerHtml = string.Empty;
        }
    }
}