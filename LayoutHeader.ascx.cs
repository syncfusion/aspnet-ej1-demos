using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser
{
   
    public partial class LayoutHeader : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {                      
            this.themeButton.Fields.DataSource = new ThemeDataSource().getThemeData(); 
        }
    }
}