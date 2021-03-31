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
using Syncfusion.EJ.Export;
using Syncfusion.JavaScript.Web;
using Syncfusion.Pdf;
using System.Collections;
using System.Web.Script.Serialization;
using Syncfusion.JavaScript.Models;

namespace WebSampleBrowser.Schedule
{
    public partial class PDFExport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<WebSampleBrowser.Schedule.multipleresource.Rooms> owner = new List<WebSampleBrowser.Schedule.multipleresource.Rooms>();
            List<WebSampleBrowser.Schedule.multipleresource.Rooms> rooms = new List<WebSampleBrowser.Schedule.multipleresource.Rooms>();
            rooms.Add(new WebSampleBrowser.Schedule.multipleresource.Rooms { text = "Room1", id = "1", color = "#cb6bb2" });
            rooms.Add(new WebSampleBrowser.Schedule.multipleresource.Rooms { text = "Room2", id = "2", color = "#56ca85" });

            owner.Add(new WebSampleBrowser.Schedule.multipleresource.Rooms { text = "Nancy", id = "1", groupId = "1", color = "#ffaa00" });
            owner.Add(new WebSampleBrowser.Schedule.multipleresource.Rooms { text = "Steven", id = "3", groupId = "2", color = "#f8a398" });
            owner.Add(new WebSampleBrowser.Schedule.multipleresource.Rooms { text = "Michael", id = "5", groupId = "1", color = "#7499e1" });

            Schedule1.Resources[0].ResourceSettings.DataSource = rooms;
            Schedule1.Resources[1].ResourceSettings.DataSource = owner;

            List<BlockDataSource> blockData = new List<BlockDataSource>();
            blockData.Add(new BlockDataSource(1, "MAINTENANCE", new DateTime(2017, 6, 5, 8, 0, 0), new DateTime(2017, 6, 5, 10, 0, 0), true, "3", "2", false));
            blockData.Add(new BlockDataSource(2, "SERVICE", new DateTime(2017, 6, 5, 9, 0, 0), new DateTime(2017, 6, 5, 11, 0, 0), true, "1", "1", false));
            blockData.Add(new BlockDataSource(3, "SERVICE", new DateTime(2017, 6, 6), new DateTime(2017, 6, 6), true, "1", "1", true));
            blockData.Add(new BlockDataSource(4, "BAD MONSOON", new DateTime(2017, 6, 5, 15, 30, 0), new DateTime(2017, 6, 5, 17, 0, 0), true, "1", "1", false));
            blockData.Add(new BlockDataSource(5, "BAD MONSOON", new DateTime(2017, 6, 5, 15, 30, 0), new DateTime(2017, 6, 5, 17, 0, 0), true, "3", "2", false));
            blockData.Add(new BlockDataSource(6, "BAD MONSOON", new DateTime(2017, 6, 5, 15, 30, 0), new DateTime(2017, 6, 5, 17, 0, 0), true, "5", "1", false));
            Schedule1.BlockoutSettings.DataSource = blockData;
        }
        protected void Schedule1_OnServerExportPDF(object sender, ScheduleEventArgs e)
        {
            ScheduleProperties scheduleObject = new SchedulePDFExport().ScheduleSerializeModel(e.Arguments["model"].ToString());
            scheduleObject.BlockoutSettings.DataSource = (IEnumerable)new JavaScriptSerializer().Deserialize(e.Arguments["blockedApp"].ToString(), typeof(IEnumerable));
            IEnumerable scheduleAppointments = (IEnumerable)new JavaScriptSerializer().Deserialize(e.Arguments["processedApp"].ToString(), typeof(IEnumerable));
            PdfPageSettings pageSettings = new PdfPageSettings(50f) { Orientation = PdfPageOrientation.Landscape };
            PdfDocument document = new PdfExport().Export(scheduleObject, scheduleAppointments, ExportTheme.FlatLime, Request.Form["locale"], pageSettings);
            document.Save("Schedule.pdf", Response, HttpReadType.Save);
        }
    }

    [Serializable]
    public class BlockDataSource
    {
        private int id;
        private string subject;
        private DateTime startTime;
        private DateTime endTime;
        private bool blockapp;
        private string resId;
        private string groupId;
        private bool fullDay;
        public BlockDataSource(int id, string subject, DateTime startTime, DateTime endTime, Boolean blockapp, string resId, string groupId, bool fullDay)
        {
            this.id = id;
            this.subject = subject;
            this.startTime = startTime;
            this.endTime = endTime;
            this.blockapp = blockapp;
            this.resId = resId;
            this.groupId = groupId;
            this.fullDay = fullDay;
        }
        public int BlockId
        {
            get { return id; }
            set { id = value; }
        }
        public string Subject
        {
            get { return subject; }
            set { subject = value; }
        }
        public DateTime StartTime
        {
            get { return startTime; }
            set { startTime = value; }
        }
        public DateTime EndTime
        {
            get { return endTime; }
            set { endTime = value; }
        }
        public Boolean BlockAppointment
        {
            get { return blockapp; }
            set { blockapp = value; }
        }
        public string ResourceId
        {
            get { return resId; }
            set { resId = value; }
        }

        public string GroupId
        {
            get { return groupId; }
            set { groupId = value; }
        }
        public bool FullDay
        {
            get { return fullDay; }
            set { fullDay = value; }
        }
    }
}