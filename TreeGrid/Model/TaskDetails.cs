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

namespace WebSampleBrowser.TreeGrid.Model
{
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

    public class ShipmentData
    {
        public string ID { get; set; }
        public string Name { get; set; }
        public string Category { get; set; }
        public int Units { get; set; }
        public int UnitPrice { get; set; }
        public int Price { get; set; }
        public List<ShipmentData> SubTasks { get; set; }
    }

    public class TemplateData
    {
        public string Name { get; set; }
        public string FullName { get; set; }
        public string Designation { get; set; }
        public string EmployeeID { get; set; }
        public string Address { get; set; }
        public string Contact { get; set; }
        public string Country { get; set; }
        public string DOB { get; set; }
        public string DOJ { get; set; }
        public int Orders { get; set; }
        public int Sales { get; set; }
        public List<TemplateData> Children { get; set; }

    }

    public class SummaryData
    {
        public string FreightID { get; set; }
        public string FreightName { get; set; }
        public int TotalUnits { get; set; }
        public int TotalCosts { get; set; }
        public int UnitWeight { get; set; }       
        public List<SummaryData> Children { get; set; }

    }
    public class FileInfo
    {
        public string Name { get; set; }
        public string DateModified { get; set; }
        public string Type { get; set; }
        public string DateCreated { get; set; }
        public List<FileInfo> SubFolder { get; set; }
    }

    public class ExportTaskDetailsCollection
    {
        public List<TaskDetails> GetDataSource()
        {
            List<TaskDetails> tasks = new List<TaskDetails>();

            tasks.Add(new TaskDetails()
            {
                TaskID = 1,
                TaskName = "Planning",
                StartDate = "02/03/2017",
                EndDate = "02/07/2017",
                Priority = "Normal",
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
            });
            tasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 5,
                TaskName = "Planning complete",
                StartDate = "02/07/2017",
                EndDate = "02/07/2017",
                Duration = 0,
                Approved = false,
            });
            return tasks;
        }

        public List<TaskDetails> GetDesignPhaseDataSource()
        {
            List<TaskDetails> tasks = new List<TaskDetails>();
            tasks.Add(new TaskDetails()
            {
                TaskID = 1,
                TaskName = "Design",
                StartDate = "02/10/2017",
                EndDate = "02/14/2017",
                Priority = "High",
            });

            tasks[0].SubTasks = new List<TaskDetails>();

            tasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 2,
                TaskName = "Software Specification",
                StartDate = "02/10/2017",
                EndDate = "02/12/2017",
                Duration = 3,
                Progress = "60",
                Priority = "Critical",
                Approved = true,
            });
            tasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 3,
                TaskName = "Develop prototype",
                StartDate = "02/10/2017",
                EndDate = "02/12/2017",
                Duration = 3,
                Progress = "100",
                Priority = "Normal",
                Approved = false,
            });
            tasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 4,
                TaskName = "Get approval from customer",
                StartDate = "02/13/2017",
                EndDate = "02/14/2017",
                Duration = 2,
                Progress = "100",
                Priority = "Low",
                Approved = false,
            });
            tasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 5,
                TaskName = "Design complete",
                StartDate = "02/14/2017",
                EndDate = "02/14/2017",
                Duration = 0,
                Approved = true,
            });
            return tasks;
        }

        public List<TaskDetails> GetImplementationPhaseDataSource()
        {
            List<TaskDetails> tasks = new List<TaskDetails>();
            tasks.Add(new TaskDetails()
            {
                TaskID = 1,
                TaskName = "Implementation Phase",
                StartDate = "02/17/2017",
                EndDate = "02/27/2017",
                Priority = "Normal",
            });

            tasks[0].SubTasks = new List<TaskDetails>();

            tasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 2,
                TaskName = "Phase 1",
                StartDate = "02/17/2017",
                EndDate = "02/27/2017",
                Priority = "High",
            });

            tasks[0].SubTasks[0].SubTasks = new List<TaskDetails>();

            tasks[0].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 3,
                TaskName = "Implementation Module 1",
                StartDate = "02/17/2017",
                EndDate = "02/27/2017",
                Priority = "Normal",
            });

            tasks[0].SubTasks[0].SubTasks[0].SubTasks = new List<TaskDetails>();


            tasks[0].SubTasks[0].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 4,
                TaskName = "Development Task 1",
                StartDate = "02/17/2017",
                EndDate = "02/19/2017",
                Duration = 3,
                Progress = "50",
                Priority = "Critical",
                Approved = true,
            });
            tasks[0].SubTasks[0].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 5,
                TaskName = "Development Task 2",
                StartDate = "02/17/2017",
                EndDate = "02/19/2017",
                Duration = 3,
                Progress = "50",
                Priority = "Low",
                Approved = true,
            });
            tasks[0].SubTasks[0].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 6,
                TaskName = "Testing",
                StartDate = "02/20/2017",
                EndDate = "02/21/2017",
                Duration = 2,
                Progress = "0",
                Priority = "Normal",
                Approved = false,
            });
            tasks[0].SubTasks[0].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 7,
                TaskName = "Bug fix",
                StartDate = "02/24/2017",
                EndDate = "02/25/2017",
                Duration = 2,
                Progress = "0",
                Priority = "Low",
                Approved = false,
            });
            tasks[0].SubTasks[0].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 8,
                TaskName = "Customer review meeting",
                StartDate = "02/26/2017",
                EndDate = "02/27/2017",
                Duration = 2,
                Progress = "0",
                Priority = "High",
                Approved = true,
            });
            tasks[0].SubTasks[0].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 9,
                TaskName = "Phase 1 complete",
                StartDate = "02/27/2017",
                EndDate = "02/27/2017",
                Duration = 0,
                Priority = "Low",
                Approved = false,
            });

            tasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 10,
                TaskName = "Phase 2",
                StartDate = "02/17/2017",
                EndDate = "02/28/2017",
                Priority = "High",
            });

            tasks[0].SubTasks[1].SubTasks = new List<TaskDetails>();

            tasks[0].SubTasks[1].SubTasks.Add(new TaskDetails()
            {
                TaskID = 11,
                TaskName = "Implementation Module 2",
                StartDate = "02/17/2017",
                EndDate = "02/28/2017",
                Priority = "Normal",
            });

            tasks[0].SubTasks[1].SubTasks[0].SubTasks = new List<TaskDetails>();

            tasks[0].SubTasks[1].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 12,
                TaskName = "Development Task 1",
                StartDate = "02/17/2017",
                EndDate = "02/20/2017",
                Duration = 4,
                Progress = "50",
                Priority = "High",
                Approved = false,
            });
            tasks[0].SubTasks[1].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 13,
                TaskName = "Development Task 2",
                StartDate = "02/17/2017",
                EndDate = "02/20/2017",
                Duration = 4,
                Progress = "50",
                Priority = "Critical",
                Approved = true,
            });
            tasks[0].SubTasks[1].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 14,
                TaskName = "Testing",
                StartDate = "02/21/2017",
                EndDate = "02/24/2017",
                Duration = 2,
                Progress = "0",
                Priority = "Normal",
                Approved = true,
            });
            tasks[0].SubTasks[1].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 15,
                TaskName = "Bug fix",
                StartDate = "02/25/2017",
                EndDate = "02/26/2017",
                Duration = 2,
                Progress = "0",
                Priority = "Critical",
                Approved = false,
            });
            tasks[0].SubTasks[1].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 16,
                TaskName = "Customer review meeting",
                StartDate = "02/27/2017",
                EndDate = "02/28/2017",
                Duration = 2,
                Progress = "0",
                Priority = "High",
                Approved = false,
            });
            tasks[0].SubTasks[1].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 17,
                TaskName = "Phase 2 complete",
                StartDate = "02/28/2017",
                EndDate = "02/28/2017",
                Duration = 0,
                Priority = "Low",
                Approved = true,
            });

            tasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 18,
                TaskName = "Phase 3",
                StartDate = "02/17/2017",
                EndDate = "02/27/2017",
                Priority = "Critical",
            });
            tasks[0].SubTasks[2].SubTasks = new List<TaskDetails>();

            tasks[0].SubTasks[2].SubTasks.Add(new TaskDetails()
            {
                TaskID = 19,
                TaskName = "Implementation Module 3",
                StartDate = "02/17/2017",
                EndDate = "02/27/2017",
                Priority = "High",
            });

            tasks[0].SubTasks[2].SubTasks[0].SubTasks = new List<TaskDetails>();

            tasks[0].SubTasks[2].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 20,
                TaskName = "Development Task 1",
                StartDate = "02/17/2017",
                EndDate = "02/19/2017",
                Duration = 3,
                Progress = "50",
                Priority = "High",
                Approved = false,
            });
            tasks[0].SubTasks[2].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 21,
                TaskName = "Development Task 2",
                StartDate = "02/17/2017",
                EndDate = "02/19/2017",
                Duration = 3,
                Progress = "50",
                Priority = "Critical",
                Approved = true,
            });
            tasks[0].SubTasks[2].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 22,
                TaskName = "Testing",
                StartDate = "02/20/2017",
                EndDate = "02/21/2017",
                Duration = 2,
                Progress = "0",
                Priority = "High",
                Approved = false,
            });
            tasks[0].SubTasks[2].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 23,
                TaskName = "Bug fix",
                StartDate = "02/24/2017",
                EndDate = "02/25/2017",
                Duration = 2,
                Progress = "0",
                Priority = "Low",
                Approved = true,
            });
            tasks[0].SubTasks[2].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 24,
                TaskName = "Customer review meeting",
                StartDate = "02/26/2017",
                EndDate = "02/27/2017",
                Duration = 2,
                Progress = "0",
                Priority = "Normal",
                Approved = false,
            });
            tasks[0].SubTasks[2].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 25,
                TaskName = "Phase 3 complete",
                StartDate = "02/27/2017",
                EndDate = "02/27/2017",
                Duration = 0,
                Priority = "Critical",
                Approved = true,
            });
            return tasks;
        }

    }
    public class TaskDetailsCollection
    {
        public List<TaskDetails> GetDataSource()
        {
            List<TaskDetails> tasks = new List<TaskDetails>();

            //tasks.Add(new TaskDetails()
            //{
            //    TaskID = 1,
            //    TaskName = "Project Schedule",
            //    StartDate = "02/03/2017",
            //    EndDate = "03/07/2017"
            //});

            //tasks[0].SubTasks = new List<TaskDetails>();

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
            tasks[1].SubTasks.Add(new TaskDetails()
            {
                TaskID = 11,
                TaskName = "Design complete",
                StartDate = "02/14/2017",
                EndDate = "02/14/2017",
                Duration = 0,
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 14),
                FilterEndDate = new DateTime(2017, 02, 14),
            });


            tasks.Add(new TaskDetails()
            {
                TaskID = 12,
                TaskName = "Implementation Phase",
                StartDate = "02/17/2017",
                EndDate = "02/27/2017",
                Priority = "Normal",
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 27),
            });

            tasks[2].SubTasks = new List<TaskDetails>();

            tasks[2].SubTasks.Add(new TaskDetails()
            {
                TaskID = 13,
                TaskName = "Phase 1",
                StartDate = "02/17/2017",
                EndDate = "02/27/2017",
                Priority = "High",
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 27),
            });

            tasks[2].SubTasks[0].SubTasks = new List<TaskDetails>();

            tasks[2].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 14,
                TaskName = "Implementation Module 1",
                StartDate = "02/17/2017",
                EndDate = "02/27/2017",
                Priority = "Normal",
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 27),
            });

            tasks[2].SubTasks[0].SubTasks[0].SubTasks = new List<TaskDetails>();


            tasks[2].SubTasks[0].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 15,
                TaskName = "Development Task 1",
                StartDate = "02/17/2017",
                EndDate = "02/19/2017",
                Duration = 3,
                Progress = "50",
                Priority = "Critical",
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 19),
            });
            tasks[2].SubTasks[0].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 16,
                TaskName = "Development Task 2",
                StartDate = "02/17/2017",
                EndDate = "02/19/2017",
                Duration = 3,
                Progress = "50",
                Priority = "Low",
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 19),
            });
            tasks[2].SubTasks[0].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 17,
                TaskName = "Testing",
                StartDate = "02/20/2017",
                EndDate = "02/21/2017",
                Duration = 2,
                Progress = "0",
                Priority = "Normal",
                Approved = false,
                FilterStartDate = new DateTime(2017, 02, 20),
                FilterEndDate = new DateTime(2017, 02, 21),
            });
            tasks[2].SubTasks[0].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 18,
                TaskName = "Bug fix",
                StartDate = "02/24/2017",
                EndDate = "02/25/2017",
                Duration = 2,
                Progress = "0",
                Priority = "Low",
                Approved = false,
                FilterStartDate = new DateTime(2017, 02, 24),
                FilterEndDate = new DateTime(2017, 02, 25),
            });
            tasks[2].SubTasks[0].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 19,
                TaskName = "Customer review meeting",
                StartDate = "02/26/2017",
                EndDate = "02/27/2017",
                Duration = 2,
                Progress = "0",
                Priority = "High",
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 26),
                FilterEndDate = new DateTime(2017, 02, 27),
            });
            tasks[2].SubTasks[0].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 20,
                TaskName = "Phase 1 complete",
                StartDate = "02/27/2017",
                EndDate = "02/27/2017",
                Duration = 0,
                Priority = "Low",
                Approved = false,
                FilterStartDate = new DateTime(2017, 02, 27),
                FilterEndDate = new DateTime(2017, 02, 27),
            });

            tasks[2].SubTasks.Add(new TaskDetails()
            {
                TaskID = 21,
                TaskName = "Phase 2",
                StartDate = "02/17/2017",
                EndDate = "02/28/2017",
                Priority = "High",
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 28),
            });

            tasks[2].SubTasks[1].SubTasks = new List<TaskDetails>();

            tasks[2].SubTasks[1].SubTasks.Add(new TaskDetails()
            {
                TaskID = 22,
                TaskName = "Implementation Module 2",
                StartDate = "02/17/2017",
                EndDate = "02/28/2017",
                Priority = "Normal",
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 28),
            });

            tasks[2].SubTasks[1].SubTasks[0].SubTasks = new List<TaskDetails>();

            tasks[2].SubTasks[1].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 23,
                TaskName = "Development Task 1",
                StartDate = "02/17/2017",
                EndDate = "02/20/2017",
                Duration = 4,
                Progress = "50",
                Priority = "High",
                Approved = false,
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 20),
            });
            tasks[2].SubTasks[1].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 24,
                TaskName = "Development Task 2",
                StartDate = "02/17/2017",
                EndDate = "02/20/2017",
                Duration = 4,
                Progress = "50",
                Priority = "Critical",
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 20),
            });
            tasks[2].SubTasks[1].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 25,
                TaskName = "Testing",
                StartDate = "02/21/2017",
                EndDate = "02/24/2017",
                Duration = 2,
                Progress = "0",
                Priority = "Normal",
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 21),
                FilterEndDate = new DateTime(2017, 02, 24),
            });
            tasks[2].SubTasks[1].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 26,
                TaskName = "Bug fix",
                StartDate = "02/25/2017",
                EndDate = "02/26/2017",
                Duration = 2,
                Progress = "0",
                Priority = "Critical",
                Approved = false,
                FilterStartDate = new DateTime(2017, 02, 25),
                FilterEndDate = new DateTime(2017, 02, 26),
            });
            tasks[2].SubTasks[1].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 27,
                TaskName = "Customer review meeting",
                StartDate = "02/27/2017",
                EndDate = "02/28/2017",
                Duration = 2,
                Progress = "0",
                Priority = "High",
                Approved = false,
                FilterStartDate = new DateTime(2017, 02, 27),
                FilterEndDate = new DateTime(2017, 02, 28),
            });
            tasks[2].SubTasks[1].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 28,
                TaskName = "Phase 2 complete",
                StartDate = "02/28/2017",
                EndDate = "02/28/2017",
                Duration = 0,
                Priority = "Low",
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 28),
                FilterEndDate = new DateTime(2017, 02, 28),
            });

            tasks[2].SubTasks.Add(new TaskDetails()
            {
                TaskID = 29,
                TaskName = "Phase 3",
                StartDate = "02/17/2017",
                EndDate = "02/27/2017",
                Priority = "Critical",
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 27),
            });
            tasks[2].SubTasks[2].SubTasks = new List<TaskDetails>();

            tasks[2].SubTasks[2].SubTasks.Add(new TaskDetails()
            {
                TaskID = 30,
                TaskName = "Implementation Module 3",
                StartDate = "02/17/2017",
                EndDate = "02/27/2017",
                Priority = "High",
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 27),
            });

            tasks[2].SubTasks[2].SubTasks[0].SubTasks = new List<TaskDetails>();

            tasks[2].SubTasks[2].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 31,
                TaskName = "Development Task 1",
                StartDate = "02/17/2017",
                EndDate = "02/19/2017",
                Duration = 3,
                Progress = "50",
                Priority = "High",
                Approved = false,
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 19),
            });
            tasks[2].SubTasks[2].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 32,
                TaskName = "Development Task 2",
                StartDate = "02/17/2017",
                EndDate = "02/19/2017",
                Duration = 3,
                Progress = "50",
                Priority = "Critical",
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 19),
            });
            tasks[2].SubTasks[2].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 33,
                TaskName = "Testing",
                StartDate = "02/20/2017",
                EndDate = "02/21/2017",
                Duration = 2,
                Progress = "0",
                Priority = "High",
                Approved = false,
                FilterStartDate = new DateTime(2017, 02, 20),
                FilterEndDate = new DateTime(2017, 02, 21),
            });
            tasks[2].SubTasks[2].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 34,
                TaskName = "Bug fix",
                StartDate = "02/24/2017",
                EndDate = "02/25/2017",
                Duration = 2,
                Progress = "0",
                Priority = "Low",
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 24),
                FilterEndDate = new DateTime(2017, 02, 25),
            });
            tasks[2].SubTasks[2].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 35,
                TaskName = "Customer review meeting",
                StartDate = "02/26/2017",
                EndDate = "02/27/2017",
                Duration = 2,
                Progress = "0",
                Priority = "Normal",
                Approved = false,
                FilterStartDate = new DateTime(2017, 02, 26),
                FilterEndDate = new DateTime(2017, 02, 27),
            });
            tasks[2].SubTasks[2].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 36,
                TaskName = "Phase 3 complete",
                StartDate = "02/27/2017",
                EndDate = "02/27/2017",
                Duration = 0,
                Priority = "Critical",
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 27),
                FilterEndDate = new DateTime(2017, 02, 27),
            });
            return tasks;
        }
        public List<TaskDetails> GetBatchEditDataSource()
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
            tasks[1].SubTasks.Add(new TaskDetails()
            {
                TaskID = 11,
                TaskName = "Design complete",
                StartDate = "02/14/2017",
                EndDate = "02/14/2017",
                Duration = 0,
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 14),
                FilterEndDate = new DateTime(2017, 02, 14),
            });


            tasks.Add(new TaskDetails()
            {
                TaskID = 12,
                TaskName = "Phase 1",
                StartDate = "02/17/2017",
                EndDate = "02/27/2017",
                Priority = "High",
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 27),
            });

            tasks[2].SubTasks = new List<TaskDetails>();

            tasks[2].SubTasks.Add(new TaskDetails()
            {
                TaskID = 13,
                TaskName = "Implementation Module 1",
                StartDate = "02/17/2017",
                EndDate = "02/27/2017",
                Priority = "Normal",
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 27),
            });

            tasks[2].SubTasks[0].SubTasks = new List<TaskDetails>();


            tasks[2].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 14,
                TaskName = "Development Task 1",
                StartDate = "02/17/2017",
                EndDate = "02/19/2017",
                Duration = 3,
                Progress = "50",
                Priority = "Critical",
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 19),
            });
            tasks[2].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 15,
                TaskName = "Development Task 2",
                StartDate = "02/17/2017",
                EndDate = "02/19/2017",
                Duration = 3,
                Progress = "50",
                Priority = "Low",
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 19),
            });
            tasks[2].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 16,
                TaskName = "Testing",
                StartDate = "02/20/2017",
                EndDate = "02/21/2017",
                Duration = 2,
                Progress = "0",
                Priority = "Normal",
                Approved = false,
                FilterStartDate = new DateTime(2017, 02, 20),
                FilterEndDate = new DateTime(2017, 02, 21),
            });
            tasks[2].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 17,
                TaskName = "Bug fix",
                StartDate = "02/24/2017",
                EndDate = "02/25/2017",
                Duration = 2,
                Progress = "0",
                Priority = "Low",
                Approved = false,
                FilterStartDate = new DateTime(2017, 02, 24),
                FilterEndDate = new DateTime(2017, 02, 25),
            });
            tasks[2].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 18,
                TaskName = "Customer review meeting",
                StartDate = "02/26/2017",
                EndDate = "02/27/2017",
                Duration = 2,
                Progress = "0",
                Priority = "High",
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 26),
                FilterEndDate = new DateTime(2017, 02, 27),
            });
            tasks[2].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 19,
                TaskName = "Phase 1 complete",
                StartDate = "02/27/2017",
                EndDate = "02/27/2017",
                Duration = 0,
                Priority = "Low",
                Approved = false,
                FilterStartDate = new DateTime(2017, 02, 27),
                FilterEndDate = new DateTime(2017, 02, 27),
            });

            tasks.Add(new TaskDetails()
            {
                TaskID = 20,
                TaskName = "Phase 2",
                StartDate = "02/17/2017",
                EndDate = "02/28/2017",
                Priority = "High",
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 28),
            });

            tasks[3].SubTasks = new List<TaskDetails>();

            tasks[3].SubTasks.Add(new TaskDetails()
            {
                TaskID = 21,
                TaskName = "Implementation Module 2",
                StartDate = "02/17/2017",
                EndDate = "02/28/2017",
                Priority = "Normal",
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 28),
            });

            tasks[3].SubTasks[0].SubTasks = new List<TaskDetails>();

            tasks[3].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 22,
                TaskName = "Development Task 1",
                StartDate = "02/17/2017",
                EndDate = "02/20/2017",
                Duration = 4,
                Progress = "50",
                Priority = "High",
                Approved = false,
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 20),
            });
            tasks[3].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 23,
                TaskName = "Development Task 2",
                StartDate = "02/17/2017",
                EndDate = "02/20/2017",
                Duration = 4,
                Progress = "50",
                Priority = "Critical",
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 20),
            });
            tasks[3].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 24,
                TaskName = "Testing",
                StartDate = "02/21/2017",
                EndDate = "02/24/2017",
                Duration = 2,
                Progress = "0",
                Priority = "Normal",
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 21),
                FilterEndDate = new DateTime(2017, 02, 24),
            });
            tasks[3].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 25,
                TaskName = "Bug fix",
                StartDate = "02/25/2017",
                EndDate = "02/26/2017",
                Duration = 2,
                Progress = "0",
                Priority = "Critical",
                Approved = false,
                FilterStartDate = new DateTime(2017, 02, 25),
                FilterEndDate = new DateTime(2017, 02, 26),
            });
            tasks[3].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 26,
                TaskName = "Customer review meeting",
                StartDate = "02/27/2017",
                EndDate = "02/28/2017",
                Duration = 2,
                Progress = "0",
                Priority = "High",
                Approved = false,
                FilterStartDate = new DateTime(2017, 02, 27),
                FilterEndDate = new DateTime(2017, 02, 28),
            });
            tasks[3].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 27,
                TaskName = "Phase 2 complete",
                StartDate = "02/28/2017",
                EndDate = "02/28/2017",
                Duration = 0,
                Priority = "Low",
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 28),
                FilterEndDate = new DateTime(2017, 02, 28),
            });

            tasks.Add(new TaskDetails()
            {
                TaskID = 28,
                TaskName = "Phase 3",
                StartDate = "02/17/2017",
                EndDate = "02/27/2017",
                Priority = "Critical",
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 27),
            });
            tasks[4].SubTasks = new List<TaskDetails>();
            tasks[4].SubTasks.Add(new TaskDetails()
            {
                TaskID = 29,
                TaskName = "Implementation Module 3",
                StartDate = "02/17/2017",
                EndDate = "02/27/2017",
                Priority = "High",
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 27),
            });

            tasks[4].SubTasks[0].SubTasks = new List<TaskDetails>();
            tasks[4].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 30,
                TaskName = "Development Task 1",
                StartDate = "02/17/2017",
                EndDate = "02/19/2017",
                Duration = 3,
                Progress = "50",
                Priority = "High",
                Approved = false,
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 19),
            });
            tasks[4].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 31,
                TaskName = "Development Task 2",
                StartDate = "02/17/2017",
                EndDate = "02/19/2017",
                Duration = 3,
                Progress = "50",
                Priority = "Critical",
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 19),
            });
            tasks[4].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 32,
                TaskName = "Testing",
                StartDate = "02/20/2017",
                EndDate = "02/21/2017",
                Duration = 2,
                Progress = "0",
                Priority = "High",
                Approved = false,
                FilterStartDate = new DateTime(2017, 02, 20),
                FilterEndDate = new DateTime(2017, 02, 21),
            });
            tasks[4].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 33,
                TaskName = "Bug fix",
                StartDate = "02/24/2017",
                EndDate = "02/25/2017",
                Duration = 2,
                Progress = "0",
                Priority = "Low",
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 24),
                FilterEndDate = new DateTime(2017, 02, 25),
            });
            tasks[4].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 34,
                TaskName = "Customer review meeting",
                StartDate = "02/26/2017",
                EndDate = "02/27/2017",
                Duration = 2,
                Progress = "0",
                Priority = "Normal",
                Approved = false,
                FilterStartDate = new DateTime(2017, 02, 26),
                FilterEndDate = new DateTime(2017, 02, 27),
            });
            tasks[4].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 35,
                TaskName = "Phase 3 complete",
                StartDate = "02/27/2017",
                EndDate = "02/27/2017",
                Duration = 0,
                Priority = "Critical",
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 27),
                FilterEndDate = new DateTime(2017, 02, 27),
            });
            return tasks;
        }
    }

    public class ShipmentDataCollection
    {
        public List<ShipmentData> GetDataSource()
        {
            List<ShipmentData> tasks = new List<ShipmentData>();

            tasks.Add(new ShipmentData()
            {
                ID = "1",
                Name = "Order 1",
                Units =1395,
                UnitPrice=47,
                Price=13366
            });

            tasks[0].SubTasks = new List<ShipmentData>();


            tasks[0].SubTasks.Add(new ShipmentData()
            {
                ID = "1.1",
                Name = "Mackerel",
                Category = "Frozen seafood",
                Units = 235,
                UnitPrice = 12,
                Price = 2820
            });
            tasks[0].SubTasks.Add(new ShipmentData()
            {
                ID = "1.2",
                Name = "Yellowfin Tuna",
                Category = "Frozen seafood",
                Units = 324,
                UnitPrice = 8,
                Price = 2592
            });
            tasks[0].SubTasks.Add(new ShipmentData()
            {
                ID = "1.3",
                Name = "Herrings",
                Category = "Frozen seafood",
                Units = 488,
                UnitPrice = 11,
                Price = 5268
            });
            tasks[0].SubTasks.Add(new ShipmentData()
            {
                ID = "1.4",
                Name = "Preserved Olives",
                Category = "Edible",
                Units = 125,
                UnitPrice = 9,
                Price = 1125
            });
            tasks[0].SubTasks.Add(new ShipmentData()
            {
                ID = "1.5",
                Name = "Sweet corn Frozen",
                Category = "Edible",
                Units = 223,
                UnitPrice = 7,
                Price = 1561
            });

            tasks.Add(new ShipmentData()
            {
                ID = "2",
                Name = "Order 2",
                Units = 1944,
                UnitPrice = 58,
                Price = 21233
            });

            tasks[1].SubTasks = new List<ShipmentData>();


            tasks[1].SubTasks.Add(new ShipmentData()
            {
                ID = "2.1",
                Name = "Tilapias",
                Category = "Frozen seafood",
                Units = 278,
                UnitPrice = 15,
                Price = 4170
            });
            tasks[1].SubTasks.Add(new ShipmentData()
            {
                ID = "2.2",
                Name = "White Shrimp",
                Category = "Frozen seafood",
                Units = 560,
                UnitPrice = 7,
                Price = 3920
            });
            tasks[1].SubTasks.Add(new ShipmentData()
            {
                ID = "2.3",
                Name = "Fresh Cheese",
                Category = "Dairy",
                Units = 323,
                UnitPrice = 12,
                Price = 3876
            });
            tasks[1].SubTasks.Add(new ShipmentData()
            {
                ID = "2.4",
                Name = "Blue Veined Cheese",
                Category = "Dairy",
                Units = 370,
                UnitPrice = 15,
                Price = 5550
            });
            tasks[1].SubTasks.Add(new ShipmentData()
            {
                ID = "2.5",
                Name = "Butter",
                Category = "Dairy",
                Units = 413,
                UnitPrice = 9,
                Price = 3717
            });

            tasks.Add(new ShipmentData()
            {
                ID = "3",
                Name = "Order 3",
                Units = 1120,
                UnitPrice = 33,
                Price = 10880
            });

            tasks[2].SubTasks = new List<ShipmentData>();


            tasks[2].SubTasks.Add(new ShipmentData()
            {
                ID = "3.1",
                Name = "Lead glassware",
                Category = "Solid crystals",
                Units = 542,
                UnitPrice = 6,
                Price = 3252
            });
            tasks[2].SubTasks.Add(new ShipmentData()
            {
                ID = "3.2",
                Name = "Pharmaceutical Glassware",
                Category = "Solid crystals",
                Units = 324,
                UnitPrice = 11,
                Price = 3564
            });
            tasks[2].SubTasks.Add(new ShipmentData()
            {
                ID = "3.3",
                Name = "Glass beads",
                Category = "Solid crystals",
                Units = 254,
                UnitPrice = 16,
                Price = 4064
            });
                      
            return tasks;
        }
    }
    public class FileInfoCollection
    {

        public List<FileInfo> GetFileInfoCollections()
        {
            List<FileInfo> FileinfoCollection = new List<FileInfo>();
            FileinfoCollection.Add(new FileInfo()
            {
                Name = "Windows_OS",
                DateModified = "06/16/2017",
                DateCreated = "06/16/2017",
                Type = "File Folder"
            });

            FileinfoCollection[0].SubFolder = new List<FileInfo>();

            FileinfoCollection[0].SubFolder.Add(new FileInfo()
            {
                Name = "Users",
                DateModified = "06/26/2017",
                DateCreated = "06/16/2017",
                Type = "File Folder"
            });

            FileinfoCollection[0].SubFolder[0].SubFolder = new List<FileInfo>();

            FileinfoCollection[0].SubFolder[0].SubFolder.Add(new FileInfo()
            {
                Name = "Public",
                DateModified = "07/07/2017",
                DateCreated = "06/16/2017",
                Type = "File Folder"
            });

            FileinfoCollection[0].SubFolder[0].SubFolder[0].SubFolder = new List<FileInfo>();
            FileinfoCollection[0].SubFolder[0].SubFolder[0].SubFolder.Add(new FileInfo()
            {
                Name = "Documents",
                DateModified = "07/07/2017",
                DateCreated = "06/16/2017",
                Type = "File Folder"
            });

            FileinfoCollection[0].SubFolder[0].SubFolder[0].SubFolder[0].SubFolder = new List<FileInfo>();

            FileinfoCollection[0].SubFolder[0].SubFolder[0].SubFolder[0].SubFolder.Add(new FileInfo()
            {
                Name = "Document",
                DateModified = "07/01/2017",
                DateCreated = "06/30/2017",
                Type = "DOCX File"
            });

            FileinfoCollection[0].SubFolder[0].SubFolder[0].SubFolder[0].SubFolder.Add(new FileInfo()
            {
                Name = "Presentation",
                DateModified = "07/01/2017",
                DateCreated = "06/30/2017",
                Type = "PPTX File"
            });

            FileinfoCollection[0].SubFolder[0].SubFolder[0].SubFolder[0].SubFolder.Add(new FileInfo()
            {
                Name = "Publication",
                DateModified = "07/01/2017",
                DateCreated = "06/30/2017",
                Type = "PUB File Folder"
            });

            FileinfoCollection[0].SubFolder[0].SubFolder[0].SubFolder[0].SubFolder.Add(new FileInfo()
            {
                Name = "ExcelBook",
                DateModified = "07/01/2017",
                DateCreated = "06/30/2017",
                Type = "XLSX File"
            });

            FileinfoCollection[0].SubFolder[0].SubFolder[0].SubFolder[0].SubFolder.Add(new FileInfo()
            {
                Name = "Database",
                DateModified = "07/01/2017",
                DateCreated = "06/30/2017",
                Type = "ACCDB File"
            });
            return FileinfoCollection;
        }
    }

    public class RowTemplateData
    {

        public List<TemplateData> GetData()
        {

            List<TemplateData> datas = new List<TemplateData>();
            datas.Add(new TemplateData()
             {
                 Name = "Robert King",
                 FullName = "Robert King",
                 Designation = "Chief Executive Officer",
                 EmployeeID = "EMP001",
                 Orders = 1700,
                 Sales = 20000,
                 Address = "507 - 20th Ave. E.Apt. 2A, Seattle",
                 Contact = "(206) 555-9857",
                 Country = "USA",
                 DOB = "2/15/1963",
                 DOJ = "5/1/1983"
             });

            datas[0].Children = new List<TemplateData>();

            datas[0].Children.Add(new TemplateData()
            {
                Name = "David william",
                FullName = "David william",
                Designation = "Vice President",
                EmployeeID = "EMP004",
                Orders = 1328,
                Sales = 15600,
                Address = "722 Moss Bay Blvd., Kirkland",
                Country = "USA",
                Contact = "(206) 555-3412",
                DOB = "5/20/1971",
                DOJ = "5/1/1991"
            });

            datas[0].Children[0].Children = new List<TemplateData>();
            datas[0].Children[0].Children.Add(new TemplateData
            {
                Name = "Nancy Davolio",
                FullName = "Nancy Davolio",
                Designation = "Marketing Executive",
                EmployeeID = "EMP035",
                Orders = 1440,
                Sales = 13000,
                Address = "4110 Old Redmond Rd., Redmond",
                Country = "USA",
                Contact = "(206) 555-8122",
                DOB = "3/19/1966",
                DOJ = "5/1/2016"
            });

            datas[0].Children[0].Children[0].Children = new List<TemplateData>();

            datas[0].Children[0].Children[0].Children.Add(new TemplateData()
            {
                Name = "Andrew Fuller",
                FullName = "Andrew Fuller",
                Designation = "Sales Representative",
                EmployeeID = "EMP045",
                Orders = 1328,
                Sales = 5700,
                Address = "14 Garrett Hill, London",
                Country = "UK",
                Contact = "(71) 555-4848",
                DOB = "9/20/1980",
                DOJ = "5/1/2000"
            });
            datas[0].Children[0].Children[0].Children.Add(new TemplateData()
            {
                Name = "Anne Dodsworth",
                FullName = "Anne Dodsworth",
                Designation = "Sales Representative",
                EmployeeID = "EMP091",
                Orders = 900,
                Sales = 12500,
                Address = "4726 - 11th Ave. N.E., Seattle",
                Country = "USA",
                Contact = "(206) 555-1189",
                DOB = "10/19/1989",
                DOJ = "5/1/2019"
            });
            datas[0].Children[0].Children[0].Children.Add(new TemplateData()
            {
                Name = "Michael Suyama",
                FullName = "Michael Suyama",
                Designation = "Sales Representative",
                EmployeeID = "EMP110",
                Orders = 950,
                Sales = 9400,
                Address = "Coventry House Miner Rd., London",
                Country = "UK",
                Contact = "(71) 555-3636",
                DOB = "11/02/1987",
                DOJ = "5/1/2007"
            });
            datas[0].Children[0].Children[0].Children.Add(new TemplateData()
            {
                Name = "Janet Leverling",
                FullName = "Janet Leverling",
                Designation = "Sales Coordinator",
                EmployeeID = "EMP131",
                Orders = 1200,
                Sales = 11300,
                Address = "Edgeham Hollow Winchester Way, London",
                Country = "UK",
                Contact = "(71) 555-3636",
                DOB = "11/06/1990",
                DOJ = "5/1/2010"
            });

            datas[0].Children[0].Children.Add(new TemplateData()
            {
                Name = "Romey Wilson",
                FullName = "Romey Wilson",
                Designation = "Sales Executive",
                EmployeeID = "EMP039",
                Orders = 1250,
                Sales = 12400,
                Address = "7 Houndstooth Rd., London",
                Country = "UK",
                Contact = "(71) 555-3690",
                DOB = "02/02/1980",
                DOJ = "5/1/2000"
            });

            datas[0].Children[0].Children[1].Children = new List<TemplateData>();

            datas[0].Children[0].Children[1].Children.Add(new TemplateData()
            {
                Name = "Margaret Pecock",
                FullName = "Margaret Peacock",
                Designation = "Sales Representative",
                EmployeeID = "EMP213",
                Orders = 800,
                Sales = 8600,
                Address = "4726 - 11th Ave. N.E., California",
                Country = "USA",
                Contact = "(206) 555-1989",
                DOB = "01/21/1986",
                DOJ = "5/1/2016"

            });

            datas[0].Children[0].Children[1].Children.Add(new TemplateData()
            {
                Name = "Laura Callahan",
                FullName = "Laura Callahan",
                Designation = "Sales Coordinator",
                EmployeeID = "EMP201",
                Orders = 876,
                Sales = 3400,
                Address = "Coventry House Miner Rd., London",
                Country = "UK",
                Contact = "(71) 555-2222",
                DOB = "12/01/1990",
                DOJ = "5/1/2010"

            });

            datas[0].Children[0].Children[1].Children.Add(new TemplateData()
            {
                Name = "Steven Buchanan",
                FullName = "Steven Buchanan",
                Designation = "Sales Representative",
                EmployeeID = "EMP197",
                Orders = 938,
                Sales = 5200,
                Address = "200 Lincoln Ave, Salinas, CA 93901",
                Country = "USA",
                Contact = "(831) 758-7408",
                DOB = "03/23/1987",
                DOJ = "5/1/2017"

            });

            datas[0].Children[0].Children[1].Children.Add(new TemplateData()
            {
                Name = "Tedd Lawson",
                FullName = "Tedd Lawson",
                Designation = "Sales Representative",
                EmployeeID = "EMP167",
                Orders = 345,
                Sales = 6000,
                Address = "200 Lincoln Ave, Salinas, CA 93901",
                Country = "USA",
                Contact = "(831) 758-7368 ",
                DOB = "08/09/1989",
                DOJ = "5/1/2009"

            });

            return datas;
        }
    }

    public class SummaryRowData
    {

        public List<SummaryData> GetSummaryData()
        {

            List<SummaryData> summarydatas = new List<SummaryData>();
            summarydatas.Add(new SummaryData()
            {
                FreightID = "CX2389NK",
                FreightName = "Maersk Edibles Co.",
                TotalUnits = 598,
                TotalCosts = 27838,
                UnitWeight = 241,
            });

            summarydatas[0].Children = new List<SummaryData>();

            summarydatas[0].Children.Add(new SummaryData()
            {
                FreightID = "QW4567OP",
                FreightName = "Chang",
                TotalUnits = 123,
                TotalCosts = 3400,
                UnitWeight = 50,
            });

            summarydatas[0].Children.Add(new SummaryData()
            {
                FreightID = "QW3458BH",
                FreightName = "Aniseed Syrup",
                TotalUnits = 89,
                TotalCosts = 5900,
                UnitWeight = 87,
            });

            summarydatas[0].Children.Add(new SummaryData()
            {
                FreightID = "QW8967OH",
                FreightName = "Chef Anton's Cajun Seasoning",
                TotalUnits = 46,
                TotalCosts = 9578,
                UnitWeight = 54,
            });
            summarydatas[0].Children.Add(new SummaryData()
            {
                FreightID = "QW6549NJ",
                FreightName = "Chef Anton's Gumbo Mix",
                TotalUnits = 340,
                TotalCosts = 8960,
                UnitWeight = 50,
            });
            summarydatas.Add(new SummaryData()
            {
                FreightID = "DW8954IO",
                FreightName = "Aeon fitness inc.",
                TotalUnits = 1720,
                TotalCosts = 24367,
                UnitWeight = 296,              
            });
            summarydatas[1].Children = new List<SummaryData>();

            summarydatas[1].Children.Add(new SummaryData()
            {
                FreightID = "UF5647YH",
                FreightName = "Reebox CrossFit Back Bay",
                TotalUnits = 600,
                TotalCosts = 8700,
                UnitWeight = 73,
            });

            summarydatas[1].Children.Add(new SummaryData()
            {
                FreightID = "UF1290LK",
                FreightName = "The Green Microgym",
                TotalUnits = 569,
                TotalCosts = 8765,
                UnitWeight = 90,
            });

            summarydatas[1].Children.Add(new SummaryData()
            {
                FreightID = "UF8956KU",
                FreightName = "DeFranco's",
                TotalUnits = 456,
                TotalCosts = 4589,
                UnitWeight = 68,
            });

            summarydatas[1].Children.Add(new SummaryData()
            {
                FreightID = "UF7464JK",
                FreightName = "Westside Barbell",
                TotalUnits = 95,
                TotalCosts = 2313,
                UnitWeight = 65,

            });

            summarydatas.Add(new SummaryData()
            {
                FreightID = "EJ9456KN",
                FreightName = "Sun technologies inc",
                TotalUnits = 331,
                TotalCosts = 22933,
                UnitWeight = 192,             
            });
            summarydatas[2].Children = new List<SummaryData>();

            summarydatas[2].Children.Add(new SummaryData()
            {
               FreightID= "GH2367OP",
               FreightName= "Haier Group",
               TotalUnits= 78,
               TotalCosts= 6789,
               UnitWeight= 23,

            });
            summarydatas[2].Children.Add(new SummaryData()
            {
                FreightID = "GH4309TH",
                FreightName = "Panda Electronics",
                TotalUnits = 90,
                TotalCosts = 8999,
                UnitWeight = 48,

            });
            summarydatas[2].Children.Add(new SummaryData()
            {
                FreightID = "GH3494SD",
                FreightName = "Jiangsu Etern",
                TotalUnits = 36,
                TotalCosts = 4356,
                UnitWeight = 56,

            });
            summarydatas[2].Children.Add(new SummaryData()
            {
                FreightID = "GH3213FR",
                FreightName = "Zhejiang Fuchunjiang",
                TotalUnits = 127,
                TotalCosts = 2789,
                UnitWeight = 65,

            });

            return summarydatas;
        }
    }

    public class PagingDataCollection
    {
        public List<TaskDetails> GetPagingDataSource()
        {
            List<TaskDetails> TaskDetailsCollection = new List<TaskDetails>();
            var x = 0; 
            var c = "";
            for (var i = 1; i < 10; i++)
            {
                TaskDetails Record1 = null;
                Record1 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Planning" + " "+(c),
                    StartDate = "02/03/2017",
                    EndDate = "02/07/2017",
                    Progress = "100",
                    Duration = 5,
                    Priority = "Normal",
                    Approved = false,
                    SubTasks = new List<TaskDetails>(),
                };

                TaskDetails Child1 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Plan timeline" + " "+(c),
                    StartDate = "02/03/2017",
                    EndDate = "02/07/2017",
                    Progress = "100",
                    Duration = 5,
                    Priority = "Normal",
                    Approved = false,
                };

                TaskDetails Child2 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Plan budget" + " "+(c),
                    StartDate = "02/03/2017",
                    EndDate = "02/07/2017",
                    Duration = 5,
                    Progress = "100",
                    Approved = true
                };

                TaskDetails Child3 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Allocate resources" + " "+(c),
                    StartDate = "02/03/2017",
                    EndDate = "02/07/2017",
                    Duration = 5,
                    Progress = "100",
                    Priority = "Critical",
                    Approved = false
                };

                TaskDetails Child4 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Planning complete" + " "+(c),
                    StartDate = "02/07/2017",
                    EndDate = "02/07/2017",
                    Duration = 0,
                    Progress = "0",
                    Priority = "Low",
                    Approved = true
                };

                Record1.SubTasks.Add(Child1);
                Record1.SubTasks.Add(Child2);
                Record1.SubTasks.Add(Child3);
                Record1.SubTasks.Add(Child4);

                TaskDetails Record2 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Design" + " "+(c),
                    StartDate = "02/10/2017",
                    EndDate = "02/14/2017",
                    Progress = "86",
                    Duration = 3,
                    Priority = "High",
                    Approved = false,
                    SubTasks = new List<TaskDetails>(),
                };

                TaskDetails Child5 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Software Specification" + " "+(c),
                    StartDate = "02/10/2017",
                    EndDate = "02/12/2017",
                    Duration = 3,
                    Progress = "60",
                    Priority = "Normal",
                    Approved = false
                };

                TaskDetails Child6 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Develop prototype" + " "+(c),
                    StartDate = "02/10/2017",
                    EndDate = "02/12/2017",
                    Duration = 3,
                    Progress = "100",
                    Priority = "Critical",
                    Approved = false
                };

                TaskDetails Child7 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Get approval from customer" + " "+(c),
                    StartDate = "02/13/2017",
                    EndDate = "02/14/2017",
                    Duration = 2,
                    Progress = "100",
                    Approved = true
                };

                TaskDetails Child8 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Design complete" + " "+(c),
                    StartDate = "02/14/2017",
                    EndDate = "02/14/2017",
                    Duration = 0,
                    Progress = "0",
                    Priority = "Normal",
                    Approved = true
                };

                Record2.SubTasks.Add(Child5);
                Record2.SubTasks.Add(Child6);
                Record2.SubTasks.Add(Child7);
                Record2.SubTasks.Add(Child8);
                TaskDetails Record3 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Implementation Phase" + " "+(c),
                    StartDate = "02/17/2017",
                    EndDate = "02/17/2017",
                    Priority = "Normal",
                    Approved = false,
                    Duration = 11,
                    SubTasks = new List<TaskDetails>(),
                };

                TaskDetails Record4 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Phase I" + " "+(c),
                    StartDate = "02/17/2017",
                    EndDate = "02/27/2017",
                    Priority = "High",
                    Approved = false,
                    Duration = 11,
                    SubTasks = new List<TaskDetails>(),
                };
                TaskDetails Record7 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Implementation Module I" + " "+(c),
                    StartDate = "02/17/2017",
                    EndDate = "02/27/2017",
                    Priority = "Normal",
                    Duration = 11,
                    Approved = false,
                    SubTasks = new List<TaskDetails>(),
                };
                TaskDetails Child9 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Development Task I" + " "+(c),
                    StartDate = "02/17/2017",
                    EndDate = "02/19/2017",
                    Duration = 3,
                    Progress = "50",
                    Priority = "High",
                    Approved = false
                };
                TaskDetails Child10 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Development Task II" + " "+(c),
                    StartDate = "02/17/2017",
                    EndDate = "02/19/2017",
                    Duration = 3,
                    Progress = "50",
                    Priority = "Low",
                    Approved = true
                };
                TaskDetails Child11 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Testing" + " "+(c),
                    StartDate = "02/20/2017",
                    EndDate = "02/21/2017",
                    Duration = 2,
                    Progress = "0",
                    Priority = "Normal",
                    Approved = true
                };
                TaskDetails Child12 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Bug fix" + " "+(c),
                    StartDate = "02/24/2017",
                    EndDate = "02/25/2017",
                    Duration = 2,
                    Progress = "0",
                    Priority = "Critical",
                    Approved = false
                };
                TaskDetails Child13 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Customer review meeting" + " "+(c),
                    StartDate = "02/26/2017",
                    EndDate = "02/27/2017",
                    Duration = 2,
                    Progress = "0",
                    Priority = "High",
                    Approved = false
                };
                TaskDetails Child14 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Phase I complete" + " "+(c),
                    StartDate = "02/27/2017",
                    EndDate = "02/27/2017",
                    Duration = 2,
                    Progress = "0",
                    Priority = "Low",
                    Approved = true
                };
                Record7.SubTasks.Add(Child9);
                Record7.SubTasks.Add(Child10);
                Record7.SubTasks.Add(Child11);
                Record7.SubTasks.Add(Child12);
                Record7.SubTasks.Add(Child13);
                Record7.SubTasks.Add(Child14);
                Record4.SubTasks.Add(Record7);
                Record3.SubTasks.Add(Record4);
                TaskDetails Record5 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Phase II" + " "+(c),
                    StartDate = "02/17/2017",
                    EndDate = "02/28/2017",
                    SubTasks = new List<TaskDetails>(),
                    Priority = "High",
                    Approved = false,
                    Duration = 12,
                };
                TaskDetails Record8 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Implementation Module II" + " "+(c),
                    StartDate = "02/17/2017",
                    EndDate = "02/28/2017",
                    Priority = "Critical",
                    Approved = false,
                    Duration = 12,
                    SubTasks = new List<TaskDetails>(),
                };
                TaskDetails Child15 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Development Task I" + " "+(c),
                    StartDate = "02/17/2017",
                    EndDate = "02/20/2017",
                    Duration = 4,
                    Progress = "50",
                    Priority = "Normal",
                    Approved = true,
                };
                TaskDetails Child16 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Development Task II" + " "+(c),
                    StartDate = "02/17/2017",
                    EndDate = "02/20/2017",
                    Duration = 4,
                    Progress = "50",
                    Priority = "Critical",
                    Approved = true,
                };
                TaskDetails Child17 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Testing" + " "+(c),
                    StartDate = "02/21/2017",
                    EndDate = "02/24/2017",
                    Duration = 2,
                    Progress = "0",
                    Priority = "High",
                    Approved = false,
                };
                TaskDetails Child18 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Bug fix" + " "+(c),
                    StartDate = "02/25/2017",
                    EndDate = "02/26/2017",
                    Duration = 2,
                    Progress = "0",
                    Priority = "Low",
                    Approved = false,
                };
                TaskDetails Child19 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Customer review meeting" + " "+(c),
                    StartDate = "02/27/2017",
                    EndDate = "02/28/2017",
                    Duration = 2,
                    Progress = "0",
                    Priority = "Critical",
                    Approved = true,
                };
                TaskDetails Child20 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Phase II complete" + " "+(c),
                    StartDate = "02/28/2017",
                    EndDate = "02/28/2017",
                    Duration = 2,
                    Priority = "Normal",
                    Approved = false,
                };
                Record8.SubTasks.Add(Child15);
                Record8.SubTasks.Add(Child16);
                Record8.SubTasks.Add(Child17);
                Record8.SubTasks.Add(Child18);
                Record8.SubTasks.Add(Child19);
                Record8.SubTasks.Add(Child20);
                Record5.SubTasks.Add(Record8);
                Record3.SubTasks.Add(Record5);
                TaskDetails Record6 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Phase III" + " "+(c),
                    StartDate = "02/17/2017",
                    EndDate = "02/27/2017",
                    Priority = "Normal",
                    Approved = false,
                    Duration = 11,
                    SubTasks = new List<TaskDetails>(),
                };
                TaskDetails Record9 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Implementation Module III" + " "+(c),
                    StartDate = "02/17/2017",
                    EndDate = "02/27/2017",
                    Priority = "High",
                    Approved = false,
                    Duration = 11,
                    SubTasks = new List<TaskDetails>(),
                };
                TaskDetails Child21 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Development Task I" + " "+(c),
                    StartDate = "02/17/2017",
                    EndDate = "02/19/2017",
                    Duration = 3,
                    Progress = "50",
                    Priority = "Low",
                    Approved = true,
                };
                TaskDetails Child22 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Development Task II" + " "+(c),
                    StartDate = "02/17/2017",
                    EndDate = "02/19/2017",
                    Duration = 3,
                    Progress = "50",
                    Priority = "Normal",
                    Approved = false,
                };
                TaskDetails Child23 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Testing" + " "+(c),
                    StartDate = "02/20/2017",
                    EndDate = "02/21/2017",
                    Duration = 2,
                    Progress = "0",
                    Priority = "Critical",
                    Approved = true,

                };
                TaskDetails Child24 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Bug fix" + " "+(c),
                    StartDate = "02/24/2017",
                    EndDate = "02/25/2017",
                    Duration = 2,
                    Progress = "0",
                    Priority = "High",
                    Approved = false,
                };
                TaskDetails Child25 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Customer review meeting" + " "+(c),
                    StartDate = "02/26/2017",
                    EndDate = "02/27/2017",
                    Duration = 2,
                    Progress = "0",
                    Priority = "Normal",
                    Approved = true,
                };
                TaskDetails Child26 = new TaskDetails()
                {
                    TaskID = ++x,
                    TaskName = "Phase III complete" + " "+(c),
                    StartDate = "02/27/2017",
                    EndDate = "02/27/2017",
                    Duration = 2,
                    Priority = "Critical",
                    Approved = false,
                };
                Record9.SubTasks.Add(Child21);
                Record9.SubTasks.Add(Child22);
                Record9.SubTasks.Add(Child23);
                Record9.SubTasks.Add(Child24);
                Record9.SubTasks.Add(Child25);
                Record9.SubTasks.Add(Child26);
                Record6.SubTasks.Add(Record9);
                Record3.SubTasks.Add(Record6);
                TaskDetailsCollection.Add(Record1);
                TaskDetailsCollection.Add(Record2);
                TaskDetailsCollection.Add(Record3);
                c = i.ToString();
            }
            return TaskDetailsCollection;        
        }
    }
    public class DragAndDropCollection
    {
        public List<TaskDetails> GetDragAndDropData()
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
                TaskName = "Item can't be Dragged",
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
            tasks[1].SubTasks.Add(new TaskDetails()
            {
                TaskID = 11,
                TaskName = "Item can't be Dropped",
                StartDate = "02/14/2017",
                EndDate = "02/14/2017",
                Duration = 0,
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 14),
                FilterEndDate = new DateTime(2017, 02, 14),
            });


            tasks.Add(new TaskDetails()
            {
                TaskID = 12,
                TaskName = "Implementation Phase",
                StartDate = "02/17/2017",
                EndDate = "02/27/2017",
                Priority = "Normal",
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 27),
            });

            tasks[2].SubTasks = new List<TaskDetails>();

            tasks[2].SubTasks.Add(new TaskDetails()
            {
                TaskID = 13,
                TaskName = "Phase 1",
                StartDate = "02/17/2017",
                EndDate = "02/27/2017",
                Priority = "High",
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 27),
            });

            tasks[2].SubTasks[0].SubTasks = new List<TaskDetails>();

            tasks[2].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 14,
                TaskName = "Implementation Module 1",
                StartDate = "02/17/2017",
                EndDate = "02/27/2017",
                Priority = "Normal",
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 27),
            });

            tasks[2].SubTasks[0].SubTasks[0].SubTasks = new List<TaskDetails>();


            tasks[2].SubTasks[0].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 15,
                TaskName = "Development Task 1",
                StartDate = "02/17/2017",
                EndDate = "02/19/2017",
                Duration = 3,
                Progress = "50",
                Priority = "Critical",
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 19),
            });
            tasks[2].SubTasks[0].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 16,
                TaskName = "Development Task 2",
                StartDate = "02/17/2017",
                EndDate = "02/19/2017",
                Duration = 3,
                Progress = "50",
                Priority = "Low",
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 19),
            });
            tasks[2].SubTasks[0].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 17,
                TaskName = "Testing",
                StartDate = "02/20/2017",
                EndDate = "02/21/2017",
                Duration = 2,
                Progress = "0",
                Priority = "Normal",
                Approved = false,
                FilterStartDate = new DateTime(2017, 02, 20),
                FilterEndDate = new DateTime(2017, 02, 21),
            });
            tasks[2].SubTasks[0].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 18,
                TaskName = "Bug fix",
                StartDate = "02/24/2017",
                EndDate = "02/25/2017",
                Duration = 2,
                Progress = "0",
                Priority = "Low",
                Approved = false,
                FilterStartDate = new DateTime(2017, 02, 24),
                FilterEndDate = new DateTime(2017, 02, 25),
            });
            tasks[2].SubTasks[0].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 19,
                TaskName = "Customer review meeting",
                StartDate = "02/26/2017",
                EndDate = "02/27/2017",
                Duration = 2,
                Progress = "0",
                Priority = "High",
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 26),
                FilterEndDate = new DateTime(2017, 02, 27),
            });
            tasks[2].SubTasks[0].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 20,
                TaskName = "Phase 1 complete",
                StartDate = "02/27/2017",
                EndDate = "02/27/2017",
                Duration = 0,
                Priority = "Low",
                Approved = false,
                FilterStartDate = new DateTime(2017, 02, 27),
                FilterEndDate = new DateTime(2017, 02, 27),
            });

            tasks[2].SubTasks.Add(new TaskDetails()
            {
                TaskID = 21,
                TaskName = "Phase 2",
                StartDate = "02/17/2017",
                EndDate = "02/28/2017",
                Priority = "High",
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 28),
            });

            tasks[2].SubTasks[1].SubTasks = new List<TaskDetails>();

            tasks[2].SubTasks[1].SubTasks.Add(new TaskDetails()
            {
                TaskID = 22,
                TaskName = "Implementation Module 2",
                StartDate = "02/17/2017",
                EndDate = "02/28/2017",
                Priority = "Normal",
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 28),
            });

            tasks[2].SubTasks[1].SubTasks[0].SubTasks = new List<TaskDetails>();

            tasks[2].SubTasks[1].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 23,
                TaskName = "Development Task 1",
                StartDate = "02/17/2017",
                EndDate = "02/20/2017",
                Duration = 4,
                Progress = "50",
                Priority = "High",
                Approved = false,
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 20),
            });
            tasks[2].SubTasks[1].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 24,
                TaskName = "Development Task 2",
                StartDate = "02/17/2017",
                EndDate = "02/20/2017",
                Duration = 4,
                Progress = "50",
                Priority = "Critical",
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 20),
            });
            tasks[2].SubTasks[1].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 25,
                TaskName = "Testing",
                StartDate = "02/21/2017",
                EndDate = "02/24/2017",
                Duration = 2,
                Progress = "0",
                Priority = "Normal",
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 21),
                FilterEndDate = new DateTime(2017, 02, 24),
            });
            tasks[2].SubTasks[1].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 26,
                TaskName = "Bug fix",
                StartDate = "02/25/2017",
                EndDate = "02/26/2017",
                Duration = 2,
                Progress = "0",
                Priority = "Critical",
                Approved = false,
                FilterStartDate = new DateTime(2017, 02, 25),
                FilterEndDate = new DateTime(2017, 02, 26),
            });
            tasks[2].SubTasks[1].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 27,
                TaskName = "Customer review meeting",
                StartDate = "02/27/2017",
                EndDate = "02/28/2017",
                Duration = 2,
                Progress = "0",
                Priority = "High",
                Approved = false,
                FilterStartDate = new DateTime(2017, 02, 27),
                FilterEndDate = new DateTime(2017, 02, 28),
            });
            tasks[2].SubTasks[1].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 28,
                TaskName = "Phase 2 complete",
                StartDate = "02/28/2017",
                EndDate = "02/28/2017",
                Duration = 0,
                Priority = "Low",
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 28),
                FilterEndDate = new DateTime(2017, 02, 28),
            });

            tasks[2].SubTasks.Add(new TaskDetails()
            {
                TaskID = 29,
                TaskName = "Phase 3",
                StartDate = "02/17/2017",
                EndDate = "02/27/2017",
                Priority = "Critical",
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 27),
            });
            tasks[2].SubTasks[2].SubTasks = new List<TaskDetails>();

            tasks[2].SubTasks[2].SubTasks.Add(new TaskDetails()
            {
                TaskID = 30,
                TaskName = "Implementation Module 3",
                StartDate = "02/17/2017",
                EndDate = "02/27/2017",
                Priority = "High",
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 27),
            });

            tasks[2].SubTasks[2].SubTasks[0].SubTasks = new List<TaskDetails>();

            tasks[2].SubTasks[2].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 31,
                TaskName = "Development Task 1",
                StartDate = "02/17/2017",
                EndDate = "02/19/2017",
                Duration = 3,
                Progress = "50",
                Priority = "High",
                Approved = false,
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 19),
            });
            tasks[2].SubTasks[2].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 32,
                TaskName = "Development Task 2",
                StartDate = "02/17/2017",
                EndDate = "02/19/2017",
                Duration = 3,
                Progress = "50",
                Priority = "Critical",
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 17),
                FilterEndDate = new DateTime(2017, 02, 19),
            });
            tasks[2].SubTasks[2].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 33,
                TaskName = "Testing",
                StartDate = "02/20/2017",
                EndDate = "02/21/2017",
                Duration = 2,
                Progress = "0",
                Priority = "High",
                Approved = false,
                FilterStartDate = new DateTime(2017, 02, 20),
                FilterEndDate = new DateTime(2017, 02, 21),
            });
            tasks[2].SubTasks[2].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 34,
                TaskName = "Bug fix",
                StartDate = "02/24/2017",
                EndDate = "02/25/2017",
                Duration = 2,
                Progress = "0",
                Priority = "Low",
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 24),
                FilterEndDate = new DateTime(2017, 02, 25),
            });
            tasks[2].SubTasks[2].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 35,
                TaskName = "Customer review meeting",
                StartDate = "02/26/2017",
                EndDate = "02/27/2017",
                Duration = 2,
                Progress = "0",
                Priority = "Normal",
                Approved = false,
                FilterStartDate = new DateTime(2017, 02, 26),
                FilterEndDate = new DateTime(2017, 02, 27),
            });
            tasks[2].SubTasks[2].SubTasks[0].SubTasks.Add(new TaskDetails()
            {
                TaskID = 36,
                TaskName = "Phase 3 complete",
                StartDate = "02/27/2017",
                EndDate = "02/27/2017",
                Duration = 0,
                Priority = "Critical",
                Approved = true,
                FilterStartDate = new DateTime(2017, 02, 27),
                FilterEndDate = new DateTime(2017, 02, 27),
            });
            return tasks;
        }
    }

}