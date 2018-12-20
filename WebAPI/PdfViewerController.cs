#region Copyright Syncfusion Inc. 2001-2018.
// Copyright Syncfusion Inc. 2001-2018. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Newtonsoft.Json;
using Syncfusion.EJ.PdfViewer;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;

namespace WebSampleBrowser.WebAPI
{
    public class PdfViewerController : ApiController
    {
	    PdfViewerHelper helper = new PdfViewerHelper();
        public object Load(Dictionary<string, string> jsonResult)
        {
            
            //load the multiple document from client side 
            if (jsonResult.ContainsKey("newFileName"))
            {
                var name = jsonResult["newFileName"];
                var pdfName = name.ToString() + ".pdf";
                helper.Load(Helper.GetFilePath("" + pdfName));
            }
            else
            {
                if (jsonResult.ContainsKey("isInitialLoading"))
                {
                    if (jsonResult.ContainsKey("file"))
                    {
                        var name = jsonResult["file"];
                        helper.Load(name);
                    }
                    else
                    {
                        helper.Load(Helper.GetFilePath("HTTP Succinctly.pdf"));
                    }
                }
            }

            string output = JsonConvert.SerializeObject(helper.ProcessPdf(jsonResult));
            return output;
        }
		 public object FileUpload(Dictionary<string, string> jsonResult)
        {
            if (jsonResult.ContainsKey("uploadedFile"))
            {
                var fileurl = jsonResult["uploadedFile"];
                byte[] byteArray = Convert.FromBase64String(fileurl);
                MemoryStream stream = new MemoryStream(byteArray);
                helper.Load(stream);
            }
            string output = JsonConvert.SerializeObject(helper.ProcessPdf(jsonResult));
            return output;
        }
		 public object Download(Dictionary<string, string> jsonResult)
        {
            return (helper.GetDocumentData(jsonResult));
        }	
    }

    public class Helper
    {
        public static string GetFilePath(string path)
        {
           string _dataPath = new System.IO.DirectoryInfo(HttpContext.Current.Server.MapPath("~\\App_Data\\PdfViewer")).FullName;
            _dataPath += @"\" + path;
            return _dataPath;
        }       
    }
}