using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.ComponentModel;
using System.Web.Script.Serialization;
  [Serializable]
    public class BoxPlotData
    {
        public BoxPlotData(string xval,Double[] yvalue)
        {
            this.Xvalue = xval;
            this.YValue1 = yvalue;
            
        }
        public string Xvalue
        {
            get;
            set;
        }
        public Double[] YValue1
        {
            get;
            set;
        }
       
    }