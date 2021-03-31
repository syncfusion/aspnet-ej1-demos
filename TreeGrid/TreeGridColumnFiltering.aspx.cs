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
using WebSampleBrowser.TreeGrid.Model;

namespace WebSampleBrowser.TreeGrid
{
    public partial class TreeGridColumnFiltering : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TaskDetailsCollection TaskCollection = new TaskDetailsCollection();
            this.TreeGridControlFiltering.DataSource = TaskCollection.GetDataSource();
            this.TreeGridControlFiltering.DataBind();

            StageDetails stages=new StageDetails();
            var data = stages.GetStageCollection();
            var index1 = this.TreeGridControlFiltering.Columns.FindIndex(col => col.Field == "Priority");
            this.TreeGridControlFiltering.Columns.ElementAt(index1).DropDownData = data;

            StateDetails state = new StateDetails();
            var stateData = state.GetStateCollection();
            var index2 = this.TreeGridControlFiltering.Columns.FindIndex(col => col.Field == "Approved");
            this.TreeGridControlFiltering.Columns.ElementAt(index2).DropDownData = stateData;
        }
    }
    public class Stage
    {
        public int id { get; set; }
        public string text { get; set; }
        public string value { get; set; }       
    }
    public class StageDetails
    {
        public List<Stage> GetStageCollection()
        {
            List<Stage> stageCollection = new List<Stage>();

            stageCollection.Add(new Stage() { id = 1, text = "Low", value = "Low" });
            stageCollection.Add(new Stage() { id = 2, text = "Normal", value = "Normal" });
            stageCollection.Add(new Stage() { id = 3, text = "High", value = "High" });
            stageCollection.Add(new Stage() { id = 4, text = "Critical", value = "Critical" });           
            return stageCollection;
        }
    }
    public class State
    {
        public int id { get; set; }
        public string text { get; set; }
        public string value { get; set; }
    }
    public class StateDetails
    {
        public List<State> GetStateCollection()
        {
            List<State> stateCollection = new List<State>();

            stateCollection.Add(new State() { id = 1, text = "Yes", value = "true" });
            stateCollection.Add(new State() { id = 2, text = "No", value = "false" });
            return stateCollection;
        }
    }
}