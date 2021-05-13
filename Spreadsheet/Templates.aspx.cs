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
using WebSampleBrowser.SpreadsheetASP.Model;

namespace WebSampleBrowser.SpreadsheetASP
{
    public partial class Templates : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataSource();
        }

        private void BindDataSource()
        {
            var dataSource = new FIFADataContext().GetFIFADetails.ToList();
            this.FlatSpreadsheet.Sheets[0].RangeSetting[0].Datasource = dataSource[0];
            this.FlatSpreadsheet.Sheets[1].RangeSetting[0].Datasource = dataSource[1];
            this.FlatSpreadsheet.Sheets[2].RangeSetting[0].Datasource = dataSource[2];
            this.FlatSpreadsheet.Sheets[3].RangeSetting[0].Datasource = dataSource[3];
        }
    }
}