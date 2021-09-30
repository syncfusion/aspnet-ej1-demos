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

[Serializable]
public class TabData
{

	public TabData(int _id, int _parentid, string _text)
	{
		this.ID = _id;
		this.ParentID = _parentid;
		this.Text = _text;
	}
	public TabData()
	{

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


	public List<TabData> GetTabItems()
	{
		List<TabData> data = new List<TabData>();
		data.Add(new TabData(1, 0, "Railways"));
		data.Add(new TabData(2, 0, "Roadways"));
		data.Add(new TabData(3, 0, "Airways"));
		data.Add(new TabData(4, 0, "Waterways"));
		data.Add(new TabData(5, 1, "Electric Trains"));
		data.Add(new TabData(6, 1, "Diesel Trains"));
		data.Add(new TabData(7, 2, "Heavy Motor Vehicles"));
		data.Add(new TabData(8, 2, "Light Motor Vehicles"));
		data.Add(new TabData(9, 3, "Aeroplanes"));
		data.Add(new TabData(10, 3, "Helicopters"));
		data.Add(new TabData(11, 4, "Ships"));
		data.Add(new TabData(12, 4, "Submarines"));

		return data;
	}
}
