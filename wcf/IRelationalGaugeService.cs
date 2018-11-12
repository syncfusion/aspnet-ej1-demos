using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace WebSampleBrowser
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IPivotGaugeService" in both code and config file together.
    [ServiceContract]
    public interface IRelationalGaugeService
    {
        [OperationContract]
        Dictionary<string, object> InitializeGauge(string action,string customObject);
    }
}
