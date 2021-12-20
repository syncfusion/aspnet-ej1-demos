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
    public partial class DateTimeCategoryAxis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Setting Range for PrimaryXAxis
            this.Chart1.PrimaryXAxis.Range.Interval = 1;

            List<DatetimeCategoryData> data = new List<DatetimeCategoryData>();

            data.Add(new DatetimeCategoryData(new DateTime(2015, 03, 02), 30));
            data.Add(new DatetimeCategoryData(new DateTime(2015, 03, 03), 50));
            data.Add(new DatetimeCategoryData(new DateTime(2015, 03, 04), 45));
            data.Add(new DatetimeCategoryData(new DateTime(2015, 03, 05), 65));
            data.Add(new DatetimeCategoryData(new DateTime(2015, 03, 06), 90));
            data.Add(new DatetimeCategoryData(new DateTime(2015, 03, 09), 85));
            data.Add(new DatetimeCategoryData(new DateTime(2015, 03, 10), 30));
            data.Add(new DatetimeCategoryData(new DateTime(2015, 03, 11), 55));
            data.Add(new DatetimeCategoryData(new DateTime(2015, 03, 12), 25));
            data.Add(new DatetimeCategoryData(new DateTime(2015, 03, 13), 40));
            data.Add(new DatetimeCategoryData(new DateTime(2015, 03, 16), 75));
            data.Add(new DatetimeCategoryData(new DateTime(2015, 03, 17), 70));
            data.Add(new DatetimeCategoryData(new DateTime(2015, 03, 18), 60));
            data.Add(new DatetimeCategoryData(new DateTime(2015, 03, 19), 30));
            data.Add(new DatetimeCategoryData(new DateTime(2015, 03, 20), 15));
            //Binding Datasource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();

        }
    }
     
}