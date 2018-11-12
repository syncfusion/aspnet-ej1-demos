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