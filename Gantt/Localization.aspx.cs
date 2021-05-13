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
    public partial class Localization : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var DataSource = this.GetDataSource();
            this.GanttControlLocalization.DataSource = DataSource;
            this.GanttControlLocalization.DataBind();
        }

        #region Create DataSource for Gantt control
        private List<BusinessObject> GetDataSource()
        {
            List<BusinessObject> list = new List<BusinessObject>();

            list.Add(new BusinessObject()
            {
                Id = 1,
                Name = "Parent Task 1",
                StartDate = "10/18/2017",
                Duration = 10,
                PercentDone = "70",
                Children = (new List<BusinessObject>()
                    {
                        new BusinessObject()
                        {
                            Id = 2,
                            Name = "Child Task 1",
                            StartDate = "10/18/2017",
                            Duration = 4,
                            PercentDone = "80",
                        },
                        new BusinessObject()
                        {
                            Id = 3,
                            Name = "Child Task 2",
                            StartDate = "10/19/2017",
                            Duration = 5,
                            PercentDone = "65",
                            Predescessor = "2"
                        },
                        new BusinessObject()
                        {
                            Id = 4,
                            Name = "Child Task 3",
                            StartDate = "10/23/2017",
                            Duration = 6,
                            PercentDone = "77",
                            Children = (new List<BusinessObject>()
                    {
                        new BusinessObject()
                        {
                            Id = 5,
                            Name = "Grand Child Task 1",
                            StartDate = "10/23/2017",
                            Duration = 3,
                            PercentDone = "60",
                        },
                        new BusinessObject()
                        {
                            Id = 6,
                            Name = "Grand Child Task 2",
                            StartDate = "10/24/2017",
                            Duration = 2,
                            PercentDone = "77",
                            Predescessor = "5"
                        },
                        new BusinessObject()
                        {
                            Id = 7,
                            Name = "Grand Child Task 3",
                            StartDate = "10/25/2017",
                            Duration = 0,
                            PercentDone = "0",
                            Predescessor = "6"
                        }
                    })
                        }
                    })
            });

            return list;
        }
        #endregion

        #region Create BusinessObject
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