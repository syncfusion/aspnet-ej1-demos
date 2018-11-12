using Syncfusion.JavaScript;
using Syncfusion.JavaScript.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSampleBrowser.TreeGrid.Model;

namespace WebSampleBrowser.TreeGrid
{
    public partial class TreeGridSummaryRow : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SummaryRowData TaskCollection = new SummaryRowData();
            this.TreeGridControlSummaryRow.DataSource = TaskCollection.GetSummaryData();
            this.TreeGridControlSummaryRow.DataBind();
        }
    }
}