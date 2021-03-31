#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.JavaScript;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.FileExplorer
{
    public partial class VirtualScrolling : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod]
        public static object FileActionDefault(string ActionType, string Path, string ExtensionsAllow, string LocationFrom, string LocationTo, string Name, string[] Names, string NewName, string Action, bool CaseSensitive, string SearchString, IEnumerable<CommonFileDetails> CommonFiles)
        {
            try
            {
                FileExplorerOperations opeartion = new FileExplorerOperations();
                if (ActionType != "Paste" && ActionType != "GetDetails")
                {
                    var FilePath = opeartion.GetPhysicalPath(opeartion.ToAbsolute(Path));
                    if (!FilePath.ToLower().Contains("filebrowser1"))
                        throw new ArgumentException("'" + FilePath + "' is not accessible. Access is denied.");
                }
                switch (ActionType)
                {
                    case "Read":
                        return (opeartion.Read(Path, ExtensionsAllow));
                    //case "CreateFolder":
                    //    return (opeartion.CreateFolder(Path, Name));
                    //case "Paste":
                    //    opeartion.Paste(LocationFrom, LocationTo, Names, Action, CommonFiles);
                    //    break;
                    //case "Remove":
                    //    opeartion.Remove(Names, Path);
                    //    break;
                    //case "Rename":
                    //    opeartion.Rename(Path, Name, NewName, CommonFiles);
                    //    break;
                    case "GetDetails":
                        return (opeartion.GetDetails(Path, Names));
                    case "Search":
                        return (opeartion.Search(Path, ExtensionsAllow, SearchString, CaseSensitive));
                    //provide restriction to modify data in our online samples
                    default:
                        throw new Exception("Restricted to modify data in online demo.");
                }
                //return "";
            }
            catch (Exception e)
            {
                FileExplorerResponse Response = new FileExplorerResponse();
                Response.error = e.GetType().FullName + ", " + e.Message;
                return Response;
            }
        }
    }
}