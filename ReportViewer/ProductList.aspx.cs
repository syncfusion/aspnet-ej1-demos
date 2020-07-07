#region Copyright Syncfusion Inc. 2001-2020.
// Copyright Syncfusion Inc. 2001-2020. All rights reserved.
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

namespace WebSampleBrowser.ReportViewer
{
    public partial class ProductList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            WebSampleBrowser.ReportViewer.Models.ProductList prodlist = new WebSampleBrowser.ReportViewer.Models.ProductList();
            List<ReportDataSource> rptDatasources = new List<ReportDataSource>();
            ReportDataSource rptDatasource =new ReportDataSource();
            rptDatasource.Name = "list";
            rptDatasource.Value = prodlist.GetData();
            rptDatasources.Add(rptDatasource);
            this.ReportViewer1.DataSources = rptDatasources;
            this.ReportViewer1.ReportServiceUrl = VirtualPathUtility.ToAbsolute("~/api/RDLCReport");
        }
    }
}