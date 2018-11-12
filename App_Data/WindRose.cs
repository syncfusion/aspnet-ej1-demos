using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.ComponentModel;
using System.Web.Script.Serialization;
  [Serializable]
    public class WindRoseChartData
    {
        public WindRoseChartData(string xval, double yvalue1, double yvalue2, double yvalue3, double yvalue4, double yvalue5, double yvalue6, double yvalue7, double yvalue8)
        {
            this.Xvalue = xval;
            this.YValue1 = yvalue1;
            this.YValue2 = yvalue2;
            this.YValue3 = yvalue3;
            this.YValue4 = yvalue4;
            this.YValue5 = yvalue5;
            this.YValue6 = yvalue6;
            this.YValue7 = yvalue7;
            this.YValue8 = yvalue8;
        }
        public string Xvalue
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
        public double YValue3
        {
            get;
            set;
        }
        public double YValue4
        {
            get;
            set;
        }
        public double YValue5
        {
            get;
            set;
        }
        public double YValue6
        {
            get;
            set;
        }
        public double YValue7
        {
            get;
            set;
        }
        public double YValue8
        {
            get;
            set;
        }

    }
