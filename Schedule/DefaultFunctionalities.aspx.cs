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

namespace WebSampleBrowser.Schedule
{
    public partial class DefaultFunctionalities : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string constr = ConfigurationManager.ConnectionStrings["ScheduleDBConnectionString"].ConnectionString;
            //SqlConnection con = new SqlConnection(constr);
            //string query = "select * from DefaultSchedule";
            //SqlCommand cmd = new SqlCommand(query, con);
            //SqlDataAdapter da = new SqlDataAdapter();
            //da.SelectCommand = cmd;
            //DataTable dt = new DataTable();
            //da.Fill(dt);
            ////List<DataRow> list = 
            //this.Schedule1.AppointmentSettings.DataSource = dt;








            //SqlConnection conn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ScheduleData.mdf;Integrated Security=True;User Instance=True");
            //string constr = ConfigurationManager.ConnectionStrings["ScheduleDBConnectionString"].ConnectionString;
            //SqlConnection conn = new SqlConnection(constr);
            ////SqlConnection conn;
            //SqlDataAdapter adp1;
            ////SqlDataAdapter adp2;
            //DataSet ds1;
            ////string str = "";
            ////DataSet ds2;
            //SqlCommand cmd1;
            ////SqlCommand cmd2;
            //conn.Open();

            //cmd1 = new SqlCommand("Select  * from DefaultSchedule", conn);
            ////cmd2 = new SqlCommand("Select   Id, UniqueID,ResourceName, Description, Category, Info,serialNumber from Resources   ", conn);

            //adp1 = new SqlDataAdapter();
            ////adp2 = new SqlDataAdapter();

            //ds1 = new DataSet("myDataSet1");
            ////ds2 = new DataSet("myDataSet2");

            //adp1.SelectCommand = cmd1;
            ////adp2.SelectCommand = cmd2;

            //adp1.Fill(ds1, "Appointments");
            ////adp2.Fill(ds2, "Resources");

            //this.Schedule1.AppointmentSettings.DataSource = ds1;
            ////this.Schedule1.ResourceDataSource = ds2;


            //this.Schedule1.DataBind();
            //conn.Close();

        }

    }
}