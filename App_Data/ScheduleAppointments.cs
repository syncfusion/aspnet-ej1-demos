#region Copyright
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion

using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Security.Permissions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml;



public class ScheduleAppointmentsObjDatum
{

    [DataObjectMethod(DataObjectMethodType.Select)]
    public List<ScheduleAppointmentsObjData> GetRecords()
    {

        List<ScheduleAppointmentsObjData> list = new List<ScheduleAppointmentsObjData>();
        list.Add(new ScheduleAppointmentsObjData(100, "Bering Sea Gold", "chn", "06/02/2017 09:00:00 AM", "06/02/2017 10:30:00 AM", "", "1", "", true, "", "", "", "", false, "", "", "FREQ=DAILY;INTERVAL=2;COUNT=10", null, null));
        list.Add(new ScheduleAppointmentsObjData(101, "Bering Sea Gold", "mum", "06/02/2017 04:00:00 AM", "06/02/2017 05:00:00 AM", "", "1", "", false, "", "", "", "", false, "", "", "", null, null));
        list.Add(new ScheduleAppointmentsObjData(102, "Bering Sea Gold", "trcy", "06/02/2017 04:00:00 PM", "06/02/2017 05:30:00 PM", "", "1", "", false, "", "", "", "", false, "", "", "", null, null));
        list.Add(new ScheduleAppointmentsObjData(103, "What Happened Next?", "chn", "06/04/2017 03:00:00 AM", "06/04/2017 04:30:00 AM", "", "1", "", false, "", "", "", "", false, "", "", "", null, null));
        list.Add(new ScheduleAppointmentsObjData(104, "Bering Sea Gold", "trcy", "06/04/2017 05:00:00 AM", "06/04/2017 05:40:00 AM", "", "1", "", false, "", "", "", "", false, "", "", "", null, null));
        list.Add(new ScheduleAppointmentsObjData(105, "Daily Planet", "chn", "06/03/2017 01:00:00 AM", "06/03/2017 02:00:00 AM", "", "1", "", false, "", "", "", "", false, "", "", "", null, null));
        list.Add(new ScheduleAppointmentsObjData(106, "Alaska: The Last Frontier", "chn", "06/03/2017 08:00:00 AM", "06/03/2017 09:00:00 AM", "", "1", "", false, "", "", "", "", false, "", "", "", null, null));
        list.Add(new ScheduleAppointmentsObjData(107, "How It's Made", "chn", "06/01/2017 06:00:00 AM", "06/01/2017 06:30:00 AM", "", "1", "", true, "", "", "", "", false, "", "", "FREQ=WEEKLY;BYDAY=MO,TU;INTERVAL=1;COUNT=15", null, null));
        list.Add(new ScheduleAppointmentsObjData(108, "Deadest Catch", "chn", "06/03/2017 04:00:00 PM", "06/03/2017 05:00:00 PM", "", "1", "", false, "", "", "", "", false, "", "", "", null, null));
        list.Add(new ScheduleAppointmentsObjData(109, "Sports Day", "chn", "05/30/2017 06:30:00 AM", "05/30/2017 07:30:00 AM", "", "1", "", false, "", "", "", "", false, "", "", "", null, null));
        list.Add(new ScheduleAppointmentsObjData(110, "MoonShiners", "chn", "06/02/2017 02:00:00 AM", "06/02/2017 02:30:00 AM", "", "1", "", true, "", "", "", "", false, "", "", "FREQ=DAILY;INTERVAL=1;COUNT=5", null, null));
        list.Add(new ScheduleAppointmentsObjData(111, "Close Encounters", "chn", "05/30/2017 02:00:00 PM", "05/30/2017 03:00:00 PM", "", "1", "", true, "", "", "", "", false, "", "", "FREQ=WEEKLY;BYDAY=MO,TH;INTERVAL=1;COUNT=5", null, null));
        list.Add(new ScheduleAppointmentsObjData(112, "Close Encounters", "mum", "05/30/2017 03:00:00 AM", "05/30/2017 03:30:00 AM", "", "1", "", true, "", "", "", "", false, "", "", "FREQ=WEEKLY;BYDAY=WE;INTERVAL=1;COUNT=3", null, null));
        list.Add(new ScheduleAppointmentsObjData(113, "Highway Thru Hell", "chn", "06/01/2017 03:00:00 AM", "06/01/2017 07:00:00 AM", "", "1", "", true, "", "", "", "", false, "", "", "FREQ=DAILY;INTERVAL=2;COUNT=10", null, null));
        list.Add(new ScheduleAppointmentsObjData(114, "Moon Shiners", "chn", "06/02/2017 04:20:00 AM", "06/02/2017 05:50:00 AM", "", "1", "", false, "", "", "", "", false, "", "", "", null, null));
        list.Add(new ScheduleAppointmentsObjData(115, "Cash Cab", "chn", "05/30/2017 03:00:00 PM", "05/30/2017 04:30:00 PM", "", "1", "", true, "", "", "", "", false, "", "", "FREQ=DAILY;INTERVAL=1;COUNT=5", null, null));
        return list;

    }
    [DataObjectMethod(DataObjectMethodType.Select)]
    public List<ScheduleAppointmentsObjData> GetQueryCellRecords()
    {
        List<ScheduleAppointmentsObjData> list = new List<ScheduleAppointmentsObjData>();
        list.Add(new ScheduleAppointmentsObjData(1, "Maintenance", "05/30/2017 02:30:00 AM", "05/30/2017 04:00:00 AM", "", "1", "1", false, false, "Maintenance", "UTC +05:30", "UTC +05:30"));
        list.Add(new ScheduleAppointmentsObjData(2, "Technology Book Stall", "06/05/2017 01:30:00 AM", "06/05/2017 05:00:00 AM", "", "1", "1", false, false, "Public Event", "UTC +05:30", "UTC +05:30"));
        list.Add(new ScheduleAppointmentsObjData(3, "Technology Book Stall", "06/15/2017 01:30:00 AM", "06/15/2017 05:00:00 AM", "", "1", "1", false, false, "Public Event", "UTC +05:30", "UTC +05:30"));
        list.Add(new ScheduleAppointmentsObjData(4, "Technology Book Stall", "06/12/2017 01:30:00 AM", "06/12/2017 05:00:00 AM", "", "1", "2", false, false, "Public Event", "UTC +05:30", "UTC +05:30"));
        list.Add(new ScheduleAppointmentsObjData(5, "Annual Conference", "06/05/2017 06:30:00 AM", "06/05/2017 09:00:00 AM", "", "1", "1", false, false, "Commercial Event", "UTC +05:30", "UTC +05:30"));
        list.Add(new ScheduleAppointmentsObjData(6, "Annual Conference", "06/15/2017 06:30:00 AM", "06/15/2017 09:00:00 AM", "", "1", "1", false, false, "Commercial Event", "UTC +05:30", "UTC +05:30"));
        list.Add(new ScheduleAppointmentsObjData(7, "Annual Conference", "06/10/2017 06:30:00 AM", "06/10/2017 09:00:00 AM", "", "1", "2", false, false, "Commercial Event", "UTC +05:30", "UTC +05:30"));
        list.Add(new ScheduleAppointmentsObjData(8, "IMI Meeting", "06/05/2017 06:30:00 AM", "06/05/2017 09:00:00 AM", "International Management Institute", "2", "3", false, false, "Commercial Event", "UTC +05:30", "UTC +05:30"));
        list.Add(new ScheduleAppointmentsObjData(9, "George Birthday Celebration", "06/05/2017 05:00:00 AM", "06/05/2017 08:00:00 AM", "4th Year Celebration", "1", "2", false, false, "Family Event", "UTC +05:30", "UTC +05:30"));
        list.Add(new ScheduleAppointmentsObjData(10, "John Wedding Aniversary", "06/02/2017 06:00:00 AM", "06/02/2017 09:00:00 AM", "1st Year Celebration", "2", "3", false, false, "Family Event", "UTC +05:30", "UTC +05:30"));
        return list;
    }
}

public class ScheduleEvents
{
    public List<ScheduleEventsData> GetAppointmentData()
    {
        List<ScheduleEventsData> list = new List<ScheduleEventsData>();
        list.Add(new ScheduleEventsData { Id = 1, Subject = "Bering sea Gold", StartTime = new DateTime(2017, 6, 5), EndTime = new DateTime(2017, 6, 5), Description = "", Recurrence = true, RecurrenceRule = "FREQ=DAILY;INTERVAL=2;COUNT=10", AllDay = true });
        list.Add(new ScheduleEventsData { Id = 2, Subject = "Daily Planet", StartTime = new DateTime(2017, 6, 6, 4, 0, 0), EndTime = new DateTime(2017, 6, 6, 5, 0, 0), Description = "", Recurrence = false, RecurrenceRule = "", AllDay = false });
        list.Add(new ScheduleEventsData { Id = 3, Subject = "What happened?", StartTime = new DateTime(2017, 6, 4, 11, 30, 0), EndTime = new DateTime(2017, 6, 4, 13, 0, 0), Description = "", Recurrence = true, RecurrenceRule = "FREQ=DAILY;INTERVAL=2;COUNT=10", AllDay = false });
        list.Add(new ScheduleEventsData { Id = 4, Subject = "Wild Discovery", StartTime = new DateTime(2017, 6, 5, 4, 0, 0), EndTime = new DateTime(2017, 6, 5, 5, 0, 0), Description = "", Recurrence = true, RecurrenceRule = "FREQ=DAILY;INTERVAL=2;COUNT=10", AllDay = false });
        list.Add(new ScheduleEventsData { Id = 5, Subject = "How it's Made", StartTime = new DateTime(2017, 6, 6, 12, 30, 0), EndTime = new DateTime(2017, 6, 6, 13, 30, 0), Description = "", Recurrence = false, RecurrenceRule = "", AllDay = false });
        list.Add(new ScheduleEventsData { Id = 6, Subject = "What happened?", StartTime = new DateTime(2017, 6, 5, 6, 30, 0), EndTime = new DateTime(2017, 6, 5, 7, 30, 0), Description = "", Recurrence = false, RecurrenceRule = "", AllDay = false });
        return list;
    }
    public List<ScheduleEventsData> GetGroupAppointmentData()
    {
        List<ScheduleEventsData> appoint = new List<ScheduleEventsData>();

        appoint.Add(new ScheduleEventsData
        {
            Id = 100,
            Subject = "Bering Sea Gold",
            StartTime = new DateTime(2017, 05, 02, 09, 00, 00),
            EndTime = new DateTime(2017, 05, 02, 10, 30, 00),
            Description = "",
            AllDay = false,
            Recurrence = true,
            RecurrenceRule = "FREQ=DAILY;INTERVAL=2;COUNT=10",
            OwnerId = "3,1,5"
        });
        appoint.Add(new ScheduleEventsData
        {
            Id = 101,
            Subject = "Hello Sea Gold",
            StartTime = new DateTime(2017, 5, 2, 4, 00, 00),
            EndTime = new DateTime(2017, 5, 2, 5, 00, 00),
            Description = "",
            AllDay = false,
            Recurrence = false,
            OwnerId = "3,5"
        });
        return appoint;
    }
}

public class ScheduleEventsData
{
    public int Id { get; set; }
    public string OwnerId { get; set; }
    public string Subject { get; set; }
    public DateTime StartTime { get; set; }
    public DateTime EndTime { get; set; }
    public string Description { get; set; }
    public Boolean Recurrence { get; set; }
    public String RecurrenceRule { get; set; }
    public Boolean AllDay { get; set; }
}

[Serializable]
public class ScheduleAppointmentsObjData
{
    private int _id;
    private String _subject;
    private String _location;
    private String _startTime;
    private String _endTime;
    private String _description;
    private String _owner;
    private String _priority;
    private Boolean _recurrence;
    private String _recurrenceType;
    private String _recurrenceTypeCount;
    private String _remainderCategorize;
    private String _customStyle;
    private Boolean _allDay;
    private String _recurrenceStartDate;
    private String _recurrenceEndDate;
    private String _recurrenceRule;
    private String _startTimeZone;
    private String _endTimeZone;
    private String _room;
    private String _eventType;

    public ScheduleAppointmentsObjData()
    {

    }
    public ScheduleAppointmentsObjData(int _id, string _subject, string _location, string _startTime, string _endTime, string _description, string _owner, string _priority, bool _recurrence, string _recurrenceType, string _recurrenceTypeCount, string _remainderCategorize, string _customStyle, bool _allDay, string _recurrenceStartDate, string _recurrenceEndDate, string _recurrenceRule, string _startTimeZone, string _endTimeZone)
    {
        this._id = _id;
        this._subject = _subject;
        this._location = _location;
        this._startTime = _startTime;
        this._endTime = _endTime;
        this._description = _description;
        this._owner = _owner;
        this._priority = _priority;
        this._recurrence = _recurrence; ;
        this._recurrenceType = _recurrenceType;
        this._recurrenceTypeCount = _recurrenceTypeCount;
        this._remainderCategorize = _remainderCategorize;
        this._customStyle = _customStyle;
        this._allDay = _allDay;
        this._recurrenceStartDate = _recurrenceStartDate;
        this._recurrenceEndDate = _recurrenceEndDate;
        this._recurrenceRule = _recurrenceRule;
        this._startTimeZone = _startTimeZone;
        this._endTimeZone = _endTimeZone;

    }
    public ScheduleAppointmentsObjData(int _id, string _subject, string _startTime, string _endTime, string _description, string _room, string _owner, bool _recurrence, bool _allDay, string _eventType, string _startTimeZone, string _endTimeZone)
    {
        this._id = _id;
        this._subject = _subject;
        this._startTime = _startTime;
        this._endTime = _endTime;
        this._description = _description;
        this._owner = _owner;
        this._room = _room;
        this._recurrence = _recurrence; ;
        this._allDay = _allDay;
        this._eventType = _eventType;
        this._startTimeZone = _startTimeZone;
        this._endTimeZone = _endTimeZone;
    }
    public int ID
    {
        get
        {
            return _id;
        }
        set
        {
            _id = value;
        }
    }

    public string Subject
    {
        get
        {
            return _subject;
        }
        set
        {
            _subject = value;
        }
    }
    public string RoomID
    {
        get
        {
            return _room;
        }
        set
        {
            _room = value;
        }
    }
    public string EventType
    {
        get
        {
            return _eventType;
        }
        set
        {
            _eventType = value;
        }
    }
    public string Location
    {
        get
        {
            return _location;
        }
        set
        {
            _location = value;
        }
    }
    public string StartTime
    {
        get
        {
            return _startTime;
        }
        set
        {
            _startTime = value;
        }
    }
    public string EndTime
    {
        get
        {
            return _endTime;
        }
        set
        {
            _endTime = value;
        }
    }
    public string Description
    {
        get
        {
            return _description;
        }
        set
        {
            _description = value;
        }
    }
    public string Owner
    {
        get
        {
            return _owner;
        }
        set
        {
            _owner = value;
        }
    }
    public string Priority
    {
        get
        {
            return _priority;
        }
        set
        {
            _priority = value;
        }
    }
    public Boolean Recurrence
    {
        get
        {
            return _recurrence;
        }
        set
        {
            _recurrence = value;
        }
    }
    public string RecurrenceType
    {
        get
        {
            return _recurrenceType;
        }
        set
        {
            _recurrenceType = value;
        }
    }
    public string RecurrenceTypeCount
    {
        get
        {
            return _recurrenceTypeCount;
        }
        set
        {
            _recurrenceTypeCount = value;
        }
    }
    public string RemainderCategorize
    {
        get
        {
            return _remainderCategorize;
        }
        set
        {
            _remainderCategorize = value;
        }
    }
    public string CustomStyle
    {
        get
        {
            return _customStyle;
        }
        set
        {
            _customStyle = value;
        }
    }
    public Boolean AllDay
    {
        get
        {
            return _allDay;
        }
        set
        {
            _allDay = value;
        }
    }
    public string RecurrenceStartDate
    {
        get
        {
            return _recurrenceStartDate;
        }
        set
        {
            _recurrenceStartDate = value;
        }
    }
    public string RecurrenceEndDate
    {
        get
        {
            return _recurrenceEndDate;
        }
        set
        {
            _recurrenceEndDate = value;
        }
    }
    public string RecurrenceRule
    {
        get
        {
            return _recurrenceRule;
        }
        set
        {
            _recurrenceRule = value;
        }
    }
    public string StartTimeZone
    {
        get
        {
            return _startTimeZone;
        }
        set
        {
            _startTimeZone = value;
        }
    }
    public string EndTimeZone
    {
        get
        {
            return _endTimeZone;
        }
        set
        {
            _endTimeZone = value;
        }
    }
}