#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.JavaScript.DataVisualization;
using Syncfusion.JavaScript.DataVisualization.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.Chart
{
    public partial class Events : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<EventData> data = new List<EventData>();

            data.Add(new EventData("China", 1268));
            data.Add(new EventData("India", 1004));
            data.Add(new EventData("United States", 282));
            data.Add(new EventData("Indonesia", 213));
            data.Add(new EventData("Brazil", 176));
            
            //Binding DataSource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();
          

        }
    }
  
}