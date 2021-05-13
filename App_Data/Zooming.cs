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
using System.Data;
using System.ComponentModel;
public class Data1
    {
        public Data1(DateTime date, double y)
        {
            this.Date = date;
            this.YValue = y;
        }
        public DateTime Date
        {
            get;
            set;
        }
        public double YValue
        {
            get;
            set;
        }
    }