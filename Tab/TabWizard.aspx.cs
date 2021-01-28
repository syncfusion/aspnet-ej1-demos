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

namespace WebSampleBrowser.Tab
{
    public partial class TabWizard : System.Web.UI.Page
    {
        List<TrainsList> trains = new List<TrainsList>();
        protected void Page_Load(object sender, EventArgs e)
        {
            List<int> disableditem = new List<int>() { 1, 2, 3 };
            this.journeydate.MinDate = DateTime.Now;
            this.journeydate.MaxDate = DateTime.Now.AddDays(60);
            this.wizardTab.DisabledItemIndex = disableditem;
            this.startpoint.DataSource = new PlacesData().GetLocation().ToList();
            this.endpoint.DataSource = new PlacesData().GetLocation().ToList();
            this.pass_berth1.DataSource = new BerthDropDown().GetBerthList().ToList();
            this.pass_berth2.DataSource = new BerthDropDown().GetBerthList().ToList();
            this.pass_berth3.DataSource = new BerthDropDown().GetBerthList().ToList();
            this.pass_berth4.DataSource = new BerthDropDown().GetBerthList().ToList();
            this.pass_berth5.DataSource = new BerthDropDown().GetBerthList().ToList();
            this.pass_gender1.DataSource = new GenDropDown().GetGenList().ToList();
            this.pass_gender2.DataSource = new GenDropDown().GetGenList().ToList();
            this.pass_gender3.DataSource = new GenDropDown().GetGenList().ToList();
            this.pass_gender4.DataSource = new GenDropDown().GetGenList().ToList();
            this.pass_gender5.DataSource = new GenDropDown().GetGenList().ToList();
            BindDataSource();
        }
         private void BindDataSource()
        {

            trains.Add(new TrainsList("EN447", "JAN KIEPURA 2", "Amsterdam", "Warsaw", 4));
            trains.Add(new TrainsList("EN447", "JAN KIEPURA 2", "Berlin", "Moscow", 23));
            trains.Add(new TrainsList("EN447", "JAN KIEPURA 2", "Berlin", "Konin", 14));
            trains.Add(new TrainsList("EN447", "JAN KIEPURA 2", "Emmerich am Rhein", "Warsaw", 73));
            trains.Add(new TrainsList("EN447", "JAN KIEPURA 2", "Warsaw", "Amsterdam", 14));
            trains.Add(new TrainsList("EN447", "JAN KIEPURA 2", "Konin", "Berlin", 203));
            trains.Add(new TrainsList("EN447", "JAN KIEPURA 2", "Moscow", "Berlin", 33));
            trains.Add(new TrainsList("EN447", "JAN KIEPURA 2", "Warsaw", "Emmerich am Rhein", 63));
            trains.Add(new TrainsList("EC41", "Berlin-Warszawa-Express", "Berlin", "Poznan", 65));
            trains.Add(new TrainsList("EC41", "Berlin-Warszawa-Express", "Berlin", "Warsaw", 96));
            trains.Add(new TrainsList("EC41", "Berlin-Warszawa-Express", "Poznan", "Berlin", 86));
            trains.Add(new TrainsList("EC41", "Berlin-Warszawa-Express", "Warsaw", "Berlin", 54));
            trains.Add(new TrainsList("EC9242", "EC Dumas", "Milan", "Paris", 23));
            trains.Add(new TrainsList("EC9242", "EC Dumas", "Milan", "Tonio", 53));
            trains.Add(new TrainsList("EC9242", "EC Dumas", "Paris", "Milan", 30));
            trains.Add(new TrainsList("EC9242", "EC Dumas", "Tonio", "Milan", 93));
            trains.Add(new TrainsList("EC96", "EC Iris", "Brussels", "Chur", 73));
            trains.Add(new TrainsList("EC96", "EC Iris", "Brussels", "Strasbourg", 5));
            trains.Add(new TrainsList("EC96", "EC Iris", "Strasbourg", "Chur", 32));
            trains.Add(new TrainsList("EC96", "EC Iris", "Chur", "Brussels", 59));
            trains.Add(new TrainsList("EC96", "EC Iris", "Chur", "Strasbourg", 7));
            trains.Add(new TrainsList("EC96", "EC Iris", "Strasbourg", "Brussels", 123));
            trains.Add(new TrainsList("EN466", "Wiener Walzer", "Budapest", "Vienna", 43));
            trains.Add(new TrainsList("EN466", "Wiener Walzer", "Budapest", "Prague", 39));
            trains.Add(new TrainsList("EN466", "Wiener Walzer", "Vienna", "Budapest", 23));
            trains.Add(new TrainsList("EN466", "Wiener Walzer", "Prague", "Budapest", 3));
            trains.Add(new TrainsList("TEE21", "Rheinpfeil", "Dortmund", "Cologne", 95));
            trains.Add(new TrainsList("TEE21", "Rheinpfeil", "Dortmund", "München", 13));
            trains.Add(new TrainsList("TEE21", "Rheinpfeil", "Cologne", "Dortmund", 213));
            trains.Add(new TrainsList("TEE21", "Rheinpfeil", "München", "Dortmund", 350));
            this.TrainAvailability.DataSource = trains;
            this.TrainAvailability.DataBind();
        }
         [Serializable]
         public class TrainsList
         {
             public TrainsList()
             {

             }
             public TrainsList(string TrainNo, string TrainName, string Depature, string Arrival,
                 int Availability)
             {
                 this.TrainNo = TrainNo;
                 this.TrainName = TrainName;                 
                 this.Depature = Depature;
                 this.Arrival = Arrival;
                 this.Availability = Availability;
             }
             public string TrainNo { get; set; }
             public string TrainName { get; set; }            
             public string Depature { get; set; }
             public string Arrival { get; set; }
             public int Availability { get; set; }
         }
         [Serializable]
         public class PlacesData
         {

             public PlacesData(int _id, string _text)
             {
                 this.ID = _id;
                 this.Text = _text;
             }
             public PlacesData()
             {

             }

             public int ID
             {
                 get;
                 set;
             }
             public string Text
             {
                 get;
                 set;
             }

             public List<PlacesData> GetLocation()
             {
                 List<PlacesData> data = new List<PlacesData>();
                 data.Add(new PlacesData(1, "Amsterdam"));
                 data.Add(new PlacesData(2, "Warsaw"));
                 data.Add(new PlacesData(3, "Emmerich am Rhein"));
                 data.Add(new PlacesData(4, "Berlin"));
                 data.Add(new PlacesData(5, "Konin"));
                 data.Add(new PlacesData(6, "Moscow"));
                 data.Add(new PlacesData(7, "Poznan"));
                 data.Add(new PlacesData(8, "Milan"));
                 data.Add(new PlacesData(9, "Paris"));
                 data.Add(new PlacesData(10, "Brussels"));
                 data.Add(new PlacesData(11, "Strasbourg"));
                 data.Add(new PlacesData(12, "Chur"));
                 data.Add(new PlacesData(3, "Budapest"));
                 data.Add(new PlacesData(4, "Vienna"));
                 data.Add(new PlacesData(5, "Prague"));
                 data.Add(new PlacesData(6, "Dortmund"));
                 data.Add(new PlacesData(7, "Cologne"));
                 data.Add(new PlacesData(8, "Munchen"));
                 data.Add(new PlacesData(9, "Tonio"));
                 return data;
             }
         }
         public class GenDropDown
         {
             public GenDropDown() { }
             public GenDropDown(int _id, string _text)
             {
                 this.ID = _id;
                 this.GText = _text;
             }
             public int ID
             {
                 get;
                 set;
             }
             public string GText { get; set; }
             public List<GenDropDown> GetGenList()
             {
                 List<GenDropDown> gdata = new List<GenDropDown>();
                 gdata.Add(new GenDropDown(1, "Male"));
                 gdata.Add(new GenDropDown(2, "Female"));
                 return gdata;
             }
         }
         public class BerthDropDown
         {
             public BerthDropDown() { }
             public BerthDropDown(int _id, string _text)
             {
                 this.ID = _id;
                 this.BerthPref = _text;
             }
             public int ID
             {
                 get;
                 set;
             }
             public string BerthPref { get; set; }
             public List<BerthDropDown> GetBerthList()
             {
                 List<BerthDropDown> bdata = new List<BerthDropDown>();
                 bdata.Add(new BerthDropDown(1, "Upper"));
                 bdata.Add(new BerthDropDown(2, "Lower"));
                 bdata.Add(new BerthDropDown(3, "Window"));
                 bdata.Add(new BerthDropDown(4, "Middle"));
                 bdata.Add(new BerthDropDown(5, "Aisel"));
                 return bdata;
             }
         }
    }
}