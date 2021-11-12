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
    public partial class Selection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<SelectionChartData> data = new List<SelectionChartData>();

            data.Add(new SelectionChartData("China", 17, 74, 9));
            data.Add(new SelectionChartData("UnitedStates", 19, 67, 14));
            data.Add(new SelectionChartData("India", 29, 65, 6));
            data.Add(new SelectionChartData("Japan", 13, 61, 26));
            data.Add(new SelectionChartData("Brazil", 24, 68, 8));
            data.Add(new SelectionChartData("Russia", 16, 70, 14));
            data.Add(new SelectionChartData("Nigeria", 44, 53, 3));
            data.Add(new SelectionChartData("Germany", 13, 66, 21));
            data.Add(new SelectionChartData("UnitedKingdom", 18, 65, 17));
            data.Add(new SelectionChartData("France", 19, 63, 18));
            //Binding Datasource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();

           
        }
    }
   
}