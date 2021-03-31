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
using System.IO;

namespace WebSampleBrowser
{
    public class ReportViewerHelper
    {
        public static string GetReportPath(string path)
        {
            string _dataPath = GetCommonFolder(new DirectoryInfo(HttpContext.Current.Request.PhysicalApplicationPath));
            _dataPath += @"\EjReportTemplate\" + path;
            return _dataPath;
        }

        static string GetCommonFolder(DirectoryInfo dtInfo)
        {
            var _folderNames = dtInfo.GetDirectories("Common");
            if (_folderNames.Length > 0)
            {
                var _innerfolder = _folderNames[0].GetDirectories("Data");
                if (_innerfolder.Length > 0)
                    return _innerfolder[0].FullName;
            }

            return dtInfo.Parent != null ? GetCommonFolder(dtInfo.Parent) : string.Empty;
        }
    }
}