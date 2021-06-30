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

namespace WebSampleBrowser.Textboxes
{
    public partial class Events : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void numeric_focusOut(object sender, Syncfusion.JavaScript.Web.EditorEventArgs e)
        {
            this.EventLog.InnerHtml = "NumericTextbox has been <span class='eventTitle'>focussed out</span>.\r\n<br/>" + this.EventLog.InnerHtml;
        }

        protected void percent_focusOut(object sender, Syncfusion.JavaScript.Web.EditorEventArgs e)
        {
            this.EventLog.InnerHtml = "PercentTextbox has been <span class='eventTitle'>focussed out</span>.\r\n<br/>" + this.EventLog.InnerHtml;
        }

        protected void currency_focusOut(object sender, Syncfusion.JavaScript.Web.EditorEventArgs e)
        {
            this.EventLog.InnerHtml = "CurrencyTextbox has been <span class='eventTitle'>focussed out</span>.\r\n<br/>" + this.EventLog.InnerHtml;
        }

        protected void maskedit_FocusOut(object sender, Syncfusion.JavaScript.Web.MaskEditFocusOutEventArgs e)
        {
            this.EventLog.InnerHtml = "MaskEditTextbox has been <span class='eventTitle'>focussed out</span>.\r\n<br/>" + this.EventLog.InnerHtml;
        }

        protected void Clear_Click(object Sender, Syncfusion.JavaScript.Web.ButtonEventArgs e)
        {
            this.EventLog.InnerHtml = string.Empty;
        }
    }
}