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
    public partial class RTL : System.Web.UI.Page
    {
         protected void Page_Load(object sender, EventArgs e)
        {           
            List<Languages> Language = new List<Languages>();
            Language.Add(new Languages("ActionScript"));
            Language.Add(new Languages("Basic"));
            Language.Add(new Languages("C"));
            Language.Add(new Languages("C++"));
            Language.Add(new Languages("C#"));
            Language.Add(new Languages("dBase"));
            Language.Add(new Languages("Delphi"));
            Language.Add(new Languages("ESPOL")); 
            Language.Add(new Languages("F#"));
            Language.Add(new Languages("FoxPro"));
            Language.Add(new Languages("Java"));
            Language.Add(new Languages("j#"));
            Language.Add(new Languages("Lisp"));
            Language.Add(new Languages("Logo"));
            Language.Add(new Languages("PHP"));
            List<CountryList> Country = new List<CountryList>();
            Country.Add(new CountryList("الجیریا"));
            Country.Add(new CountryList("ارمینیا"));
            Country.Add(new CountryList("بنگلا دیش"));
            Country.Add(new CountryList("کیوبا"));
            Country.Add(new CountryList("ڈنمارک"));
            Country.Add(new CountryList("مصر"));
            Country.Add(new CountryList("فن لینڈ"));
            Country.Add(new CountryList("بھارت"));
            Country.Add(new CountryList("ملائیشیا"));
            Country.Add(new CountryList("نیوزی لینڈ"));
            Country.Add(new CountryList("ناروے"));
            this.rtlList.DataSource = Country;

        }       
 
    }
    [Serializable]
    class Languages
    {
        public string Skills; 
        public Languages(string _skill)
        {            
            this.Skills = _skill;
        }          
    }
    [Serializable]
    class CountryList
    {
        public string Countries;
        public CountryList(string _country)
        {
            this.Countries = _country;
        }
    }
}