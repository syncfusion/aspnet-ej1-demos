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
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.Schedule
{
    public partial class Remainder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Schedule1.AppointmentSettings.DataSource = AppointmentsList;
        }
        private List<ReminderData> AppointmentsList
        {
            get
            {
                List<ReminderData> appointmentList = Session["Appointments"] as List<ReminderData>;
                appointmentList = AddAppointments();
                return appointmentList;
            }
        }
        private List<ReminderData> AddAppointments()
        {
            DateTime _today = DateTime.Now;
            List<ReminderData> _newList = new List<ReminderData>();
            ReminderData appoint1 = new ReminderData()
            {
                Id = 1,
                Subject = "Analysis",
                StartTime = DateTime.Now.AddMinutes(5),
                EndTime = DateTime.Now.AddHours(1),
                Allday = false,
                Recurrence = false
            };
            ReminderData appoint2 = new ReminderData()
            {
                Id = 2,
                Subject = "SRS Document",
                StartTime = DateTime.Now.AddMinutes(6),
                EndTime = DateTime.Now.AddHours(1),
                Allday = false,
                Recurrence = false
            };

            ReminderData appoint3 = new ReminderData()
            {
                Id = 3,
                Subject = "Design Start",
                StartTime = DateTime.Now.AddHours(2),
                EndTime = DateTime.Now.AddHours(3),
                Allday = false,
                Recurrence = false
            };
            ReminderData appoint5 = new ReminderData()
            {
                Id = 5,
                Subject = "Design Demo meeting",
                StartTime = DateTime.Now.AddHours(4),
                EndTime = DateTime.Now.AddHours(5),
                Allday = false,
                Recurrence = false
            };
            _newList.Add(appoint1);
            _newList.Add(appoint2);
            _newList.Add(appoint3);
            _newList.Add(appoint5);
            return _newList;
        }

    }
}