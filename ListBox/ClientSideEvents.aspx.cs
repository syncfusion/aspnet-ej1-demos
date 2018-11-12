using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.ListBox
{
    public partial class ClientSideEvents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Languages> countries = new List<Languages>();
            countries.Add(new Languages("America"));
            countries.Add(new Languages("Australia"));
            countries.Add(new Languages("Austria"));
            countries.Add(new Languages("Bangladesh"));
            countries.Add(new Languages("Brazil"));
            countries.Add(new Languages("Canada"));
            countries.Add(new Languages("China"));
            countries.Add(new Languages("Denmark"));
            countries.Add(new Languages("Europe"));
            countries.Add(new Languages("France"));
            countries.Add(new Languages("Germany"));
            countries.Add(new Languages("India"));
            countries.Add(new Languages("Japan"));
            countries.Add(new Languages("Kuwait"));
            countries.Add(new Languages("Malaysia"));
            this.selectCountry.DataSource = countries;
        }
    }
}