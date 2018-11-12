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