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
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IRelationalService" in both code and config file together.
    [ServiceContract]
    public interface IRelationalGridService
    {
        [OperationContract]
        Dictionary<string, object> InitializeGrid(string action);
        [OperationContract]
        Dictionary<string, object> FetchMembers(string action, string headerTag, string sortedHeaders, string currentReport);
        [OperationContract]
        Dictionary<string, object> Filtering(string action, string filterParams, string sortedHeaders, string currentReport);
        [OperationContract]
        Dictionary<string, object> NodeStateModified(string action, string headerTag, string dropAxis, string sortedHeaders, string filterParams, string currentReport);
        [OperationContract]
        Dictionary<string, object> NodeDropped(string action, string dropAxis, string headerTag, string sortedHeaders, string filterParams, string currentReport);
        [OperationContract]
        Dictionary<string, object> Sorting(string action, string sortedHeaders, string currentReport);
        [OperationContract]
        void Export(System.IO.Stream stream);
        [OperationContract]
        Dictionary<string, object> DeferUpdate(string action, string filterParams, string sortedHeaders, string currentReport);
        [OperationContract]
        Dictionary<string, object> CalculatedField(string action, string headerTag, string currentReport);
        [OperationContract]
        Dictionary<string, object> CellEditing(string action, string index, string valueHeaders, string summaryValues, string currentReport);
        [OperationContract]
        Dictionary<string, object> SaveReport(string reportName, string operationalMode, string olapReport, string clientReports);
        [OperationContract]
        Dictionary<string, object> LoadReportFromDB(string reportName, string operationalMode, string olapReport, string clientReports);
    }
}
