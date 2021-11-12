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
    public partial class Editing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var DataSource = this.GetDataSource();
            this.GanttControlEditing.DataSource = DataSource;
            this.GanttControlEditing.DataBind();
        }

       

        public List<GanttEditingTaskData> GetDataSource()
        {
            List<GanttEditingTaskData> tasks = new List<GanttEditingTaskData>();

            tasks.Add(new GanttEditingTaskData()
            {
                TaskID = 1,
                TaskName = "Project Schedule",
                StartDate = "02/06/2017",
                EndDate = "03/13/2017"
            });

            tasks[0].SubTasks = new List<GanttEditingTaskData>();

            tasks[0].SubTasks.Add(new GanttEditingTaskData()
            {
                TaskID = 2,
                TaskName = "Planning",
                StartDate = "02/06/2017",
                EndDate = "02/10/2017"
            });

            tasks[0].SubTasks[0].SubTasks = new List<GanttEditingTaskData>();


            tasks[0].SubTasks[0].SubTasks.Add(new GanttEditingTaskData()
            {
                TaskID = 3,
                TaskName = "Plan timeline",
                StartDate = "02/06/2017",
                EndDate = "02/10/2017",
                Duration = 5,
                Progress = "100"
            });
            tasks[0].SubTasks[0].SubTasks.Add(new GanttEditingTaskData()
            {
                TaskID = 4,
                TaskName = "Plan budget",
                StartDate = "02/06/2017",
                EndDate = "02/10/2017",
                Duration = 5,
                Progress = "100"
            });
            tasks[0].SubTasks[0].SubTasks.Add(new GanttEditingTaskData()
            {
                TaskID = 5,
                TaskName = "Allocate resources",
                StartDate = "02/06/2017",
                EndDate = "02/10/2017",
                Duration = 5,
                Progress = "100"
            });
            tasks[0].SubTasks[0].SubTasks.Add(new GanttEditingTaskData()
            {
                TaskID = 6,
                TaskName = "Planning complete",
                StartDate = "02/10/2017",
                EndDate = "02/10/2017",
                Duration = 0,
                Predecessors = "3FS,4FS,5FS"
            });

            tasks[0].SubTasks.Add(new GanttEditingTaskData()
            {
                TaskID = 7,
                TaskName = "Design",
                StartDate = "02/13/2017",
                EndDate = "02/17/2017"
            });

            tasks[0].SubTasks[1].SubTasks = new List<GanttEditingTaskData>();

            tasks[0].SubTasks[1].SubTasks.Add(new GanttEditingTaskData()
            {
                TaskID = 8,
                TaskName = "Software Specification",
                StartDate = "02/13/2017",
                EndDate = "02/15/2017",
                Duration = 3,
                Progress = "60",
                Predecessors = "6FS"
            });
            tasks[0].SubTasks[1].SubTasks.Add(new GanttEditingTaskData()
            {
                TaskID = 9,
                TaskName = "Develop prototype",
                StartDate = "02/13/2017",
                EndDate = "02/15/2017",
                Duration = 3,
                Progress = "100",
                Predecessors = "6FS"
            });
            tasks[0].SubTasks[1].SubTasks.Add(new GanttEditingTaskData()
            {
                TaskID = 10,
                TaskName = "Get approval from customer",
                StartDate = "02/16/2017",
                EndDate = "02/17/2017",
                Duration = 2,
                Progress = "100",
                Predecessors = "9FS"
            });
            tasks[0].SubTasks[1].SubTasks.Add(new GanttEditingTaskData()
            {
                TaskID = 11,
                TaskName = "Design complete",
                StartDate = "02/17/2017",
                EndDate = "02/17/2017",
                Duration = 0,
                Predecessors = "10FS"
            });


            tasks[0].SubTasks.Add(new GanttEditingTaskData()
            {
                TaskID = 12,
                TaskName = "Implementation",
                StartDate = "02/20/2017",
                EndDate = "03/05/2017"
            });

            tasks[0].SubTasks[2].SubTasks = new List<GanttEditingTaskData>();

            tasks[0].SubTasks[2].SubTasks.Add(new GanttEditingTaskData()
            {
                TaskID = 13,
                TaskName = "Development Task 1",
                StartDate = "02/20/2017",
                EndDate = "02/22/2017",
                Duration = 3,
                Progress = "50",
                Predecessors = "11FS"
            });

            tasks[0].SubTasks[2].SubTasks.Add(new GanttEditingTaskData()
            {
                TaskID = 14,
                TaskName = "Development Task 2",
                StartDate = "02/20/2017",
                EndDate = "02/22/2017",
                Duration = 3,
                Progress = "50",
                Predecessors = "11FS"
            });


            tasks[0].SubTasks[2].SubTasks.Add(new GanttEditingTaskData()
            {
                TaskID = 15,
                TaskName = "Testing",
                StartDate = "02/23/2017",
                EndDate = "02/24/2017",
                Duration = 2,
                Progress = "0",
                Predecessors = "13FS,14FS"
            });
            tasks[0].SubTasks[2].SubTasks.Add(new GanttEditingTaskData()
            {
                TaskID = 16,
                TaskName = "Bug fix",
                StartDate = "02/27/2017",
                EndDate = "02/28/2017",
                Duration = 2,
                Progress = "0",
                Predecessors = "15FS"
            });
            tasks[0].SubTasks[2].SubTasks.Add(new GanttEditingTaskData()
            {
                TaskID = 17,
                TaskName = "Customer review meeting",
                StartDate = "03/01/2017",
                EndDate = "03/02/2017",
                Duration = 2,
                Progress = "0",
                Predecessors = "16FS"
            });
            tasks[0].SubTasks[2].SubTasks.Add(new GanttEditingTaskData()
            {
                TaskID = 18,
                TaskName = "Implemenation complete",
                StartDate = "03/02/2017",
                EndDate = "03/02/2017",
                Duration = 0,
                Predecessors = "17FS"
            });

            tasks[0].SubTasks.Add(new GanttEditingTaskData()
            {
                TaskID = 19,
                TaskName = "Integration",
                StartDate = "03/05/2017",
                EndDate = "03/08/2017",
                Duration = 2,
                Progress = "0",
                Predecessors = "18FS"
            });
            tasks[0].SubTasks.Add(new GanttEditingTaskData()
            {
                TaskID = 20,
                TaskName = "Final Testing",
                StartDate = "03/09/2017",
                EndDate = "03/10/2017",
                Duration = 2,
                Progress = "0",
                Predecessors = "19FS"
            });
            tasks[0].SubTasks.Add(new GanttEditingTaskData()
            {
                TaskID = 21,
                TaskName = "Final Delivery",
                StartDate = "03/10/2017",
                EndDate = "03/10/2017",
                Duration = 0,
                Predecessors = "20FS"
            });

            return tasks;
        }
        public class GanttEditingTaskData
        {
            public int TaskID { get; set; }
            public string TaskName { get; set; }
            public string StartDate { get; set; }
            public string EndDate { get; set; }
            public int Duration { get; set; }
            public string Progress { get; set; }
            public List<GanttEditingTaskData> SubTasks { get; set; }
            public List<object> ResourceID { get; set; }
            public string Predecessors { get; set; }
        }
    }
}