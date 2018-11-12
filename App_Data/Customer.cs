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