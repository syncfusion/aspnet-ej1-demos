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
            this.countryList.DataSource = countries;
        }
        [Serializable]
        class CountryList
        {
            public int value { get; set; }
            public string parentId { get; set; }
            public string text { get; set; }
            public string sprite { get; set; }
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
            public string parentId { get; set; }
            public string text { get; set; }
            public GroupsList(string gID, string gtext)
            {
                this.parentId = gID;
                this.text = gtext;
            }
        }
    }
}