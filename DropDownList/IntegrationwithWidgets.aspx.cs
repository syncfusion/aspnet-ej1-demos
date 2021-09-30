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
using System.ComponentModel;

namespace WebSampleBrowser.DropDownList
{
    public partial class IntegrationwithWidgets : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Treeview.DataSource = new TreeIconsDataSource().GetTreeIconItems().ToList();
        }
    }
    public class TreeIconsDataSource
    {

        public TreeIconsDataSource()
        { }
        public TreeIconsDataSource(int _id, int _parentid, string _text, string _hasChild, string _expanded, string _spriteCssClass)
        {
            this.ID = _id;
            this.ParentID = _parentid;
            this.Text = _text;
            this.HasChild = _hasChild;
            this.Expanded = _expanded;         
        }
        [Browsable(true)]
        public int ID
        {
            get;
            set;
        }

        [Browsable(true)]
        public int ParentID
        {
            get;
            set;
        }

        [Browsable(true)]
        public string Text
        {
            get;
            set;
        }
        [Browsable(true)]
        public string HasChild
        {
            get;
            set;
        }
        [Browsable(true)]
        public string Expanded
        {
            get;
            set;
        }
        [Browsable(true)]
        public string SpriteCssClass
        {
            get;
            set;
        }

        public List<TreeIconsDataSource> GetTreeIconItems()
        {
            List<TreeIconsDataSource> data = new List<TreeIconsDataSource>();
            data.Add(new TreeIconsDataSource(1, 0, "Mail", "true", "true", "mailicon sprite-root"));
            data.Add(new TreeIconsDataSource(2, 1, "Inbox ", "true", "", "mailicon sprite-inbox"));
            data.Add(new TreeIconsDataSource(3, 2, "Development ", "", "", "mailicon sprite-folder"));
            data.Add(new TreeIconsDataSource(4, 2, "Supports", "", "", "mailicon sprite-folder"));
            data.Add(new TreeIconsDataSource(20, 2, "Management", "", "", "mailicon sprite-folder"));
            data.Add(new TreeIconsDataSource(21, 2, "Team Meeting", "", "", "mailicon sprite-folder"));
            data.Add(new TreeIconsDataSource(6, 1, "Drafts", "true", "", "mailicon sprite-drafts"));
            data.Add(new TreeIconsDataSource(7, 6, "Support template ", "", "", "mailicon sprite-folder"));
            data.Add(new TreeIconsDataSource(8, 6, "Personal ", "", "", "mailicon sprite-folder"));
            data.Add(new TreeIconsDataSource(9, 1, "Sent items ", "true", "", "mailicon sprite-sentitems"));
            data.Add(new TreeIconsDataSource(10, 9, "Support ", "", "", "mailicon sprite-folder"));
            data.Add(new TreeIconsDataSource(22, 9, "HTML JS ", "", "", "mailicon sprite-folder"));
            data.Add(new TreeIconsDataSource(24, 1, "Deleted ", "", "", "mailicon sprite-deleted"));
            data.Add(new TreeIconsDataSource(25, 1, "Junk Mails ", "", "", "mailicon sprite-junk"));
            data.Add(new TreeIconsDataSource(26, 1, "Peronal ", "true", "", "mailicon sprite-folder"));
            data.Add(new TreeIconsDataSource(27, 26, "HR Team ", "", "", "mailicon sprite-folder"));
            data.Add(new TreeIconsDataSource(28, 26, "My Works ", "", "", "mailicon sprite-folder"));
            data.Add(new TreeIconsDataSource(29, 26, "Login details ", "", "", "mailicon sprite-folder"));
            data.Add(new TreeIconsDataSource(11, 0, "Calendar", "true", "", "mailicon sprite-calendar"));
            data.Add(new TreeIconsDataSource(12, 11, "My Calendar ", "", "", "mailicon sprite-calendar"));
            data.Add(new TreeIconsDataSource(13, 11, "Team", "", "", "mailicon sprite-calendar"));
            data.Add(new TreeIconsDataSource(14, 11, "Others", "", "", "mailicon sprite-calendar"));
            data.Add(new TreeIconsDataSource(15, 0, "Notes", "true", "", "mailicon sprite-notes"));
            data.Add(new TreeIconsDataSource(16, 15, "My Reference ", "", "", "mailicon sprite-folder"));
            data.Add(new TreeIconsDataSource(30, 0, "Contacts", "true", "", "mailicon sprite-contacts"));
            data.Add(new TreeIconsDataSource(31, 30, "Suggested", "", "", "mailicon sprite-contacts"));
            data.Add(new TreeIconsDataSource(32, 30, "MY Team", "", "", "mailicon sprite-contacts"));
            

            return data;
        }
    }
}