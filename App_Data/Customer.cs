#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System.Data;
using System.Web.UI.WebControls;

/// <summary>
/// An example Customer class
/// </summary>

public class Customer
{
    public int CustomerID { get; set; }
    public string Name { get; set; }
    public string City { get; set; }

    public Customer()
    { }

    /// <summary>
    /// Gets Customers and returns them in DataSet
    /// </summary>
    public DataSet GetCustomers()
    {
        // Add logic here for actual retrieval of data from DB

        DataSet ds = new DataSet();
     
        DataTable dt = new DataTable("Customers");
        dt.Columns.Add("CustomerId", typeof(System.Int32));
        dt.Columns.Add("CustomerName", typeof(System.String));
        dt.Columns.Add("CustomerCity", typeof(System.String));

        dt.Rows.Add(new object[] { 1, "Test Customer", "Glasgow" });

        ds.Tables.Add(dt);
        return ds;
    }
}