using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser
{
    public partial class Samplebrowser : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (PropertySection.Controls.Count == 1 && EventSection.Controls.Count ==1)
            {
                if (PropertySection.Controls[0].GetType().ToString() == "System.Web.UI.LiteralControl" )
                {
                    LiteralControl liter = PropertySection.Controls[0] as System.Web.UI.LiteralControl;
                    if (liter.Text.Trim() == "")
                    {
                        if (EventSection.Controls[0].GetType().ToString() == "System.Web.UI.LiteralControl")
                        {
                            LiteralControl liter1 = EventSection.Controls[0] as System.Web.UI.LiteralControl;
                            if (liter1.Text.Trim() == "")
                                maincontrolarea.Style.Add("width", "100%");
                        }   
                       
                    }
                }
                
            }
            else if (PropertySection.Controls.Count == 0 || EventSection.Controls.Count == 0)
            {
                maincontrolarea.Style.Add("width", "100%");
            }
        }
    }
}