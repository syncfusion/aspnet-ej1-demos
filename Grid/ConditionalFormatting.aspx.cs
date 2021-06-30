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
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.Grid
{
    public partial class ConditionalFormatting : System.Web.UI.Page
    {
        List<Orders> order = new List<Orders>();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataSource();
        }

        private void BindDataSource()
        {
            order.Add(new Orders("DDNDKJ", 6088.20, 61145.93, 6034.50, 12.4, 6115.35, 4770.35, 14.37, 9.87));
            order.Add(new Orders("FKLND", 2042.00, 2108.34, 2048.67, 77.8, 2108.34, 1526.25, 23.76, 10.28));
            order.Add(new Orders("DSNNS", 740, 772.3, 740, 26.6,772.3, 496.23, 47.28,23.20));
            order.Add(new Orders("MLSSD", 993.54, 958.20, 939.40, 21.45, 998.76, 553.65, 47.34, 9.20));
            order.Add(new Orders("LKSNDL", 4642.30, 4748.40, 4641.38, 99.5, 5050.60, 3538.90, 61.34, 11.20));
            order.Add(new Orders("NKJSN", 445, 451.9, 442, 6.92, 578.2, 370.20, 29.2, 7.23));
            order.Add(new Orders("LNKNDS", 298.4, 163.49, 168.30, 12.4, 386.39, 289.4, -9.42, 9.87));
            order.Add(new Orders("NSDN", 400, 403.20, 399.48, 4.5, 435, 300, -5.32, -1.20));
            order.Add(new Orders("DSJBD", 1723.34, 1748.30, 1764.84, 10.05, 1728.75, 1051.57, 61.48, 31.32)); 
            order.Add(new Orders("BSBDBD", 1623.23, 1656.23, 1169.48, 6.25, 1232.34, 767.34, 37.43, 23.04));
            this.OrdersGrid.DataSource = order;
            this.OrdersGrid.DataBind();
        }

        [Serializable]
        public class Orders
        {
            public Orders()
            {

            }
            public Orders(String orderId, double open,double high,double low, double close,double weekHigh,double weekLow,double yearChange,double monthChange)
            {
                this.OrderID = orderId;
                this.Open = open;
                this.High = high;
                this.Low = low;
                this.Close = close;
                this.WeekHigh = weekHigh;
                this.WeekLow = weekLow;
                this.YearChange = yearChange;
                this.MonthChange = monthChange;
            }
            public String OrderID { get; set; }
            public double Open { get; set; }
            public double High { get; set; }
            public double Low { get; set; }
            public double Close { get; set; }
            public double WeekHigh { get; set; }
            public double WeekLow { get; set; }
            public double YearChange { get; set; }
            public double MonthChange { get; set; }
        }
    }
}