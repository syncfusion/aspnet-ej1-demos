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
    public partial class Trackball : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Setting Range for PrimaryXAxis
            this.Chart1.PrimaryXAxis.Range.Min = new DateTime(2000, 1, 1);
            this.Chart1.PrimaryXAxis.Range.Max = new DateTime(2006, 2, 11);
            this.Chart1.PrimaryXAxis.Range.Interval = 1;
          
            //Setting Range for PrimaryYAxis
            this.Chart1.PrimaryYAxis.Range.Min = 20;
            this.Chart1.PrimaryYAxis.Range.Max = 120;
            this.Chart1.PrimaryYAxis.Range.Interval = 20;

            List<TrackBallData> data = new List<TrackBallData>();

            data.Add(new TrackBallData(new DateTime(2000, 02, 11), 30, 54, 76, 98, 116));
            data.Add(new TrackBallData(new DateTime(2000, 09, 14), 35, 45, 70, 90, 110));
            data.Add(new TrackBallData(new DateTime(2001, 02, 11), 40, 43, 63, 83, 100));
            data.Add(new TrackBallData(new DateTime(2001, 09, 16), 36, 50, 72, 90, 102));
            data.Add(new TrackBallData(new DateTime(2002, 02, 07), 28, 54, 77, 86, 97));
            data.Add(new TrackBallData(new DateTime(2002, 09, 07), 33, 56, 79, 84, 89));
            data.Add(new TrackBallData(new DateTime(2003, 02, 11), 39, 60, 72, 106, 88));
            data.Add(new TrackBallData(new DateTime(2003, 09, 14), 38, 63, 68, 99, 90));
            data.Add(new TrackBallData(new DateTime(2004, 02, 06), 34, 69, 78, 110, 88));
            data.Add(new TrackBallData(new DateTime(2004, 09, 06), 46, 70, 65, 102, 75));
            data.Add(new TrackBallData(new DateTime(2005, 02, 11), 54, 72, 81, 90, 63));
            data.Add(new TrackBallData(new DateTime(2005, 09, 11), 65, 75, 80, 85, 70));
            data.Add(new TrackBallData(new DateTime(2006, 02, 11), 39, 75, 94, 110, 55));
           
            //Binding DataSource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();


           

        }
    }
    
}