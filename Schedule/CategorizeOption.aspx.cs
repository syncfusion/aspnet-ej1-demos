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

namespace WebSampleBrowser.Schedule
{
    public partial class CategorizeOption : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Categorize> CategorizeValue = new List<Categorize>();

            CategorizeValue.Add(new Categorize { text = "Blue Category", id = 1,   color ="#43b496", fontColor= "#ffffff" });
            CategorizeValue.Add(new Categorize { text = "Green Category", id = 2,  color ="#7f993e", fontColor= "#ffffff" });
            CategorizeValue.Add(new Categorize { text = "Orange Category", id = 3, color ="#cc8638", fontColor= "#ffffff" });
            CategorizeValue.Add(new Categorize { text = "Purple Category", id = 4, color ="#ab54a0", fontColor= "#ffffff" });
            CategorizeValue.Add(new Categorize { text = "Red Category", id = 5,    color ="#dd654e", fontColor= "#ffffff" });
            CategorizeValue.Add(new Categorize { text = "Yellow Category", id = 6, color ="#d0af2b", fontColor= "#ffffff" });

            Schedule1.CategorizeSettings.DataSource = CategorizeValue;
        }
        public class Categorize
        {
            public string text { set; get; }
            public int id { set; get; }
            public string fontColor { set; get; }
            public string color { set; get; }
        }
    }
}