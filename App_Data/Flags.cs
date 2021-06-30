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
using System.Data;
using System.ComponentModel;
using System.Web.Script.Serialization;
public class Flags
{
    public string text { get; set; }
    public string key { get; set; }
    public static List<Flags> GetFlags()
    {
        List<Flags> flag = new List<Flags>();
        flag.Add(new Flags { text = "Algeria", key = "flag-dz" });
        flag.Add(new Flags { text = "Armenia", key = "flag-am" });
        flag.Add(new Flags { text = "Brazil", key = "flag-br" });
        flag.Add(new Flags { text = "Bangladesh", key = "flag-bd" });
        flag.Add(new Flags { text = "Canada", key = "flag-ca" });
        flag.Add(new Flags { text = "Cuba", key = "flag-cu" });
        flag.Add(new Flags { text = "China", key = "flag-cn" });
        flag.Add(new Flags { text = "Denmark", key = "flag-dk" });
        flag.Add(new Flags { text = "Estonia", key = "flag-ee" });
        flag.Add(new Flags { text = "Egypt", key = "flag-eg" });
        flag.Add(new Flags { text = "France", key = "flag-fr" });
        flag.Add(new Flags { text = "Finland", key = "flag-fi" });
        flag.Add(new Flags { text = "Greenland", key = "flag-gl" });
        flag.Add(new Flags { text = "India", key = "flag-in" });
        flag.Add(new Flags { text = "Indonesia", key = "flag-id" });
        flag.Add(new Flags { text = "Malaysia", key = "flag-my" });
        flag.Add(new Flags { text = "Mexico", key = "flag-mx" });
        flag.Add(new Flags { text = "New Zealand", key = "flag-nz" });
        flag.Add(new Flags { text = "Netherlands", key = "flag-nl" });
        flag.Add(new Flags { text = "Norway", key = "flag-no" });
        flag.Add(new Flags { text = "Portugal", key = "flag-pt" });
        flag.Add(new Flags { text = "Poland", key = "flag-pl" });
        flag.Add(new Flags { text = "Qatar", key = "flag-qa" });
        flag.Add(new Flags { text = "Romania", key = "flag-ro" });
        flag.Add(new Flags { text = "Spain", key = "flag-es" });
        flag.Add(new Flags { text = "Singapore", key = "flag-sg" });
        flag.Add(new Flags { text = "Saudi Arabia", key = "flag-sa" });
        flag.Add(new Flags { text = "Thailand", key = "flag-th" });
        flag.Add(new Flags { text = "Turkey", key = "flag-tr" });
        flag.Add(new Flags { text = "Ukraine", key = "flag-ua" });
        flag.Add(new Flags { text = "United States", key = "flag-us" });
        flag.Add(new Flags { text = "Uruguay", key = "flag-uy" });
        flag.Add(new Flags { text = "Viet Nam", key = "flag-vn" });
        return flag;
    }
}