using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.DropDownList
{
    public partial class MultiSelect : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Lanuages> lagguage = new List<Lanuages>();
            lagguage.Add(new Lanuages("ActionScript"));
            lagguage.Add(new Lanuages("Basic"));
            lagguage.Add(new Lanuages("C"));
            lagguage.Add(new Lanuages("C++"));
            lagguage.Add(new Lanuages("C#"));
            lagguage.Add(new Lanuages("dBase"));
            lagguage.Add(new Lanuages("Delphi"));
            lagguage.Add(new Lanuages("ESPOL"));
            lagguage.Add(new Lanuages("F#"));
            lagguage.Add(new Lanuages("FoxPro"));
            lagguage.Add(new Lanuages("Java"));
            lagguage.Add(new Lanuages("j#"));
            lagguage.Add(new Lanuages("Lisp"));
            lagguage.Add(new Lanuages("Logo"));
            lagguage.Add(new Lanuages("PHP"));
            this.skillsets.DataSource = lagguage;
        }
    }
}