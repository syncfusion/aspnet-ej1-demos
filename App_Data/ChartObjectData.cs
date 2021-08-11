#region Copyright
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion

using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Security.Permissions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml;



public class ChartObjectData
{

    [DataObjectMethod(DataObjectMethodType.Select)]
    public List<ChartSource> GetRecords()
    {

        List<ChartSource> list = new List<ChartSource>();
        list.Add(new ChartSource("USA", 20));
        list.Add(new ChartSource("India", 40));
        list.Add(new ChartSource("Brazil", 25));
        list.Add(new ChartSource("Russia", 15));
        list.Add(new ChartSource("Japan", 12));
        list.Add(new ChartSource("Germany", 13));
        list.Add(new ChartSource("China", 45));
        list.Add(new ChartSource("Australia", 18));
        list.Add(new ChartSource("England", 10));
        list.Add(new ChartSource("Canada", 15));
        return list;

    }

}

[Serializable]
public class ChartSource
{
    public string _country;
    public int _population;
   

    public ChartSource(string _country, int _pop)
    {
        this.Country = _country;
        this._population=_pop;
    }

    public int Population
    {
        get { return _population; }
        set { value = _population; }
    }
    public string Country
    {
        get { return _country; }
        set { _country = value;}
    }

   
}