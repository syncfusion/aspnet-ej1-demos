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
using Syncfusion.JavaScript.DataVisualization.Maps;

/// <summary>
/// Summary description for Data
/// </summary>
public class Data
{
    public SqlConnection odc;
    public Data()
	{
        
        odc = new SqlConnection();
        
        odc.ConnectionString = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;User Instance=True";
    }
    public DataSet GetRecords()
    {

        DataSet ds = new DataSet();

        //try
        {
            odc.Open();
            SqlDataAdapter odda = new SqlDataAdapter("select * from [DataSource]", odc);
            odda.Fill(ds, "DataSource");
        }
        //catch (Exception e)
        //{
        //    throw new Exception(e.Message);

        //}
        return ds;
    }
}

[Serializable]
public class ToolData
{

    public ToolData(string _id, string _css, string _tip)
    {
        this.ID = _id;
        this.Tooltip = _tip;
        this.Css = _css;
    }
    public ToolData()
    {

    }

    [Browsable(true)]
    public string ID
    {
        get;
        set;
    }

    [Browsable(true)]
    public string Css
    {
        get;
        set;
    }

    [Browsable(true)]
    public string Tooltip
    {
        get;
        set;
    }



    public List<ToolData> GetToolItems()
    {
        List<ToolData> data = new List<ToolData>();
        data.Add(new ToolData("1", "mailtools movetofolder", "Mail"));
        data.Add(new ToolData("2", "mailtools categorize", "Scheduler"));
        data.Add(new ToolData("3", "mailtools flag", "Calculator"));
        data.Add(new ToolData("4", "mailtools forward", "Sticky Notes"));
        data.Add(new ToolData("5", "mailtools newmail", "Calendar"));
        data.Add(new ToolData("6", "mailtools reply", "Notes"));
        data.Add(new ToolData("7", "mailtools done", "Delete"));
        return data;
    }
}


[Serializable]
public class AutoData
{

    public AutoData(string _text, string _spriteCss)
    {

        this.text = _text;
        this.sprite = _spriteCss;
    }
    public AutoData()
    {

    }

    [Browsable(true)]
    public string text
    {
        get;
        set;
    }

    [Browsable(true)]
    public string sprite
    {
        get;
        set;
    }


    public List<AutoData> GetAutoDataItems()
    {
        List<AutoData> data = new List<AutoData>();

        data.Add(new AutoData("Algeria", "flag-dz"));
        data.Add(new AutoData("Argentina", "flag-ar"));
        data.Add(new AutoData("Armenia", "flag-am"));
        data.Add(new AutoData("Brazil", "flag-br"));
        data.Add(new AutoData("Bangladesh", "flag-bd"));
        data.Add(new AutoData("Canada", "flag-ca"));
        data.Add(new AutoData("Cuba", "flag-cu"));
        data.Add(new AutoData("China", "flag-cn"));
        data.Add(new AutoData("Denmark", "flag-dk"));
        data.Add(new AutoData("Estonia", "flag-ee"));
        data.Add(new AutoData("Egypt", "flag-eg"));
        data.Add(new AutoData("France", "flag-fr"));
        data.Add(new AutoData("Finland", "flag-fi"));
        data.Add(new AutoData("Greenland", "flag-gl"));
        data.Add(new AutoData("India", "flag-in"));
        data.Add(new AutoData("Indonesia", "flag-id"));
        data.Add(new AutoData("Malaysia", "flag-my"));
        data.Add(new AutoData("Mexico", "flag-mx"));
        data.Add(new AutoData("New Zealand", "flag-nz"));
        data.Add(new AutoData("Netherlands", "flag-nl"));
        data.Add(new AutoData("Norway", "flag-no"));
        data.Add(new AutoData("Portugal", "flag-pt"));
        data.Add(new AutoData("Poland", "flag-pl"));
        data.Add(new AutoData("Qatar", "flag-qa"));
        return data;
    }
}

public class Languages
{
    public string text { get; set; }
    public string skill { get; set; }
    public static List<Languages> GetLanguages()
    {
        List<Languages> language = new List<Languages>();
        language.Add(new Languages { text = "ActionScript" });
        language.Add(new Languages { text = "AppleScript" });
        language.Add(new Languages { text = "Asp" });
        language.Add(new Languages { text = "BASIC" });
        language.Add(new Languages { text = "BeanShell" });
        language.Add(new Languages { text = "C" });
        language.Add(new Languages { text = "C++" });
        language.Add(new Languages { text = "C#" });
        language.Add(new Languages { text = "Clojure" });
        language.Add(new Languages { text = "COBOL" });
        language.Add(new Languages { text = "ColdFusion" });
        language.Add(new Languages { text = "DataFlex" });
        language.Add(new Languages { text = "DCL" });
        language.Add(new Languages { text = "Erlang" });
        language.Add(new Languages { text = "E#" });
        language.Add(new Languages { text = "Fortran" });
        language.Add(new Languages { text = "F#" });
        language.Add(new Languages { text = "Flex" });
        language.Add(new Languages { text = "Google Apps Script" });
        language.Add(new Languages { text = "Groovy" });
        language.Add(new Languages { text = "Haskell" });
        language.Add(new Languages { text = "Hope" });
        language.Add(new Languages { text = "IBM HAScript" });
        language.Add(new Languages { text = "Java" });
        language.Add(new Languages { text = "JavaScript" });
        language.Add(new Languages { text = "J#" });
        language.Add(new Languages { text = "Lisp" });
        language.Add(new Languages { text = "MATLAB" });
        language.Add(new Languages { text = "Oak" });
        language.Add(new Languages { text = "Perl" });
        language.Add(new Languages { text = "PHP" });
        language.Add(new Languages { text = "Python" });
        language.Add(new Languages { text = "Ruby" });
        language.Add(new Languages { text = "Scala" });
        language.Add(new Languages { text = "Scheme" });
        language.Add(new Languages { text = "T-SQL" });
        language.Add(new Languages { text = "WebQL" });
        language.Add(new Languages { text = "ZOPL" });
        return language;
    }
}





