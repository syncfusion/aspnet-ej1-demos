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

namespace WebSampleBrowser.Dashboard
{
    public partial class ProjectTracker : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {          
           var resource = GanttDefaultData.ResourceDataContext.GetResourceData();
            var DataSource = GanttDefaultData.GetTaskData();
            this.Gantt.DataSource = DataSource;
            this.Gantt.DataBind();
            this.Gantt.Resources = resource;            
        }
    }

    public class GanttDefaultData
    {

       public class TaskDetails
        {
            public int TaskID { get; set; }
            public string TaskName { get; set; }
            public string StartDate { get; set; }
            public string EndDate { get; set; }
            public int Duration { get; set; }
            public string Progress { get; set; }
            public List<TaskDetails> SubTasks { get; set; }
            public List<object> ResourceID { get; set; }
            public string Predecessors { get; set; }
            public string Notes { get; set; }
            public string isCritical { get; set; }
        }

        public static List<TaskDetails> GetTaskData()
        {
            List<TaskDetails> tasks = new List<TaskDetails>();

            tasks.Add(new TaskDetails()
            {
                TaskID = 1,
                TaskName = "Project Schedule",
                StartDate = "02/06/2017",
                EndDate = "03/10/2017"
            });

            tasks[0].SubTasks = new List<TaskDetails>();

            tasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 2,
                TaskName = "Planning",
                StartDate = "02/06/2017",
                EndDate = "02/10/2017"
            });

            tasks[0].SubTasks[0].SubTasks = new List<TaskDetails>();


            tasks[0].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 3,
                TaskName = "Plan timeline",
                StartDate = "02/06/2017",
                EndDate = "02/10/2017",
                Duration = 5,
                Progress = "100",
                ResourceID = new List<object>() { 1 }
            });
            tasks[0].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 4,
                TaskName = "Plan budget",
                StartDate = "02/06/2017",
                EndDate = "02/10/2017",
                Duration = 5,
                Progress = "100",
                ResourceID = new List<object>() { 1 }
            });
            tasks[0].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 5,
                TaskName = "Allocate resources",
                StartDate = "02/06/2017",
                EndDate = "02/10/2017",
                Duration = 5,
                Progress = "100",
                ResourceID = new List<object>() { 1 }
            });
            tasks[0].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 6,
                TaskName = "Planning complete",
                StartDate = "02/10/2017",
                EndDate = "02/10/2017",
                Duration = 0,
                Predecessors = "3FS,4FS,5FS"
            });

            tasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 7,
                TaskName = "Design",
                StartDate = "02/13/2017",
                EndDate = "02/17/2017"
            });

            tasks[0].SubTasks[1].SubTasks = new List<TaskDetails>();

            tasks[0].SubTasks[1].SubTasks.Add(new TaskDetails()
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
            tasks[0].SubTasks[1].SubTasks.Add(new TaskDetails()
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
            tasks[0].SubTasks[1].SubTasks.Add(new TaskDetails()
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
            tasks[0].SubTasks[1].SubTasks.Add(new TaskDetails()
            {
                TaskID = 11,
                TaskName = "Design complete",
                StartDate = "02/17/2017",
                EndDate = "02/17/2017",
                Duration = 0,
                Predecessors = "10FS"
            });


            tasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 12,
                TaskName = "Implementation Phase",
                StartDate = "02/20/2017",
                EndDate = "03/02/2017"
            });

            tasks[0].SubTasks[2].SubTasks = new List<TaskDetails>();

            tasks[0].SubTasks[2].SubTasks.Add(new TaskDetails()
            {
                TaskID = 13,
                TaskName = "Phase 1",
                StartDate = "02/20/2017",
                EndDate = "03/02/2017"
            });

            tasks[0].SubTasks[2].SubTasks[0].SubTasks = new List<TaskDetails>();

            tasks[0].SubTasks[2].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 14,
                TaskName = "Implementation Module 1",
                StartDate = "02/20/2017",
                EndDate = "03/02/2017"
            });

            tasks[0].SubTasks[2].SubTasks[0].SubTasks[0].SubTasks = new List<TaskDetails>();


            tasks[0].SubTasks[2].SubTasks[0].SubTasks[0].SubTasks.Add(new TaskDetails()
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
            tasks[0].SubTasks[2].SubTasks[0].SubTasks[0].SubTasks.Add(new TaskDetails()
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
            tasks[0].SubTasks[2].SubTasks[0].SubTasks[0].SubTasks.Add(new TaskDetails()
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
            tasks[0].SubTasks[2].SubTasks[0].SubTasks[0].SubTasks.Add(new TaskDetails()
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
            tasks[0].SubTasks[2].SubTasks[0].SubTasks[0].SubTasks.Add(new TaskDetails()
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
            tasks[0].SubTasks[2].SubTasks[0].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 20,
                TaskName = "Phase 1 complete",
                StartDate = "03/02/2017",
                EndDate = "03/02/2017",
                Duration = 0,
                Predecessors = "19FS"
            });

            tasks[0].SubTasks[2].SubTasks.Add(new TaskDetails()
            {
                TaskID = 21,
                TaskName = "Phase 2",
                StartDate = "02/20/2017",
                EndDate = "03/03/2017"
            });

            tasks[0].SubTasks[2].SubTasks[1].SubTasks = new List<TaskDetails>();

            tasks[0].SubTasks[2].SubTasks[1].SubTasks.Add(new TaskDetails()
            {
                TaskID = 22,
                TaskName = "Implementation Module 2",
                StartDate = "02/20/2017",
                EndDate = "03/03/2017"
            });

            tasks[0].SubTasks[2].SubTasks[1].SubTasks[0].SubTasks = new List<TaskDetails>();

            tasks[0].SubTasks[2].SubTasks[1].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 23,
                TaskName = "Development Task 1",
                StartDate = "02/20/2017",
                EndDate = "02/23/2017",
                Duration = 4,
                Progress = "50",
                ResourceID = new List<object>() { 3 }
            });
            tasks[0].SubTasks[2].SubTasks[1].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 24,
                TaskName = "Development Task 2",
                StartDate = "02/20/2017",
                EndDate = "02/23/2017",
                Duration = 4,
                Progress = "50",
                ResourceID = new List<object>() { 3 }
            });
            tasks[0].SubTasks[2].SubTasks[1].SubTasks[0].SubTasks.Add(new TaskDetails()
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
            tasks[0].SubTasks[2].SubTasks[1].SubTasks[0].SubTasks.Add(new TaskDetails()
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
            tasks[0].SubTasks[2].SubTasks[1].SubTasks[0].SubTasks.Add(new TaskDetails()
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
            tasks[0].SubTasks[2].SubTasks[1].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 28,
                TaskName = "Phase 2 complete",
                StartDate = "03/03/2017",
                EndDate = "03/03/2017",
                Duration = 0,
                Predecessors = "27FS"
            });

            tasks[0].SubTasks[2].SubTasks.Add(new TaskDetails()
            {
                TaskID = 29,
                TaskName = "Phase 3",
                StartDate = "02/20/2017",
                EndDate = "03/02/2017"
            });
            tasks[0].SubTasks[2].SubTasks[2].SubTasks = new List<TaskDetails>();

            tasks[0].SubTasks[2].SubTasks[2].SubTasks.Add(new TaskDetails()
            {
                TaskID = 30,
                TaskName = "Implementation Module 3",
                StartDate = "02/20/2017",
                EndDate = "03/02/2017"
            });

            tasks[0].SubTasks[2].SubTasks[2].SubTasks[0].SubTasks = new List<TaskDetails>();

            tasks[0].SubTasks[2].SubTasks[2].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 31,
                TaskName = "Development Task 1",
                StartDate = "02/20/2017",
                EndDate = "02/22/2017",
                Duration = 3,
                Progress = "50",
                ResourceID = new List<object>() { 3 }
            });
            tasks[0].SubTasks[2].SubTasks[2].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 32,
                TaskName = "Development Task 2",
                StartDate = "02/20/2017",
                EndDate = "02/22/2017",
                Duration = 3,
                Progress = "50",
                ResourceID = new List<object>() { 3 }
            });
            tasks[0].SubTasks[2].SubTasks[2].SubTasks[0].SubTasks.Add(new TaskDetails()
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
            tasks[0].SubTasks[2].SubTasks[2].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 34,
                TaskName = "Bug fix",
                StartDate = "02/27/2017",
                EndDate = "02/28/2017",
                Duration = 2,
                Progress = "0",
                Predecessors = "33FS",
                ResourceID = new List<object>() { 3 }
            });
            tasks[0].SubTasks[2].SubTasks[2].SubTasks[0].SubTasks.Add(new TaskDetails()
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
            tasks[0].SubTasks[2].SubTasks[2].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 36,
                TaskName = "Phase 3 complete",
                StartDate = "03/02/2017",
                EndDate = "03/02/2017",
                Duration = 0,
                Predecessors = "35FS"
            });

            tasks[0].SubTasks.Add(new TaskDetails()
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
            tasks[0].SubTasks.Add(new TaskDetails()
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
            tasks[0].SubTasks.Add(new TaskDetails()
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


        public class ResourceDataContext
        {
            public class Resources
            {
                public int ResourceID { get; set; }
                public string ResourceName { get; set; }
            }

            public static List<Resources> GetResourceData()
            {
                List<Resources> resourceDetails = new List<Resources>();

                resourceDetails.Add(new Resources() { ResourceID = 1, ResourceName = "Project Manager" });
                resourceDetails.Add(new Resources() { ResourceID = 2, ResourceName = "Software Analyst" });
                resourceDetails.Add(new Resources() { ResourceID = 3, ResourceName = "Developer" });
                resourceDetails.Add(new Resources() { ResourceID = 4, ResourceName = "Testing Engineer" });

                return resourceDetails;
            }

        }
    }

    public class DefaultData
    {
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public int Id { get; set; }
        public string Name { get; set; }
        public int Duration { get; set; }
        public string PercentDone { get; set; }
        public List<object> ResourceID { get; set; }
        public List<DefaultData> Children { get; set; }
        public string Predescessor { get; set; }
    }
}