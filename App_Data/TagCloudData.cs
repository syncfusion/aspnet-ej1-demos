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
public class TagCloudData
{

	public TagCloudData(string _text, string _url, int _frequency)
	{
		this.text = _text;
		this.url = _url;
		this.frequency = _frequency;

	}
	public TagCloudData()
	{

	}


	public string text
	{
		get;
		set;
	}


	public string url
	{
		get;
		set;
	}

	public int frequency
	{
		get;
		set;
	}


	public List<TagCloudData> GetTagCloudItems()
	{
		List<TagCloudData> data = new List<TagCloudData>();
		data.Add(new TagCloudData("Hindustan Motors", "http://www.zigwheels.com/newcars/Hindustan-Motors", 10));
		data.Add(new TagCloudData("Bentley Continental ", "http://www.zigwheels.com/newcars/Bentley/Continental", 3));
		data.Add(new TagCloudData("BMW 7", "http://www.zigwheels.com/newcars/BMW/7-Series", 4));
		data.Add(new TagCloudData("Bugatti Veyron", "http://www.zigwheels.com/newcars/Bugatti/Veyron", 2));
		data.Add(new TagCloudData("Honda", "http://www.zigwheels.com/newcars/Honda", 3));
		data.Add(new TagCloudData("Chevrolet Beat", "http://www.zigwheels.com/newcars/Chevrolet/Beat", 7));
		return data;
	}
	public List<TagCloudData> GetRtlTagCloudItems()
	{
		List<TagCloudData> data = new List<TagCloudData>();
		data.Add(new TagCloudData("جوجل", "http://www.google.com", 12));
		data.Add(new TagCloudData("كل الأشياء الرقمية", "http://allthingsd.com/", 3));
		data.Add(new TagCloudData("الفنون تكنيكا", "http://arstechnica.com/", 8));
		data.Add(new TagCloudData("بيزنس ويك", "http://www.businessweek.com/", 2));
		data.Add(new TagCloudData("ياهو", "http://in.yahoo.com/", 12));
		data.Add(new TagCloudData("مركز الشبكات", "http://www.centernetworks.com/", 5));
		return data;
	}
}
