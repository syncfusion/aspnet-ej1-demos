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



public class EmployeeDetails
{

    [DataObjectMethod(DataObjectMethodType.Select)]
    public List<Employee> GetRecords()
    {

        List<Employee> list = new List<Employee>();
        list.Add(new Employee(001, "JohnDavid", "UK", "Nancy", "SalesRepresentative"));
        list.Add(new Employee(002, "Tom", "USA", "Andrew", "SalesManager"));
        list.Add(new Employee(003, "Bretney", "USA", "Janet", "SalesManager"));
        list.Add(new Employee(004, "Jessy", "UK", "Margaret", "SalesCoordinator"));
        list.Add(new Employee(005, "Bruch", "USA", "Peacock", "VicePresident"));
        list.Add(new Employee(006, "Johny", "USA", "Callahan", "SalesRepresentative"));
        return list;

    }

}

[Serializable]
public class Employee
{
    public string _country;
    public int _empID;
    public string _firstName;
    public string _lastname;
    public string _title;

    public Employee(int _empID, string _firstName, string _country, string _lastname, string _title)
    {
        this._empID = _empID;
        this._firstName = _firstName;
        this._country = _country;
        this._lastname = _lastname;
        this._title = _title;
    }

    public string Country
    {
        get
        {
            return _country;
        }
        set
        {
            _country = value;
        }
    }

    public int EmployeeID
    {
        get
        {
            return _empID;
        }
        set
        {
            _empID = value;
        }
    }

    public string FirstName
    {
        get
        {
            return _firstName;
        }
        set
        {
            _firstName = value;
        }
    }

    public string LastName
    {
        get
        {
            return _lastname;
        }
        set
        {
            _lastname = value;
        }
    }

    public string Title
    {
        get
        {
            return _title;
        }
        set
        {
            _title = value;
        }
    }
}