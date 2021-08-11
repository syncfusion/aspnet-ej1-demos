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

namespace WebSampleBrowser.DropDownList
{
    public partial class KeyboardInteraction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<FontList> fontslist = new List<FontList>();
            fontslist.Add(new FontList("ARIAL"));
            fontslist.Add(new FontList("Bimini"));
            fontslist.Add(new FontList("Courier"));
            fontslist.Add(new FontList("Cursive"));
            fontslist.Add(new FontList("Fantasy"));
            fontslist.Add(new FontList("Georgia"));
            fontslist.Add(new FontList("Impact"));
            fontslist.Add(new FontList("New york"));
            fontslist.Add(new FontList("Sans-Serif"));
            fontslist.Add(new FontList("Scripts"));
            fontslist.Add(new FontList("Times"));
            fontslist.Add(new FontList("Times New Roman"));
            fontslist.Add(new FontList("Verdana"));
            fontslist.Add(new FontList("Western"));
            fontslist.Add(new FontList("Zapfellipt bt"));
            this.fontnames.DataSource = fontslist;
        }
        [Serializable]
        class FontList
        {
            public string Fonts { get; set; }
            public FontList(string fonts)
            {
                this.Fonts = fonts;
            }
        }
    }
}