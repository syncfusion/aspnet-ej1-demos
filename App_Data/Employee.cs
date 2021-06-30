#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Data;
using System.Data.Sql;
using System.Configuration;
using System.Web;
using System.Web.Hosting;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;


public class EmployeeList
{
    private SqlConnection odc;
    protected Exception Ex=null;
    public EmployeeList()
    {

        odc = new SqlConnection("Network Address=66.135.59.108,49489;initial catalog=SampleDB;password=Sync_samples;persist security info=True;user id=sa;packet size=4096;Pooling=true");
    }

    /// <summary>
    /// Return DataView from DB Table
    /// </summary>
    public DataSet GetRecords()
    {
               
        DataSet ds = new DataSet();
        
        try
        {
            SqlDataAdapter odda = new SqlDataAdapter("SELECT top 10 [FirstName], [LastName],[Address], [City] FROM [Customers]", odc);
            odda.Fill(ds, "Customers");
        }
        catch (Exception e)
        {
            throw new Exception(e.Message);
            
        }

        //DataColumn[] key =  new DataColumn[1] ;
        //key[0] = ds.Tables[0].Columns[0];
        //ds.Tables[0].PrimaryKey = key;
        //DataView dv = new DataView(ds.Tables[0]);
        return ds;
    }

   
}

public class EmployeeList1
{
    private SqlConnection odc;
    protected Exception Ex = null;
    public EmployeeList1()
    {
    
        odc = new SqlConnection("Network Address=66.135.59.108,49489;initial catalog=Data;password=Sync_samples;persist security info=True;user id=sa;packet size=4096;Pooling=true");
    }

    /// <summary>
    /// Return DataView from DB Table
    /// </summary>
    public DataSet GetRecords()
    {

        DataSet ds = new DataSet();

        try
        {
            SqlDataAdapter odda = new SqlDataAdapter("SELECT top 10 [id], [parentId],[Text] FROM [Links]", odc);
            odda.Fill(ds, "Customers");
        }
        catch (Exception e)
        {
            throw new Exception(e.Message);

        }

        //DataColumn[] key =  new DataColumn[1] ;
        //key[0] = ds.Tables[0].Columns[0];
        //ds.Tables[0].PrimaryKey = key;
        //DataView dv = new DataView(ds.Tables[0]);
        return ds;
    }


}
public class EmployeeList3
{
    private SqlConnection odc;
    protected Exception Ex = null;
    public EmployeeList3()
    {
       
        odc = new SqlConnection("Network Address=66.135.59.108,49489;initial catalog=DataBind;password=Sync_samples;persist security info=True;user id=sa;packet size=4096;Pooling=true");
    }

    /// <summary>
    /// Return DataView from DB Table
    /// </summary>
    public DataSet GetRecords()
    {

        DataSet ds = new DataSet();

        try
        {
            SqlDataAdapter odda = new SqlDataAdapter("SELECT top 16 [id], [parentId],[Text] FROM [Links]", odc);
            odda.Fill(ds, "Customers");
        }
        catch (Exception e)
        {
            throw new Exception(e.Message);

        }

        //DataColumn[] key =  new DataColumn[1] ;
        //key[0] = ds.Tables[0].Columns[0];
        //ds.Tables[0].PrimaryKey = key;
        //DataView dv = new DataView(ds.Tables[0]);
        return ds;
    }


}

