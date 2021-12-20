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
    public partial class LogAxis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Setting Range for PrimaryXAxis
            this.Chart1.PrimaryXAxis.Range.Min =1990;
            this.Chart1.PrimaryXAxis.Range.Max = 2000;
            this.Chart1.PrimaryXAxis.Range.Interval = 1;

            //Setting Range for PrimaryYAxis
            this.Chart1.PrimaryYAxis.Range.Min = 10;
            this.Chart1.PrimaryYAxis.Range.Max = 10000;
            this.Chart1.PrimaryYAxis.Range.Interval = 1;

            List<LogData> data = new List<LogData>();
         
            data.Add(new LogData(1990, 80));
            data.Add(new LogData(1991, 200));
            data.Add(new LogData(1992, 400));
            data.Add(new LogData(1993, 600));
            data.Add(new LogData(1994, 900));
            data.Add(new LogData(1995, 1400));
            data.Add(new LogData(1996, 2000));
            data.Add(new LogData(1997, 4000));
            data.Add(new LogData(1998, 6000));
            data.Add(new LogData(1999, 8000));
            data.Add(new LogData(2000, 9000));          

            //Binding DataSource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();

        }
    }
    
}