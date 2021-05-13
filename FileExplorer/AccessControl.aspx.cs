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
    public partial class AccessControl : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                Session["Role"] = "Administrator";
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
                    if (!FilePath.ToLower().Contains("filecontent"))
                        throw new ArgumentException("'" + FilePath + "' is not accessible. Access is denied.");
                }
                AccessControl Rule = new AccessControl();
                FileAccessOperations operation = new FileAccessOperations(Rule.GetRules());
                switch (ActionType)
                {
                    case "Read":
                        return (operation.Read(Path, ExtensionsAllow));
                    //case "CreateFolder":
                    //    return (operation.CreateFolder(Path, Name));
                    //case "Paste":
                    //    operation.Paste(LocationFrom, LocationTo, Names, Action, CommonFiles);
                    //    break;
                    //case "Remove":
                    //    operation.Remove(Names, Path);
                    //    break;
                    //case "Rename":
                    //    operation.Rename(Path, Name, NewName, CommonFiles);
                    //    break;
                    case "GetDetails":
                        return (operation.GetDetails(Path, Names));
                    case "Search":
                        return (operation.Search(Path, ExtensionsAllow, SearchString, CaseSensitive));
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
        public FileAccessInfo GetRules()
        {
            FileAccessInfo rules = new FileAccessInfo();
            List<AccessRule> accessRules = new List<AccessRule> {
                // For Default User
                new AccessRule { Path = "*.*", Role = "Default User", Read = Permission.Deny, Edit = Permission.Deny, Copy = Permission.Deny, Download = Permission.Deny },
                new AccessRule { Path = "*", Role = "Default User", Read = Permission.Deny, Edit = Permission.Deny, Copy = Permission.Deny, EditContents = Permission.Deny, Upload = Permission.Deny },
                new AccessRule { Path = "", Role = "Default User", Read = Permission.Allow, Edit = Permission.Deny, Copy = Permission.Deny, EditContents = Permission.Deny, Upload = Permission.Deny },
                // For Administrator
                new AccessRule { Path = "*.*", Role = "Administrator", Read = Permission.Allow, Edit = Permission.Allow, Copy = Permission.Allow, Download = Permission.Allow },
                new AccessRule { Path = "*", Role = "Administrator", Read = Permission.Allow, Edit = Permission.Allow, Copy = Permission.Allow, EditContents = Permission.Allow, Upload = Permission.Allow },
                new AccessRule { Path = "", Role = "Administrator", Read = Permission.Allow, Edit = Permission.Deny, Copy = Permission.Allow, EditContents = Permission.Allow, Upload = Permission.Allow },
                // For Document Manager
                new AccessRule { Path = "*.*", Role = "Document Manager", Read = Permission.Deny, Edit = Permission.Deny, Copy = Permission.Deny, Download = Permission.Deny },
                new AccessRule { Path = "Documents/*.*", Role = "Document Manager", Read = Permission.Allow, Edit = Permission.Allow, Copy = Permission.Allow, Download = Permission.Allow },
                new AccessRule { Path = "*", Role = "Document Manager", Read = Permission.Deny, Edit = Permission.Deny, Copy = Permission.Deny, EditContents = Permission.Deny, Upload = Permission.Deny },
                new AccessRule { Path = "", Role = "Document Manager", Read = Permission.Allow, Edit = Permission.Deny, Copy = Permission.Deny, EditContents = Permission.Deny, Upload = Permission.Deny },
                new AccessRule { Path = "Documents", Role = "Document Manager", Read = Permission.Allow, Edit = Permission.Deny, Copy = Permission.Allow, EditContents = Permission.Allow, Upload = Permission.Allow },
                new AccessRule { Path = "Documents/*", Role = "Document Manager", Read = Permission.Allow, Edit = Permission.Allow, Copy = Permission.Allow, EditContents = Permission.Allow, Upload = Permission.Allow },
            };
            rules.Rules = accessRules;
            rules.Role = Session["Role"].ToString();
            rules.RootPath = "~/FileContent/";
            return rules;
        }

        protected void selectRole_ValueSelect(object sender, Syncfusion.JavaScript.Web.DropdownListEventArgs e)
        {
            Session["Role"] = e.SelectedText;
        }
    }
}