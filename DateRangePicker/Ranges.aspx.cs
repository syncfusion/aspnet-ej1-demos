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

namespace WebSampleBrowser.DateRangePicker
{
    public partial class Ranges : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime Today = DateTime.Now;
                        
            this.dateRange.Ranges.AddRange(new[] { new Syncfusion.JavaScript.Models.DateRanges() {
                  Label = "Last 1 Month",
                 Range = new List<Object>() { Today.AddMonths(-1).ToString(), Today.ToString() }
            },
            new Syncfusion.JavaScript.Models.DateRanges
            {
                  Label = "Last 2 Months",
                  Range = new List<Object>() { Today.AddMonths(-2).ToString(), Today.ToString() }
            },
            new Syncfusion.JavaScript.Models.DateRanges{
                  Label = "Last Week",
                  Range = new List<Object>() { Today.AddDays(-7).ToString(), Today.ToString() }
          
            }
            });          
        }
    }
}