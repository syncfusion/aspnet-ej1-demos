#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.JavaScript.Models.ReportViewer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSampleBrowser.ReportViewer.Models;

namespace WebSampleBrowser.ReportViewer
{
    public partial class DataBindingLocal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<ReportDataSource> rptDatasources = new List<ReportDataSource>();

            ReportDataSource rptDatasource1 = new ReportDataSource();
            rptDatasource1.Name = "DataSet1";
            rptDatasource1.Value = Billionaires.GetList_2012();
            rptDatasources.Add(rptDatasource1);

            ReportDataSource rptDatasource2 = new ReportDataSource();
            rptDatasource2.Name = "DataSet2";
            rptDatasource2.Value = Billionaires.GetList_2013();
            rptDatasources.Add(rptDatasource2);

            ReportDataSource rptDatasource3 = new ReportDataSource();
            rptDatasource3.Name = "DataSet3";
            rptDatasource3.Value = Indicator.GetIndicator();
            rptDatasources.Add(rptDatasource3);

            this.ReportViewer1.DataSources = rptDatasources;
            this.ReportViewer1.ReportServiceUrl = VirtualPathUtility.ToAbsolute("~/api/RDLCReport");
        }
    }
}