using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.Rotator
{
    public partial class template : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<EmployeeSpecialists> empl = new List<EmployeeSpecialists>();
            empl.Add(new EmployeeSpecialists { text = "Louis", color = "#43BDC2", eimg = "03", desig = "Representative", country = "England" });
            empl.Add(new EmployeeSpecialists { text = "Silivia", color = "#80C344", eimg = "04", desig = "Representative", country = "Norway" });
            empl.Add(new EmployeeSpecialists { text = "Linden", color = "#F68A3F", eimg = "05", desig = "Representative", country = "Australia" });
            empl.Add(new EmployeeSpecialists { text = "Lawrence", color = "#E4BF21", eimg = "06", desig = "Representative", country = "India" });
            sliderContent.DataSource = empl;

        }
    }
    public class EmployeeSpecialists
    {
        public string text { get; set; }
        public string color { get; set; }
        public string eimg { get; set; }
        public string desig { get; set; }
        public string country { get; set; }
    }
}