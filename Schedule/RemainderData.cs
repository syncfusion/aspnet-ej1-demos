using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebSampleBrowser.Schedule
{
    public class ReminderData
    {
        public int Id { get; set; }
        public string Subject { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
        public bool Allday { get; set; }
        public bool Recurrence { get; set; }
        public string RecurrenceRule { get; set; }
    }
}