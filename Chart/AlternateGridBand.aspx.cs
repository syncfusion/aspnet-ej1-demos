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
    public partial class AlternateGridBand : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //Setting Rnage for PrimaryXAxis
            this.Chart1.PrimaryXAxis.Range.Min = 1965;
            this.Chart1.PrimaryXAxis.Range.Max = 2010;
            this.Chart1.PrimaryXAxis.Range.Interval = 5;
            
            //Setting Range for PrimaryYAxis
            this.Chart1.PrimaryYAxis.Range.Min = 0;
            this.Chart1.PrimaryYAxis.Range.Max = 18000;
            this.Chart1.PrimaryYAxis.Range.Interval = 2000;

            List<AlternateGridBandData> data = new List<AlternateGridBandData>();


            data.Add(new AlternateGridBandData(1970, 16500, 8000));
            data.Add(new AlternateGridBandData(1975, 16000, 7600));
            data.Add(new AlternateGridBandData(1980, 15400, 6400));
            data.Add(new AlternateGridBandData(1985, 15800, 3700));
            data.Add(new AlternateGridBandData(1990, 14000, 7200));
            data.Add(new AlternateGridBandData(1995, 10500, 2300));
            data.Add(new AlternateGridBandData(2000, 13300, 4000));
            data.Add(new AlternateGridBandData(2005, 12800, 4800));
            

            //Binding Datasource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();

        }
    }

  
}