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
    public partial class properties : System.Web.UI.Page
    {
        List<texts> first= new List<texts>();
        List<texts> second = new List<texts>();
        List<texts> third = new List<texts>();

        protected void Page_Load(object sender, EventArgs e)
        {
            first.Add(new texts{text="1"});
            second.Add(new texts { text = "1" });
            second.Add(new texts { text = "2" });
            third.Add(new texts{text="1"});
            third.Add(new texts{text="2"});
            third.Add(new texts { text = "3" });
     
            this.itemMove.DataSource =  third;
        }
    }
    [Serializable]
    public class texts
    {
        public string text;
    }
}