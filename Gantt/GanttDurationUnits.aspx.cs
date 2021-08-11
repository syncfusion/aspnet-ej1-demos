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
    public partial class GanttDurationUnits : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.GanttDurationUnitsControl.DataSource = GetData();
            this.GanttDurationUnitsControl.DataBind();

        }
        public List<GanttDuratioUnitData> GetData()
        {
            List<GanttDuratioUnitData> list = new List<GanttDuratioUnitData>();
            list.Add(new GanttDuratioUnitData()
            {
                TaskID = 1,
                TaskName = "Parent Task 1",
                StartDate = "02/27/2017",
                Duration = "5day",
                Progress = 40,
                Children = (new List<GanttDuratioUnitData>()
                    {
                        new GanttDuratioUnitData()
                        {
                            TaskID = 2,
                            TaskName = "Child Task 1",
                            StartDate = "02/27/2017",
                            
                            Duration = "5d",
                            Progress = 40
                        },
                        new GanttDuratioUnitData()
                        {
                            TaskID = 3,
                            TaskName = "Child Task 2",
                            StartDate = "02/27/2017",
                            Duration = "40",
                            DurationUnit="hour",
                            Progress = 40,
                        },
                        new GanttDuratioUnitData()
                        {
                            TaskID = 4,
                            TaskName = "Child Task 3",
                            StartDate = "02/27/2017",
                            Duration = "2400",
                            DurationUnit = "minute",
                            Progress = 40
                        }
                    })

            });

            list.Add(new GanttDuratioUnitData()
            {
                TaskID = 5,
                TaskName = "Parent Task 2",
                StartDate = "03/06/2017",
                Duration = "5h",
                Progress = 40,
                Children = (new List<GanttDuratioUnitData>()
                    {
                        new GanttDuratioUnitData()
                        {
                            TaskID = 6,
                            TaskName = "Child Task 1",
                            StartDate = "03/06/2017",
                            Duration = "5d",
                            Progress = 40
                        },
                        new GanttDuratioUnitData()
                        {
                            TaskID = 7,
                            TaskName = "Child Task 2",
                            StartDate = "03/06/2017",
                            Duration = "40h",
                            Progress = 40,
                        },
                        new GanttDuratioUnitData()
                        {
                            TaskID = 8,
                            TaskName = "Child Task 3",
                            StartDate = "03/06/2017",
                            Duration = "2400m",
                            Progress = 40,
                        },
                        new GanttDuratioUnitData()
                        {
                            TaskID = 9,
                            TaskName = "Child Task 4",
                            StartDate = "03/06/2017",
                            Duration = "5",
                            Progress = 40,
                        }
                    })

            });
            list.Add(new GanttDuratioUnitData()
            {
                TaskID = 10,
                TaskName = "Parent Task 3",
                StartDate = "03/13/2017",
                Duration = "2400m",
                Progress = 40,

                Children = (new List<GanttDuratioUnitData>()
                    {
                        new GanttDuratioUnitData()
                        {

                            TaskID = 11,
                            TaskName = "Child Task 1",
                            StartDate = "03/13/2017",
                            Duration = "5d",
                            Progress = 40
                        },
                        new GanttDuratioUnitData()
                        {
                            TaskID = 12,
                            TaskName = "Child Task 2",
                            StartDate = "03/13/2017",
                            Duration = "40h",
                            Progress = 40,
                        },
                        new GanttDuratioUnitData()
                        {
                            TaskID = 13,
                            TaskName = "Child Task 3",
                            StartDate = "03/13/2017",
                            Duration = "2400m",
                            Progress = 40,
                        },
                        new GanttDuratioUnitData()
                        {
                            TaskID = 14,
                            TaskName = "Child Task 4",
                            StartDate = "03/13/2017",
                            Duration = "5",
                            Progress = 40,
                        },
                        new GanttDuratioUnitData()
                        {
                            TaskID = 15,
                            TaskName = "Child Task 5",
                            StartDate = "03/13/2017",
                            Duration = "5",
                            Progress = 40,
                        }
                    })

            });


            return list;
        }

        public class GanttDuratioUnitData
        {
            public string StartDate { get; set; }
            public int TaskID { get; set; }
            public string TaskName { get; set; }
            public string Duration { get; set; }
            public string DurationUnit { get; set; }
            public int Progress { get; set; }
            public List<GanttDuratioUnitData> Children { get; set; }
        }
    }
}