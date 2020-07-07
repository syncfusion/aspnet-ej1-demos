#region Copyright Syncfusion Inc. 2001-2020.
// Copyright Syncfusion Inc. 2001-2020. All rights reserved.
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
    public partial class SelfReference : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var DataSource = this.GetData();
            this.TreeGridSelfReference.DataSource = DataSource;
            this.TreeGridSelfReference.DataBind();
        }
        public List<SelfData> GetData()
        {
            List<SelfData> data = new List<SelfData>();
            data.Add(new SelfData()
            {
                Id = 1,
                Name = "Parent Task 1",
                StartDate = "02/23/2017",
                Duration = 5,
                PercentDone = 40,
                ParentId = null
            });
            data.Add(new SelfData()
            {
                Id = 2,
                Name = "Child Task 1",
                StartDate = "02/23/2017",
                Duration = 5,
                PercentDone = 40,
                ParentId = 1
            });
            data.Add(new SelfData()
            {
                Id = 3,
                Name = "Child Task 2",
                StartDate = "02/23/2017",
                Duration = 5,
                PercentDone = 40,
                ParentId = 1
            });
            data.Add(new SelfData()
            {
                Id = 4,
                Name = "Child Task 3",
                StartDate = "02/23/2017",
                Duration = 5,
                PercentDone = 40,
                ParentId = 1
            });

            data.Add(new SelfData()
            {
                Id = 5,
                Name = "Parent Task 2",
                StartDate = "03/14/2017",
                Duration = 5,
                PercentDone = 40,
                ParentId = null
            });
            data.Add(new SelfData()
            {
                Id = 6,
                Name = "Child Task 1",
                StartDate = "03/02/2017",
                Duration = 5,
                PercentDone = 40,
                ParentId = 5
            });
            data.Add(new SelfData()
            {
                Id = 7,
                Name = "Child Task 2",
                StartDate = "03/02/2017",
                Duration = 5,
                PercentDone = 40,
                ParentId = 5
            });
            data.Add(new SelfData()
            {
                Id = 8,
                Name = "Child Task 3",
                StartDate = "03/02/2017",
                Duration = 5,
                PercentDone = 40,
                ParentId = 5
            });
            data.Add(new SelfData()
            {
                Id = 9,
                Name = "Child Task 4",
                StartDate = "03/02/2017",
                Duration = 5,
                PercentDone = 40,
                ParentId = 5
            });

            data.Add(new SelfData()
            {
                Id = 10,
                Name = "Parent Task 3",
                StartDate = "03/06/2017",
                Duration = 5,
                PercentDone = 40,
                ParentId = null
            });
            data.Add(new SelfData()
            {
                Id = 11,
                Name = "Child Task 1",
                StartDate = "03/09/2017",
                Duration = 4,
                PercentDone = 40,
                ParentId = 10
            });
            data.Add(new SelfData()
            {
                Id = 12,
                Name = "Child Task 2",
                StartDate = "03/09/2017",
                Duration = 4,
                PercentDone = 40,
                ParentId = 10
            });
            data.Add(new SelfData()
            {
                Id = 13,
                Name = "Child Task 3",
                StartDate = "03/09/2017",
                Duration = 4,
                PercentDone = 40,
                ParentId = 10
            });
            data.Add(new SelfData()
            {
                Id = 14,
                Name = "Child Task 4",
                StartDate = "03/09/2017",
                Duration = 4,
                PercentDone = 40,
                ParentId = 10
            });
            data.Add(new SelfData()
            {
                Id = 15,
                Name = "Child Task 5",
                StartDate = "03/09/2017",
                Duration = 4,
                PercentDone = 40,
                ParentId = 10
            });
            return data;
        }
    }
    public class SelfData
    {
        public string StartDate { get; set; }
        public int Id { get; set; }
        public string Name { get; set; }
        public int Duration { get; set; }
        public int PercentDone { get; set; }
        public int? ParentId { get; set; }

    }
}