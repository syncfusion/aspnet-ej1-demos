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

namespace WebSampleBrowser.Menu
{
    public class menufields
    {
        public string id { get; set; }
        public int? parentId { get; set; }
        public string text { get; set; }
        public string sprite { get; set; }
    }
    public partial class Databinding_Local : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            List<menufields> sites = new List<menufields>();
            sites.Add(new menufields { id = "1", parentId = null, text = "Group A" });
            sites.Add(new menufields { id = "2", parentId = null, text = "Group B" });
            sites.Add(new menufields { id = "3", parentId = null, text = "Group C" });
            sites.Add(new menufields { id = "4", parentId = null, text = "Group D" });
            //first level child
            sites.Add(new menufields { id = "11", parentId = 1, text = "Algeria", sprite = "flag-dz" });
            sites.Add(new menufields { id = "12", parentId = 1, text = "Armenia", sprite = "flag-am" });
            sites.Add(new menufields { id = "13", parentId = 1, text = "Bangladesh", sprite = "flag-bd" });
            sites.Add(new menufields { id = "14", parentId = 1, text = "Cuba", sprite = "flag-cu" });
            sites.Add(new menufields { id = "15", parentId = 2, text = "Denmark", sprite = "flag-dk" });
            sites.Add(new menufields { id = "16", parentId = 2, text = "Egypt", sprite = "flag-eg" });
            sites.Add(new menufields { id = "17", parentId = 3, text = "Finland", sprite = "flag-fi" });
            sites.Add(new menufields { id = "18", parentId = 3, text = "India", sprite = "flag-in" });
            sites.Add(new menufields { id = "19", parentId = 3, text = "Malaysia", sprite = "flag-my" });
            sites.Add(new menufields { id = "20", parentId = 4, text = "New Zealand", sprite = "flag-nz" });
            sites.Add(new menufields { id = "21", parentId = 4, text = "Norway", sprite = "flag-no" });
            sites.Add(new menufields { id = "22", parentId = 4, text = "Poland", sprite = "flag-pl" });
            sites.Add(new menufields { id = "23", parentId = 5, text = "Romania", sprite = "flag-ro" });
            sites.Add(new menufields { id = "24", parentId = 5, text = "Singapore", sprite = "flag-sg" });
            sites.Add(new menufields { id = "25", parentId = 5, text = "Thailand", sprite = "flag-th" });
            sites.Add(new menufields { id = "26", parentId = 5, text = "Ukraine", sprite = "flag-ua" });

            //second level child
            sites.Add(new menufields { id = "111", parentId = 11, text = "First Place" });
            sites.Add(new menufields { id = "112", parentId = 12, text = "Second Place" });
            sites.Add(new menufields { id = "113", parentId = 13, text = "Third place" });
            sites.Add(new menufields { id = "114", parentId = 14, text = "Fourth Place" });
            sites.Add(new menufields { id = "115", parentId = 15, text = "First Place" });
            sites.Add(new menufields { id = "116", parentId = 16, text = "Second Place" });
            sites.Add(new menufields { id = "117", parentId = 17, text = "Third Place" });
            sites.Add(new menufields { id = "118", parentId = 18, text = "First Place" });
            sites.Add(new menufields { id = "119", parentId = 19, text = "Second Place" });
            sites.Add(new menufields { id = "120", parentId = 20, text = "First Place" });
            sites.Add(new menufields { id = "121", parentId = 21, text = "Second Place" });
            sites.Add(new menufields { id = "122", parentId = 22, text = "Third place" });
            sites.Add(new menufields { id = "123", parentId = 3, text = "Fourth Place" });
            sites.Add(new menufields { id = "120", parentId = 24, text = "First Place" });
            sites.Add(new menufields { id = "121", parentId = 25, text = "Second Place" });
            sites.Add(new menufields { id = "122", parentId = 26, text = "Third place" });

            this.sitemenu.Fields.DataSource = sites;
        }
    }
}