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

namespace WebSampleBrowser.Sunburst
{
    public partial class Zooming : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.container.DataSource = ZoomingData.GetZoomingList();
			this.container.Palette = new List<string>() { "#002e4d", "#005c99", "#008ae6", "#33adff", "#80ccff" };
            
        }
    }    
}