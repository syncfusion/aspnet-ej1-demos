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

namespace WebSampleBrowser.Kanban
{
    public partial class Adaptive : System.Web.UI.Page
    {
        List<Tasks> Task = new List<Tasks>();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataSource();
        }
        private void BindDataSource()
        {
            for (int i = 1; i <= 1; i = i + 15)
            {
                Task.Add(new Tasks(i, "Open", "Analyze new requirements gathered from customer.", "UG", "Low", "Analyze,Requirements", 3.5, "Nancy Davloio", "../content/images/kanban/1.png", 1));
                Task.Add(new Tasks(i + 1, "InProgress", "Improve application performance.", "Improvement", "Normal", "Improvement,Performance", 6, "Andrew Fuller", "../content/images/kanban/2.png", 1));
                Task.Add(new Tasks(i + 2, "Open", "Arrange web meeting with customer to get new requirements.", "Epic", "High", "Meeting,Requirments", 5.5, "Janet Leverling", "../content/images/kanban/3.png", 2));
                Task.Add(new Tasks(i + 3, "InProgress", "Fix the issues reported in IE browsers.", "Issue", "Release Breaker", "IssueFix,IE", 2.5, "Margaret hamilt", "../content/images/kanban/4.png", 2));
                Task.Add(new Tasks(i + 4, "Testing", "Fix customer reported issues.", "Issue", "Low", "IssueFix,Queries", 3.5, "Steven walker", "../content/images/kanban/5.png", 1));
                Task.Add(new Tasks(i + 5, "Close", "Arrange web meeting with customer to get login page requirements", "Epic", "Low", "Meeting,Requirements", 2, "Michael Suyama", "../content/images/kanban/6.png", 1));
                Task.Add(new Tasks(i + 6, "Validate", "Validate new requirements.", "Story", "Low", "Validation,Requirements", 1.5, "Robert King", "../content/images/kanban/7.png", 3));
                Task.Add(new Tasks(i + 7, "Close", "Login page validation.", "Story", "Release Breaker", "Validation", 2.5, "Laura Callahan", "../content/images/kanban/8.png", 2));
            }
            this.KanbanBoard.DataSource = Task;
            this.KanbanBoard.DataBind();
           
        }
        [Serializable]
        public class Tasks
        {
            public Tasks()
            {
            }
            public Tasks(int Id, string Status, string Summary, string Type, string Priority, string Tags, double Estimate, string Assignee, string ImgUrl, int RankId)
            {
                this.Id = Id;
                this.Status = Status;
                this.Summary = Summary;
                this.Type = Type;
                this.Priority = Priority;
                this.Tags = Tags;
                this.Estimate = Estimate;
                this.Assignee = Assignee;
                this.ImgUrl = ImgUrl;
                this.RankId = RankId;

            }
            public int Id { get; set; }
            public string Status { get; set; }
            public string Summary { get; set; }
            public string Type { get; set; }
            public string Priority { get; set; }
            public string Tags { get; set; }
            public double Estimate { get; set; }
            public string Assignee { get; set; }
            public string ImgUrl { get; set; }
            public int RankId { get; set; }

        }

    }
}