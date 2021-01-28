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
    public partial class TaskSchedulingMode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var DataSource = this.GetDataSource();
            this.GanttControlTaskMode.DataSource = DataSource;
            this.GanttControlTaskMode.DataBind();
        }

        #region Create DataSource for Gantt control
        public List<BusinessObject> GetDataSource()
        {
            List<BusinessObject> list = new List<BusinessObject>();
            list.Add(new BusinessObject()
            {
                Id = 1,
                Name = "Parent Task 1",
                StartDate = "02/26/2017",
                EndDate = "03/02/2017",
                PercentDone = "40",
                IsManual = true,
                Children = (new List<BusinessObject>()
                    {
                        new BusinessObject()
                        {
                            Id = 2,
                            Name = "Child Task 1",
                            StartDate = "02/26/2017",
                            EndDate = "03/02/2017",
                            PercentDone = "40",
                            IsManual = true,
                        },
                        new BusinessObject()
                        {
                            Id = 3,
                            Name = "Child Task 2",
                            StartDate = "02/27/2017",
                            EndDate = "03/02/2017",
                            PercentDone = "40"
                        },
                        new BusinessObject()
                        {
                            Id = 4,
                            Name = "Child Task 3",
                            StartDate = "02/26/2017",
                            EndDate = "03/02/2017",
                            Duration = 5,
                            PercentDone = "40",
                            IsManual = true,
                        }
                    })

            });

            list.Add(new BusinessObject()
            {
                Id = 5,
                Name = "Parent Task 2",
                StartDate = "03/05/2017",
                EndDate = "03/09/2017",
                IsManual = true,
                PercentDone = "40",
                Children = (new List<BusinessObject>()
                    {
                        new BusinessObject()
                        {
                            Id = 6,
                            Name = "Child Task 1",
                            StartDate = "03/05/2017",
                            EndDate = "03/09/2017",
                            PercentDone = "40",
                        },
                        new BusinessObject()
                        {
                            Id = 7,
                            Name = "Child Task 2",
                            StartDate = "03/05/2017",
                            EndDate = "03/09/2017",
                            PercentDone = "40",
                            IsManual = true,
                        },
                        new BusinessObject()
                        {
                            Id = 8,
                            Name = "Child Task 3",
                            StartDate = "02/28/2017",
                            EndDate = "03/04/2017",
                            PercentDone = "40",
                        },
                         new BusinessObject()
                        {
                            Id = 9,
                            Name = "Child Task 4",
                            StartDate = "03/05/2017",
                            EndDate = "03/09/2017",
                            PercentDone = "40",
                            IsManual = true,
                        }
                    })

            });
            list.Add(new BusinessObject()
            {
                Id = 10,
                Name = "Parent Task 3",
                StartDate = "03/12/2017",
                EndDate = "03/16/2017",
                PercentDone = "40",

                Children = (new List<BusinessObject>()
                    {
                        new BusinessObject()
                        {

                            Id = 11,
                            Name = "Child Task 1",
                            StartDate = "03/13/2017",
                            EndDate = "03/16/2017",
                            Duration = 5,
                            PercentDone = "40"
                        },
                        new BusinessObject()
                        {
                            Id = 12,
                            Name = "Child Task 2",
                            StartDate = "03/13/2017",
                            EndDate = "03/16/2017",
                            PercentDone = "40",
                        },
                        new BusinessObject()
                        {
                            Id = 13,
                            Name = "Child Task 3",
                            StartDate = "03/12/2017",
                            EndDate = "03/16/2017",
                            PercentDone = "40",
                            IsManual = true
                        }
                    })

            });

            return list;
        }
        #endregion

        #region BusinessObject Creation
        public class BusinessObject
        {
            public string StartDate { get; set; }
            public string EndDate { get; set; }
            public int Id { get; set; }
            public string Name { get; set; }
            public int Duration { get; set; }
            public string PercentDone { get; set; }
            public List<object> ResourceID { get; set; }
            public List<BusinessObject> Children { get; set; }
            public string Predescessor { get; set; }
            public bool IsManual { get; set; }

        }
        #endregion
    }
}