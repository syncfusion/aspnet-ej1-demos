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
    public partial class Cascading : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<GroupsList> groups = new List<GroupsList>();
            groups.Add(new GroupsList("a", "Group A"));
            groups.Add(new GroupsList("b", "Group B"));
            groups.Add(new GroupsList("c", "Group C"));
            groups.Add(new GroupsList("d", "Group D"));
            groups.Add(new GroupsList("e", "Group E"));
            groups.Add(new GroupsList("f", "Group F"));
            groups.Add(new GroupsList("g", "Group G"));
            groups.Add(new GroupsList("h", "Group H"));
            groups.Add(new GroupsList("i", "Group I"));
            groups.Add(new GroupsList("j", "Group J"));
            this.groupsList.DataSource = groups;

            List<CountryList> countries = new List<CountryList>();
            countries.Add(new CountryList(11, "a", "Algeria", "flag-dz"));
            countries.Add(new CountryList(12, "a", "Armenia", "flag-am"));
            countries.Add(new CountryList(13, "a", "Bangladesh", "flag-bd"));
            countries.Add(new CountryList(14, "a", "Cuba", "flag-cu"));
            countries.Add(new CountryList(15, "b", "Denmark", "flag-dk"));
            countries.Add(new CountryList(16, "b", "Egypt", "flag-eg"));
            countries.Add(new CountryList(17, "c", "Finland", "flag-fi"));
            countries.Add(new CountryList(18, "c", "India", "flag-in"));
            countries.Add(new CountryList(19, "c", "Malaysia", "flag-my"));
            countries.Add(new CountryList(20, "d", "New Zealand", "flag-nz"));
            countries.Add(new CountryList(21, "d", "Norway", "flag-no"));
            countries.Add(new CountryList(22, "d", "Poland", "flag-pl"));
            countries.Add(new CountryList(23, "e", "Romania", "flag-ro"));
            countries.Add(new CountryList(24, "e", "Singapore", "flag-sg"));
            countries.Add(new CountryList(25, "e", "Thailand", "flag-th"));
            countries.Add(new CountryList(26, "e", "Ukraine", "flag-ua"));
            countries.Add(new CountryList(26, "f", "Falkland Islands", "flag-ua"));
            countries.Add(new CountryList(27, "f", "Faroe Islands", "flag-ua"));
            countries.Add(new CountryList(28, "f", "Fiji", "flag-ua"));
            countries.Add(new CountryList(29, "g", "Germany", "flag-ua"));
            countries.Add(new CountryList(30, "g", "Greece", "flag-ua"));
            countries.Add(new CountryList(31, "g", "Greenland", "flag-ua"));
            countries.Add(new CountryList(32, "g", "Ghana", "flag-ua"));
            countries.Add(new CountryList(33, "h", "Hong Kong", "flag-ua"));
            countries.Add(new CountryList(34, "h", "Haiti", "flag-ua"));
            countries.Add(new CountryList(35, "i", "Iceland", "flag-ua"));
            countries.Add(new CountryList(36, "i", "Indonesia", "flag-ua"));
            countries.Add(new CountryList(37, "i", "Ireland", "flag-ua"));
            countries.Add(new CountryList(38, "j", "Jamaica", "flag-ua"));
            countries.Add(new CountryList(39, "j", "Japan", "flag-ua"));
            countries.Add(new CountryList(40, "j", "Jordan", "flag-ua"));
            this.countryList.DataSource = countries;
        }
        [Serializable]
        class CountryList
        {
            public int value;
            public string parentId;
            public string text;
            public string sprite;
            public CountryList(int cvalue, string cid, string ctext, string sprt)
            {
                this.value = cvalue;
                this.parentId = cid;
                this.text = ctext;
                this.sprite = sprt;

            }
        }
        [Serializable]
        class GroupsList
        {
            public string parentId;
            public string text;
            public GroupsList(string gID, string gtext)
            {
                this.parentId = gID;
                this.text = gtext;
            }
        }
    }
}