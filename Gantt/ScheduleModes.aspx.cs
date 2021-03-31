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

namespace WebSampleBrowser.Gantt
{
    public partial class ScheduleModes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var DataSource = this.GetDataSource();
            this.GanttSceduleModes.DataSource = DataSource;
            this.GanttSceduleModes.DataBind();
            List<WeekStartDay> startDayData = new List<WeekStartDay>();
            startDayData.Add(new WeekStartDay { value = 0, text = "Sunday" });
            startDayData.Add(new WeekStartDay { value = 1, text = "Monday" });
            startDayData.Add(new WeekStartDay { value = 2, text = "Tuesday" });
            startDayData.Add(new WeekStartDay { value = 3, text = "Wednesday" });
            startDayData.Add(new WeekStartDay { value = 4, text = "Thursday" });
            startDayData.Add(new WeekStartDay { value = 5, text = "Friday" });
            startDayData.Add(new WeekStartDay { value = 6, text = "Saturday" });
            this.StartDay.DataSource = startDayData;
            this.StartDay.DataBind();
        }
        private class WeekStartDay
        {
            public int value;
            public string text;
        }
        #region Create DataSource for Gantt control
        public List<BusinessObject> GetDataSource()
        {
            List<BusinessObject> list = new List<BusinessObject>();
            list.Add(new BusinessObject()
            {
                TaskID = 1,
                TaskName = "Parent Task 1",
                StartDate = "02/27/2017",
                EndDate = "03/03/2017",
                Progress = "40",
                Children = (new List<BusinessObject>()
                    {
                        new BusinessObject()
                        {
                            TaskID = 2,
                            TaskName = "Child Task 1",
                            StartDate = "02/27/2017",
                            EndDate = "03/03/2017",
                            Progress = "40",
                        },
                        new BusinessObject()
                        {
                            TaskID = 3,
                            TaskName = "Child Task 2",
                            StartDate = "02/27/2017",
                            EndDate = "03/03/2017",
                            Progress = "40"
                        },
                        new BusinessObject()
                        {
                            TaskID = 4,
                            TaskName = "Child Task 3",
                            StartDate = "02/27/2017",
                            EndDate = "03/03/2017",
                            Progress = "40"
                        }
                    })

            });

            list.Add(new BusinessObject()
            {
                TaskID = 5,
                TaskName = "Parent Task 2",
                StartDate = "03/18/2017",
                EndDate = "03/22/2017",
                Progress = "40",
                Children = (new List<BusinessObject>()
                    {
                        new BusinessObject()
                        {
                            TaskID = 6,
                            TaskName = "Child Task 1",
                            StartDate = "03/06/2017",
                            EndDate = "03/10/2017",
                            Progress = "40",
                        },
                        new BusinessObject()
                        {
                            TaskID = 7,
                            TaskName = "Child Task 2",
                            StartDate = "03/06/2017",
                            EndDate = "03/10/2017",
                            Progress = "40",
                        },
                        new BusinessObject()
                        {
                            TaskID = 8,
                            TaskName = "Child Task 3",
                            StartDate = "03/06/2017",
                            EndDate = "03/10/2017",
                            Progress = "40",
                        },
                         new BusinessObject()
                        {
                            TaskID = 9,
                            TaskName = "Child Task 4",
                            StartDate = "03/06/2017",
                            EndDate = "03/10/2017",
                            Progress = "40",
                        }
                    })

            });
            list.Add(new BusinessObject()
            {
                TaskID = 10,
                TaskName = "Parent Task 3",
                StartDate = "03/13/2017",
                EndDate = "03/17/2017",
                Progress = "40",

                Children = (new List<BusinessObject>()
                    {
                        new BusinessObject()
                        {

                            TaskID = 11,
                            TaskName = "Child Task 1",
                            StartDate = "03/13/2017",
                            EndDate = "03/17/2017",
                            Progress = "40"
                        },
                        new BusinessObject()
                        {
                            TaskID = 12,
                            TaskName = "Child Task 2",
                            StartDate = "03/13/2017",
                            EndDate = "03/17/2017",
                            Progress = "40",
                        },
                        new BusinessObject()
                        {
                            TaskID = 13,
                            TaskName = "Child Task 3",
                            StartDate = "03/13/2017",
                            EndDate = "03/17/2017",
                            Progress = "40"
                        }
                    })

            });

            return list;
        }
        #endregion

        #region BusinessObject Creation
        public class BusinessObject
        {
            public string StartDate { get; set; }
            public string EndDate { get; set; }
            public int TaskID { get; set; }
            public string TaskName { get; set; }
            public string Progress { get; set; }
            public List<BusinessObject> Children { get; set; }
        }

        #endregion
    }
}