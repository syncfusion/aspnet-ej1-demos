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
using System.Data.SqlClient;
using System.ComponentModel;
using System.Web.Script.Serialization;
using Syncfusion.JavaScript;

[Serializable]
public class MultiSelectDataSource
{

    public MultiSelectDataSource(int _id, int _parentid, string _text, string _hasChild, string _expanded, string _selected)
    {
        this.ID = _id;
        this.ParentID = _parentid;
        this.Text = _text;
        this.HasChild = _hasChild;
        this.Expanded = _expanded;
        this.Selected = _selected;
    }
    public MultiSelectDataSource()
    { }

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
    [Browsable(true)]
    public string HasChild
    {
        get;
        set;
    }
    [Browsable(true)]
    public string Expanded
    {
        get;
        set;
    }
    [Browsable(true)]
    public string Selected
    {
        get;
        set;
    }

    public List<MultiSelectDataSource> GetTreeViewItems()
    {
        List<MultiSelectDataSource> data = new List<MultiSelectDataSource>();
        data.Add(new MultiSelectDataSource(1, 0, "Discover Music", "true", "true", ""));
        data.Add(new MultiSelectDataSource(2, 1, "Hot Singles", "", "", "true"));
        data.Add(new MultiSelectDataSource(3, 1, "Rising Artists", "", "", "true"));
        data.Add(new MultiSelectDataSource(4, 1, "Live Music", "", "", "true"));
        data.Add(new MultiSelectDataSource(6, 1, "Best of 2013 So Far", "", "", ""));
        data.Add(new MultiSelectDataSource(7, 0, "Sales and Events", "true", "true", ""));
        data.Add(new MultiSelectDataSource(8, 7, "100 Albums - $5 Each", "", "", ""));
        data.Add(new MultiSelectDataSource(9, 7, "Hip-Hop and R&B Sale", "", "", ""));
        data.Add(new MultiSelectDataSource(10, 7, "CD Deals", "", "", ""));
        data.Add(new MultiSelectDataSource(11, 0, "Categories", "true", "", ""));
        data.Add(new MultiSelectDataSource(12, 11, "Songs", "", "", ""));
        data.Add(new MultiSelectDataSource(13, 11, "Bestselling Albums", "", "", ""));
        data.Add(new MultiSelectDataSource(14, 11, "New Releases", "", "", ""));
        data.Add(new MultiSelectDataSource(15, 11, "Bestselling Songs", "", "", ""));
        data.Add(new MultiSelectDataSource(16, 0, "MP3 Albums", "true", "", ""));
        data.Add(new MultiSelectDataSource(17, 16, "Rock", "", "", ""));
        data.Add(new MultiSelectDataSource(18, 16, "Gospel", "", "", ""));
        data.Add(new MultiSelectDataSource(19, 16, "Latin Music", "", "", ""));
        data.Add(new MultiSelectDataSource(20, 16, "Jazz", "", "", ""));
        data.Add(new MultiSelectDataSource(21, 0, "More in Music", "true", "", ""));
        data.Add(new MultiSelectDataSource(22, 21, "Music Trade-In", "", "", ""));
        data.Add(new MultiSelectDataSource(23, 21, "Redeem a Gift Card", "", "", ""));
        data.Add(new MultiSelectDataSource(24, 21, "Band T-Shirts", "", "", ""));
        data.Add(new MultiSelectDataSource(25, 21, "Mobile MVC", "", "", ""));
        return data;
    }
}