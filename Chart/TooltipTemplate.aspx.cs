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
    public partial class TooltipTemplate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Setting Range for PrimaryXAxis
            this.Chart1.PrimaryXAxis.Range.Min = 2001;
            this.Chart1.PrimaryXAxis.Range.Max = 2013;
            this.Chart1.PrimaryXAxis.Range.Interval = 1;
           
            //Setting Range for PrimaryYAxis
            this.Chart1.PrimaryYAxis.Range.Min = 1.50;
            this.Chart1.PrimaryYAxis.Range.Max = 2.70;
            this.Chart1.PrimaryYAxis.Range.Interval = 0.20;

            List<TooltipData> data = new List<TooltipData>();

            data.Add(new TooltipData(2002, 1.61));
            data.Add(new TooltipData(2003, 2.34));
            data.Add(new TooltipData(2004, 2.16));
            data.Add(new TooltipData(2005, 2.10));
            data.Add(new TooltipData(2006, 1.81));

            data.Add(new TooltipData(2007, 2.05));
            data.Add(new TooltipData(2008, 2.50));
            data.Add(new TooltipData(2009, 2.22));
            data.Add(new TooltipData(2010, 2.21));
            data.Add(new TooltipData(2011, 2.00));
            data.Add(new TooltipData(2012, 2.27));

            //Binding Datasource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();

 

        }
    }

}