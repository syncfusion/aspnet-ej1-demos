#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
namespace WebSampleBrowser.SpreadsheetASP.Model
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.ComponentModel;

    public class DataValidationData
    {
        public string format1 { get; set; }
        public string format2 { get; set; }
        public string format3 { get; set; }
        public string format4 { get; set; }
        public string format5 { get; set; }
        public string format6 { get; set; }
        public string format7 { get; set; }
        public string format8 { get; set; }
        public string format9 { get; set; }
        public string format10 { get; set; }
        public string format11 { get; set; }
        public static List<DataValidationData> GetDValidationDetails
        {
            get
            {
                List<DataValidationData> formats = new List<DataValidationData>();

                formats.Add(new DataValidationData() { format1 = "Greater than 6", format3 = "Text Length Less than 35", format5 = "Between 150 to 200", format7 = "List", format9 = "Greater than 07/09/2014", format11 = "Greater than 11:23:23  AM" });
                formats.Add(new DataValidationData() { format1 = "1", format3 = "Business", format5 = "$160.00", format7 = "1", format9 = "02/14/2014", format11 = "11:34:32 AM" });
                formats.Add(new DataValidationData() { format1 = "2", format3 = "Religious Worker", format5 = "$190.00", format7 = "2", format9 = "06/11/2014", format11 = "05:56:32 AM" });
                formats.Add(new DataValidationData() { format1 = "3", format3 = "Temporary Workers/Employment or Trainees", format5 = "$190.00", format7 = "3", format9 = "03/04/2012", format11 = "07:16:22 AM" });
                formats.Add(new DataValidationData() { format1 = "4", format3 = "Transiting the United States", format5 = "$160.00", format7 = "4", format9 = "07/27/2014", format11 = "03:32:44 AM" });
                formats.Add(new DataValidationData() { format1 = "5", format3 = "Student, Academic", format5 = "$160.00", format7 = "5", format9 = "11/21/2014", format11 = "06:23:54 AM" });
                formats.Add(new DataValidationData() { format1 = "6", format3 = "Orphan (Intercountry Adoption)", format5 = "$720.00", format7 = "6", format9 = "06/23/2014", format11 = "11:22:59 AM" });
                formats.Add(new DataValidationData() { format1 = "7", format3 = "Exchange Visitors", format5 = "$160.00", format7 = "7", format9 = "07/22/2014", format11 = "10:55:53 AM" });
                formats.Add(new DataValidationData() { format1 = "8", format3 = "DV category Immigrant Visa", format5 = "$360.00", format7 = "8", format9 = "07/22/2014", format11 = "10:55:53 AM" });
                formats.Add(new DataValidationData() { format1 = "9", format3 = "Victims of Criminal Activity", format5 = "$160.00", format7 = "8", format9 = "02/04/2014", format11 = "03:44:34 AM" });
                formats.Add(new DataValidationData() { format1 = "10", format3 = "NAFTA Professionals", format5 = "$160.00", format7 = "9", format9 = "11/30/2014", format11 = "03:12:52 AM" });
                formats.Add(new DataValidationData() { format1 = "11", format3 = "Employment-Based Applications", format5 = "$345.00", format7 = "10", format9 = "07/09/2014", format11 = "11:32:14 AM" });
                formats.Add(new DataValidationData() { format1 = "12", format3 = "Intracompany Transferees", format5 = "$190.00", format7 = "11", format9 = "10/31/2014", format11 = "11:01:44 AM" });
                formats.Add(new DataValidationData() { format1 = "13", format3 = "Person with Extraordinary Ability", format5 = "$190.00", format7 = "12", format9 = "07/22/2014", format11 = "10:55:53 AM" });
                formats.Add(new DataValidationData() { format1 = "14", format3 = "Tourism", format5 = "$160.00", format7 = "13", format9 = "10/31/2014", format11 = "11:01:44 AM" });

                return formats;
            }
        }
    }
}