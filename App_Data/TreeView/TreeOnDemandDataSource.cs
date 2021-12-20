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
public class TreeOnDemandDataSource
{

    public TreeOnDemandDataSource(int _id, int _parentid, string _text, string _hasChild)
    {
        this.ID = _id;
        this.ParentID = _parentid;
        this.Text = _text;
        this.HasChild = _hasChild;
    }
    public TreeOnDemandDataSource()
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

    public List<TreeOnDemandDataSource> GetTreeItems()
    {
        List<TreeOnDemandDataSource> data = new List<TreeOnDemandDataSource>();
        data.Add(new TreeOnDemandDataSource(1, 0, "Local Disk(C:)", "true"));
        data.Add(new TreeOnDemandDataSource(2, 1, "Folder 1", ""));
        data.Add(new TreeOnDemandDataSource(3, 1, "Folder 2", ""));
        data.Add(new TreeOnDemandDataSource(4, 1, "Folder 3", "true"));
        data.Add(new TreeOnDemandDataSource(5, 4, "File 1", ""));
        data.Add(new TreeOnDemandDataSource(6, 4, "File 2", "true"));
        data.Add(new TreeOnDemandDataSource(7, 6, "File 3", ""));
        data.Add(new TreeOnDemandDataSource(9, 0, "Local Disk(D:)", "true"));
        data.Add(new TreeOnDemandDataSource(10, 9, "Folder 4", "true"));
        data.Add(new TreeOnDemandDataSource(11, 10, "File 4", ""));
        data.Add(new TreeOnDemandDataSource(12, 10, "File 5", ""));
        data.Add(new TreeOnDemandDataSource(13, 10, "File 6", ""));
        data.Add(new TreeOnDemandDataSource(14, 9, "Folder 5", ""));
        data.Add(new TreeOnDemandDataSource(15, 9, "Folder 6", ""));
        data.Add(new TreeOnDemandDataSource(16, 0, "Local Disk(E:)", "true"));
        data.Add(new TreeOnDemandDataSource(17, 16, "Folder 7", "true"));
        data.Add(new TreeOnDemandDataSource(18, 17, "File 7", ""));
        data.Add(new TreeOnDemandDataSource(19, 17, "File 8", ""));
        data.Add(new TreeOnDemandDataSource(20, 17, "File 9", ""));
        data.Add(new TreeOnDemandDataSource(21, 16, "Folder 8", ""));
        data.Add(new TreeOnDemandDataSource(22, 16, "Folder 9", ""));
        return data;
    }
}