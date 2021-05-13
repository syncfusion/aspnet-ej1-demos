#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.JavaScript.Models.ReportDesigner;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.Dashboard
{
    public partial class ReportBuilderTemplate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.ReportDesigner1.ServiceUrl = VirtualPathUtility.ToAbsolute("~/api/ReportDesigner");
            this.ReportDesigner1.ToolbarSettings.Items = Syncfusion.JavaScript.ReportDesignerEnums.ToolbarItems.All & ~Syncfusion.JavaScript.ReportDesignerEnums.ToolbarItems.Preview & ~Syncfusion.JavaScript.ReportDesignerEnums.ToolbarItems.EditDesign;
        }
    }
}