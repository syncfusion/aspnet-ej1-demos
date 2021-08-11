#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Microsoft.AspNet.SignalR;
using Microsoft.Owin;
using Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebSampleBrowser.Grid
{
    public class SignalHub : Hub
    {
        public void Modify(string name, string action, RealTimeBinding.Orders order)
        {
            Clients.Others.modify(name, action, order);
        }
    }
}
