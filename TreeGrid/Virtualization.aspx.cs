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
    public partial class Virtualization : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var DataSource = this.GetDataSource();
            this.TreeGridVirtualization.DataSource = DataSource;
            this.TreeGridVirtualization.DataBind();
        }

        #region Create the DataSource for TreeGrid control
        private List<BusinessObject> GetDataSource()
        {
            Random rand = new Random();
            List<BusinessObject> list = new List<BusinessObject>();
            var x = 0;
            for (var i = 0; i < 556; i++)
            {
                list.Add(new BusinessObject()
                {
                    Id = ++x,
                    Name = "Task " + (x),
                    PercentDone = rand.Next(10, 80),
                    StartDate = "01/03/2017",
                    EndDate = "01/08/2017",


                    Children = (new List<BusinessObject>()
                        {
                            
                            new BusinessObject()
                            {
                                Id = ++x,
                                Name = "Task " + x,
                                PercentDone = rand.Next(10,80),
                                StartDate = "01/12/2017",
                                EndDate = "01/18/2017",
                               
                            },
                            new BusinessObject()
                            {
                                Id = ++x,
                                Name = "Task " + x,
                                PercentDone = rand.Next(10,80),
                                StartDate = "01/12/2017",
                                EndDate = "01/18/2017",
                                
                            },
                            new BusinessObject()
                            {
                                Id = ++x,
                                Name = "Task " +x,
                                PercentDone = rand.Next(10,80),
                                StartDate = "01/12/2017",
                                EndDate = "01/18/2017"                                
                            }
                        })
                });
            }

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
            public int PercentDone { get; set; }
            public List<BusinessObject> Children { get; set; }
            public string Predescessor { get; set; }

        }

        #endregion
    }
}