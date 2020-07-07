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

namespace WebSampleBrowser.DropDownList
{
    public partial class Event : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void selectCountry_ValueSelect(object sender, Syncfusion.JavaScript.Web.DropdownListEventArgs e)
        {
            this.EventLog.InnerHtml = string.Format("{0}{1}{2}", e.SelectedText ," &nbsp;<span class='eventTitle'> was Selected</span>.\r\n<br/>", this.EventLog.InnerHtml);
        }

        protected void Clear_Click(object Sender, Syncfusion.JavaScript.Web.ButtonEventArgs e)
        {
            this.EventLog.InnerHtml = string.Empty;
        }
    }
}