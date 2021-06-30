#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
namespace WebSampleBrowser.Schedule
{
    public partial class LoadOnDemand : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext.Current.Session["Appointments"] = null;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static object Data(String CurrentView, String CurrentAction, DateTime CurrentDate)
        {
            var data = FilterAppointment(CurrentDate, CurrentAction, CurrentView);
            BatchDataResult result = new BatchDataResult();
            result.result = data;
            result.count = GetAllRecords().ToList().Count > 0 ? GetAllRecords().ToList().Max(p => p.ID) : 1;
            return result;
        }
        public class BatchDataResult
        {
            public IEnumerable result { get; set; }
            public int count { get; set; }
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static void InsertData(object value)
        {
            ScheduleAppointmentsObjData appointValue = GetObjectValue(value as Dictionary<string, object>);
            GetAllRecords().Insert(0, appointValue);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static void UpdateData(object value)
        {
            ScheduleAppointmentsObjData obj = GetObjectValue(value as Dictionary<string, object>);
            var filterData = GetAllRecords().ToList().Where(c => c.ID == Convert.ToInt32(obj.ID));
            if (filterData.Count() > 0)
            {
                ScheduleAppointmentsObjData appoint = GetAllRecords().Single(A => A.ID == Convert.ToInt32(obj.ID));
                appoint.StartTime = obj.StartTime;
                appoint.EndTime = obj.EndTime;
                appoint.Subject = obj.Subject;
                appoint.StartTimeZone = obj.StartTimeZone;
                appoint.EndTimeZone = obj.EndTimeZone;
                appoint.Recurrence = obj.Recurrence;
                appoint.AllDay = obj.AllDay;
                appoint.RecurrenceRule = obj.RecurrenceRule;
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static void RemoveData(int key)
        {
            ScheduleAppointmentsObjData removeApp = GetAllRecords().Where(c => c.ID == key).FirstOrDefault();
            if (removeApp != null)
                GetAllRecords().Remove(removeApp);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static void CrudResult(List<object> added, List<object> changed, List<object> deleted)
        {
            if (added != null && added.Count > 0)
            {
                ScheduleAppointmentsObjData appointValue = GetObjectValue(added[0] as Dictionary<string, object>);
                GetAllRecords().Insert(0, appointValue);
            }
            if (changed != null && changed.Count > 0)
            {
                ScheduleAppointmentsObjData value = GetObjectValue(changed[0] as Dictionary<string, object>);
                var filterData = GetAllRecords().ToList().Where(c => c.ID == Convert.ToInt32(value.ID));
                if (filterData.Count() > 0)
                {
                    ScheduleAppointmentsObjData appoint = GetAllRecords().Where(A => A.ID == Convert.ToInt32(value.ID)).FirstOrDefault();
                    appoint.StartTime = value.StartTime;
                    appoint.EndTime = value.EndTime;
                    appoint.Subject = value.Subject;
                    appoint.StartTimeZone = value.StartTimeZone;
                    appoint.EndTimeZone = value.EndTimeZone;
                    appoint.Recurrence = value.Recurrence;
                    appoint.AllDay = value.AllDay;
                    appoint.RecurrenceRule = value.RecurrenceRule;
                }
            }
            if (deleted != null && deleted.Count > 0)
            {
                foreach (var dele in deleted)
                {
                    ScheduleAppointmentsObjData value = GetObjectValue(dele as Dictionary<string, object>);
                    ScheduleAppointmentsObjData removeApp = GetAllRecords().Where(c => c.ID == value.ID).FirstOrDefault();
                    if (removeApp != null)
                        GetAllRecords().Remove(removeApp);
                }
            }
        }

        public static ScheduleAppointmentsObjData GetObjectValue(Dictionary<string, object> objValue)
        {
            Dictionary<string, object> KeyVal = objValue;
            ScheduleAppointmentsObjData appointValue = new ScheduleAppointmentsObjData();

            foreach (KeyValuePair<string, object> keyval in KeyVal)
            {
                if (keyval.Key == "ID")
                    appointValue.ID = Convert.ToInt32(keyval.Value);
                else if (keyval.Key == "Subject")
                    appointValue.Subject = Convert.ToString(keyval.Value);
                else if (keyval.Key == "Location")
                    appointValue.Location = Convert.ToString(keyval.Value);
                else if (keyval.Key == "StartTime")
                    appointValue.StartTime = Convert.ToDateTime(keyval.Value).ToString("MM'/'dd'/'yyyy hh:mm:ss tt");
                else if (keyval.Key == "EndTime")
                    appointValue.EndTime = Convert.ToDateTime(keyval.Value).ToString("MM'/'dd'/'yyyy hh:mm:ss tt");
                else if (keyval.Key == "Description")
                    appointValue.Description = Convert.ToString(keyval.Value);
                else if (keyval.Key == "AllDay")
                    appointValue.AllDay = Convert.ToBoolean(keyval.Value);
                else if (keyval.Key == "Recurrence")
                    appointValue.Recurrence = Convert.ToBoolean(keyval.Value);
                else if (keyval.Key == "RecurrenceRule")
                    appointValue.RecurrenceRule = Convert.ToString(keyval.Value);
                else if (keyval.Key == "StartTimeZone")
                    appointValue.StartTimeZone = (keyval.Value == null) ? (string)keyval.Value : Convert.ToString(keyval.Value);
                else if (keyval.Key == "EndTimeZone")
                    appointValue.EndTimeZone = (keyval.Value == null) ? (string)keyval.Value : Convert.ToString(keyval.Value);
            }
            return appointValue;
        }

        public static IList<ScheduleAppointmentsObjData> GetAllRecords()
        {
            IList<ScheduleAppointmentsObjData> appoint = (IList<ScheduleAppointmentsObjData>)HttpContext.Current.Session["Appointments"];
            ScheduleAppointmentsObjDatum obj = new ScheduleAppointmentsObjDatum();
            if (appoint == null)
                HttpContext.Current.Session["Appointments"] = appoint = obj.GetRecords().ToList();
            return appoint;
        }

        public static List<ScheduleAppointmentsObjData> FilterAppointment(DateTime CurrentDate, String CurrentAction, String CurrentView)
        {
            DateTime CurrDate = Convert.ToDateTime(CurrentDate);
            DateTime StartDate = FirstWeekDate(CurrDate.Date);
            DateTime EndDate = FirstWeekDate(CurrDate.Date);
            List<ScheduleAppointmentsObjData> appointmentList = GetAllRecords().ToList();
            switch (CurrentView)
            {
                case "day":
                    StartDate = CurrentDate;
                    EndDate = CurrentDate;
                    break;
                case "week":
                    EndDate = EndDate.AddDays(7);
                    break;
                case "workweek":
                    EndDate = EndDate.AddDays(5);
                    break;
                case "month":
                    StartDate = CurrDate.Date.AddDays(-CurrDate.Day + 1);
                    EndDate = StartDate.AddMonths(1);
                    break;
            }
            appointmentList = GetAllRecords().ToList().Where(app =>
                ((DateTime.ParseExact(app.StartTime.ToString(), "MM/dd/yyyy hh:mm:ss tt", CultureInfo.InvariantCulture).ToLocalTime().Date >= Convert.ToDateTime(StartDate.Date)) &&
                (DateTime.ParseExact(app.StartTime.ToString(), "MM/dd/yyyy hh:mm:ss tt", CultureInfo.InvariantCulture).ToLocalTime().Date <= Convert.ToDateTime(EndDate.Date)) || app.Recurrence == true)).ToList();
            return appointmentList;
        }

        internal static DateTime FirstWeekDate(DateTime CurrentDate)
        {
            try
            {
                DateTime FirstDayOfWeek = CurrentDate;
                DayOfWeek WeekDay = FirstDayOfWeek.DayOfWeek;
                switch (WeekDay)
                {
                    case DayOfWeek.Sunday:
                        break;
                    case DayOfWeek.Monday:
                        FirstDayOfWeek = FirstDayOfWeek.AddDays(-1);
                        break;
                    case DayOfWeek.Tuesday:
                        FirstDayOfWeek = FirstDayOfWeek.AddDays(-2);
                        break;
                    case DayOfWeek.Wednesday:
                        FirstDayOfWeek = FirstDayOfWeek.AddDays(-3);
                        break;
                    case DayOfWeek.Thursday:
                        FirstDayOfWeek = FirstDayOfWeek.AddDays(-4);
                        break;
                    case DayOfWeek.Friday:
                        FirstDayOfWeek = FirstDayOfWeek.AddDays(-5);
                        break;
                    case DayOfWeek.Saturday:
                        FirstDayOfWeek = FirstDayOfWeek.AddDays(-6);
                        break;
                }
                return (FirstDayOfWeek);
            }
            catch
            {
                return DateTime.Now;
            }
        }
       
    }
}