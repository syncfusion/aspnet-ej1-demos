#region Copyright
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion

using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Security.Permissions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml;



public class GanttObjectData
{

    [DataObjectMethod(DataObjectMethodType.Select)]
    public List<GanttObject> GetRecords()
    {

        List<GanttObject> ganttdata = new List<GanttObject>();

        ganttdata.Add(new GanttObject()
        {
            Id = 1,
            Name = "Project Schedule",
            StartDate = "02/20/2017",
            EndDate = "02/23/2017",
            PercentDone = "40",
            Children = (new List<GanttObject>() {     
                new GanttObject()
                {
                    Id = 2,
                    Name = "Planning",
                    StartDate = "02/20/2017",
                    EndDate = "02/23/2017",
                    PercentDone = "40",
                    Children = (new List<GanttObject>()
                    {
                        new GanttObject()
                        {
                            Id = 3,
                            Name = "Plan timeline",
                            StartDate = "02/20/2017",
                            EndDate="02/23/2017",
                            PercentDone = "20",
                        },
                        new GanttObject()
                        {
                            Id = 4,
                            Name = "Plan Budget",
                            StartDate = "02/20/2017",
                            EndDate="02/23/2017",
                            PercentDone = "80"                            
                        },
                        new GanttObject()
                        {
                            Id = 5,
                            Name = "Allocate Resource",
                            StartDate = "02/20/2017",
                            EndDate="02/23/2017",
                            PercentDone = "10"                            
                        },
                        new GanttObject()
                        {
                            Id = 6,
                            Name = "Planning Complete",
                            StartDate = "02/20/2017",
                            EndDate="02/23/2017",
                            PercentDone = "45"                            
                        }
                    })
                }, 
                new GanttObject()    {
                    Id = 7,
                    Name = "Design",
                    StartDate = "03/11/2017",
                    EndDate = "03/15/2017",
                    PercentDone = "40",
                    Children = (new List<GanttObject>()
                    {
                        new GanttObject()
                        {
                            Id = 8,
                            Name = "Software Specification",
                            StartDate = "02/27/2017",
                            EndDate="03/03/2017",
                            PercentDone = "40",
                        },
                        new GanttObject()
                        {
                            Id = 9,
                            Name = "Develop Prototype",
                            StartDate = "02/27/2017",
                            EndDate="03/03/2017",
                            PercentDone = "70",
                        },
                        new GanttObject()
                        {
                            Id = 10,
                            Name = "Get Customer Approval",
                            StartDate = "02/27/2017",
                            EndDate="03/03/2017",
                            PercentDone = "30",
                        },
                        new GanttObject()
                        {
                            Id = 11,
                            Name = "Design Complete",
                            StartDate = "02/27/2017",
                            EndDate="03/03/2017",
                            PercentDone = "40",
                        }
                    })
                }      
            })
        });

        return ganttdata;

    }

}

[Serializable]
#region GanttObject Creation

        public class GanttObject
        {
            public string StartDate { get; set; }
            public int Id { get; set; }
            public string Name { get; set; }
            public string EndDate { get; set; }
            public string PercentDone { get; set; }
            public List<object> ResourceID { get; set; }
            public List<GanttObject> Children { get; set; }
            public string Predescessor { get; set; }
        }
#endregion