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
    public partial class DateTimeAxis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Setting Range for PrimaryXAxis
            this.Chart1.PrimaryXAxis.Range.Min = new DateTime(2000, 6, 1);
            this.Chart1.PrimaryXAxis.Range.Max = new DateTime(2010, 6, 1);
            this.Chart1.PrimaryXAxis.Range.Interval = 1;

            List<DatetimeData> data = new List<DatetimeData>();

            data.Add(new DatetimeData(new DateTime(2000, 06, 11), 10));
            data.Add(new DatetimeData(new DateTime(2002, 03, 07), 30));
            data.Add(new DatetimeData(new DateTime(2004, 03, 06), 15));
            data.Add(new DatetimeData(new DateTime(2006, 03, 30), 65));
            data.Add(new DatetimeData(new DateTime(2008, 03, 08), 90));
            data.Add(new DatetimeData(new DateTime(2010, 03, 08), 85));

            //Binding Datasource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();
        }
    }
  
}