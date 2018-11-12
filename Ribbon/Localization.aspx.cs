using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.Ribbon
{
    public partial class Localization : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var fontlist = new List<string> {"Segoe UI", "Arial","Times New Roman", "Tahoma", "Helvetica" };
            var fontsize = new List<string>() { "1pt", "2pt", "3pt", "4pt", "5pt" };            
        }
       
    }
}