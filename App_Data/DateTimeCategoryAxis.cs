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
using System.Web.Script.Serialization;
   [Serializable]
        public class DatetimeCategoryData
        {
            public DatetimeCategoryData(DateTime xval, double yvalue1)
            {
                this.Xvalue = xval;
                this.YValue1 = yvalue1;


            }
            public DateTime Xvalue
            {
                get;
                set;
            }
            public double YValue1
            {
                get;
                set;
            }
        }