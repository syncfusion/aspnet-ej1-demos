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