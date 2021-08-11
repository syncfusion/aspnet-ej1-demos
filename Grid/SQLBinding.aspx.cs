#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Syncfusion.JavaScript.Web;

namespace WebSampleBrowser.Grid
{
    public partial class SQLBinding : System.Web.UI.Page
    {

        DataTable dt = new DataTable("Order");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLConnectionString"].ToString());
                dt = new DataTable("Order");
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = myConnection;
                cmd.CommandText = "select * from Orders";
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                if (myConnection.State == ConnectionState.Closed)
                {
                    myConnection.Open();
                }
                da.Fill(dt);
                Session["SqlDataSource"] = dt;
                dataBind();
            }

        }
        protected void dataBind()
        {

            OrdersGrid.DataSource = (DataTable)Session["SqlDataSource"];
            OrdersGrid.DataBind();

        }

        protected void EditEvents_ServerEditRow(object sender, GridEventArgs e)
        {
            EditAction(e.EventType, e.Arguments["data"]);

        }

        protected void EditEvents_ServerAddRow(object sender, GridEventArgs e)
        {
            EditAction(e.EventType, e.Arguments["data"]);
        }

        protected void EditEvents_ServerDeleteRow(object sender, GridEventArgs e)
        {
            EditAction(e.EventType, e.Arguments["data"]);
        }

        protected void EditAction(string eventType, object record)
        {
            SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLConnectionString"].ToString());
            dt = Session["SqlDataSource"] as DataTable;
            Dictionary<string, object> KeyVal = record as Dictionary<string, object>;
            if (eventType == "endEdit")
            {
                var Order = KeyVal.Values.ToArray();
                foreach (DataRow dr in dt.Rows)
                {
                    if (Convert.ToInt32(dr["OrderID"]) == Convert.ToInt32(Order[0]))
                    {
                        dr["EmployeeID"] = Order[1];
                        dr["Freight"] = Order[2];
                        dr["ShipCity"] = Order[3];
                        dr["ShipCountry"] = Order[4];
                        dr.AcceptChanges();
                    }

                }
            }

            else if (eventType == "endAdd")
            {
                var Order = KeyVal.Values.ToArray();
                DataRow dr = dt.NewRow();
                dr["OrderID"] = Order[0];
                dr["EmployeeID"] = Order[1];
                dr["Freight"] = Order[2];
                dr["ShipCity"] = Order[3];
                dr["ShipCountry"] = Order[4];
                dt.Rows.Add(dr);
            }
            else if (eventType == "endDelete")
            {
                var Order = KeyVal.Values.ToArray();
                if (Session["SqlDataSource"] != null)
                {
                    DataRow[] rows = dt.Select("OrderID = " + Order[0]);

                    foreach (DataRow row in rows)
                        dt.Rows.Remove(row);

                }
            }
            Session["SqlDataSource"] = dt;
            dataBind();
        }

    }
}