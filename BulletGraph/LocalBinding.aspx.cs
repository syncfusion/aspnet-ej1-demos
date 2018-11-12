using Syncfusion.JavaScript.DataVisualization;
using Syncfusion.JavaScript.DataVisualization.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.BulletGraph
{
    public partial class LocalBinding : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            //Adding dataSource to bullet graph
            #region datasource
            List<BulletLocalDataBind> data = new List<BulletLocalDataBind>();
            data.Add(new BulletLocalDataBind { category = "2001", value = "9.5", comparitiveMeasureValue = "7.5" });
            data.Add(new BulletLocalDataBind { category = "2002", value = "7", comparitiveMeasureValue = "5" });
            data.Add(new BulletLocalDataBind { category = "2003", value = "6", comparitiveMeasureValue = "6" });
            data.Add(new BulletLocalDataBind { category = "2004", value = "8.3", comparitiveMeasureValue = "8" });
            data.Add(new BulletLocalDataBind { category = "2005", value = "6.8", comparitiveMeasureValue = "5" });
            data.Add(new BulletLocalDataBind { category = "2006", value = "9.4", comparitiveMeasureValue = "6" });
            this.BulletGraph1.DataSource = data;
            this.BulletGraph1.DataBind();
            
            #endregion

        }
    }
}