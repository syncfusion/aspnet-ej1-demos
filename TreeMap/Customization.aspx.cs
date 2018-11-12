using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using Syncfusion.JavaScript.Web;
using Syncfusion.JavaScript.DataVisualization.Models;
using Syncfusion.JavaScript.DataVisualization;

namespace WebSampleBrowser.TreeMap
{
    public partial class Customization : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            this.customization.DataSource = MedalData.GetMedalList();
            
        }

    }
    
}