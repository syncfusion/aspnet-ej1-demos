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
using WebSampleBrowser.TreeGrid.Model;

namespace WebSampleBrowser.TreeGrid
{
    public partial class KeyboardNavigation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var DataSource = this.GetDataSource();
            this.TreeGridKeyboardNavigation.DataSource = DataSource;
            this.TreeGridKeyboardNavigation.DataBind();
        }

        #region Create DataSource for Default Gantt control

        private List<BusinessObject> GetDataSource()
        {
            List<BusinessObject> list = new List<BusinessObject>();

            list.Add(new BusinessObject()
            {
                Id = 1,
                Name = "Parent Task 1",
                StartDate = "02/23/2017",
                EndDate = "02/27/2017",
                PercentDone = "40",
                Children = (new List<BusinessObject>()
                    {
                        new BusinessObject()
                        {
                            Id = 2,
                            Name = "Child Task 1",
                            StartDate = "02/23/2017",
                            EndDate="02/27/2017",
                            PercentDone = "40",
                        },
                        new BusinessObject()
                        {
                            Id = 3,
                            Name = "Child Task 2",
                            StartDate = "02/23/2017",
                            EndDate="02/27/2017",
                            PercentDone = "40"                            
                        },
                        new BusinessObject()
                        {
                            Id = 4,
                            Name = "Child Task 3",
                            StartDate = "02/23/2017",
                            EndDate="02/27/2017",
                            PercentDone = "40"                            
                        }
                    })

            });

            list.Add(new BusinessObject()
            {
                Id = 5,
                Name = "Parent Task 2",
                StartDate = "03/14/2017",
                EndDate = "03/18/2017",
                PercentDone = "40",
                Children = (new List<BusinessObject>()
                    {
                        new BusinessObject()
                        {
                            Id = 6,
                            Name = "Child Task 1",
                            StartDate = "03/02/2017",
                            EndDate="03/06/2017",
                            PercentDone = "40",
                        },
                        new BusinessObject()
                        {
                            Id = 7,
                            Name = "Child Task 2",
                            StartDate = "03/02/2017",
                            EndDate="03/06/2017",
                            PercentDone = "40",
                        },
                        new BusinessObject()
                        {
                            Id = 8,
                            Name = "Child Task 3",
                            StartDate = "03/02/2017",
                            EndDate="03/06/2017",
                            PercentDone = "40",
                        },
                        new BusinessObject()
                        {
                            Id = 9,
                            Name = "Child Task 4",
                            StartDate = "03/02/2017",
                            EndDate="03/06/2017",
                            PercentDone = "40",
                        }
                    })

            });
            list.Add(new BusinessObject()
            {
                Id = 10,
                Name = "Parent Task 3",
                StartDate = "03/09/2017",
                EndDate = "03/13/2017",
                PercentDone = "40",

                Children = (new List<BusinessObject>()
                    {
                        new BusinessObject()
                        {
                            Id = 11,
                            Name = "Child Task 1",
                            StartDate = "03/9/2017",
                            EndDate="03/13/2017",
                            PercentDone = "40"
                        },
                        new BusinessObject()
                        {
                            Id = 12,
                            Name = "Child Task 2",
                            StartDate = "03/9/2017",
                            EndDate="03/13/2017",
                            PercentDone = "40",
                        },
                        new BusinessObject()
                        {
                            Id = 13,
                            Name = "Child Task 3",
                            StartDate = "03/9/2017",
                            EndDate="03/13/2017",
                            PercentDone = "40"
                        },
                        new BusinessObject()
                        {
                            Id = 14,
                            Name = "Child Task 4",
                            StartDate = "03/9/2017",
                            EndDate="03/13/2017",
                            PercentDone = "40"
                        },
                        new BusinessObject()
                        {
                            Id = 15,
                            Name = "Child Task 5",
                            StartDate = "03/9/2017",
                            EndDate="03/13/2017",
                            PercentDone = "40"
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
            public int Id { get; set; }
            public string Name { get; set; }
            public string EndDate { get; set; }
            public string PercentDone { get; set; }
            public List<object> ResourceID { get; set; }
            public List<BusinessObject> Children { get; set; }
            public string Predescessor { get; set; }
        }
        #endregion
    }
}