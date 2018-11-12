using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;

namespace WebSampleBrowser.Schedule
{
    public class scheduleHub : Hub
    {
        public void Modify(String action, Object data)
        {
            Clients.Others.modify(action,data);
        }
    }
}