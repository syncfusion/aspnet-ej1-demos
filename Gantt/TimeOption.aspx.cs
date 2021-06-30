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
    public partial class TimeOption : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var DataSource = this.GetDataSource();
            this.GanttTimeOptions.DataSource = DataSource;
            this.GanttTimeOptions.DataBind();
        }
        #region Create DataSource for Gantt control
        public List<BusinessObject> GetDataSource()
        {
            List<BusinessObject> list = new List<BusinessObject>();
            list.Add(new BusinessObject()
            {
                TaskID = 1,
                TaskName = "Parent Task 1",
                StartDate = "02/23/2017",
                duration = 7,
                Progress = "40",
                Children = (new List<BusinessObject>()
                    {
                        new BusinessObject()
                        {
                            TaskID = 2,
                            TaskName = "Child Task 1",
                            StartDate = "02/23/2017 08:00:00 AM",
                            duration = 7,
                            Progress = "40",
                        },
                        new BusinessObject()
                        {
                            TaskID = 3,
                            TaskName = "Child Task 2",
                            StartDate = "02/23/2017 08:00:00 AM",
                            duration = 7,
                            Progress = "40"
                        },
                        new BusinessObject()
                        {
                            TaskID = 4,
                            TaskName = "Child Task 3",
                            StartDate = "02/23/2017 08:00:00 AM",
                            duration = 7,
                            Progress = "40"
                        }
                    })

            });

            list.Add(new BusinessObject()
            {
                TaskID = 5,
                TaskName = "Parent Task 2",
                StartDate = "02/24/2017",
                duration = 7,
                Progress = "40",
                Children = (new List<BusinessObject>()
                    {
                        new BusinessObject()
                        {
                            TaskID = 6,
                            TaskName = "Child Task 1",
                            StartDate = "02/23/2017 10:00:00 PM",
                            duration = 7,
                            Progress = "40",
                        },
                        new BusinessObject()
                        {
                            TaskID = 7,
                            TaskName = "Child Task 2",
                            StartDate = "02/23/2017 10:00:00 PM",
                            duration = 7,
                            Progress = "40",
                        },
                        new BusinessObject()
                        {
                            TaskID = 8,
                            TaskName = "Child Task 3",
                            StartDate = "02/23/2017 10:00:00 PM",
                            duration = 7,
                            Progress = "40",
                        },
                         new BusinessObject()
                        {
                            TaskID = 9,
                            TaskName = "Child Task 4",
                            StartDate = "02/23/2017 10:00:00 PM",
                            duration = 7,
                            Progress = "40",
                        }
                    })

            });
            list.Add(new BusinessObject()
            {
                TaskID = 10,
                TaskName = "Parent Task 3",
                StartDate = "02/25/2017",
                duration = 7,
                Progress = "40",
                Children = (new List<BusinessObject>()
                    {
                        new BusinessObject()
                        {
                            TaskID = 11,
                            TaskName = "Child Task 1",
                            StartDate = "02/24/2017 12:00:00 PM",
                            duration = 7,
                            Progress = "40",
                        },
                        new BusinessObject()
                        {
                            TaskID = 12,
                            TaskName = "Child Task 2",
                            StartDate = "02/24/2017 12:00:00 PM",
                            duration = 7,
                            Progress = "40",
                        },
                        new BusinessObject()
                        {
                            TaskID = 13,
                            TaskName = "Child Task 3",
                            StartDate = "02/24/2017 12:00:00 PM",
                            duration = 7,
                            Progress = "40",
                        },
                         new BusinessObject()
                        {
                            TaskID = 14,
                            TaskName = "Child Task 4",
                            StartDate = "02/24/2017 12:00:00 PM",
                            duration = 7,
                            Progress = "40",
                        },
                         new BusinessObject()
                        {
                            TaskID = 15,
                            TaskName = "Child Task 5",
                            StartDate = "02/24/2017 12:00:00 PM",
                            duration = 7,
                            Progress = "40",
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
            public int duration { get; set; }
            public int TaskID { get; set; }
            public string TaskName { get; set; }
            public string Progress { get; set; }
            public List<BusinessObject> Children { get; set; }
        }

        #endregion
    }
}