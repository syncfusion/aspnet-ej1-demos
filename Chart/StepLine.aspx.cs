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
using Syncfusion.JavaScript.DataVisualization;
using Syncfusion.JavaScript.DataVisualization.Models;

namespace WebSampleBrowser.Chart
{
    public partial class StepLine : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            List<StepLineChartData> data = new List<StepLineChartData>();

            data.Add(new StepLineChartData(2006, 378, 463, 519, 570));
            data.Add(new StepLineChartData(2007, 416, 449, 508, 579));
            data.Add(new StepLineChartData(2008, 404, 458, 502, 563));
            data.Add(new StepLineChartData(2009, 390, 450, 495, 550));
            data.Add(new StepLineChartData(2010, 376, 425, 485, 545));
            data.Add(new StepLineChartData(2011, 365, 430, 470, 525));

            //Binding Datasource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();

            //Setting range for PrimaryXAxis
            this.Chart1.PrimaryXAxis.Range.Min = 2005;
            this.Chart1.PrimaryXAxis.Range.Max = 2012;
            this.Chart1.PrimaryXAxis.Range.Interval = 1;
           
            //Setting range for PrimaryYAxis
            this.Chart1.PrimaryYAxis.Range.Min = 360;
            this.Chart1.PrimaryYAxis.Range.Max = 600;
            this.Chart1.PrimaryYAxis.Range.Interval = 30;


        }
    }
    
}

  