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

namespace WebSampleBrowser.TreeView
{
    public partial class Template : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             List<template> templateData = new List<template>();
            templateData.Add(new template { id = 1, name = "UK", hasChild = true, expanded = true, cls = "UK-style" });
            templateData.Add(new template { id = 2, pid = 1, imgId = 1, name = "Steven John", city = "London", phone = "555-5665-2323" });
            templateData.Add(new template { id = 3, name = "USA", hasChild = true, expanded = true, cls = "USA-style" });
            templateData.Add(new template { id = 5, pid = 3, imgId = 2, name = "Andrew", city = "Capital way", phone = "934-8374-2455" });
            templateData.Add(new template { id = 4, pid = 3, imgId = 3, name = "Angelica", city = "Dayton", phone = "988-4243-0806" });
            
            treeview.DataSource = templateData;
        }

        public class template
        {
            public int id { get; set; }
            public int pid { get; set; }
            public int imgId { get; set; }
            public string name { get; set; }
            public bool hasChild { get; set; }
            public bool expanded { get; set; }
            public string city { get; set; }
            public string phone { get; set; }
            public string cls { get; set; }
        }
    }
}