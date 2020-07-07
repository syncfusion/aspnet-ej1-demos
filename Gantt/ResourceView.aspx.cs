#region Copyright Syncfusion Inc. 2001-2020.
// Copyright Syncfusion Inc. 2001-2020. All rights reserved.
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
using WebSampleBrowser.Gantt.Model;
namespace WebSampleBrowser.Gantt
{
    public partial class ResourceView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.ResourceViewGantt.DataSource = new ResourceViewData().GetResourceGanttData();
            this.ResourceViewGantt.GroupCollection = new ResourceGroupDetails().GetResourceGroups();
            this.ResourceViewGantt.Resources = new ResourceGanttResources().GetResources(); 
            this.ResourceViewGantt.DataBind();
        }
    }
}