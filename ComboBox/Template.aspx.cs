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

namespace WebSampleBrowser.ComboBox
{
    public partial class Template : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.selectCountry.DataSource = empList.GetEmpList();
        }
    }
    public class empList
    {
        public string text { get; set; }
        public string eimg { get; set; }
        public string status { get; set; }
        public string country { get; set; }
        public static List<empList> GetEmpList()
        {
            List<empList> emp = new List<empList>();
            emp.Add(new empList { text = "Natalie", eimg = "1", status = "Available", country = "USA" });
            emp.Add(new empList { text = "John Linden", eimg = "2", status = "Available", country = "USA" });
            emp.Add(new empList { text = "Erik Linden", eimg = "3", status = "Available", country = "England" });
            emp.Add(new empList { text = "Leverling", eimg = "4", status = "Available", country = "England" });
            emp.Add(new empList { text = "Suyama", eimg = "5", status = "Available", country = "USA" });
            return emp;
        }
    }
}