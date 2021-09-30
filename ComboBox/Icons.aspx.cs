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

namespace WebSampleBrowser.ComboBox
{
    public partial class Icons : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.selectmailtools.DataSource = IconCss.GetIconList();
            this.selectmailtools.DataTextField = "Name";
            this.selectmailtools.DataIconCSSField = "IconClass";
        }

    
    }

public class IconCss
{
    public string Name { get; set; }
    public string IconClass { get; set; }
    public static List<IconCss> GetIconList()
    {
        List<IconCss> icon = new List<IconCss>();
        icon.Add(new IconCss { Name = "Categorize and Move", IconClass = "mailtools categorize" });
        icon.Add(new IconCss { IconClass = "mailtools done", Name = "Done" });
        icon.Add(new IconCss { IconClass = "mailtools flag", Name = "Flag & Move" });
        icon.Add(new IconCss { IconClass = "mailtools forward", Name = "Forward" });
        icon.Add(new IconCss { IconClass = "mailtools movetofolder", Name = "Move to Folder" });
        icon.Add(new IconCss { IconClass = "mailtools newmail", Name = "New E-mail" });
        icon.Add(new IconCss { IconClass = "mailtools meeting", Name = "New Meeting" });
        icon.Add(new IconCss { IconClass = "mailtools reply", Name = "Reply & Delete" });
        return icon;
    }
}

    
}