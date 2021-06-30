#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.JavaScript;
using Syncfusion.JavaScript.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.TreeGrid
{
    public partial class TextWrap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var DataSource = this.GetDataSource();
            this.TreeGridControlTextWrap.DataSource = DataSource;
            this.TreeGridControlTextWrap.DataBind();
        }
        #region Create BusinessObject
        public class TextWrapTaskDetails
        {
            public int TaskID { get; set; }
            public string TaskName { get; set; }
            public string StartDate { get; set; }
            public string EndDate { get; set; }
            public int Duration { get; set; }
            public string Progress { get; set; }
            public List<TextWrapTaskDetails> SubTasks { get; set; }
        }
        #endregion

        #region Create DataSource for TreeGrid control
        public List<TextWrapTaskDetails> GetDataSource()
        {
            List<TextWrapTaskDetails> tasks = new List<TextWrapTaskDetails>();

            tasks.Add(new TextWrapTaskDetails()
            {
                TaskID = 1,
                TaskName = "Design",
                StartDate = "02/10/2017",
                EndDate = "02/14/2017",
            });

            tasks[0].SubTasks = new List<TextWrapTaskDetails>();

            tasks[0].SubTasks.Add(new TextWrapTaskDetails()
            {
                TaskID = 2,
                TaskName = "Software Specification",
                StartDate = "02/10/2017",
                EndDate = "02/12/2017",
                Duration = 3,
                Progress = "60",
            });
            tasks[0].SubTasks.Add(new TextWrapTaskDetails()
            {
                TaskID = 3,
                TaskName = "Develop prototype",
                StartDate = "02/10/2017",
                EndDate = "02/12/2017",
                Duration = 3,
                Progress = "100",
            });
            tasks[0].SubTasks.Add(new TextWrapTaskDetails()
            {
                TaskID = 4,
                TaskName = "Get approval from customer",
                StartDate = "02/13/2017",
                EndDate = "02/14/2017",
                Duration = 2,
                Progress = "100",
            });
            tasks[0].SubTasks.Add(new TextWrapTaskDetails()
            {
                TaskID = 5,
                TaskName = "Design complete",
                StartDate = "02/14/2017",
                EndDate = "02/14/2017",
                Duration = 0,
            });


            tasks.Add(new TextWrapTaskDetails()
            {
                TaskID = 6,
                TaskName = "Implementation Phase",
                StartDate = "02/17/2017",
                EndDate = "02/27/2017",
            });

            tasks[1].SubTasks = new List<TextWrapTaskDetails>();

            tasks[1].SubTasks.Add(new TextWrapTaskDetails()
            {
                TaskID = 7,
                TaskName = "Phase 1",
                StartDate = "02/17/2017",
                EndDate = "02/27/2017",
            });

            tasks[1].SubTasks[0].SubTasks = new List<TextWrapTaskDetails>();

            tasks[1].SubTasks[0].SubTasks.Add(new TextWrapTaskDetails()
            {
                TaskID = 8,
                TaskName = "Implementation Module 1",
                StartDate = "02/17/2017",
                EndDate = "02/27/2017",
            });

            tasks[1].SubTasks[0].SubTasks[0].SubTasks = new List<TextWrapTaskDetails>();


            tasks[1].SubTasks[0].SubTasks[0].SubTasks.Add(new TextWrapTaskDetails()
            {
                TaskID = 9,
                TaskName = "Development Task 1",
                StartDate = "02/17/2017",
                EndDate = "02/19/2017",
                Duration = 3,
                Progress = "50",
            });
            tasks[1].SubTasks[0].SubTasks[0].SubTasks.Add(new TextWrapTaskDetails()
            {
                TaskID = 10,
                TaskName = "Development Task 2",
                StartDate = "02/17/2017",
                EndDate = "02/19/2017",
                Duration = 3,
                Progress = "50",
            });
            tasks[1].SubTasks[0].SubTasks[0].SubTasks.Add(new TextWrapTaskDetails()
            {
                TaskID = 11,
                TaskName = "Testing",
                StartDate = "02/20/2017",
                EndDate = "02/21/2017",
                Duration = 2,
                Progress = "0",
            });
            tasks[1].SubTasks[0].SubTasks[0].SubTasks.Add(new TextWrapTaskDetails()
            {
                TaskID = 12,
                TaskName = "Bug fix",
                StartDate = "02/24/2017",
                EndDate = "02/25/2017",
                Duration = 2,
                Progress = "0",
            });
            tasks[1].SubTasks[0].SubTasks[0].SubTasks.Add(new TextWrapTaskDetails()
            {
                TaskID = 13,
                TaskName = "Customer review meeting",
                StartDate = "02/26/2017",
                EndDate = "02/27/2017",
                Duration = 2,
                Progress = "0",
            });
            tasks[1].SubTasks[0].SubTasks[0].SubTasks.Add(new TextWrapTaskDetails()
            {
                TaskID = 14,
                TaskName = "Phase 1 complete",
                StartDate = "02/27/2017",
                EndDate = "02/27/2017",
                Duration = 0,
            });

            tasks[1].SubTasks.Add(new TextWrapTaskDetails()
            {
                TaskID = 15,
                TaskName = "Phase 2",
                StartDate = "02/17/2017",
                EndDate = "02/28/2017",
            });

            tasks[1].SubTasks[1].SubTasks = new List<TextWrapTaskDetails>();

            tasks[1].SubTasks[1].SubTasks.Add(new TextWrapTaskDetails()
            {
                TaskID = 16,
                TaskName = "Implementation Module 2",
                StartDate = "02/17/2017",
                EndDate = "02/28/2017",
            });

            tasks[1].SubTasks[1].SubTasks[0].SubTasks = new List<TextWrapTaskDetails>();

            tasks[1].SubTasks[1].SubTasks[0].SubTasks.Add(new TextWrapTaskDetails()
            {
                TaskID = 17,
                TaskName = "Development Task 1",
                StartDate = "02/17/2017",
                EndDate = "02/20/2017",
                Duration = 4,
                Progress = "50",
            });
            tasks[1].SubTasks[1].SubTasks[0].SubTasks.Add(new TextWrapTaskDetails()
            {
                TaskID = 18,
                TaskName = "Development Task 2",
                StartDate = "02/17/2017",
                EndDate = "02/20/2017",
                Duration = 4,
                Progress = "50",
            });
            tasks[1].SubTasks[1].SubTasks[0].SubTasks.Add(new TextWrapTaskDetails()
            {
                TaskID = 19,
                TaskName = "Testing",
                StartDate = "02/21/2017",
                EndDate = "02/24/2017",
                Duration = 2,
                Progress = "0",
            });
            tasks[1].SubTasks[1].SubTasks[0].SubTasks.Add(new TextWrapTaskDetails()
            {
                TaskID = 20,
                TaskName = "Bug fix",
                StartDate = "02/25/2017",
                EndDate = "02/26/2017",
                Duration = 2,
                Progress = "0",
            });
            tasks[1].SubTasks[1].SubTasks[0].SubTasks.Add(new TextWrapTaskDetails()
            {
                TaskID = 21,
                TaskName = "Customer review meeting",
                StartDate = "02/27/2017",
                EndDate = "02/28/2017",
                Duration = 2,
                Progress = "0",
            });
            tasks[1].SubTasks[1].SubTasks[0].SubTasks.Add(new TextWrapTaskDetails()
            {
                TaskID = 22,
                TaskName = "Phase 2 complete",
                StartDate = "02/28/2017",
                EndDate = "02/28/2017",
                Duration = 0,
            });

            tasks[1].SubTasks.Add(new TextWrapTaskDetails()
            {
                TaskID = 23,
                TaskName = "Phase 3",
                StartDate = "02/17/2017",
                EndDate = "02/27/2017",
            });
            tasks[1].SubTasks[2].SubTasks = new List<TextWrapTaskDetails>();

            tasks[1].SubTasks[2].SubTasks.Add(new TextWrapTaskDetails()
            {
                TaskID = 24,
                TaskName = "Implementation Module 3",
                StartDate = "02/17/2017",
                EndDate = "02/27/2017",
            });

            tasks[1].SubTasks[2].SubTasks[0].SubTasks = new List<TextWrapTaskDetails>();

            tasks[1].SubTasks[2].SubTasks[0].SubTasks.Add(new TextWrapTaskDetails()
            {
                TaskID = 25,
                TaskName = "Development Task 1",
                StartDate = "02/17/2017",
                EndDate = "02/19/2017",
                Duration = 3,
                Progress = "50",
            });
            tasks[1].SubTasks[2].SubTasks[0].SubTasks.Add(new TextWrapTaskDetails()
            {
                TaskID = 26,
                TaskName = "Development Task 2",
                StartDate = "02/17/2017",
                EndDate = "02/19/2017",
                Duration = 3,
                Progress = "50",
            });
            tasks[1].SubTasks[2].SubTasks[0].SubTasks.Add(new TextWrapTaskDetails()
            {
                TaskID = 27,
                TaskName = "Testing",
                StartDate = "02/20/2017",
                EndDate = "02/21/2017",
                Duration = 2,
                Progress = "0",
            });
            tasks[1].SubTasks[2].SubTasks[0].SubTasks.Add(new TextWrapTaskDetails()
            {
                TaskID = 28,
                TaskName = "Bug fix",
                StartDate = "02/24/2017",
                EndDate = "02/25/2017",
                Duration = 2,
                Progress = "0",
            });
            tasks[1].SubTasks[2].SubTasks[0].SubTasks.Add(new TextWrapTaskDetails()
            {
                TaskID = 29,
                TaskName = "Customer review meeting",
                StartDate = "02/26/2017",
                EndDate = "02/27/2017",
                Duration = 2,
                Progress = "0",
            });
            tasks[1].SubTasks[2].SubTasks[0].SubTasks.Add(new TextWrapTaskDetails()
            {
                TaskID = 30,
                TaskName = "Phase 3 complete",
                StartDate = "02/27/2017",
                EndDate = "02/27/2017",
                Duration = 0,
            });
            return tasks;
        }
        #endregion
    }
}