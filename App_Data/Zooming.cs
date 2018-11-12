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