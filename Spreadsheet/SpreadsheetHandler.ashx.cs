#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.EJ.Export;
using Syncfusion.JavaScript.Models;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;

namespace SpreadsheetASP
{
    /// <summary>
    /// Summary description for SpreadsheetHandler
    /// </summary>
    public class SpreadsheetHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string password = "password", sheetIndex = "sheetIndex", dataContainer = "dataContainer", allowSheetOnDemand = "allowSheetOnDemand";
            bool isImport = true;
            var files = context.Request.Files;
            NameValueCollection form = context.Request.Form;
            ImportRequest importRequest = new ImportRequest();
            if (files.Count == 0)
                importRequest.Url = form["url"];
            else
            {
                var obj = files[0];
                if (obj.ContentType.IndexOf("image") > -1)
                {
                    importRequest.File = new HttpPostedFileWrapper(files[0]);
                    isImport = false;
                }
                else
                {
                    importRequest.FileStream = obj.InputStream;
                    importRequest.FileType = obj.FileName.Split('.')[obj.FileName.Split('.').Length - 1];
                    importRequest.File = null;
                }
            }
            if (isImport)
            {
                string[] keys = form.AllKeys;
                if (keys.Contains(password))
                    importRequest.Password = form[password];
                if (keys.Contains(allowSheetOnDemand))
                    importRequest.AllowSheetOnDemand = bool.Parse(form[allowSheetOnDemand]);
                if (keys.Contains(sheetIndex))
                    importRequest.SheetIndex = int.Parse(form[sheetIndex]);
                if (keys.Contains(dataContainer))
                    importRequest.DataContainer = form.GetValues(dataContainer);
            }
            string str = Spreadsheet.Open(importRequest);
            context.Response.Write(str);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}