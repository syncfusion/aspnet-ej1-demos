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
using Syncfusion.JavaScript.Models;
namespace WebSampleBrowser.Schedule
{
    public partial class Validation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Categorize> CategorizeValue = new List<Categorize>();
            CategorizeValue.Add(new Categorize { text = "Blue Category", id = 1, color = "#43b496", fontColor = "#ffffff" });
            CategorizeValue.Add(new Categorize { text = "Green Category", id = 2, color = "#7f993e", fontColor = "#ffffff" });
            CategorizeValue.Add(new Categorize { text = "Orange Category", id = 3, color = "#cc8638", fontColor = "#ffffff" });
            CategorizeValue.Add(new Categorize { text = "Purple Category", id = 4, color = "#ab54a0", fontColor = "#ffffff" });
            CategorizeValue.Add(new Categorize { text = "Red Category", id = 5, color = "#dd654e", fontColor = "#ffffff" });
            CategorizeValue.Add(new Categorize { text = "Yellow Category", id = 6, color = "#d0af2b", fontColor = "#ffffff" });
            Schedule1.CategorizeSettings.DataSource = CategorizeValue;

            Schedule1.AppointmentSettings.Subject = new AppointmentSettings() { Field = "Subject", ValidationRules = new Dictionary<string, object>() { { "required", true } } };
            Schedule1.AppointmentSettings.Location = new AppointmentSettings() { Field = "Location", ValidationRules = new Dictionary<string, object>() { { "required", true }, { "customRule", "/^[a-zA-Z0-9- ]*$/" } } };
            Schedule1.AppointmentSettings.Description = new AppointmentSettings() { Field = "Description", ValidationRules = new Dictionary<string, object>() { { "required", true }, { "minlength", 5 }, { "maxlength", 500 } } };
            Dictionary<string, object> ValidationMessage = new Dictionary<string, object>();
            ValidationMessage.Add("required", "Categories are required.");
            Schedule1.AppointmentSettings.Categorize = new AppointmentSettings() { Field = "Categorize", ValidationRules = new Dictionary<string, object>() { { "required", true }, { "messages", ValidationMessage } } };
        }
        public class Categorize
        {
            public string text { set; get; }
            public int id { set; get; }
            public string fontColor { set; get; }
            public string color { set; get; }
        }
    }
}