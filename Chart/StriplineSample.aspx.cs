#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.JavaScript.DataVisualization.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.Chart
{
    public partial class StriplineSample : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Setting Range for PrimaryYAxis
            this.Chart1.PrimaryYAxis.Range.Min = 10;
            this.Chart1.PrimaryYAxis.Range.Max = 40;
            this.Chart1.PrimaryYAxis.Range.Interval = 5;

            List<StripData> data = new List<StripData>();

            data.Add(new StripData("Jan", 28));
            data.Add(new StripData("Feb", 27));
            data.Add(new StripData("Mar", 33));
            data.Add(new StripData("Apr", 36));
            data.Add(new StripData("May", 28));
            data.Add(new StripData("June", 30));
            data.Add(new StripData("July", 31));
            data.Add(new StripData("Aug", 27));
            data.Add(new StripData("Sep", 30));
            data.Add(new StripData("Oct", 20));
            data.Add(new StripData("Nov", 15));
            data.Add(new StripData("Dec", 17));

            //Binding DataSource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();
           
          
        }
    }

    
}