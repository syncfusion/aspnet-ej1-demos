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
    public partial class Resource : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var DataSource = this.GetDataSource();
            this.GanttControlResource.DataSource = DataSource;
            var resources = this.GetResourceCollection();
            this.GanttControlResource.Resources = resources;
            this.GanttControlResource.DataBind();
        }

        #region Create BusinessObject
        public class BusinessObject
        {
            public object StartDate { get; set; }
            public int Id { get; set; }
            public string Name { get; set; }
            public int Duration { get; set; }
            public int PercentDone { get; set; }
            public List<BusinessObject> Children { get; set; }
            public string Predescessor { get; set; }
            public string BaselineStartDate { get; set; }
            public string BaselineEndDate { get; set; }
            public List<int> Resources { get; set; }
        }
        #endregion

        #region Create ResourceObject
        public class ResourceObject
        {
            public int Id { get; set; }
            public string Name { get; set; }
        }
        #endregion

        #region Create Resource Collection
        private List<ResourceObject> GetResourceCollection()
        {
            List<ResourceObject> resourceCollection = new List<ResourceObject>();

            resourceCollection.Add(new ResourceObject() { Id = 1, Name = "Resource1" });
            resourceCollection.Add(new ResourceObject() { Id = 2, Name = "Resource2" });
            resourceCollection.Add(new ResourceObject() { Id = 3, Name = "Resource3" });
            resourceCollection.Add(new ResourceObject() { Id = 4, Name = "Resource4" });
            resourceCollection.Add(new ResourceObject() { Id = 5, Name = "Resource5" });
            resourceCollection.Add(new ResourceObject() { Id = 6, Name = "Resource6" });
            resourceCollection.Add(new ResourceObject() { Id = 7, Name = "Resource7" });

            return resourceCollection;
        }
        #endregion

        #region Create DataSource for Gantt control

        private List<BusinessObject> GetDataSource()
        {
            List<BusinessObject> BusinessObjectCollection = new List<BusinessObject>();
            BusinessObjectCollection.Add(new BusinessObject()
            {
                Id = 1,
                Name = "Task 1",
                StartDate = "10/25/2017",
                BaselineStartDate = "10/25/2017",
                BaselineEndDate = "10/30/2017",
                Duration = 10,
                PercentDone = 70,
                Resources = new List<int>() { 1, 2, 4, 5 },

                Children = (new List<BusinessObject>()
                    {
                        new BusinessObject()
                        {
                            Id = 2,
                            Name = "Child task 1",
                            StartDate = "10/25/2017",
                            BaselineStartDate = "10/25/2017",
                            BaselineEndDate = "10/28/2017",
                            Duration = 4,
                            PercentDone = 80,
                            Resources =new List<int>(){ 2,4},
                        },
                        new BusinessObject()
                        {
                            Id = 3,
                            Name = "Child Task 2",
                            StartDate = "10/26/2017",
                            BaselineStartDate = "10/26/2017",
                            BaselineEndDate = "10/30/2017",
                            Duration = 5,
                            PercentDone = 65,
                            Predescessor = "2",
                            Resources =new List<int>(){1},
                        },
                        new BusinessObject()
                        {
                            Id = 4,
                            Name = "Child task 3",
                            StartDate = "10/27/2017",
                            BaselineStartDate = "10/28/2017",
                            BaselineEndDate = "10/30/2017",
                            Duration = 6,
                            PercentDone = 77,
                            Resources =new List<int>(){5},
                            Children = (new List<BusinessObject>()
                            {
                                new BusinessObject()
                                {
                                    Id = 5,
                                    Name = "Grand child task 1",
                                    StartDate = "10/30/2017",
                                    BaselineStartDate = "10/29/2017",
                                    BaselineEndDate = "11/03/2017",
                                    Duration = 5,
                                    PercentDone = 60,
                                    Resources =new List<int>(){1,3,7},
                                },
                                new BusinessObject()
                                {
                                    Id = 6,
                                    Name = "Grand child task 2",
                                    StartDate = "10/31/2017",
                                    BaselineStartDate = "10/31/2017",
                                    BaselineEndDate = "11/02/2017",
                                    Duration = 6,
                                    PercentDone = 77,
                                    Predescessor = "5",
                                    Resources =new List<int>(){7},
                                },
                                new BusinessObject()
                                {
                                    Id = 7,
                                    Name = "Grand child task 3",
                                    StartDate = new System.DateTime(2017, 12, 23),
                                    BaselineStartDate = "10/27/2017",
                                    BaselineEndDate = "10/27/2017",
                                    Duration = 0,
                                    PercentDone = 0,
                                    Predescessor = "6"

                                }
                            })
                        }
                    })

            });
            return BusinessObjectCollection;
        }

        #endregion

    }
}