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
    public class DatetimeData1
    {
        public DatetimeData1(DateTime xval, double yvalue1, double yvalue2, double size1, double size2)
        {
            this.XValue1 = xval;
            this.XValue2 = xval;
            this.YValue1 = yvalue1;
            this.YValue2 = yvalue2;
            this.Size1 = size1;
            this.Size2 = size2;
        }
        public DateTime XValue1
        {
            get;
            set;
        }
        public DateTime XValue2
        {
            get;
            set;
        }
        public double YValue1
        {
            get;
            set;
        }
        public double YValue2
        {
            get;
            set;
        }
        public double Size1
        {
            get;
            set;
        }
        public double Size2
        {
            get;
            set;
        }
    }