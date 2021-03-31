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
    public partial class Events : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var DataSource = this.GetDataSource();
            this.GanttControlEvents.DataSource = DataSource;
            this.GanttControlEvents.DataBind();

        }

        #region Create DataSource for Gantt control
        private List<BusinessObject> GetDataSource()
        {
            List<BusinessObject> list = new List<BusinessObject>();
            list.Add(new BusinessObject()
            {
                Id = 1,
                Name = "Parent Task 1",
                StartDate = "02/27/2017",
                EndDate = "03/03/2017",
                PercentDone = "40",
                Children = (new List<BusinessObject>()
                    {
                        new BusinessObject()
                        {
                            Id = 2,
                            Name = "Child Task 1",
                            StartDate = "02/27/2017",
                            EndDate="03/03/2017",
                            PercentDone = "40",
                        },
                        new BusinessObject()
                        {
                            Id = 3,
                            Name = "Child Task 2",
                            StartDate = "02/27/2017",
                            EndDate="03/03/2017",
                            PercentDone = "40"
                        },
                        new BusinessObject()
                        {
                            Id = 4,
                            Name = "Child Task 3",
                            StartDate = "02/27/2017",
                            EndDate="03/03/2017",
                            Duration = 5,
                            PercentDone = "40"
                        }
                    })

            });

            list.Add(new BusinessObject()
            {
                Id = 5,
                Name = "Parent Task 2",
                StartDate = "03/06/2017",
                EndDate = "03/10/2017",
                PercentDone = "40",
                Children = (new List<BusinessObject>()
                    {
                        new BusinessObject()
                        {
                            Id = 6,
                            Name = "Child Task 1",
                            StartDate = "03/06/2017",
                            EndDate = "03/10/2017",
                            PercentDone = "40",
                        },
                        new BusinessObject()
                        {
                            Id = 7,
                            Name = "Child Task 2",
                            StartDate = "03/06/2017",
                            EndDate = "03/10/2017",
                            PercentDone = "40",
                        },
                        new BusinessObject()
                        {
                            Id = 8,
                            Name = "Child Task 3",
                            StartDate = "03/06/2017",
                            EndDate = "03/10/2017",
                            PercentDone = "40",
                        },
                         new BusinessObject()
                        {
                            Id = 9,
                            Name = "Child Task 4",
                            StartDate = "03/06/2017",
                            EndDate = "03/10/2017",
                            PercentDone = "40",
                        },
                          new BusinessObject()
                        {
                            Id = 10,
                            Name = "Child Task 5",
                            StartDate = "03/06/2017",
                            EndDate = "03/10/2017",
                            PercentDone = "40",
                        }
                   })
            });
            return list;
        }
        #endregion

        #region Create Business Object
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
        }

        #endregion
    }
}