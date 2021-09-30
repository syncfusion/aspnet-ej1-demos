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
public class FullRowSelectDataSource
{
    public FullRowSelectDataSource(int _id, int _parentid, string _text, string _hasChild = "", string _expanded = "", string _selected = "")
    {
        this.ID = _id;
        this.ParentID = _parentid;
        this.Text = _text;
        this.HasChild = _hasChild;
        this.Expanded = _expanded;
        this.Selected = _selected;
    }
    public FullRowSelectDataSource() { }

    [Browsable(true)]
    public int ID { get; set; }

    [Browsable(true)]
    public int ParentID { get; set; }

    [Browsable(true)]
    public string Text { get; set; }

    [Browsable(true)]
    public string HasChild { get; set; }

    [Browsable(true)]
    public string Expanded { get; set; }

    [Browsable(true)]
    public string Selected { get; set; }

    public List<FullRowSelectDataSource> GetFullRowItems()
    {
        List<FullRowSelectDataSource> fullRowData = new List<FullRowSelectDataSource>();
        fullRowData.Add(new FullRowSelectDataSource(1, 0, "Discover Music", "true", "true"));
        fullRowData.Add(new FullRowSelectDataSource(2, 1, "Hot Singles", "", "", "true"));
        fullRowData.Add(new FullRowSelectDataSource(3, 1, "Rising Artists"));
        fullRowData.Add(new FullRowSelectDataSource(4, 1, "Live Music"));
        fullRowData.Add(new FullRowSelectDataSource(6, 1, "Best of 2013 So Far"));
        fullRowData.Add(new FullRowSelectDataSource(7, 0, "Sales and Events", "true", "true"));
        fullRowData.Add(new FullRowSelectDataSource(8, 7, "100 Albums - $5 Each"));
        fullRowData.Add(new FullRowSelectDataSource(9, 7, "Hip-Hop and R&B Sale"));
        fullRowData.Add(new FullRowSelectDataSource(10, 7, "CD Deals"));
        fullRowData.Add(new FullRowSelectDataSource(11, 0, "Categories", "true"));
        fullRowData.Add(new FullRowSelectDataSource(12, 11, "Songs"));
        fullRowData.Add(new FullRowSelectDataSource(13, 11, "Bestselling Albums"));
        fullRowData.Add(new FullRowSelectDataSource(14, 11, "New Releases"));
        fullRowData.Add(new FullRowSelectDataSource(15, 11, "Bestselling Songs"));
        fullRowData.Add(new FullRowSelectDataSource(16, 0, "MP3 Albums", "true"));
        fullRowData.Add(new FullRowSelectDataSource(17, 16, "Rock"));
        fullRowData.Add(new FullRowSelectDataSource(18, 16, "Gospel"));
        fullRowData.Add(new FullRowSelectDataSource(19, 16, "Latin Music"));
        fullRowData.Add(new FullRowSelectDataSource(20, 16, "Jazz"));
        fullRowData.Add(new FullRowSelectDataSource(21, 0, "More in Music", "true"));
        fullRowData.Add(new FullRowSelectDataSource(22, 21, "Music Trade-In"));
        fullRowData.Add(new FullRowSelectDataSource(23, 21, "Redeem a Gift Card"));
        fullRowData.Add(new FullRowSelectDataSource(24, 21, "Band T-Shirts"));
        fullRowData.Add(new FullRowSelectDataSource(25, 21, "Mobile MVC"));
        return fullRowData;
    }
}