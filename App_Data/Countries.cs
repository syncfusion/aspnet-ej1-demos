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

public class Countries
{
	public string text { get; set; }
	public string category { get; set; }
	public static List<Countries> GetCountries()
	{
		List<Countries> country = new List<Countries>();
		country.Add(new Countries { text = "Austria", category = "A" });
		country.Add(new Countries { text = "Australia", category = "A" });
		country.Add(new Countries { text = "Antarctica", category = "A" });
		country.Add(new Countries { text = "Bangladesh", category = "B" });
		country.Add(new Countries { text = "Brazil", category = "B" });
		country.Add(new Countries { text = "Canada", category = "C" });
		country.Add(new Countries { text = "Cuba", category = "C" });
		country.Add(new Countries { text = "Denmark", category = "D" });
		country.Add(new Countries { text = "Dominica", category = "D" });
		country.Add(new Countries { text = "Europe", category = "E" });
		country.Add(new Countries { text = "Egypt", category = "E" });
		country.Add(new Countries { text = "England", category = "E" });
		country.Add(new Countries { text = "India", category = "I" });
		country.Add(new Countries { text = "Indonesia", category = "I" });
		country.Add(new Countries { text = "Ireland", category = "I" });
		country.Add(new Countries { text = "Italy", category = "I" });
		country.Add(new Countries { text = "France", category = "F" });
		country.Add(new Countries { text = "Finland", category = "F" });
		country.Add(new Countries { text = "Germany", category = "G" });
		country.Add(new Countries { text = "Greece", category = "G" });
		country.Add(new Countries { text = "Greenland", category = "G" });
		country.Add(new Countries { text = "Haiti", category = "H" });
		country.Add(new Countries { text = "Hong Kong", category = "H" });
		country.Add(new Countries { text = "Japan", category = "J" });
		country.Add(new Countries { text = "Jordan", category = "J" });
		country.Add(new Countries { text = "Jamaica", category = "J" });
		country.Add(new Countries { text = "Kenya", category = "K" });
		country.Add(new Countries { text = "Kuwait", category = "K" });
		country.Add(new Countries { text = "Korea", category = "K" });
		country.Add(new Countries { text = "Latvia", category = "L" });
		country.Add(new Countries { text = "Lebanon", category = "L" });
		country.Add(new Countries { text = "Leichenstein", category = "L" });
		country.Add(new Countries { text = "Malaysia", category = "M" });
		country.Add(new Countries { text = "Mexico", category = "M" });
		country.Add(new Countries { text = "Mozambique", category = "M" });
		country.Add(new Countries { text = "Madagascar", category = "M" });
		country.Add(new Countries { text = "Midway Islands", category = "M" });
		country.Add(new Countries { text = "Nepal", category = "N" });
		country.Add(new Countries { text = "New Zealand", category = "N" });
		country.Add(new Countries { text = "Oman", category = "O" });
		country.Add(new Countries { text = "Philippines", category = "P" });
		country.Add(new Countries { text = "Poland", category = "P" });
		country.Add(new Countries { text = "Qatar", category = "Q" });
		country.Add(new Countries { text = "Romania", category = "R" });
		country.Add(new Countries { text = "Russia", category = "R" });
		country.Add(new Countries { text = "Switzerland", category = "S" });
		country.Add(new Countries { text = "Sweden", category = "S" });
		country.Add(new Countries { text = "Scotland", category = "S" });
		country.Add(new Countries { text = "Tibet", category = "T" });
		country.Add(new Countries { text = "Turkey", category = "T" });
		country.Add(new Countries { text = "United States", category = "U" });
		country.Add(new Countries { text = "Uruguay", category = "U" });
		country.Add(new Countries { text = "Vatican City", category = "V" });
		country.Add(new Countries { text = "Vietnam", category = "V" });
		country.Add(new Countries { text = "Zambia", category = "Z" });
		country.Add(new Countries { text = "Zimbabwe", category = "Z" });
		return country;
	}
}
