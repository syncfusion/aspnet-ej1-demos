using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.ComponentModel;
using System.Web.Script.Serialization;
 [Serializable]
    public class StackingBar100ChartData
    {
        public StackingBar100ChartData(string xval, double yvalue1, double yvalue2, double yvalue3, double yvalue4)
        {
            this.Xvalue = xval;
            this.YValue1 = yvalue1;
            this.YValue2 = yvalue2;
            this.YValue3 = yvalue3;
            this.YValue4 = yvalue4;
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

    }