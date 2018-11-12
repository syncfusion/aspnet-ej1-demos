using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Syncfusion.JavaScript.Models;
using Syncfusion.JavaScript;

namespace WebSampleBrowser.Captcha
{
    public partial class SignUpForm : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {        
        }

        [System.Web.Services.WebMethod]
        public static string GetCurrentItem(Dictionary<object, object> captchaModel)
        {
            return Syncfusion.JavaScript.Web.Captcha.GetModel(captchaModel).ExecuteResult();
        }
    }
}