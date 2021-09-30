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
    public partial class ErrorBar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<ErrorBarData> data = new List<ErrorBarData>();
            data.Add(new ErrorBarData("Jan", 7.0));
            data.Add(new ErrorBarData("Feb", 6.9));
            data.Add(new ErrorBarData("Mar", 9.5));
            data.Add(new ErrorBarData("Apr", 14.5));
            data.Add(new ErrorBarData("May", 18.2));
            data.Add(new ErrorBarData("Jun", 21.5));
            data.Add(new ErrorBarData("Jul", 25.2));
            data.Add(new ErrorBarData("Aug", 26.5));
            data.Add(new ErrorBarData("Sep", 23.3));
            data.Add(new ErrorBarData("Oct", 18.3));
            data.Add(new ErrorBarData("Nov", 13.9));
            data.Add(new ErrorBarData("Dec", 9.6));
           

            //Binding Datasource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();

        
            //Setting range for PrimaryYAxis
            this.Chart1.PrimaryYAxis.Range.Min = 0;
            this.Chart1.PrimaryYAxis.Range.Max = 40;
            this.Chart1.PrimaryYAxis.Range.Interval = 5;

        }
    }
   
        
    
}