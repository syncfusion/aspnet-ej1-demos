#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using Syncfusion.JavaScript.Web;
using Syncfusion.EJ.Export;
using Newtonsoft.Json;

namespace WebSampleBrowser.Schedule
{
    public partial class XLSExport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Schedule1_ServerExportExcel(object sender, ScheduleEventArgs e)
        {
            List<AppointmentData> scheduleAppointments = (List<AppointmentData>)JsonConvert.DeserializeObject(e.Arguments["ScheduleAppointment"].ToString(), typeof(List<AppointmentData>));
            for (int a = 0, len = scheduleAppointments.Count; a < len; a++)
            {
                scheduleAppointments[a].StartTime = Convert.ToDateTime(scheduleAppointments[a].StartTime).ToString();
                scheduleAppointments[a].EndTime = Convert.ToDateTime(scheduleAppointments[a].EndTime).ToString();
            }
            ExcelExport xlExport = new ExcelExport();
            xlExport.Export(scheduleAppointments);
        }
    }

    public class AppointmentData
    {
        public int Id { get; set; }
        public string Subject { get; set; }
        public string StartTime { get; set; }
        public string EndTime { get; set; }
        public bool? AllDay { get; set; }
        public bool? Recurrence { get; set; }
        public string RecurrenceRule { get; set; }
    }
}