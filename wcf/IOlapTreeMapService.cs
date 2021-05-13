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
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace WebSampleBrowser
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IPivotTreeMapService" in both code and config file together.
    [ServiceContract]
    public interface IOlapTreeMapService
    {
        [OperationContract]
        Dictionary<string, object> InitializeTreeMap(string action, string currentReport, string customObject);
        [OperationContract]
        Dictionary<string, object> DrillTreeMap(string action, string drillInfo, string olapReport, string customObject);
    }
}
