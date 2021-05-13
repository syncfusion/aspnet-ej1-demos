#region Copyright Syncfusion Inc. 2001-2021
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion

using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.Chart
{
    public partial class BoxPlot : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<BoxPlotData> data = new List<BoxPlotData>();
            Double[] y1 = { 22,22,23,25,25,25,26,27,27,28,28,29,30,32,34,32,34,36,35,38 };
            Double[] y2 = { 22,33,23,25,26,28,29,30,34,33,32,31,50};
            Double[] y3 = { 22,24,25,30,32,34,36,38,39,41,35,36,40,56 };
            Double[] y4 = { 26,27,28,30,32,34,35,37,35,37,45 };
            Double[] y5 = { 26,27,29,32,34,35,36,37,38,39,41,43,58 };
            Double[] y6 = { 27,26,28,29,29,29,32,35,32,38,53 };
            Double[] y7 = { 21,23,24,25,26,27,28,30,34,36,38 };
            Double[] y8 = { 26,28,29,30,32,33,35,36, 52 };
            Double[] y9 = { 28,29,30,31,32,34,35,36 };   
            data.Add(new BoxPlotData("Development", y1));
            data.Add(new BoxPlotData("Testing", y2));
            data.Add(new BoxPlotData("HR", y3));
            data.Add(new BoxPlotData("Finance", y4));
            data.Add(new BoxPlotData("R&D", y5));
            data.Add(new BoxPlotData("Sales", y6));
            data.Add(new BoxPlotData("Inventory", y7));
            data.Add(new BoxPlotData("Graphics", y8));
            data.Add(new BoxPlotData("Training", y9)); 


            //Binding Datasource to Chart
            this.Chart1.DataSource = data;
            this.Chart1.DataBind();

          

        }
    }
  
}

