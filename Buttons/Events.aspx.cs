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

namespace WebSampleBrowser.Buttons
{
    public partial class events : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }        
        protected void ButtonNormal_Click(object Sender, Syncfusion.JavaScript.Web.ButtonEventArgs e)
        {
            this.EventLog.InnerHtml = "\n Button has been <span class='eventTitle'>clicked</span>.\r\n<br/>" + this.EventLog.InnerHtml;        }

        protected void ToggleButton_Click(object Sender, Syncfusion.JavaScript.Web.ToggleButtonEventArgs e)
        {
            this.EventLog.InnerHtml = "\n Toggle Button has been <span class='eventTitle'>clicked</span>.\r\n<br/>" + this.EventLog.InnerHtml;
        }      

        protected void SplitButton_Click(object Sender, Syncfusion.JavaScript.Web.SplitButtonEventArgs e)
        {
            this.EventLog.InnerHtml = "\n Split Button has been <span class='eventTitle'>clicked</span>.\r\n<br/>" + this.EventLog.InnerHtml;
        }

        protected void SplitButton_ItemSelect(object Sender, Syncfusion.JavaScript.Web.SplitButtonSelectEventArgs e)
        {
            this.EventLog.InnerHtml = e.MenuText + " <span class='eventTitle'>was Selected</span>.\r\n<br/>" + this.EventLog.InnerHtml;
        }

        protected void GroupButton_ItemSelect(object sender, Syncfusion.JavaScript.Web.GroupButtonEventArgs e)
        {
            this.EventLog.InnerHtml = e.Status + " <span class='eventTitle'>was Selected</span>.\r\n<br/>" + this.EventLog.InnerHtml;
        }

        protected void ClearButton_Click(object Sender, Syncfusion.JavaScript.Web.ButtonEventArgs e)
        {
            this.EventLog.InnerHtml = string.Empty;
        }
       
    }
}