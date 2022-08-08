#region Copyright Syncfusion Inc. 2001-2022.
// Copyright Syncfusion Inc. 2001-2022. All rights reserved.
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
using System.Data.SqlClient;


namespace WebSampleBrowser.DropDownList
{
    public partial class DataBinding_remotedata : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                 
            this.customerList.Query="ej.Query().from('Customers').take(6)";          
        }
    }
}