using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSampleBrowser.TreeGrid.Model;

namespace WebSampleBrowser.TreeGrid
{
    public partial class TreeGridPagingAPI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PagingDataCollection TaskCollection = new PagingDataCollection();
            this.TreeGridControlPagingAPI.DataSource = TaskCollection.GetPagingDataSource();
            this.TreeGridControlPagingAPI.DataBind();
        }
    }
}