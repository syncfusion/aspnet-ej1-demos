#region Copyright Syncfusion Inc. 2001-2020.
// Copyright Syncfusion Inc. 2001-2020. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;

namespace WebSampleBrowser.SpreadsheetASP
{
    public class SpreadsheetHub : Hub
    {
        public void Modify(string userId, string range, string action, string data, int sheetIndex)
        {
            Clients.Others.modify(userId, range, action, data, sheetIndex);
        }
    }
}