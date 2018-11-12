using Syncfusion.JavaScript.Models.ReportDesigner;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.ReportDesigner
{
    public partial class Customization : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /// <summary>
            /// ReportDesigner1 control.
            /// </summary>
            /// <remarks>
            /// Auto-generated field.
            /// To modify move field declaration from designer file to code-behind file.
            /// </remarks>
            this.ReportDesigner1.ServiceUrl = VirtualPathUtility.ToAbsolute("~/api/ReportDesigner");
            this.ReportDesigner1.ToolbarSettings.Items = Syncfusion.JavaScript.ReportDesignerEnums.ToolbarItems.All & ~Syncfusion.JavaScript.ReportDesignerEnums.ToolbarItems.Preview & ~Syncfusion.JavaScript.ReportDesignerEnums.ToolbarItems.EditDesign & ~Syncfusion.JavaScript.ReportDesignerEnums.ToolbarItems.New & ~Syncfusion.JavaScript.ReportDesignerEnums.ToolbarItems.Open & ~Syncfusion.JavaScript.ReportDesignerEnums.ToolbarItems.Save;
        }
    }
}