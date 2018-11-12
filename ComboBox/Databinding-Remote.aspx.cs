using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.ComboBox
{
    public partial class Databinding_Remote : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.searchCustomer.Query = "ej.Query().from('Suppliers').select('SupplierID', 'ContactName')";
        }
    }
}