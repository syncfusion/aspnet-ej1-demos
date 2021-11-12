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
    public partial class SplineArea : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<SplineAreaChartData> data = new List<SplineAreaChartData>();

            data.Add(new SplineAreaChartData(2002, 2.2, 2, 0.8));
            data.Add(new SplineAreaChartData(2003, 3.4, 1.7, 1.3));
            data.Add(new SplineAreaChartData(2004, 2.8, 1.8, 1.1));
            data.Add(new SplineAreaChartData(2005, 1.6, 2.1, 1.6));
            data.Add(new SplineAreaChartData(2006, 2.3, 2.3, 2));
            data.Add(new SplineAreaChartData(2007, 2.5, 1.7, 1.7));
            data.Add(new SplineAreaChartData(2008, 2.9, 1.5, 2.3));
            data.Add(new SplineAreaChartData(2009, 3.8, 2.8, 2.7));
            data.Add(new SplineAreaChartData(2010, 1.4, 1.5, 1.1));
            data.Add(new SplineAreaChartData(2011, 3.1, 2.3, 2.3));

            //Binding DataSource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();

        }
    }
   
}
 
    