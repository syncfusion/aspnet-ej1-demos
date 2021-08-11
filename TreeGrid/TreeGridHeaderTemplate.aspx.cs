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
    public partial class TreeGridHeaderTemplate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var DataSource = this.GetDataSource();
            this.TreeGridColumnHeaderTemplate.DataSource = DataSource;
            this.TreeGridColumnHeaderTemplate.DataBind();

            var resourceData = this.GetResourceCollection();
            var index = this.TreeGridColumnHeaderTemplate.Columns.FindIndex(col => col.Field == "Resources");
            this.TreeGridColumnHeaderTemplate.Columns.ElementAt(index).DropDownData = resourceData;
            this.TreeGridColumnHeaderTemplate.Columns.ElementAt(index).DropDownEditOptions = new DropDownListProperties();
            this.TreeGridColumnHeaderTemplate.Columns.ElementAt(index).DropDownEditOptions.DropDownListFields = new DropDownListFields() { Text = "Name", Value = "Id" };
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
            public string Resources { get; set; }
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

        #region Create DataSource for TreeGrid control

        private List<BusinessObject> GetDataSource()
        {
            List<BusinessObject> BusinessObjectCollection = new List<BusinessObject>();
            BusinessObjectCollection.Add(new BusinessObject()
            {
                Id = 1,
                Name = "Task 1",
                StartDate = "10/23/2017",
                Duration = 10,
                PercentDone = 70,
                Resources = "1",

                Children = (new List<BusinessObject>()
                    {
                        new BusinessObject()
                        {
                            Id = 2,
                            Name = "Child task 1",
                            StartDate = "10/23/2017",
                            Duration = 4,
                            PercentDone = 80,
                            Resources ="2",
                        },
                        new BusinessObject()
                        {
                            Id = 3,
                            Name = "Child Task 2",
                            StartDate = "10/24/2017",
                            Duration = 5,
                            PercentDone = 65,
                            Resources ="1",
                        },
                        new BusinessObject()
                        {
                            Id = 4,
                            Name = "Child task 3",
                            StartDate = "10/25/2017",                            
                            Duration = 6,
                            PercentDone = 77,
                            Resources ="5",
                            Children = (new List<BusinessObject>()
                            {
                                new BusinessObject()
                                {
                                    Id = 5,
                                    Name = "Grand child task 1",
                                    StartDate = "10/28/2017",                                   
                                    Duration = 5,
                                    PercentDone = 60,
                                    Resources ="4",
                                },
                                new BusinessObject()
                                {
                                    Id = 6,
                                    Name = "Grand child task 2",
                                    StartDate = "10/29/2017",                                    
                                    Duration = 6,
                                    PercentDone = 77,
                                    Resources ="7",
                                },
                                new BusinessObject()
                                {
                                    Id = 7,
                                    Name = "Grand child task 3",
                                    StartDate = "10/29/2017",
                                    Duration = 0,
                                    PercentDone = 0

                                }
                            })
                        }
                    })

            });
            BusinessObjectCollection.Add(new BusinessObject()
            {
                Id = 8,
                Name = "Task 2",
                StartDate = "10/23/2017",
                Duration = 10,
                PercentDone = 70,
                Resources = "1",

                Children = (new List<BusinessObject>()
                    {
                        new BusinessObject()
                        {
                            Id = 9,
                            Name = "Child task 1",
                            StartDate = "10/23/2017",
                            Duration = 4,
                            PercentDone = 80,
                            Resources ="2",
                        },
                        new BusinessObject()
                        {
                            Id = 10,
                            Name = "Child Task 2",
                            StartDate = "10/24/2017",
                            Duration = 5,
                            PercentDone = 65,
                            Resources ="1",
                        },
                        new BusinessObject()
                        {
                            Id = 11,
                            Name = "Child task 3",
                            StartDate = "10/25/2017",                            
                            Duration = 6,
                            PercentDone = 77,
                            Resources ="5",
                            Children = (new List<BusinessObject>()
                            {
                                new BusinessObject()
                                {
                                    Id = 12,
                                    Name = "Grand child task 1",
                                    StartDate = "10/28/2017",                                   
                                    Duration = 5,
                                    PercentDone = 60,
                                    Resources ="4",
                                },
                                new BusinessObject()
                                {
                                    Id = 13,
                                    Name = "Grand child task 2",
                                    StartDate = "10/29/2017",                                    
                                    Duration = 6,
                                    PercentDone = 77,
                                    Resources ="7",
                                },
                                new BusinessObject()
                                {
                                    Id = 14,
                                    Name = "Grand child task 3",
                                    StartDate = "10/29/2017",
                                    Duration = 0,
                                    PercentDone = 0

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