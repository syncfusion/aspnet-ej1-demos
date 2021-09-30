#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Collections.Generic;

namespace WebSampleBrowser.model
{
    public class ScheduleAppointmentsObjData
    {
        public List<ScheduleAppointmentsData> GetAppointmentData()
        {
            List<ScheduleAppointmentsData> list = new List<ScheduleAppointmentsData>();
            list.Add(new ScheduleAppointmentsData { Id = 1, Subject = "Bering sea Gold", StartTime = new DateTime(2017, 6, 5), EndTime = new DateTime(2017, 6, 5), Description = "", Recurrence = true, RecurrenceRule = "FREQ=DAILY;INTERVAL=2;COUNT=10", AllDay = true });
            list.Add(new ScheduleAppointmentsData { Id = 2, Subject = "Daily Planet", StartTime = new DateTime(2017, 6, 6, 4, 0, 0), EndTime = new DateTime(2017, 6, 6, 5, 0, 0), Description = "", Recurrence = false, RecurrenceRule = "", AllDay = false });
            list.Add(new ScheduleAppointmentsData { Id = 3, Subject = "What happened?", StartTime = new DateTime(2017, 6, 4, 11, 30, 0), EndTime = new DateTime(2017, 6, 4, 13, 0, 0), Description = "", Recurrence = true, RecurrenceRule = "FREQ=DAILY;INTERVAL=2;COUNT=10", AllDay = false });
            list.Add(new ScheduleAppointmentsData { Id = 4, Subject = "Wild Discovery", StartTime = new DateTime(2017, 6, 5, 4, 0, 0), EndTime = new DateTime(2017, 6, 5, 5, 0, 0), Description = "", Recurrence = true, RecurrenceRule = "FREQ=DAILY;INTERVAL=2;COUNT=10", AllDay = false });
            list.Add(new ScheduleAppointmentsData { Id = 5, Subject = "How it's Made", StartTime = new DateTime(2017, 6, 6, 12, 30, 0), EndTime = new DateTime(2017, 6, 6, 13, 30, 0), Description = "", Recurrence = false, RecurrenceRule = "", AllDay = false });
            list.Add(new ScheduleAppointmentsData { Id = 6, Subject = "What happened?", StartTime = new DateTime(2017, 6, 5, 6, 30, 0), EndTime = new DateTime(2017, 6, 5, 7, 30, 0), Description = "", Recurrence = false, RecurrenceRule = "", AllDay = false });
            return list;
        }

    }
    public class ScheduleAppointmentsData
    {
        public int Id { get; set; }
        public string Subject { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
        public string Description { get; set; }
        public Boolean Recurrence { get; set; }
        public String RecurrenceRule { get; set; }
        public Boolean AllDay { get; set; }
    }
}