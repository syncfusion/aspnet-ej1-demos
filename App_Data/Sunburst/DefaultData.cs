#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.ComponentModel;
using System.Web.Script.Serialization;
using System;

[Serializable]
    public class DefaultData
    {
        public string Category { get; set; }
        public string Country { get; set; }
        public string JobDescription { get; set; }
        public string JobGroup { get; set; }
        public string JobRole { get; set; }
        public int EmployeesCount { get; set; }    
        
        public static List<DefaultData> GetDefaultList()
        {
            List<DefaultData> data = new List<DefaultData>();

            data.Add(new DefaultData() { Category = "Employees", Country = "USA", JobDescription = "Sales", JobGroup = "Executive", EmployeesCount = 50 });
            data.Add(new DefaultData() { Category = "Employees", Country = "USA", JobDescription = "Sales", JobGroup = "Analyst", EmployeesCount = 40 });
            data.Add(new DefaultData() { Category = "Employees", Country = "USA", JobDescription = "Marketing", EmployeesCount = 40 });
            data.Add(new DefaultData() { Category = "Employees", Country = "USA", JobDescription = "Technical", JobGroup = "Testers", EmployeesCount = 55 });
            data.Add(new DefaultData() { Category = "Employees", Country = "USA", JobDescription = "Technical", JobGroup = "Developers", JobRole = "Windows", EmployeesCount = 175 });
            data.Add(new DefaultData() { Category = "Employees", Country = "USA", JobDescription = "Technical", JobGroup = "Developers", JobRole = "Web", EmployeesCount = 70 });
            data.Add(new DefaultData() { Category = "Employees", Country = "USA", JobDescription = "Management", EmployeesCount = 40 });
            data.Add(new DefaultData() { Category = "Employees", Country = "USA", JobDescription = "Accounts", EmployeesCount = 60 });

            data.Add(new DefaultData() { Category = "Employees", Country = "India", JobDescription = "Technical", JobGroup = "Testers", EmployeesCount = 43 });
            data.Add(new DefaultData() { Category = "Employees", Country = "India", JobDescription = "Technical", JobGroup = "Developers", JobRole = "Windows", EmployeesCount = 125 });
            data.Add(new DefaultData() { Category = "Employees", Country = "India", JobDescription = "Technical", JobGroup = "Developers", JobRole = "Web", EmployeesCount = 60 });
            data.Add(new DefaultData() { Category = "Employees", Country = "India", JobDescription = "HR Executives", EmployeesCount = 70 });
            data.Add(new DefaultData() { Category = "Employees", Country = "India", JobDescription = "Accounts", EmployeesCount = 45 });

            data.Add(new DefaultData() { Category = "Employees", Country = "Germany", JobDescription = "Sales", JobGroup = "Executive", EmployeesCount = 30 });
            data.Add(new DefaultData() { Category = "Employees", Country = "Germany", JobDescription = "Sales", JobGroup = "Analyst", EmployeesCount = 40 });
            data.Add(new DefaultData() { Category = "Employees", Country = "Germany", JobDescription = "Marketing", EmployeesCount = 50 });
            data.Add(new DefaultData() { Category = "Employees", Country = "Germany", JobDescription = "Technical", JobGroup = "Testers", EmployeesCount = 40 });
            data.Add(new DefaultData() { Category = "Employees", Country = "Germany", JobDescription = "Technical", JobGroup = "Developers", JobRole = "Windows", EmployeesCount = 65 });
            data.Add(new DefaultData() { Category = "Employees", Country = "Germany", JobDescription = "Technical", JobGroup = "Developers", JobRole = "Web", EmployeesCount = 27 });
            data.Add(new DefaultData() { Category = "Employees", Country = "Germany", JobDescription = "Management", EmployeesCount = 33 });
            data.Add(new DefaultData() { Category = "Employees", Country = "Germany", JobDescription = "Accounts", EmployeesCount = 55 });

            data.Add(new DefaultData() { Category = "Employees", Country = "UK", JobDescription = "Technical", JobGroup = "Testers", EmployeesCount = 45 });
            data.Add(new DefaultData() { Category = "Employees", Country = "UK", JobDescription = "Technical", JobGroup = "Developers", JobRole = "Windows", EmployeesCount = 96 });
            data.Add(new DefaultData() { Category = "Employees", Country = "UK", JobDescription = "Technical", JobGroup = "Developers", JobRole = "Web", EmployeesCount = 55 });
            data.Add(new DefaultData() { Category = "Employees", Country = "UK", JobDescription = "HR Executives", EmployeesCount = 60 });
            data.Add(new DefaultData() { Category = "Employees", Country = "UK", JobDescription = "Accounts", EmployeesCount = 30 });

            data.Add(new DefaultData() { Category = "Employees", Country = "France", JobDescription = "Technical", JobGroup = "Testers", EmployeesCount = 40 });
            data.Add(new DefaultData() { Category = "Employees", Country = "France", JobDescription = "Technical", JobGroup = "Developers", JobRole = "Windows", EmployeesCount = 65 });
            data.Add(new DefaultData() { Category = "Employees", Country = "France", JobDescription = "Technical", JobGroup = "Developers", JobRole = "Web", EmployeesCount = 27 });
            data.Add(new DefaultData() { Category = "Employees", Country = "France", JobDescription = "Marketing", EmployeesCount = 50 });
            return data; 
        }
    }