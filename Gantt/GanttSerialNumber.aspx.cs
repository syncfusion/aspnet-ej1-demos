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
using Syncfusion.JavaScript.Web;

namespace WebSampleBrowser.Gantt
{
    public partial class GanttSerialNumber : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var DataSource = TaskData.GetTaskData();
            this.GanttControlSerialNumber.DataSource = DataSource;
            this.GanttControlSerialNumber.DataBind();
        }
        public class TaskDataDetails
        {
            public int TaskID { get; set; }
            public string TaskName { get; set; }
            public string StartDate { get; set; }
            public string EndDate { get; set; }
            public int Duration { get; set; }
            public string Progress { get; set; }
            public List<TaskDataDetails> SubTasks { get; set; }
            public List<object> ResourceID { get; set; }
            public string Predecessors { get; set; }
        }
        public class TaskData
        {
            public static List<TaskDataDetails> GetTaskData()
            {
                List<TaskDataDetails> tasks = new List<TaskDataDetails>();

                tasks.Add(new TaskDataDetails()
                {
                    TaskID = 1,
                    TaskName = "Project Schedule",
                    StartDate = "02/06/2017",
                    EndDate = "03/10/2017"
                });

                tasks[0].SubTasks = new List<TaskDataDetails>();

                tasks[0].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 2,
                    TaskName = "Planning",
                    StartDate = "02/06/2017",
                    EndDate = "02/10/2017"
                });

                tasks[0].SubTasks[0].SubTasks = new List<TaskDataDetails>();


                tasks[0].SubTasks[0].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 3,
                    TaskName = "Plan timeline",
                    StartDate = "02/06/2017",
                    EndDate = "02/10/2017",
                    Duration = 5,
                    Progress = "100",
                    ResourceID = new List<object>() { 1 }
                });
                tasks[0].SubTasks[0].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 4,
                    TaskName = "Plan budget",
                    StartDate = "02/06/2017",
                    EndDate = "02/10/2017",
                    Duration = 5,
                    Progress = "100",
                    ResourceID = new List<object>() { 1 }
                });
                tasks[0].SubTasks[0].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 5,
                    TaskName = "Allocate resources",
                    StartDate = "02/06/2017",
                    EndDate = "02/10/2017",
                    Duration = 5,
                    Progress = "100",
                    ResourceID = new List<object>() { 1 }
                });
                tasks[0].SubTasks[0].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 6,
                    TaskName = "Planning complete",
                    StartDate = "02/10/2017",
                    EndDate = "02/10/2017",
                    Duration = 0,
                    Predecessors = "3FS,4FS,5FS"
                });

                tasks[0].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 7,
                    TaskName = "Design",
                    StartDate = "02/13/2017",
                    EndDate = "02/17/2017"
                });

                tasks[0].SubTasks[1].SubTasks = new List<TaskDataDetails>();

                tasks[0].SubTasks[1].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 8,
                    TaskName = "Software Specification",
                    StartDate = "02/13/2017",
                    EndDate = "02/15/2017",
                    Duration = 3,
                    Progress = "60",
                    Predecessors = "6FS",
                    ResourceID = new List<object>() { 2 }
                });
                tasks[0].SubTasks[1].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 9,
                    TaskName = "Develop prototype",
                    StartDate = "02/13/2017",
                    EndDate = "02/15/2017",
                    Duration = 3,
                    Progress = "100",
                    Predecessors = "6FS",
                    ResourceID = new List<object>() { 3 }
                });
                tasks[0].SubTasks[1].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 10,
                    TaskName = "Get approval from customer",
                    StartDate = "02/16/2017",
                    EndDate = "02/17/2017",
                    Duration = 2,
                    Progress = "100",
                    Predecessors = "9FS",
                    ResourceID = new List<object>() { 1 }
                });
                tasks[0].SubTasks[1].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 11,
                    TaskName = "Design complete",
                    StartDate = "02/17/2017",
                    EndDate = "02/17/2017",
                    Duration = 0,
                    Predecessors = "10FS"
                });


                tasks[0].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 12,
                    TaskName = "Implementation Phase",
                    StartDate = "02/20/2017",
                    EndDate = "03/03/2017"
                });

                tasks[0].SubTasks[2].SubTasks = new List<TaskDataDetails>();

                tasks[0].SubTasks[2].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 13,
                    TaskName = "Phase 1",
                    StartDate = "02/20/2017",
                    EndDate = "03/02/2017"
                });

                tasks[0].SubTasks[2].SubTasks[0].SubTasks = new List<TaskDataDetails>();

                tasks[0].SubTasks[2].SubTasks[0].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 14,
                    TaskName = "Implementation Module 1",
                    StartDate = "02/20/2017",
                    EndDate = "03/02/2017"
                });

                tasks[0].SubTasks[2].SubTasks[0].SubTasks[0].SubTasks = new List<TaskDataDetails>();


                tasks[0].SubTasks[2].SubTasks[0].SubTasks[0].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 15,
                    TaskName = "Development Task 1",
                    StartDate = "02/20/2017",
                    EndDate = "02/22/2017",
                    Duration = 3,
                    Progress = "50",
                    Predecessors = "11FS",
                    ResourceID = new List<object>() { 3 }
                });
                tasks[0].SubTasks[2].SubTasks[0].SubTasks[0].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 16,
                    TaskName = "Development Task 2",
                    StartDate = "02/20/2017",
                    EndDate = "02/22/2017",
                    Duration = 3,
                    Progress = "50",
                    Predecessors = "11FS",
                    ResourceID = new List<object>() { 3 }
                });
                tasks[0].SubTasks[2].SubTasks[0].SubTasks[0].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 17,
                    TaskName = "Testing",
                    StartDate = "02/23/2017",
                    EndDate = "02/24/2017",
                    Duration = 2,
                    Progress = "0",
                    Predecessors = "15FS,16FS",
                    ResourceID = new List<object>() { 4 }
                });
                tasks[0].SubTasks[2].SubTasks[0].SubTasks[0].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 18,
                    TaskName = "Bug fix",
                    StartDate = "02/27/2017",
                    EndDate = "02/28/2017",
                    Duration = 2,
                    Progress = "0",
                    Predecessors = "17FS",
                    ResourceID = new List<object>() { 3 }
                });
                tasks[0].SubTasks[2].SubTasks[0].SubTasks[0].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 19,
                    TaskName = "Customer review meeting",
                    StartDate = "03/01/2017",
                    EndDate = "03/02/2017",
                    Duration = 2,
                    Progress = "0",
                    Predecessors = "18FS",
                    ResourceID = new List<object>() { 1 }
                });
                tasks[0].SubTasks[2].SubTasks[0].SubTasks[0].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 20,
                    TaskName = "Phase 1 complete",
                    StartDate = "03/02/2017",
                    EndDate = "03/02/2017",
                    Duration = 0,
                    Predecessors = "19FS"
                });

                tasks[0].SubTasks[2].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 21,
                    TaskName = "Phase 2",
                    StartDate = "02/20/2017",
                    EndDate = "02/21/2017"
                });

                tasks[0].SubTasks[2].SubTasks[1].SubTasks = new List<TaskDataDetails>();

                tasks[0].SubTasks[2].SubTasks[1].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 22,
                    TaskName = "Implementation Module 2",
                    StartDate = "02/20/2017",
                    EndDate = "03/03/2017"
                });

                tasks[0].SubTasks[2].SubTasks[1].SubTasks[0].SubTasks = new List<TaskDataDetails>();

                tasks[0].SubTasks[2].SubTasks[1].SubTasks[0].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 23,
                    TaskName = "Development Task 1",
                    StartDate = "02/20/2017",
                    EndDate = "02/23/2017",
                    Duration = 4,
                    Progress = "50",
                    ResourceID = new List<object>() { 3 }
                });
                tasks[0].SubTasks[2].SubTasks[1].SubTasks[0].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 24,
                    TaskName = "Development Task 2",
                    StartDate = "02/20/2017",
                    EndDate = "02/23/2017",
                    Duration = 4,
                    Progress = "50",
                    ResourceID = new List<object>() { 3 }
                });
                tasks[0].SubTasks[2].SubTasks[1].SubTasks[0].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 25,
                    TaskName = "Testing",
                    StartDate = "02/24/2017",
                    EndDate = "02/27/2017",
                    Duration = 2,
                    Progress = "0",
                    Predecessors = "23FS,24FS",
                    ResourceID = new List<object>() { 4 }
                });
                tasks[0].SubTasks[2].SubTasks[1].SubTasks[0].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 26,
                    TaskName = "Bug fix",
                    StartDate = "02/28/2017",
                    EndDate = "03/01/2017",
                    Duration = 2,
                    Progress = "0",
                    Predecessors = "25FS",
                    ResourceID = new List<object>() { 3 }
                });
                tasks[0].SubTasks[2].SubTasks[1].SubTasks[0].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 27,
                    TaskName = "Customer review meeting",
                    StartDate = "03/02/2017",
                    EndDate = "03/03/2017",
                    Duration = 2,
                    Progress = "0",
                    Predecessors = "26FS",
                    ResourceID = new List<object>() { 1 }
                });
                tasks[0].SubTasks[2].SubTasks[1].SubTasks[0].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 28,
                    TaskName = "Phase 2 complete",
                    StartDate = "03/03/2017",
                    EndDate = "03/03/2017",
                    Duration = 0,
                    Predecessors = "27FS"
                });

                tasks[0].SubTasks[2].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 29,
                    TaskName = "Phase 3",
                    StartDate = "02/20/2017",
                    EndDate = "03/02/2017"
                });
                tasks[0].SubTasks[2].SubTasks[2].SubTasks = new List<TaskDataDetails>();

                tasks[0].SubTasks[2].SubTasks[2].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 30,
                    TaskName = "Implementation Module 3",
                    StartDate = "02/20/2017",
                    EndDate = "03/02/2017"
                });

                tasks[0].SubTasks[2].SubTasks[2].SubTasks[0].SubTasks = new List<TaskDataDetails>();

                tasks[0].SubTasks[2].SubTasks[2].SubTasks[0].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 31,
                    TaskName = "Development Task 1",
                    StartDate = "02/20/2017",
                    EndDate = "02/22/2017",
                    Duration = 3,
                    Progress = "50",
                    ResourceID = new List<object>() { 3 }
                });
                tasks[0].SubTasks[2].SubTasks[2].SubTasks[0].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 32,
                    TaskName = "Development Task 2",
                    StartDate = "02/20/2017",
                    EndDate = "02/21/2017",
                    Duration = 3,
                    Progress = "50",
                    ResourceID = new List<object>() { 3 }
                });
                tasks[0].SubTasks[2].SubTasks[2].SubTasks[0].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 33,
                    TaskName = "Testing",
                    StartDate = "02/23/2017",
                    EndDate = "02/24/2017",
                    Duration = 2,
                    Progress = "0",
                    Predecessors = "31FS,32FS",
                    ResourceID = new List<object>() { 4 }
                });
                tasks[0].SubTasks[2].SubTasks[2].SubTasks[0].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 34,
                    TaskName = "Bug fix",
                    StartDate = "02/25/2017",
                    EndDate = "02/26/2017",
                    Duration = 2,
                    Progress = "0",
                    Predecessors = "33FS",
                    ResourceID = new List<object>() { 3 }
                });
                tasks[0].SubTasks[2].SubTasks[2].SubTasks[0].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 35,
                    TaskName = "Customer review meeting",
                    StartDate = "03/01/2017",
                    EndDate = "03/02/2017",
                    Duration = 2,
                    Progress = "0",
                    Predecessors = "34FS",
                    ResourceID = new List<object>() { 1 }
                });
                tasks[0].SubTasks[2].SubTasks[2].SubTasks[0].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 36,
                    TaskName = "Phase 3 complete",
                    StartDate = "03/02/2017",
                    EndDate = "03/02/2017",
                    Duration = 0,
                    Predecessors = "35FS"
                });

                tasks[0].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 37,
                    TaskName = "Integration",
                    StartDate = "03/06/2017",
                    EndDate = "03/08/2017",
                    Duration = 2,
                    Progress = "0",
                    Predecessors = "20FS,28FS,36FS",
                    ResourceID = new List<object>() { 3 }
                });
                tasks[0].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 38,
                    TaskName = "Final Testing",
                    StartDate = "03/09/2017",
                    EndDate = "03/10/2017",
                    Duration = 2,
                    Progress = "0",
                    Predecessors = "37FS",
                    ResourceID = new List<object>() { 4 }
                });
                tasks[0].SubTasks.Add(new TaskDataDetails()
                {
                    TaskID = 39,
                    TaskName = "Final Delivery",
                    StartDate = "03/10/2017",
                    EndDate = "03/10/2017",
                    Duration = 0,
                    Predecessors = "38FS"
                });

                return tasks;

            }
        }        
    }
}