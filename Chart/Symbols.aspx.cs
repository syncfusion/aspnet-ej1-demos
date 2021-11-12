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
    public partial class Symbols : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            //Setting Range for PrimaryYAxis
            this.Chart1.PrimaryYAxis.Range.Min = 0;
            this.Chart1.PrimaryYAxis.Range.Max  = 3;
            this.Chart1.PrimaryYAxis.Range.Interval = 0.5;

            List<SymbolData> data = new List<SymbolData>();
 
            data.Add(new SymbolData(1950, 0.8, 1.4, 2));
            data.Add(new SymbolData(1955, 1.2, 1.7, 2.4));
            data.Add(new SymbolData(1960, 0.9, 1.5, 2.2));
            data.Add(new SymbolData(1965, 1, 1.6, 2.5));
            data.Add(new SymbolData(1970, 0.8, 1.4, 2.2));
            data.Add(new SymbolData(1975, 1, 1.8, 2.4));
            data.Add(new SymbolData(1980, 1, 1.7, 2));
            data.Add(new SymbolData(1985, 1.2, 1.9, 2.3));
            data.Add(new SymbolData(1990, 1.1, 1.7, 2));
            data.Add(new SymbolData(1995, 1.2, 1.8, 2.2));
            data.Add(new SymbolData(2000, 1.4, 2, 2.4));

            //Binding DataSource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();
           
        }
    }

  
}