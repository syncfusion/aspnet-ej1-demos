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


namespace WebSampleBrowser.Rotator
{
    [Serializable]
    public class weber
    {
        public string text;
        public string url;
    }
    public partial class myevent : System.Web.UI.Page
    {
     
        protected void Page_Load(object sender, EventArgs e)
        {
            List<weber> website = new List<weber>();
             website.Add(new weber{text="tablet",url="../Content/images/rotator/tablet.jpg"});
             website.Add(new weber{text="nature",url="../Content/images/rotator/nature.jpg"});
             website.Add(new weber{text="snowfall",url="../Content/images/rotator/snowfall.jpg"});
             website.Add(new weber{text="card",url="../Content/images/rotator/card.jpg"});
             website.Add(new weber{text="sculpture",url="../Content/images/rotator/sculpture.jpg"});
             website.Add(new weber{text="rose",url="../Content/images/rotator/rose.jpg"});
             website.Add(new weber{text="night",url="../Content/images/rotator/night.jpg"});
             this.Rotatorcontent.DataSource = website;
        }

    }
 }
    
