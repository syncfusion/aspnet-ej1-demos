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
    public partial class Sorting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            List<SkillSet> veg = new List<SkillSet>();

            veg.Add(new SkillSet { skill = "F#" });
            veg.Add(new SkillSet { skill = "ActionScript" });
            veg.Add(new SkillSet { skill = "Delphi" });
            veg.Add(new SkillSet { skill = "Basic" });
            veg.Add(new SkillSet { skill = "C++" });
            veg.Add(new SkillSet { skill = "ESPOL" });
            veg.Add(new SkillSet { skill = "C#" });
            veg.Add(new SkillSet { skill = "DBase" });
            veg.Add(new SkillSet { skill = "ASP.NET" });
            skillSetList.DataSource = veg;

            List<GroupList> skills = new List<GroupList>();
            skills.Add(new GroupList { skill = "Beetroot", category = "Root and Tuberous" });
            skills.Add(new GroupList { skill = "Potato", category = "Root and Tuberous" });
            skills.Add(new GroupList { skill = "Pigeon pea", category = "Beans" });
            skills.Add(new GroupList { skill = "Pea", category = "Leafy and Salad" });
            skills.Add(new GroupList { skill = "Spinach", category = "Leafy and Salad" });
            skills.Add(new GroupList { skill = "Wheatgrass", category = "Leafy and Salad" });
            skills.Add(new GroupList { skill = "Turmeric", category = "Root and Tuberous" });
            skills.Add(new GroupList { skill = "Yarrow", category = "Leafy and Salad" });
            skills.Add(new GroupList { skill = "Chickpea", category = "Beans" });
            skills.Add(new GroupList { skill = "Green bean", category = "Beans" });
            skills.Add(new GroupList { skill = "Horse gram", category = "Beans" });
            skills.Add(new GroupList { skill = "Cabbage", category = "Leafy and Salad" });
            skills.Add(new GroupList { skill = "Carrot", category = "Root and Tuberous" });
            skills.Add(new GroupList { skill = "Peanut", category = "Beans" });
            skills.Add(new GroupList { skill = "Garlic", category = "Bulb and Stem" });
            skills.Add(new GroupList { skill = "Garlic Chives", category = "Bulb and Stem" });
            skills.Add(new GroupList { skill = "Nopal", category = "Bulb and Stem" });
            skills.Add(new GroupList { skill = "Lotus root", category = "Bulb and Stem" });
            skills.Add(new GroupList { skill = "Onion", category = "Bulb and Stem" });
            skills.Add(new GroupList { skill = "Shallot", category = "Bulb and Stem" });
            skills.Add(new GroupList { skill = "Ginger", category = "Root and Tuberous" });
            skills.Add(new GroupList { skill = "Radish", category = "Root and Tuberous" });
            groupData.DataSource = skills;

        }
    }
    public class SkillSet
    {
        public string skill { get; set; }

    }
    public class GroupList
    {
        public string skill { get; set; }
        public string category { get; set; }
    }
}