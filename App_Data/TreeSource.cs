using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.ComponentModel;
using System.Web.Script.Serialization;
using Syncfusion.JavaScript;

/// <summary>
/// Summary description for Data
/// </summary>
public class TreeSource
{
    public SqlConnection odc;
    public TreeSource()
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