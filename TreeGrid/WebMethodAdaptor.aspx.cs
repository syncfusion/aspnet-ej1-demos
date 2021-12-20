#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.JavaScript;
using Syncfusion.JavaScript.DataSources;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.TreeGrid
{
    public partial class WebMethodAdaptor : System.Web.UI.Page
    {
        public static List<TreeGridProjectData> DataList = null;

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static object DataSource(DataManager value)
        {
            if (DataList == null)
            {
                DataSource datasource = new DataSource();
                DataList = datasource.GetWebMethodDataSource();
            }
            var count = DataList.AsQueryable().Count();
            return new { result = DataList, count = count };
        }

        [WebMethod]
        public static void Update(TreeGridProjectData value)
        {
            TreeGridProjectData result = DataList.Where(currentData => currentData.taskID == value.taskID).FirstOrDefault();
            if (result != null)
            {
                result.taskID = value.taskID;
                result.taskName = value.taskName;
                result.startDate = value.startDate;
                result.endDate = value.endDate;
                result.duration = value.duration;
                result.progress = value.progress;

            }
        }
        
        [WebMethod]
        public static void Insert(TreeGridProjectData value)
        {
            DataList.Insert(0, value);            
        }

        [WebMethod]
        public static void Delete(int key)
        {
            var result = DataList.Where(currentData => currentData.taskID == key).FirstOrDefault();
            DataList.Remove(result);
            RemoveChildRecords(key);
        }

        public static void RemoveChildRecords(int key)
        {
            var childList = DataList.Where(x => x.parentID.Equals(key)).ToList();
            foreach (var item in childList)
            {
                DataList.Remove(item);
                RemoveChildRecords(item.taskID);
            }
        }
    }

    public class DataSource {

        public List<TreeGridProjectData> GetWebMethodDataSource()
        {
            List<TreeGridProjectData> dataCollection = new List<TreeGridProjectData>();
            dataCollection = new List<TreeGridProjectData>() {
                new TreeGridProjectData(){ taskID = 1, taskName = "Planning", startDate = "02/03/2017", endDate = "02/07/2017", progress = 100, duration = 5},
                    new TreeGridProjectData(){ parentID= 1, taskID = 2, taskName = "Plan timeline", startDate = "02/03/2017", endDate = "02/07/2017", duration = 5, progress = 100},
                    new TreeGridProjectData(){ parentID= 1, taskID = 3,taskName = "Plan budget",startDate = "02/03/2017",endDate = "02/07/2017",duration = 5,progress = 100},
                    new TreeGridProjectData(){ parentID= 1, taskID = 4,taskName = "Allocate resources",startDate = "02/03/2017",endDate = "02/07/2017",duration = 5, progress = 100},
                    new TreeGridProjectData(){ parentID= 1, taskID = 5,taskName = "Planning complete",startDate = "02/07/2017",endDate = "02/07/2017",duration = 0, progress = 0},
                new TreeGridProjectData(){ taskID = 6, taskName = "Design",startDate = "02/10/2017",endDate = "02/14/2017",progress = 86,duration = 3},
                    new TreeGridProjectData(){ parentID = 6, taskID = 7,taskName = "Software Specification",startDate = "02/10/2017",endDate = "02/12/2017",duration = 3,progress = 60},
                    new TreeGridProjectData(){ parentID = 6, taskID = 8,taskName = "Develop prototype",startDate = "02/10/2017",endDate = "02/12/2017",duration = 3,progress = 100},
                    new TreeGridProjectData(){ parentID = 6, taskID = 9,taskName = "Get approval from customer",startDate = "02/13/2017",endDate = "02/14/2017",duration = 2,progress = 100},
                    new TreeGridProjectData(){ parentID = 6, taskID = 10,taskName = "Design Documentation",startDate = "02/16/2017",endDate = "02/17/2017",duration = 2,progress = 100},
                    new TreeGridProjectData(){ parentID = 6, taskID = 11,taskName = "Design complete",startDate = "02/14/2017",endDate = "02/14/2017",duration = 0,progress = 0},
                new TreeGridProjectData(){ taskID = 12,taskName = "Implementation Phase",startDate = "02/17/2017",endDate = "02/17/2017"},
                    new TreeGridProjectData(){ parentID = 12, taskID = 13,taskName = "Phase 1",startDate = "02/17/2017",endDate = "02/27/2017"},
                        new TreeGridProjectData(){ parentID = 13, taskID = 14,taskName = "Implementation Module 1",startDate = "02/17/2017",endDate = "02/27/2017"},
                            new TreeGridProjectData(){ parentID = 14, taskID = 15,taskName = "Development Task 1",startDate = "02/17/2017",endDate = "02/19/2017",duration = 3,progress = 50},
                            new TreeGridProjectData(){ parentID = 14, taskID = 16,taskName = "Development Task 2",startDate = "02/17/2017",endDate = "02/19/2017",duration = 3,progress = 50},
                            new TreeGridProjectData(){ parentID = 14, taskID = 17,taskName = "Testing",startDate = "02/20/2017",endDate = "02/21/2017",duration = 2,progress = 0},
                            new TreeGridProjectData(){ parentID = 14, taskID = 18,taskName = "Bug fix",startDate = "02/24/2017",endDate = "02/25/2017",duration = 2,progress = 0},
                            new TreeGridProjectData(){ parentID = 14, taskID = 19,taskName = "Customer review meeting",startDate = "02/26/2017",endDate = "02/27/2017",duration = 2,progress = 0},
                            new TreeGridProjectData(){ parentID = 14, taskID = 20,taskName = "Phase 1 complete",startDate = "02/27/2017",endDate = "02/27/2017",duration = 2,progress = 0},
                    new TreeGridProjectData(){ parentID = 12, taskID = 21,taskName = "Phase 2",startDate = "02/17/2017",endDate = "02/28/2017",},
                        new TreeGridProjectData(){ parentID = 21, taskID = 22,taskName = "Implementation Module 2",startDate = "02/17/2017",endDate = "02/28/2017"},
                            new TreeGridProjectData(){ parentID = 22, taskID = 23,taskName = "Development Task 1",startDate = "02/17/2017",endDate = "02/20/2017",duration = 4,progress = 50},
                            new TreeGridProjectData(){ parentID = 22, taskID = 24,taskName = "Development Task 1",startDate = "02/17/2017",endDate = "02/20/2017",duration = 4,progress = 50},
                            new TreeGridProjectData(){ parentID = 22, taskID = 25,taskName = "Development Task 2",startDate = "02/17/2017",endDate = "02/20/2017",duration = 4,progress = 50},
                            new TreeGridProjectData(){ parentID = 22, taskID = 26,taskName = "Testing",startDate = "02/21/2017",endDate = "02/24/2017",duration = 2,progress = 0},
                            new TreeGridProjectData(){ parentID = 22, taskID = 27,taskName = "Bug fix",startDate = "02/25/2017",endDate = "02/26/2017",duration = 2,progress = 0},
                            new TreeGridProjectData(){ parentID = 22, taskID = 28,taskName = "Customer review meeting",startDate = "02/27/2017",endDate = "02/28/2017",duration = 2,progress = 0},
                            new TreeGridProjectData(){ parentID = 22, taskID = 29,taskName = "Phase 2 complete",startDate = "02/28/2017",endDate = "02/28/2017",duration = 2},
                    new TreeGridProjectData(){ parentID = 12, taskID = 30,taskName = "Phase 3",startDate = "02/17/2017",endDate = "02/27/2017",},
                        new TreeGridProjectData(){ parentID = 30, taskID = 31,taskName = "Implementation Module 3",startDate = "02/17/2017",endDate = "02/27/2017",},
                            new TreeGridProjectData(){ parentID = 31, taskID = 32,taskName = "Development Task 1",startDate = "02/17/2017",endDate = "02/19/2017",duration = 3,progress = 50},
                            new TreeGridProjectData(){ parentID = 31, taskID = 33,taskName = "Development Task 2",startDate = "02/17/2017",endDate = "02/19/2017",duration = 3,progress = 50},
                            new TreeGridProjectData(){ parentID = 31, taskID = 34,taskName = "Testing",startDate = "02/20/2017",endDate = "02/21/2017",duration = 2,progress = 0},
                            new TreeGridProjectData(){ parentID = 31, taskID = 35,taskName = "Bug fix",startDate = "02/24/2017",endDate = "02/25/2017",duration = 2,progress = 0},
                            new TreeGridProjectData(){ parentID = 31, taskID = 36,taskName = "Customer review meeting",startDate = "02/26/2017",endDate = "02/27/2017",duration = 2,progress = 0},
                            new TreeGridProjectData(){ parentID = 31, taskID = 37,taskName = "Phase 3 complete",startDate = "02/27/2017",endDate = "02/27/2017",   duration = 2}
            };
            return dataCollection;
        }
    }
    public class TreeGridProjectData
    {
        public int taskID { get; set; }
        public int? parentID { get; set; }
        public string taskName { get; set; }
        public string startDate { get; set; }
        public string endDate { get; set; }
        public int duration { get; set; }
        public int progress { get; set; }
    }
}