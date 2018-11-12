using Syncfusion.JavaScript;
using Syncfusion.JavaScript.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSampleBrowser.TreeGrid.Model;

namespace WebSampleBrowser.TreeGrid
{
    public partial class TreeGridStackedHeader : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ShipmentDataCollection TaskCollection = new ShipmentDataCollection();
            this.TreeGridControlStackedHeader.DataSource = TaskCollection.GetDataSource();
            this.TreeGridControlStackedHeader.DataBind();
        }

    }
}

