#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.ListBox
{
    public partial class ToolTip : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<EmployeeSpecialists> empl = new List<EmployeeSpecialists>();
            empl.Add(new EmployeeSpecialists { text = "Erik Linden", country = "England" });
            empl.Add(new EmployeeSpecialists { text = "John Linden", country = "Norway" });
            empl.Add(new EmployeeSpecialists { text = "Louis", country = "Australia" });
            empl.Add(new EmployeeSpecialists { text = "Lawrence", country = "India" });
            empl.Add(new EmployeeSpecialists { text = "Abraham", country = "England" });
            empl.Add(new EmployeeSpecialists { text = "Philip", country = "Norway" });
            empl.Add(new EmployeeSpecialists { text = "James", country = "Australia" });
            empl.Add(new EmployeeSpecialists { text = "Kennedy", country = "India" });
            selectExperts.DataSource = empl;
            selectExperts.ListBoxFields.TooltipText = "country";
            selectExperts.DataTextField = "text";
        }
    }
    public class EmployeeTool
    {
        public String text, country;
    }
}