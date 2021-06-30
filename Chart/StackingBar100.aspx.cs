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
    public partial class StackingBar100 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Setting Range for PrimaryXAxis
            this.Chart1.PrimaryXAxis.Range.Max = 2015;
            this.Chart1.PrimaryXAxis.Range.Min = 2006;
            this.Chart1.PrimaryXAxis.Range.Interval = 1;

           
            List<StackingBar100ChartData> data = new List<StackingBar100ChartData>();

            data.Add(new StackingBar100ChartData("2007", 453, 876, 356,122));
            data.Add(new StackingBar100ChartData("2008", 354, 564,876,444));
            data.Add(new StackingBar100ChartData("2009", 282,242,898,222));
            data.Add(new StackingBar100ChartData("2010", 321, 121,567,231));
            data.Add(new StackingBar100ChartData("2011", 333, 343,456,122));
            data.Add(new StackingBar100ChartData("2012", 351,451,345,333));
            data.Add(new StackingBar100ChartData("2013", 403,203,543,354));
            data.Add(new StackingBar100ChartData("2014",421,431,654,100));
            

            //Binding DataSource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();

        }
    }
   
}