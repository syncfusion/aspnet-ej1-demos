#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using Syncfusion.EJ.Export;

namespace WebSampleBrowser.Schedule
{
    public partial class ScheduleICSExport : System.Web.UI.Page
    {

        ScheduleAppointmentsObjDatum data = new ScheduleAppointmentsObjDatum();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Schedule1.AppointmentSettings.DataSource = data.GetRecords();
        }
        protected void Schedule1_ExportICS(object sender, Syncfusion.JavaScript.Web.ScheduleEventArgs e)
        {
            IEnumerable datum;
            var model = JsonConvert.DeserializeObject<Dictionary<string, object>>(e.Arguments["appSetting"].ToString());
            if(e.Arguments["appId"] != null)
                datum = data.GetRecords().Where(app=>app.ID == Convert.ToInt16(e.Arguments["appId"])).ToList();
            else
                datum = data.GetRecords();
            ScheduleExport obj = new ScheduleExport(model, datum);
        }
        protected void fileUpload1_Complete(object sender, Syncfusion.JavaScript.Web.UploadBoxCompleteEventArgs e)
        {
            string txt = HttpContext.Current.Server.MapPath("uploadfiles");
            txt = txt + "\\" + e.Name;
            ScheduleImport importApps = new ScheduleImport();
            var app = importApps.renderingImportAppointments(txt);
            var records = data.GetRecords();
            int maxID = Convert.ToInt32(records.Max(x => x.ID));
            List<ScheduleAppointmentsObjData> list = new List<ScheduleAppointmentsObjData>();
            for (var i = 0; i < app.Count; i++)
            {
                int ID = maxID + 1;
                ScheduleAppointmentsObjData row = new ScheduleAppointmentsObjData(ID, app[i].Subject, app[i].Location, app[i].StartTime, app[i].EndTime, app[i].Description, null, null, app[i].Recurrence, null, null, app[i].AppointmentCategorize, null, app[i].AllDay, null, null, app[i].RecurrenceRules,null,null);
                records.Add(row);
            }
            this.Schedule1.AppointmentSettings.DataSource = records;
        }
    }
}