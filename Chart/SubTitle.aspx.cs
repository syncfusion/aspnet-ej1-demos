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
    public partial class SubTitle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<SubTitleData> data = new List<SubTitleData>();

            data.Add(new SubTitleData("Monday", 70, 80));
            data.Add(new SubTitleData("Tuesday", 60, 70));
            data.Add(new SubTitleData("Wednesday", 40, 50));
            data.Add(new SubTitleData("Thursday", 40, 60));
            data.Add(new SubTitleData("Friday", 70, 60));
            data.Add(new SubTitleData("Saturday", 50, 80));
            data.Add(new SubTitleData("Sunday", 45, 50));
           
            //Binding DataSource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();

            //Setting Range for PrimaryYAxis
            this.Chart1.PrimaryYAxis.Range.Min = 0;
            this.Chart1.PrimaryYAxis.Range.Max = 100;
            this.Chart1.PrimaryYAxis.Range.Interval = 20;

            //Setting Range for PrimaryXAxis
            this.Chart1.PrimaryXAxis.Range.Min = "Monday";
            this.Chart1.PrimaryXAxis.Range.Max = "Sunday";
        }
    }
    
}

