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
    public partial class Zooming : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { 
            DateTime dt=DateTime.Now;
            Random r=new Random();
            List<Data1> data1 = new List<Data1>();
            for (int i = 0; i < 100; i++)
                data1.Add(new Data1(dt.AddMonths(i), r.Next(50, 100)));
         }
    }

    
}