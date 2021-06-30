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
using WebSampleBrowser.TreeGrid.Model;
namespace WebSampleBrowser.TreeGrid
{
    public partial class Events : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var DataSource = this.GetEventDataSource();
            this.TreeGridControlEvents.DataSource = DataSource;
            this.TreeGridControlEvents.DataBind();
        }
        public List<TaskDetails> GetEventDataSource()
        {
            List<TaskDetails> tasks = new List<TaskDetails>();
            tasks.Add(new TaskDetails()
            {
                TaskID = 1,
                TaskName = "Planning",
                StartDate = "02/03/2017",
                EndDate = "02/07/2017",
                Priority = "Normal",
                FilterStartDate = new DateTime(2017, 02, 03),
                FilterEndDate = new DateTime(2017, 02, 07),
            });

            tasks[0].SubTasks = new List<TaskDetails>();


            tasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 2,
                TaskName = "Plan timeline",
                StartDate = "02/03/2017",
                EndDate = "02/07/2017",
                Duration = 5,
                Progress = "100",
                Priority = "Low",
                Approved = false,
                FilterStartDate = new DateTime(2017, 02, 03),
                FilterEndDate = new DateTime(2017, 02, 07),
            });
            tasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 3,
                TaskName = "Plan budget",
                StartDate = "02/03/2017",
                EndDate = "02/07/2017",
                Duration = 5,
                Progress = "100",
                Priority = "Normal",
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 03),
                FilterEndDate = new DateTime(2017, 02, 07),
            });
            tasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 4,
                TaskName = "Allocate resources",
                StartDate = "02/03/2017",
                EndDate = "02/07/2017",
                Duration = 5,
                Progress = "100",
                Priority = "High",
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 03),
                FilterEndDate = new DateTime(2017, 02, 07),
            });
            tasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 5,
                TaskName = "Planning complete",
                StartDate = "02/07/2017",
                EndDate = "02/07/2017",
                Duration = 0,
                Approved = false,
                FilterStartDate = new DateTime(2017, 02, 07),
                FilterEndDate = new DateTime(2017, 02, 07),
            });

            tasks.Add(new TaskDetails()
            {
                TaskID = 6,
                TaskName = "Design",
                StartDate = "02/10/2017",
                EndDate = "02/14/2017",
                Priority = "High",
                FilterStartDate = new DateTime(2017, 02, 10),
                FilterEndDate = new DateTime(2017, 02, 14),
            });

            tasks[1].SubTasks = new List<TaskDetails>();

            tasks[1].SubTasks.Add(new TaskDetails()
            {
                TaskID = 7,
                TaskName = "Software Specification",
                StartDate = "02/10/2017",
                EndDate = "02/12/2017",
                Duration = 3,
                Progress = "60",
                Priority = "Critical",
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 10),
                FilterEndDate = new DateTime(2017, 02, 12),
            });
            tasks[1].SubTasks.Add(new TaskDetails()
            {
                TaskID = 8,
                TaskName = "Develop prototype",
                StartDate = "02/10/2017",
                EndDate = "02/12/2017",
                Duration = 3,
                Progress = "100",
                Priority = "Normal",
                Approved = false,
                FilterStartDate = new DateTime(2017, 02, 10),
                FilterEndDate = new DateTime(2017, 02, 12),
            });
            tasks[1].SubTasks.Add(new TaskDetails()
            {
                TaskID = 9,
                TaskName = "Get approval from customer",
                StartDate = "02/13/2017",
                EndDate = "02/14/2017",
                Duration = 2,
                Progress = "100",
                Priority = "Low",
                Approved = false,
                FilterStartDate = new DateTime(2017, 02, 13),
                FilterEndDate = new DateTime(2017, 02, 14),
            });
            tasks[1].SubTasks.Add(new TaskDetails()
            {
                TaskID = 10,
                TaskName = "Design Documentation",
                StartDate = "02/13/2017",
                EndDate = "02/14/2017",
                Duration = 0,
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 14),
                FilterEndDate = new DateTime(2017, 02, 14),
            });
            return tasks;
        }
    }
    public class TaskDetails
    {
        public int TaskID { get; set; }
        public string TaskName { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public int Duration { get; set; }
        public string Progress { get; set; }
        public string Priority { get; set; }
        public bool Approved { get; set; }
        public List<TaskDetails> SubTasks { get; set; }
        public DateTime FilterStartDate { get; set; }
        public DateTime FilterEndDate { get; set; }
    }
}
