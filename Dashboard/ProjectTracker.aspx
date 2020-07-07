<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectTracker.aspx.cs" Inherits="WebSampleBrowser.Dashboard.ProjectTracker" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>Essential Studio for ASP.NET Web Forms : Project Tracker</title>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta name="description" content="The Gantt control in ASP.NET Web Forms is a project management tool used for visualizing and tracking the projects and schedules. Using the editing support available in ASP.NET Web Forms Gantt, you can edit, manage and organize the projects dynamically."/>
    <link rel="shortcut icon" href='<%= Page.ResolveClientUrl("~/Content/images/favicon.ico")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/bootstrap.min.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/ejthemes/ej.widgets.core.min.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/ejthemes/gradient-lime/ej.theme.min.css")%>' />

    <!--[if lt IE 9]>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery-1.11.3.min.js")%>' type="text/javascript"></script>
    <![endif]-->
    <!--[if gte IE 9]><!-->
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery-3.4.1.min.js")%>' type="text/javascript"></script>
    <!--<![endif]-->
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jsrender.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/ej.web.all.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/properties.js")%>' type="text/javascript"></script>

    <style type="text/css">
        html, body {
            height: 100%;
            padding: 0px;
            margin: 0px;
        }        
            .e-ganttdialog .e-link {
                position: relative;
                top: 10px;
            }        
        #Gantt {
            position: absolute;
        }
        /* Footerdiv CSS */
        #footer
        {
            display: none;
            background-color: #4F4F4C;
            color: GrayText;
            height: 45px;
            min-width: 300px;
            width:100%;
            float: left;
            bottom: 0;
            position: absolute; 
            z-index:0;
        }
    </style>
</head>
<body>

    <form runat="server" onsubmit="return false" style="overflow: hidden; padding: 0; margin: 0; height: 100%; width: 100%;">

        <ej:Gantt ID="Gantt" runat="server" AllowColumnResize="true" AllowSorting="true"
            TaskIdMapping="TaskID" TaskNameMapping="TaskName" StartDateMapping="StartDate"
            ProgressMapping="Progress" DurationMapping="Duration" EndDateMapping="EndDate"
            ChildMapping="SubTasks" EnableVirtualization="false" HighlightWeekends="true"
            ScheduleStartDate="02/01/2017" ScheduleEndDate="03/14/2017" AllowDragAndDrop="true" ShowColumnChooser="true" ShowColumnOptions="true"
            ResourceInfoMapping="ResourceID" ResourceNameMapping="ResourceName" ResourceIdMapping="ResourceID"
            PredecessorMapping="Predecessors" ShowResourceNames="true" ShowGridCellTooltip="true" TreeColumnIndex="1"
            IncludeWeekend="false" EnableResize="true" EnableContextMenu="true" NotesMapping="Notes">
            <DragTooltip ShowTooltip="true" />
            <ToolbarSettings ShowToolbar="true" ToolbarItems="add,edit,delete,update,cancel,indent,outdent,expandAll,collapseAll,search,criticalPath,prevTimeSpan,nextTimeSpan"></ToolbarSettings>
            <EditSettings AllowEditing="true" AllowAdding="true" AllowDeleting="true" AllowIndent="true" EditMode="cellEditing"></EditSettings>
            <SizeSettings Width="100%" Height="100%" />
            <StripLines>
                <ej:GanttStripLine Day="02/06/2017" Label="Project Start" LineStyle="dotted" LineColor="Darkblue" LineWidth="2" />
            </StripLines>
        </ej:gantt>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div id="footer">
            <div class="bottom-links">
                <div class="left">
                    <div class="sync-text">
                        Copyright © 2001-2019 Syncfusion Inc.
                    </div>
                </div>
                <div class="right">
                    <a href="https://www.syncfusion.com">
                        <div class="syncfusion-image"></div>
                    </a>
                </div>
            </div>
        </div>
    </form>

</body>

</html>
