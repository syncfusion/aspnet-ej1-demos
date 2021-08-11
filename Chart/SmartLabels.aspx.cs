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
    public partial class SmartLabels : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e){
            List<SmartLabelsData> data = new List<SmartLabelsData>();
            data.Add(new SmartLabelsData(2005, 28));
            data.Add(new SmartLabelsData(2006, 24));
            data.Add(new SmartLabelsData(2006, 24));
            data.Add(new SmartLabelsData(2006, 24));
            data.Add(new SmartLabelsData(2007, 26));
            data.Add(new SmartLabelsData(2008, 27));
            data.Add(new SmartLabelsData(2008, 27));
            data.Add(new SmartLabelsData(2009, 32));
            data.Add(new SmartLabelsData(2010, 34));
            data.Add(new SmartLabelsData(2010, 34));
            data.Add(new SmartLabelsData(2010, 34));
            data.Add(new SmartLabelsData(2010, 34));
            data.Add(new SmartLabelsData(2011, 29));
            data.Add(new SmartLabelsData(2012, 31));

            //Binding Datasource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();

            //Setting range for PrimaryXAxis
            this.Chart1.PrimaryXAxis.Range.Min = 2004;
            this.Chart1.PrimaryXAxis.Range.Max = 2013;
            this.Chart1.PrimaryXAxis.Range.Interval = 1;

            //Setting range for PrimaryYAxis
            this.Chart1.PrimaryYAxis.Range.Min = 20;
            this.Chart1.PrimaryYAxis.Range.Max = 40;
            this.Chart1.PrimaryYAxis.Range.Interval = 4;

        }
    }
  
}