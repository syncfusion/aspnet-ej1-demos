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
    public partial class InversedAxis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Setting Range for PrimaryXAxis
            this.Chart1.PrimaryXAxis.Range.Min = new DateTime(2005, 1, 1);
            this.Chart1.PrimaryXAxis.Range.Max = new DateTime(2012, 2, 1);
            this.Chart1.PrimaryXAxis.Range.Interval = 1;
           
            //Setting Range for PrimaryYAxis
            this.Chart1.PrimaryYAxis.Range.Min = 34;
            this.Chart1.PrimaryYAxis.Range.Max = 60;
            this.Chart1.PrimaryYAxis.Range.Interval = 2;

            List<InversedData> data = new List<InversedData>();

            
            data.Add(new InversedData(new DateTime(2005, 01, 01), 43.47));
            data.Add(new InversedData(new DateTime(2006, 01, 01), 45.19));
            data.Add(new InversedData(new DateTime(2007, 01, 01), 39.42));
            data.Add(new InversedData(new DateTime(2008, 10, 01), 48.88));
            data.Add(new InversedData(new DateTime(2009, 10, 01), 46.37));
            data.Add(new InversedData(new DateTime(2010, 01, 22), 44.17));
            data.Add(new InversedData(new DateTime(2011, 01, 22), 57.15));
            data.Add(new InversedData(new DateTime(2012, 01, 22), 54.73));
                     
            //Binding DataSource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();
        }
    }
   
}