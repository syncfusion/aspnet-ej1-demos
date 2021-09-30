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
    public partial class StackingColumn100 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Setting Range for PriamryXAxis
            this.Chart1.PrimaryXAxis.Range.Max = 2013;
            this.Chart1.PrimaryXAxis.Range.Min = 2005;
            this.Chart1.PrimaryXAxis.Range.Interval = 1;
           

            List<StackingColumn100ChartData> data = new List<StackingColumn100ChartData>();

            data.Add(new StackingColumn100ChartData("2006", 900, 190, 250, 150));
            data.Add(new StackingColumn100ChartData("2007", 544, 226, 145, 120));
            data.Add(new StackingColumn100ChartData("2008", 880, 194, 190, 115));
            data.Add(new StackingColumn100ChartData("2009", 675, 250, 220, 125));
            data.Add(new StackingColumn100ChartData("2010", 765, 222, 225, 132));
            data.Add(new StackingColumn100ChartData("2011", 679, 181, 135, 137));
            data.Add(new StackingColumn100ChartData("2012", 770, 128, 152, 110));
          
            //Binding DataSource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();

        }
    }
   
}