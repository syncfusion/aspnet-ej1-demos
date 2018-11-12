using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Syncfusion.JavaScript.Web;

namespace WebSampleBrowser.TagCloud
{
    public partial class DataBinding_Remote : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         
            this.TagCloud1.Query = "ej.Query().from('Orders').take(10)";
           this.TagCloud1.TagCloudFields.Frequency = "EmployeeID";
           this.TagCloud1.TagCloudFields.Text = "CustomerID";
        }
    }
}