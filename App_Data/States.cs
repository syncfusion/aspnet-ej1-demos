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
public class States
{
	public string index { get; set; }
	public string countryName { get; set; }
	public static List<States> GetStates()
	{
		List<States> state = new List<States>();
		state.Add(new States { index = "s1", countryName = "Alabama" });
		state.Add(new States { index = "s2", countryName = "Alaska" });
		state.Add(new States { index = "s3", countryName = "Arizona" });
		state.Add(new States { index = "s4", countryName = "Arkansas" });
		state.Add(new States { index = "s5", countryName = "California" });
		state.Add(new States { index = "s6", countryName = "Colorado" });
		state.Add(new States { index = "s7", countryName = "Connecticut" });
		state.Add(new States { index = "s8", countryName = "Delaware" });
		state.Add(new States { index = "s9", countryName = "Florida" });
		state.Add(new States { index = "s10", countryName = "Georgia" });
		state.Add(new States { index = "s11", countryName = "Hawaii" });
		state.Add(new States { index = "s12", countryName = "Idaho" });
		state.Add(new States { index = "s13", countryName = "Illinois" });
		state.Add(new States { index = "s14", countryName = "Indiana" });
		state.Add(new States { index = "s15", countryName = "Iowa" });
		state.Add(new States { index = "s16", countryName = "Kansas" });
		state.Add(new States { index = "s17", countryName = "Kentucky" });
		state.Add(new States { index = "s18", countryName = "Louisiana" });
		state.Add(new States { index = "s19", countryName = "Maine" });
		state.Add(new States { index = "s20", countryName = "Maryland" });
		state.Add(new States { index = "s21", countryName = "Massachusetts" });
		state.Add(new States { index = "s22", countryName = "Michigan" });
		state.Add(new States { index = "s23", countryName = "Montana" });
		state.Add(new States { index = "s24", countryName = "New Mexico" });
		state.Add(new States { index = "s25", countryName = "New York" });
		state.Add(new States { index = "s26", countryName = "North Carolina" });
		state.Add(new States { index = "s27", countryName = "Nevada" });
		state.Add(new States { index = "s28", countryName = "New Jersey" });
		state.Add(new States { index = "s29", countryName = "Pennsylvania" });
		state.Add(new States { index = "s30", countryName = "Ohio" });
		state.Add(new States { index = "s31", countryName = "Rhode Island" });
		state.Add(new States { index = "s32", countryName = "South Carolina" });
		state.Add(new States { index = "s33", countryName = "Tennessee" });
		state.Add(new States { index = "s34", countryName = "Utah" });
		state.Add(new States { index = "s35", countryName = "Virginia" });
		state.Add(new States { index = "s36", countryName = "Washington" });
		return state;
	}
}