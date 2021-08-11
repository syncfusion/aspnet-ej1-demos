#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.EJ.Export;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.OlapClient
{
    public partial class AdvancedFiltering : System.Web.UI.Page
    {

        protected void PivotClient1_ServerExporting(object sender, Syncfusion.JavaScript.Web.PivotClientEventArgs e)
        {
            PivotClientExport olapClient = new PivotClientExport();
            dynamic args = e.Arguments;
            olapClient.ExportPivotClient(string.Empty, args["args"].ToString(), HttpContext.Current.Response);
        }
    }
}