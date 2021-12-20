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

namespace WebSampleBrowser.Chart
{
    public partial class Annotations : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<AnnotationChartData> data = new List<AnnotationChartData>();

            data.Add(new AnnotationChartData("Jan", 60));
            data.Add(new AnnotationChartData("Feb", 50));
            data.Add(new AnnotationChartData("Mar", 64));
            data.Add(new AnnotationChartData("Apr", 63));
            data.Add(new AnnotationChartData("May", 81));
            data.Add(new AnnotationChartData("Jun", 64));
            data.Add(new AnnotationChartData("Jul", 82));
            data.Add(new AnnotationChartData("Aug", 96));
            data.Add(new AnnotationChartData("Sep", 78));
            data.Add(new AnnotationChartData("Oct", 60));
            data.Add(new AnnotationChartData("Nov", 58));
            data.Add(new AnnotationChartData("Dec", 56));

            //Binding Datasource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();

            //Setting Range for PrimaryYAxis
            this.Chart1.PrimaryYAxis.Range.Min = 0;
            this.Chart1.PrimaryYAxis.Range.Max = 120;
            this.Chart1.PrimaryYAxis.Range.Interval = 20;

            this.Chart1.Annotations[1].X = 1;
            this.Chart1.Annotations[1].Y = 57;
            this.Chart1.Annotations[2].X = 7;
            this.Chart1.Annotations[2].Y = 97;
        }
    }
  
}