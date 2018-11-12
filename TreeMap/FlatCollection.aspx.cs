using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using Syncfusion.JavaScript.Web;
using Syncfusion.JavaScript.DataVisualization;
using Syncfusion.JavaScript.DataVisualization.Models;

namespace WebSampleBrowser.TreeMap
{
    public partial class flatcollection : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            this.flatCollection.DataSource = TreeMapPopulationData.GetData();
            this.flatCollection.TreeMapRangeColorMappings = new List<TreeMapRangeColorMapping>()
             {
                    new TreeMapRangeColorMapping() { From = 29671000, To = 315646000, GradientColors = new List<string>() { "#fde6cc", "#fab665" } }
                    
                };
        }
    }
             
        
    }

    