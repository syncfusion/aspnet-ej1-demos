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
using WebSampleBrowser.Gantt.Model;
namespace WebSampleBrowser.Gantt
{
    public partial class HistogramView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.GanttContainer.DataSource = GetHistogramData();
            this.GanttContainer.Resources = ResourceHistogramData.GetResourceData();
            this.GanttContainer.DataBind();
            this.HistoGanttContainer.DataSource = GetHistogramData();
            this.HistoGanttContainer.Resources = ResourceHistogramData.GetResourceData();
            this.HistoGanttContainer.DataBind();
        }

        public List<HistoTaskDetails> GetHistogramData()
        {
            List<HistoTaskDetails> tasks = new List<HistoTaskDetails>();

            tasks.Add(new HistoTaskDetails()
            {
                TaskID = 1,
                TaskName = "Plan timeline",
                StartDate = "10/23/2017",
                Duration = 4,
                Progress = "70"
            });

            tasks[0].SubTasks = new List<HistoTaskDetails>();

            tasks[0].SubTasks.Add(new HistoTaskDetails()
            {
                TaskID = 2,
                TaskName = "Plan budget",
                StartDate = "10/23/2017",
                Duration = 4,
                Progress = "80",
                ResourceID = new List<object>() { 1, 4 }
            });
            tasks[0].SubTasks.Add(new HistoTaskDetails()
            {
                TaskID = 3,
                TaskName = "Allocate resource",
                StartDate = "10/24/2017",
                Duration = 5,
                Progress = "65",
                ResourceID = new List<object>() { 3, 1 }
            });
            tasks[0].SubTasks.Add(new HistoTaskDetails()
            {
                TaskID = 4,
                TaskName = "Software Specification",
                StartDate = "10/24/2017",
                Duration = 5,
                Progress = "65",
                ResourceID = new List<object>() { 5, 4 }
            });


            tasks.Add(new HistoTaskDetails()
            {
                TaskID = 5,
                TaskName = "Design",
                StartDate = "10/25/2017",
                Duration = 6,
            });

            tasks[1].SubTasks = new List<HistoTaskDetails>();

            tasks[1].SubTasks.Add(new HistoTaskDetails()
            {
                TaskID = 6,
                TaskName = "Get approval",
                StartDate = "10/28/2017",
                Duration = 5,
                Progress = "60",
                ResourceID = new List<object>() { 2, 5 }
            });
            tasks[1].SubTasks.Add(new HistoTaskDetails()
            {
                TaskID = 7,
                TaskName = "Testing",
                StartDate = "10/29/2017",
                Duration = 6,
                Progress = "77",
                ResourceID = new List<object>() { 6, 7 }
            });
            tasks[1].SubTasks.Add(new HistoTaskDetails()
            {
                TaskID = 8,
                TaskName = "Final Delivery",
                StartDate = "10/29/2017",
                Duration = 0,
                Progress = "77",
                ResourceID = new List<object>() { 3 }
            });
            return tasks;

        }


        public class ResourceHistogramData
        {
            public class Resources
            {
                public int ResourceID { get; set; }
                public string ResourceName { get; set; }
            }

            public static List<Resources> GetResourceData()
            {
                List<Resources> resourceDetails = new List<Resources>();

                resourceDetails.Add(new Resources() { ResourceID = 1, ResourceName = "Robert King" });
                resourceDetails.Add(new Resources() { ResourceID = 2, ResourceName = "Anne Dodsworth" });
                resourceDetails.Add(new Resources() { ResourceID = 3, ResourceName = "David william" });
                resourceDetails.Add(new Resources() { ResourceID = 4, ResourceName = "Nancy Davolio" });
                resourceDetails.Add(new Resources() { ResourceID = 5, ResourceName = "Janet Leverling" });
                resourceDetails.Add(new Resources() { ResourceID = 6, ResourceName = "Romey Wilson" });

                return resourceDetails;
            }

        }
        public class HistoTaskDetails
        {
            public int TaskID { get; set; }
            public string TaskName { get; set; }
            public string StartDate { get; set; }
            public string EndDate { get; set; }
            public int Duration { get; set; }
            public string Progress { get; set; }
            public List<HistoTaskDetails> SubTasks { get; set; }
            public List<object> ResourceID { get; set; }
            public string Predecessors { get; set; }
        }
    }
}