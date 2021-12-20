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
    public partial class Grouping : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        List<Countries> veg= new List<Countries>();
   
            veg.Add(new Countries { text= "Bahrain", category= "B" }); 
            veg.Add(new Countries { text= "Brazil", category= "B" });
            veg.Add(new Countries { text= "Argentina", category= "A" });
            veg.Add(new Countries { text= "Bangladesh", category= "B" }); 
            veg.Add(new Countries { text= "Burma", category= "B" }); 
            veg.Add(new Countries { text= "Afghanistan", category= "A" }); 
            veg.Add(new Countries { text= "Antigua and Barbuda", category= "A" });
            veg.Add(new Countries { text= "Barbados", category= "B" }); 
            veg.Add(new Countries { text= "Botswana", category= "B" }); 
            veg.Add(new Countries { text= "Albania", category= "A" }); 
            veg.Add(new Countries { text= "Andorra", category= "A" });
            veg.Add(new Countries { text= "Belarus", category= "B" }); 
            veg.Add(new Countries { text= "Bolivia", category= "B" }); 
            veg.Add(new Countries { text= "Algeria", category= "A" }); 
            veg.Add(new Countries { text= "Angola", category= "A" });
            vegetable.DataSource = veg;
        }
    }
    public class Countries
    {
        public string text { get; set; }
        public string category { get; set; }
        public int value { get; set; }
        public string parentId { get; set; }
        public string sprite { get; set; }
        public string country { get; set; }
        public int id { get; set; }
        public int parent { get; set; }
    }
}