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
    public partial class TreeGridRowDragAndDrop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DragAndDropCollection DragCollection = new DragAndDropCollection();
            this.TreeGridControlDragAndDrop.DataSource = DragCollection.GetDragAndDropData();
            this.TreeGridControlDragAndDrop.DataBind();  
        }
    }
}