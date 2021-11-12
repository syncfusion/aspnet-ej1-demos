#region Copyright
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion

using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Security.Permissions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml;



public class TreeGridObjectData
{

    [DataObjectMethod(DataObjectMethodType.Select)]
    public List<TaskDetails> GetDataSource()
    {
        List<TaskDetails> tasks = new List<TaskDetails>();

        tasks.Add(new TaskDetails()
        {
            TaskID = 1,
            TaskName = "Planning",
            StartDate = "02/03/2017",
            EndDate = "02/07/2017",
            Progress = "100",
            Duration = 5,
        });

        tasks[0].SubTasks = new List<TaskDetails>();


        tasks[0].SubTasks.Add(new TaskDetails()
        {
            TaskID = 2,
            TaskName = "Plan timeline",
            StartDate = "02/03/2017",
            EndDate = "02/07/2017",
            Duration = 5,
            Progress = "100"
        });
        tasks[0].SubTasks.Add(new TaskDetails()
        {
            TaskID = 3,
            TaskName = "Plan budget",
            StartDate = "02/03/2017",
            EndDate = "02/07/2017",
            Duration = 5,
            Progress = "100"
        });
        tasks[0].SubTasks.Add(new TaskDetails()
        {
            TaskID = 4,
            TaskName = "Allocate resources",
            StartDate = "02/03/2017",
            EndDate = "02/07/2017",
            Duration = 5,
            Progress = "100"
        });
        tasks[0].SubTasks.Add(new TaskDetails()
        {
            TaskID = 5,
            TaskName = "Planning complete",
            StartDate = "02/07/2017",
            EndDate = "02/07/2017",
            Duration = 0,
            Progress = "0"
        });

        tasks.Add(new TaskDetails()
        {
            TaskID = 6,
            TaskName = "Design",
            StartDate = "02/10/2017",
            EndDate = "02/14/2017",
            Duration = 3,
            Progress = "86"
        });

        tasks[1].SubTasks = new List<TaskDetails>();

        tasks[1].SubTasks.Add(new TaskDetails()
        {
            TaskID = 7,
            TaskName = "Software Specification",
            StartDate = "02/10/2017",
            EndDate = "02/12/2017",
            Duration = 3,
            Progress = "60"
        });
        tasks[1].SubTasks.Add(new TaskDetails()
        {
            TaskID = 8,
            TaskName = "Develop prototype",
            StartDate = "02/10/2017",
            EndDate = "02/12/2017",
            Duration = 3,
            Progress = "100"
        });
        tasks[1].SubTasks.Add(new TaskDetails()
        {
            TaskID = 9,
            TaskName = "Get approval from customer",
            StartDate = "02/13/2017",
            EndDate = "02/14/2017",
            Duration = 2,
            Progress = "100"
        });
        tasks[1].SubTasks.Add(new TaskDetails()
        {
            TaskID = 10,
            TaskName = "Design complete",
            StartDate = "02/14/2017",
            EndDate = "02/14/2017",
            Duration = 0,
            Progress = "0"
        });

        return tasks;
    }

}

[Serializable]
public class TaskDetails
{
    public int TaskID { get; set; }
    public string TaskName { get; set; }
    public string StartDate { get; set; }
    public string EndDate { get; set; }
    public int Duration { get; set; }
    public string Progress { get; set; }
    public List<TaskDetails> SubTasks { get; set; }
}