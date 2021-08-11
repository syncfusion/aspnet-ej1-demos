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
    public partial class StackingColumn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            //Setting Range for PrimaryYAxis
            this.Chart1.PrimaryYAxis.Range.Min = 0;
            this.Chart1.PrimaryYAxis.Range.Max = 1800;
            this.Chart1.PrimaryYAxis.Range.Interval = 200;

            List<StackingColumnChartData> data = new List<StackingColumnChartData>();

            data.Add(new StackingColumnChartData("Jan", 900, 190, 250, 150));
            data.Add(new StackingColumnChartData("Feb", 820, 226, 145, 120));
            data.Add(new StackingColumnChartData("Mar", 880, 194, 190, 115));
            data.Add(new StackingColumnChartData("Apr", 725, 250, 220, 125));
            data.Add(new StackingColumnChartData("May", 765, 222, 225, 132));
            data.Add(new StackingColumnChartData("Jun", 679, 181, 135, 137));
            data.Add(new StackingColumnChartData("Jul", 770, 128, 152, 110));
            data.Add(new StackingColumnChartData("Aug", 825, 239, 216, 126));
            data.Add(new StackingColumnChartData("Sep", 704, 268, 137, 97));
            data.Add(new StackingColumnChartData("Oct", 781, 236, 147, 122));
            data.Add(new StackingColumnChartData("Nov", 799, 285, 242, 85));
            data.Add(new StackingColumnChartData("Dec", 822, 199, 230, 120));

            //Binding DataSource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();

        }
    }
    
}

 
 