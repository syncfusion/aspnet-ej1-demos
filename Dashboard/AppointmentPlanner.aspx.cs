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
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.Dashboard
{
    public partial class AppointmentPlanner : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Datasource for departments
            List<Rooms> departments = new List<Rooms>();
            departments.Add(new Rooms { Name = "GENERAL", Text = "GENERAL", Id = 1, GroupId = 10, Color = "#C3DAF1" });
            departments.Add(new Rooms { Name = "DENTAL", Text = "DENTAL", Id = 2, GroupId = 10, Color = "#FBDBD8" });

            //Datasource for doctors
            List<Rooms> doctors = new List<Rooms>();
            doctors.Add(new Rooms { Name = "John Xavier", Text = "JohnXavier", Id = 1, GroupId = 1, Color = "#cb6bb2", Designation = "Cardiologist", Value = "cardiologist" });
            doctors.Add(new Rooms { Name = "Annie", Text = "Annie", Id = 2, GroupId = 2, Color = "#56ca85", Designation = "Oncologist", Value = "oncologist" });
            doctors.Add(new Rooms { Name = "Paul", Text = "Paul", Id = 3, GroupId = 1, Color = "#cb6bb2", Designation = "Ophthalmologist", Value = "ophthalmologist" });
            doctors.Add(new Rooms { Name = "Helen", Text = "Helen", Id = 4, GroupId = 2, Color = "#56ca85", Designation = "Orthopedic", Value = "orthopedic" });
            doctors.Add(new Rooms { Name = "Smith", Text = "Smith", Id = 5, GroupId = 1, Color = "#cb6bb2", Designation = "Neurologist", Value = "neurologist" });
            doctors.Add(new Rooms { Name = "George", Text = "George", Id = 6, GroupId = 2, Color = "#56ca85", Designation = "Child Specialist", Value = "childspecialist" });
            doctors.Add(new Rooms { Name = "Benita", Text = "Benita", Id = 7, GroupId = 1, Color = "#cb6bb2", Designation = "Dermatologist", Value = "dermatologist" });

            //Datasource for catagory
            List<Categories> categorylist = new List<Categories>();
            categorylist.Add(new Categories { Text = "Consulting", Value = "consulting", Color = "#9578b3" });
            categorylist.Add(new Categories { Text = "Check up", Value = "checkup", Color = "#64b7a0" });
            categorylist.Add(new Categories { Text = "Extraction", Value = "extraction", Color = "#c95d5d" });
            categorylist.Add(new Categories { Text = "Observation", Value = "observation", Color = "#8196a7" });
            categorylist.Add(new Categories { Text = "Surgery", Value = "surgery", Color = "#6a8fcb" });
            categorylist.Add(new Categories { Text = "Therapy", Value = "therapy", Color = "#5B7D38" });
            Category.DataSource = categorylist;

            //Datasource for appointments
            List<Appointmennts> hospitaldata = new List<Appointmennts>();
            hospitaldata.Add(new Appointmennts { Id = 1, Subject = "David", StartTime = new DateTime(2016, 4, 1, 15, 0, 0), EndTime = new DateTime(2016, 4, 1, 17, 0, 0), Description = "Health Checkup", AllDay = false, Recurrence = false, RoomId = 1, OwnerId = 1, Category = "consulting" });
            hospitaldata.Add(new Appointmennts { Id = 2, Subject = "John", StartTime = new DateTime(2016, 4, 1, 16, 30, 0), EndTime = new DateTime(2016, 4, 1, 18, 30, 0), Description = "Monthly Treatment", AllDay = false, Recurrence = false, RoomId = 2, OwnerId = 2, Category = "checkup" });
            hospitaldata.Add(new Appointmennts { Id = 3, Subject = "Peter", StartTime = new DateTime(2016, 4, 1, 19, 0, 0), EndTime = new DateTime(2016, 4, 1, 21, 0, 0), Description = "Eye and Spectacles Checkup", AllDay = false, Recurrence = false, RoomId = 1, OwnerId = 3, Category = "extraction" });
            hospitaldata.Add(new Appointmennts { Id = 4, Subject = "Starc", StartTime = new DateTime(2016, 4, 1, 19, 0, 0), EndTime = new DateTime(2016, 4, 1, 21, 0, 0), Description = "Bone and Health Checkup ", AllDay = false, Recurrence = false, RoomId = 2, OwnerId = 4, Category = "observation" });
            hospitaldata.Add(new Appointmennts { Id = 5, Subject = "James", StartTime = new DateTime(2016, 4, 1, 22, 0, 0), EndTime = new DateTime(2016, 4, 2, 0, 0, 0), Description = "Surgery Appointment", AllDay = false, Recurrence = false, RoomId = 1, OwnerId = 5, Category = "therapy" });
            hospitaldata.Add(new Appointmennts { Id = 6, Subject = "Jercy", StartTime = new DateTime(2016, 4, 1, 21, 30, 0), EndTime = new DateTime(2016, 4, 1, 23, 30, 0), Description = "Monthly Checkup for baby", AllDay = false, Recurrence = false, RoomId = 2, OwnerId = 6, Category = "surgery" });
            hospitaldata.Add(new Appointmennts { Id = 7, Subject = "Albert", StartTime = new DateTime(2016, 4, 2, 0, 0, 0), EndTime = new DateTime(2016, 4, 2, 2, 30, 0), Description = "Skin care treatment", AllDay = false, Recurrence = true, RecurrenceRule = "FREQ=DAILY;INTERVAL=1;COUNT=10", RoomId = 1, OwnerId = 7, Category = "extraction" });
            hospitaldata.Add(new Appointmennts { Id = 8, Subject = "David", StartTime = new DateTime(2016, 4, 2, 16, 30, 0), EndTime = new DateTime(2016, 4, 2, 18, 15, 0), Description = "Eye checkup and Treatment", AllDay = false, Recurrence = false, RoomId = 1, OwnerId = 1, Category = "consulting" });
            hospitaldata.Add(new Appointmennts { Id = 9, Subject = "John", StartTime = new DateTime(2016, 4, 2, 19, 30, 0), EndTime = new DateTime(2016, 4, 2, 21, 45, 0), Description = "Skin Checkup and Treatment", AllDay = false, Recurrence = false, RoomId = 2, OwnerId = 2, Category = "checkup" });
            hospitaldata.Add(new Appointmennts { Id = 10, Subject = "Peter", StartTime = new DateTime(2016, 4, 3, 17, 30, 0), EndTime = new DateTime(2016, 4, 3, 19, 30, 0), Description = "Surgery Treatment", AllDay = false, Recurrence = false, RoomId = 1, OwnerId = 3, Category = "extraction" });

            //Datasource for waiting list
            List<Appointmennts> waitinglist = new List<Appointmennts>();
            waitinglist.Add(new Appointmennts { Id = 11, Subject = "Steven", StartTime = new DateTime(2016, 4, 3, 7, 30, 0), EndTime = new DateTime(2016, 4, 3, 9, 30, 0), Description = "Master Checkup", AllDay = false, Recurrence = false, RoomId = 1, OwnerId = 1, Department = "GENERAL", Category = "consulting", Categorycolor = "#9A32CD" });
            waitinglist.Add(new Appointmennts { Id = 12, Subject = "Milan", StartTime = new DateTime(2016, 4, 4, 8, 30, 0), EndTime = new DateTime(2016, 4, 4, 10, 30, 0), Description = "Master Checkup", AllDay = false, Recurrence = false, RoomId = 2, OwnerId = 2, Department = "DENTAL", Category = "checkup", Categorycolor = "#458B74" });
            waitinglist.Add(new Appointmennts { Id = 13, Subject = "Laura", StartTime = new DateTime(2016, 4, 4, 9, 30, 0), EndTime = new DateTime(2016, 4, 4, 10, 30, 0), Description = "Master Checkup", AllDay = false, Recurrence = false, RoomId = 1, OwnerId = 3, Department = "GENERAL", Category = "extraction", Categorycolor = "#CD2626" });
            waitinglist.Add(new Appointmennts { Id = 14, Subject = "Janet", StartTime = new DateTime(2016, 4, 3, 11, 0, 0), EndTime = new DateTime(2016, 4, 3, 12, 30, 0), Description = "Master Checkup", AllDay = false, Recurrence = false, RoomId = 2, OwnerId = 4, Department = "DENTAL", Category = "observation", Categorycolor = "#5F9EA0" });

            //Datasource for patients
            List<Patients> patientlist = new List<Patients>();
            patientlist.Add(new Patients { Id = 1, Name = "David", DOB = new DateTime(1991, 5, 29), Mobile = 9897969594, BloodGroup = "A+", Address = "Canada" });
            patientlist.Add(new Patients { Id = 2, Name = "John", DOB = new DateTime(1991, 8, 6), Mobile = 9897969594, BloodGroup = "A-", Address = "Canada" });
            patientlist.Add(new Patients { Id = 3, Name = "Peter", DOB = new DateTime(1991, 10, 10), Mobile = 9897969594, BloodGroup = "AB+", Address = "Canada" });
            patientlist.Add(new Patients { Id = 4, Name = "Starc", DOB = new DateTime(1991, 10, 30), Mobile = 9897969594, BloodGroup = "AB-", Address = "Canada" });
            patientlist.Add(new Patients { Id = 5, Name = "James", DOB = new DateTime(1991, 10, 26), Mobile = 9897969594, BloodGroup = "O+", Address = "Canada" });
            patientlist.Add(new Patients { Id = 6, Name = "Jercy", DOB = new DateTime(1991, 7, 18), Mobile = 9897969594, BloodGroup = "O+", Address = "Canada" });
            patientlist.Add(new Patients { Id = 7, Name = "Albret", DOB = new DateTime(1991, 1, 4), Mobile = 9897969594, BloodGroup = "O+", Address = "Canada" });
            patientlist.Add(new Patients { Id = 8, Name = "Robert", DOB = new DateTime(1991, 10, 29), Mobile = 9897969594, BloodGroup = "A-", Address = "Canada" });
            patientlist.Add(new Patients { Id = 9, Name = "Louis", DOB = new DateTime(1991, 7, 17), Mobile = 9897969594, BloodGroup = "A-", Address = "Canada" });
            patientlist.Add(new Patients { Id = 10, Name = "Williams", DOB = new DateTime(1991, 5, 25), Mobile = 9897969594, BloodGroup = "A+", Address = "Canada" });

            DoctorSchedule.Resources[0].ResourceSettings.DataSource = departments;
            DoctorSchedule.Resources[1].ResourceSettings.DataSource = doctors;
            DoctorSchedule.AppointmentSettings.DataSource = hospitaldata;

            JavaScriptSerializer jsSerialize = new JavaScriptSerializer();
            StringBuilder strScript = new StringBuilder();
            strScript.Append("<script type=\"text/javascript\">");
            strScript.Append("var departments='" + jsSerialize.Serialize(departments) + "';");
            strScript.Append("var doctors='" + jsSerialize.Serialize(doctors) + "';");
            strScript.Append("var categorylist='" + jsSerialize.Serialize(categorylist) + "';");
            strScript.Append("var waitinglist='" + jsSerialize.Serialize(waitinglist) + "';");
            strScript.Append("var patientlist='" + jsSerialize.Serialize(patientlist) + "';");
            strScript.Append("</script>");
            ClientScriptManager script = Page.ClientScript;
            if (!script.IsClientScriptBlockRegistered(this.GetType(), "Var"))
            {
                script.RegisterClientScriptBlock(this.GetType(), "Var", strScript.ToString());
            }
        }

        private class Categories
        {
            public string Text { get; set; }
            public string Value { get; set; }
            public string Color { get; set; }
        }

        private class Rooms
        {
            public string Name { get; set; }
            public string Text { set; get; }
            public int Id { set; get; }
            public int GroupId { set; get; }
            public string Color { set; get; }
            public string Designation { get; set; }
            public string Value { get; set; }
        }

        private class Appointmennts
        {
            public int Id { get; set; }
            public string Subject { get; set; }
            public DateTime StartTime { get; set; }
            public DateTime EndTime { get; set; }
            public string Description { get; set; }
            public Boolean AllDay { get; set; }
            public Boolean Recurrence { get; set; }
            public string RecurrenceRule { get; set; }
            public int RoomId { get; set; }
            public int OwnerId { get; set; }
            public string Category { get; set; }
            public string Categorycolor { get; set; }
            public string Department { get; set; }
        }

        public class Patients
        {
            public int Id { get; set; }
            public string Name { get; set; }
            public DateTime DOB { get; set; }
            public long Mobile { get; set; }
            public string BloodGroup { get; set; }
            public string Address { get; set; }
        }
    }
}