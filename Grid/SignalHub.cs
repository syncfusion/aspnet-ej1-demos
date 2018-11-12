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
