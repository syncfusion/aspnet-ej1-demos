using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.Chart
{
    public partial class XmlBinding : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet data = new DataSet();
            data.ReadXml(Server.MapPath("~/App_Data/ChartXML.xml"));
            this.ChartXml.DataSource = data;
            this.ChartXml.DataBind();
        }
    }
}