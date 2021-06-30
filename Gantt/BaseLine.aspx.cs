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
    public partial class BaseLine : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            var DataSource = this.GetDataSource();
            this.GanttControlBaseLine.DataSource = DataSource;
            this.GanttControlBaseLine.DataBind();
        }

        #region Create the DataSource for Gantt control

        private List<BusinessObject> GetDataSource()
        {
            List<BusinessObject> BusinessObjectCollection = new List<BusinessObject>();

            BusinessObjectCollection.Add(new BusinessObject()
            {
                Id = 1,
                Name = "Parent Task 1",
                StartDate = "10/25/2017",
                BaseLineStartDate = "10/25/2017",
                BaseLineEndDate = "10/30/2017",
                Duration = 10,
                PercentDone = "70",
                Children = (new List<BusinessObject>()
                    {
                        new BusinessObject()
                        {
                            Id = 2,
                            Name = "Child Task 1",
                            StartDate = "10/25/2017",
                            BaseLineStartDate = "10/25/2017",
                            BaseLineEndDate = "10/28/2017",
                            Duration = 4,
                            PercentDone = "80",
                        },
                        new BusinessObject()
                        {
                            Id = 3,
                            Name = "Child Task 2",
                            StartDate = "10/26/2017",
                            BaseLineStartDate = "10/26/2017",
                            BaseLineEndDate = "10/30/2017",
                            PercentDone = "65",
                            Duration = 5,
                            Predescessor = "2"
                        },
                        new BusinessObject()
                        {
                            Id = 4,
                            Name = "Child Task 3",
                            StartDate = "10/27/2017",
                            BaseLineStartDate = "10/28/2017",
                            BaseLineEndDate = "10/30/2017",
                            Duration = 6,
                            PercentDone = "77",
                            Children = (new List<BusinessObject>()
                        {
                        new BusinessObject()
                        {
                            Id = 5,
                            Name = "Grand Child Task 1",
                            StartDate = "10/30/2017",
                            BaseLineStartDate = "10/29/2017",
                            BaseLineEndDate = "11/3/2017",
                            Duration = 5,
                            PercentDone = "60",
                        },
                        new BusinessObject()
                        {
                            Id = 6,
                            Name = "Grand Child Task 2",
                            StartDate = "10/31/2017",
                            BaseLineStartDate = "10/31/2017",
                            BaseLineEndDate = "11/02/2017",
                            Duration = 6,
                            PercentDone = "77",
                            Predescessor = "5"
                        },
                        new BusinessObject()
                        {
                            Id = 7,
                            Name = "Grand Child Task 3",
                            StartDate = "10/27/2017",
                            BaseLineStartDate = "10/27/2017",
                            BaseLineEndDate = "10/27/2017",
                            Duration = 0,
                            PercentDone = "0",
                            Predescessor = "6"
                        }
                    })
                           
                        }
                    })
            });

            return BusinessObjectCollection;
        }
        #endregion

        #region Create the BusinessObject
        public class BusinessObject
        {
            public string StartDate { get; set; }
            public string EndDate { get; set; }
            public string BaseLineStartDate { get; set; }
            public string BaseLineEndDate { get; set; }
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