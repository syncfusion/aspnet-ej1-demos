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
public class Colors
{
	public string text { get; set; }
	public static List<Colors> GetColors()
	{
		List<Colors> color = new List<Colors>();
		color.Add(new Colors { text = "AliceBlue" });
		color.Add(new Colors { text = "AntiqueWhite" });
		color.Add(new Colors { text = "Black" });
		color.Add(new Colors { text = "Blue" });
		color.Add(new Colors { text = "Brown" });
		color.Add(new Colors { text = "Chocolate" });
		color.Add(new Colors { text = "Cyan" });
		color.Add(new Colors { text = "DarkBlue" });
		color.Add(new Colors { text = "DarkGreen" });
		color.Add(new Colors { text = "DarkRed" });
		color.Add(new Colors { text = "ForestGreen" });
		color.Add(new Colors { text = "Fuchsia" });
		color.Add(new Colors { text = "LemonChiffon" });
		color.Add(new Colors { text = "Lime" });
		color.Add(new Colors { text = "Magenta" });
		color.Add(new Colors { text = "Olive" });
		color.Add(new Colors { text = "Orange" });
		color.Add(new Colors { text = "OrangeRed" });
		color.Add(new Colors { text = "Pink" });
		color.Add(new Colors { text = "Purple" });
		color.Add(new Colors { text = "PowderBlue" });
		color.Add(new Colors { text = "Red" });
		color.Add(new Colors { text = "RosyBrown" });
		color.Add(new Colors { text = "RoyalBlue" });
		color.Add(new Colors { text = "Silver" });
		color.Add(new Colors { text = "SkyBlue" });
		color.Add(new Colors { text = "SlateGray" });
		color.Add(new Colors { text = "Tan" });
		color.Add(new Colors { text = "Teal" });
		color.Add(new Colors { text = "Turquoise" });
		color.Add(new Colors { text = "Violet" });
		color.Add(new Colors { text = "Wheat" });
		color.Add(new Colors { text = "Yellow" });
		color.Add(new Colors { text = "YellowGreen" });
		return color;
	}
}