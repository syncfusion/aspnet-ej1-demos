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
public class TreeLocalDataSource
{

    public TreeLocalDataSource()
    { }
    public TreeLocalDataSource(int _id, int _parentid, string _text, string _hasChild, string _expanded)
    {
        this.ID = _id;
        this.ParentID = _parentid;
        this.Text = _text;
        this.HasChild = _hasChild;
        this.Expanded = _expanded;
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
    public List<TreeLocalDataSource> GetTreeDataItems()
    {
        List<TreeLocalDataSource> data = new List<TreeLocalDataSource>();

        data.Add(new TreeLocalDataSource(1, 0, "Discover Music", "true", "true"));
        data.Add(new TreeLocalDataSource(2, 1, "Hot Singles", "", ""));
        data.Add(new TreeLocalDataSource(3, 1, "Rising Artists", "", ""));
        data.Add(new TreeLocalDataSource(4, 1, "Live Music", "", ""));
        data.Add(new TreeLocalDataSource(6, 1, "Best of 2013 So Far", "", ""));
        data.Add(new TreeLocalDataSource(7, 0, "Sales and Events", "true", "true"));
        data.Add(new TreeLocalDataSource(8, 7, "100 Albums - $5 Each", "", ""));
        data.Add(new TreeLocalDataSource(9, 7, "Hip-Hop and R&B Sale", "", ""));
        data.Add(new TreeLocalDataSource(10, 7, "CD Deals", "", ""));
        data.Add(new TreeLocalDataSource(11, 0, "Categories", "true", ""));
        data.Add(new TreeLocalDataSource(12, 11, "Songs", "", ""));
        data.Add(new TreeLocalDataSource(13, 11, "Bestselling Albums", "", ""));
        data.Add(new TreeLocalDataSource(14, 11, "New Releases", "", ""));
        data.Add(new TreeLocalDataSource(15, 11, "Bestselling Songs", "", ""));
        data.Add(new TreeLocalDataSource(16, 0, "MP3 Albums", "true", ""));
        data.Add(new TreeLocalDataSource(17, 16, "Rock", "", ""));
        data.Add(new TreeLocalDataSource(18, 16, "Gospel", "", ""));
        data.Add(new TreeLocalDataSource(19, 16, "Latin Music", "", ""));
        data.Add(new TreeLocalDataSource(20, 16, "Jazz", "", ""));
        data.Add(new TreeLocalDataSource(21, 0, "More in Music", "true", ""));
        data.Add(new TreeLocalDataSource(22, 21, "Music Trade-In", "", ""));
        data.Add(new TreeLocalDataSource(23, 21, "Redeem a Gift Card", "", ""));
        data.Add(new TreeLocalDataSource(24, 21, "Band T-Shirts", "", ""));
        data.Add(new TreeLocalDataSource(25, 21, "Mobile MVC", "", ""));

        return data;
    }
}