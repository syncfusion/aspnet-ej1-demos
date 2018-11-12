using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.ComponentModel;
using System.Web.Script.Serialization;
using System;


public class DataPoints
    {
        public DataPoints(DateTime x, double y)
        {
            this.Date = x;
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