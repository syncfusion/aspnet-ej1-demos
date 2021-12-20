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
    public partial class BlockTime : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<WebSampleBrowser.Schedule.multipleresource.Rooms> owners = new List<WebSampleBrowser.Schedule.multipleresource.Rooms>();
            owners.Add(new WebSampleBrowser.Schedule.multipleresource.Rooms { text = "Airline 1", id = "1", color = "#f8a398" });
            owners.Add(new WebSampleBrowser.Schedule.multipleresource.Rooms { text = "Airline 2", id = "3", color = "#56ca85" });
            owners.Add(new WebSampleBrowser.Schedule.multipleresource.Rooms { text = "Airline 3", id = "5", color = "#51a0ed" });
            Schedule1.Resources[0].ResourceSettings.DataSource = owners;
            Schedule1.AppointmentSettings.DataSource = GetAppointmentData();
            Schedule1.BlockoutSettings.DataSource = GetBlockData();
        }

        #region Create DataSource for Block Intervals
        public List<BlockDataSource> GetBlockData()
        {
            List<BlockDataSource> data = new List<BlockDataSource>();
            data.Add(new BlockDataSource(1, "MAINTENANCE", new DateTime(2017, 6, 5, 8, 0, 0), new DateTime(2017, 6, 5, 10, 0, 0), true, "3", false));
            data.Add(new BlockDataSource(2, "SERVICE", new DateTime(2017, 6, 5, 9, 0, 0), new DateTime(2017, 6, 5, 11, 0, 0), true, "1", false));
            data.Add(new BlockDataSource(3, "SERVICE", new DateTime(2017, 6, 6), new DateTime(2017, 6, 6), true, "1", true));
            data.Add(new BlockDataSource(4, "BAD MONSOON", new DateTime(2017, 6, 5, 15, 30, 0), new DateTime(2017, 6, 5, 17, 0, 0), true, "1", false));
            data.Add(new BlockDataSource(5, "BAD MONSOON", new DateTime(2017, 6, 5, 15, 30, 0), new DateTime(2017, 6, 5, 17, 0, 0), true, "3", false));
            data.Add(new BlockDataSource(6, "BAD MONSOON", new DateTime(2017, 6, 5, 15, 30, 0), new DateTime(2017, 6, 5, 17, 0, 0), true, "5", false));
            return data;
        }
        #endregion

        #region Create DataSource for Appointments
        public List<ScheduleAppointmentsData> GetAppointmentData()
        {
            List<ScheduleAppointmentsData> list = new List<ScheduleAppointmentsData>();
            list.Add(new ScheduleAppointmentsData(1, "#SG 208 Greenville - Washington", new DateTime(2017, 6, 5, 12, 0, 0), new DateTime(2017, 6, 5, 13, 30, 0), "", "2", "3", true, "FREQ=DAILY;INTERVAL=2;COUNT=10", false));
            list.Add(new ScheduleAppointmentsData(2, "#IT 188 Washington - Arizona", new DateTime(2017, 6, 5, 4, 0, 0), new DateTime(2017, 6, 5, 5, 0, 0), "", "2", "3", false, "", false));
            list.Add(new ScheduleAppointmentsData(3, "#SG 300 Chicago - Nevada", new DateTime(2017, 6, 5, 11, 30, 0), new DateTime(2017, 6, 5, 13, 0, 0), "", "1", "1", true, "FREQ=DAILY;INTERVAL=2;COUNT=10", false));
            list.Add(new ScheduleAppointmentsData(4, "#IT 306 Washington - Newport", new DateTime(2017, 6, 5, 4, 0, 0), new DateTime(2017, 6, 5, 5, 0, 0), "", "1", "5", true, "FREQ=DAILY;INTERVAL=2;COUNT=10", false));
            list.Add(new ScheduleAppointmentsData(5, "#AI 520 Washington - Chicago", new DateTime(2017, 6, 5, 12, 30, 0), new DateTime(2017, 6, 5, 13, 30, 0), "", "2", "5", false, "", false));
            list.Add(new ScheduleAppointmentsData(6, "#SG 345 Renfrewshire - Lancashire", new DateTime(2017, 6, 5, 6, 30, 0), new DateTime(2017, 6, 5, 7, 30, 0), "", "2", "3", false, "", false));
            return list;
        }
        #endregion

        [Serializable]
        public class BlockDataSource
        {
            private int id;
            private string subject;
            private DateTime startTime;
            private DateTime endTime;
            private bool blockapp;
            private string resId;
            private bool fullDay;
            public BlockDataSource(int id, string subject, DateTime startTime, DateTime endTime, Boolean blockapp, string resId, bool fullDay)
            {
                this.id = id;
                this.subject = subject;
                this.startTime = startTime;
                this.endTime = endTime;
                this.blockapp = blockapp;
                this.resId = resId;
                this.fullDay = fullDay;
            }
            public int BlockId
            {
                get { return id; }
                set { id = value; }
            }
            public string Subject
            {
                get { return subject; }
                set { subject = value; }
            }
            public DateTime StartTime
            {
                get { return startTime; }
                set { startTime = value; }
            }
            public DateTime EndTime
            {
                get { return endTime; }
                set { endTime = value; }
            }
            public Boolean BlockAppointment
            {
                get { return blockapp; }
                set { blockapp = value; }
            }
            public string ResourceId
            {
                get { return resId; }
                set { resId = value; }
            }
            public bool FullDay
            {
                get { return fullDay; }
                set { fullDay = value; }
            }
        }
        [Serializable]
        public class ScheduleAppointmentsData
        {
            private int _id;
            private String _subject;
            private DateTime _startTime;
            private DateTime _endTime;
            private String _description;
            private Boolean _recurrence;
            private String _recurrenceRule;
            private Boolean _allDay;
            private String _owner;
            private String _room;

            public ScheduleAppointmentsData()
            {

            }
            public ScheduleAppointmentsData(int _id, string _subject, DateTime _startTime, DateTime _endTime, string _description, string _room, string _owner, bool _recurrence, string _recurrenceRule, bool _allDay)
            {
                this._id = _id;
                this._subject = _subject;
                this._startTime = _startTime;
                this._endTime = _endTime;
                this._description = _description;
                this._owner = _owner;
                this._room = _room;
                this._recurrence = _recurrence;
                this._recurrenceRule = _recurrenceRule;
                this._allDay = _allDay;
            }
            public int Id
            {
                get { return _id; }
                set { _id = value; }
            }

            public string Subject
            {
                get { return _subject; }
                set { _subject = value; }
            }
            public string RoomId
            {
                get { return _room; }
                set { _room = value; }
            }
            public DateTime StartTime
            {
                get { return _startTime; }
                set { _startTime = value; }
            }
            public DateTime EndTime
            {
                get { return _endTime; }
                set { _endTime = value; }
            }
            public string Description
            {
                get { return _description; }
                set { _description = value; }
            }
            public string OwnerId
            {
                get { return _owner; }
                set { _owner = value; }
            }
            public Boolean Recurrence
            {
                get { return _recurrence; }
                set { _recurrence = value; }
            }
            public String RecurrenceRule
            {
                get { return _recurrenceRule; }
                set { _recurrenceRule = value; }
            }
            public Boolean AllDay
            {
                get { return _allDay; }
                set { _allDay = value; }
            }
        }
    }
}