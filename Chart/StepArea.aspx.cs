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
    public partial class StepArea : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

             List<StepAreaChartData> data = new List<StepAreaChartData>();

            data.Add(new StepAreaChartData(2000, 416));
            data.Add(new StepAreaChartData(2001, 490));
            data.Add(new StepAreaChartData(2002, 470));
            data.Add(new StepAreaChartData(2003, 500));
            data.Add(new StepAreaChartData(2004, 449));
            data.Add(new StepAreaChartData(2005, 470));
            data.Add(new StepAreaChartData(2006, 437));
            data.Add(new StepAreaChartData(2007, 458));
            data.Add(new StepAreaChartData(2008, 500));
            data.Add(new StepAreaChartData(2009, 473));
            data.Add(new StepAreaChartData(2010, 520));
            data.Add(new StepAreaChartData(2011, 509));

            //Binding DataSource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();

            //Setting Range for PrimaryXAxis
            this.Chart1.PrimaryXAxis.Range.Min = 2000;
            this.Chart1.PrimaryXAxis.Range.Max = 2011;
            this.Chart1.PrimaryXAxis.Range.Interval = 1;
        }

        }
    }

