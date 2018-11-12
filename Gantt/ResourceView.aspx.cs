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