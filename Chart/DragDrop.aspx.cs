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
    public partial class DragDrop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Chart1.PrimaryXAxis.Range.Min = new DateTime(2015, 01, 01);
            this.Chart1.PrimaryXAxis.Range.Max = new DateTime(2015, 05, 01);
            this.Chart1.PrimaryXAxis.Range.Interval = 1;

            this.Chart1.PrimaryYAxis.Range.Min = 500;
            this.Chart1.PrimaryYAxis.Range.Max = 1500;
            this.Chart1.PrimaryYAxis.Range.Interval = 100;

            List<DatetimeData1> data = new List<DatetimeData1>();

            data.Add(new DatetimeData1(new DateTime(2015, 01, 01), 950, 700, 9.5, 7));
            data.Add(new DatetimeData1(new DateTime(2015, 02, 01), 1200, 900, 12, 9));
            data.Add(new DatetimeData1(new DateTime(2015, 03, 01), 1000, 800, 10, 8));
            data.Add(new DatetimeData1(new DateTime(2015, 04, 01), 1350, 1050, 13.5, 10.5));
            data.Add(new DatetimeData1(new DateTime(2015, 05, 01), 1150, 950, 11.5, 9.5));

            //Binding Datasource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();
        }
    }
   
}