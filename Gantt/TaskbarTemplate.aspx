<%@ Page Title="Gantt-Taskbar Template-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This example illustrates how to display custom taskbar templates for tasks in the Syncfusion Gantt chart control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="TaskbarTemplate.aspx.cs" Inherits="WebSampleBrowser.Gantt.TaskbarTemplate" %>
<asp:Content ID="Column" runat="server" ContentPlaceHolderID="ControlsSection">
    <div style="width: 100%; height: 100%; overflow: visible;">
        <ej:Gantt ID="GanttControl" ClientIDMode="Static" runat="server" AllowColumnResize="true" 
            TaskIdMapping="TaskID" TaskNameMapping="TaskName" StartDateMapping="StartDate"
            ProgressMapping="Progress" DurationMapping="Duration" EndDateMapping="EndDate"
            ChildMapping="SubTasks" EnableVirtualization="false" HighlightWeekends="true"
            ScheduleStartDate="02/01/2017" ScheduleEndDate="03/14/2017"
            ResourceInfoMapping="ResourceID" ResourceNameMapping="ResourceName" ResourceIdMapping="ResourceID"
            PredecessorMapping="Predecessors" ShowResourceNames="true" ShowGridCellTooltip="true" TreeColumnIndex="0"
            IncludeWeekend="false" IsResponsive="true" AllowGanttChartEditing="true" TaskbarTemplate="#taskbarTemplate" ParentTaskbarTemplate="#parentTaskbarTemplate" MilestoneTemplate="#milestoneTemplate" RowHeight="60" TaskbarHeight="50" QueryTaskbarInfo="queryTaskbarInfo" Load="load">
            <SizeSettings Width="100%" Height="450px" />
            <SplitterSettings Index="0" />
        </ej:Gantt>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        function load() {
            var gantt = $("#GanttControl").ejGantt("instance"),
                columns = gantt.getColumns(),
                length = columns.length;
            columns[0].width = 110;       
        }

        function queryTaskbarInfo(args) {
            var tdata = args.data;
            //Applying border styles
            var tBar = $(args.taskbar).find(".e-gantt-template-taskbar"),
                pBar = $(args.taskbar).find(".e-gantt-template-progressbar");

            //Applying Background colors
            if (args.data.isMilestone) {
                $(args.taskbar).find(".e-gantt-template-milestone").css("margin-top", "0px");
                args.milestoneBackground = "#808080";
            }
            else {
                if (tdata.hasChildRecords) {
                    args.parentTaskbarBackground = "#000000";
                    args.parentProgressbarBackground = "#ffffff";
                    tBar.length && tBar.css("border-color", "#ffffff");
                    pBar.length && pBar.css("border-color", "#ffffff");
                    $(args.taskbar).css("color", "#000000");
                    pBar.css("z-index", "");
                    if (tdata.width <= 90) {
                        $(args.taskbar).find(".tasknametext").css("display", "none");
                    }
                }
                else if (tdata.parentItem) {
                    args.progressbarBackground = "#000000";
                    args.taskbarBackground = "#1b93cd";
                    args.taskbarBorder = "#10587B";
                    args.progressbarBorder = "#10587B";
                    if (tdata.width <= 90) {
                        $(args.taskbar).find(".tasknametext,.resourcenametext").css("display", "none");
                    }
                    if (tdata.width <= 60) {
                        $(args.taskbar).find(".progresstext").css("display", "none");
                    }
                }
            }
        }
    </script>
<script type="text/x-jsrender" id="taskbarTemplate">
        <div class="e-gantt-template-taskbar bg-color" style="border-radius:5px;overflow:hidden;-webkit-transform:translateZ(0);-webkit-mask-image: -webkit-radial-gradient(circle, white, black);">
            <div>
                {{if #data['resourceNames']}}
                <img style="position:relative;top:8px;left:4px;text-align:left;z-index:1;" height="32" width="32" src="images/{{:#data['resourceNames']}}.png" />
                <span class="tasknametext" style="position:absolute;z-index:1;font-size:14px;color:white;top:7px;left:40px;font-family:'Segoe UI';overflow:hidden;text-overflow:ellipsis;width:40%;">{{:#data['taskName']}}</span>
                <span class="resourcenametext" style="position:absolute;z-index:1;font-size:12px;color:white;top:25px;left:40px;font-family:'Segoe UI';overflow:hidden;text-overflow:ellipsis;width:40%;opacity:0.5">{{:#data['resourceNames']}}</span>
                <span class="progresstext" style="margin-top:22px;margin-right:4px;position:relative;float:right;color:white;z-index:1;font-family:'Segoe UI';font-size:14px;">{{:#data['status']}}%</span>
                {{else}}
                <span style="margin:6px 14px 0 0;position:relative;float:right;color:white;z-index:1;">{{:#data['status']}}%</span>
                {{/if}}
            </div>
            <div class="e-gantt-template-progressbar" style="font-size:13px;overflow:visible;opacity:0.2">
            </div>
        </div>
    </script>
    <script type="text/x-jsrender" id="parentTaskbarTemplate">
        <div class="e-gantt-template-taskbar" style="border-radius:5px;overflow:hidden;-webkit-transform:translateZ(0);-webkit-mask-image: -webkit-radial-gradient(circle, white, black);color:white;">
            <div class="tasknametext" style="font-weight:bold;font-size:14px;position:relative;top:14px;left:8px;z-index:inherit;display:inline-block;">{{:#data['taskName']}}</div>
            <div style="font-weight:bold;font-size:14px;position:relative;top:14px;left:-8px;float:right;z-index:inherit;display:inline-block;">{{:#data['status']}}%</div>
            <div class="e-gantt-template-progressbar" style="font-size:13px;height:20px;overflow:visible;opacity:0.4">
            </div>
        </div>
    </script>
    <script type="text/x-jsrender" id="milestoneTemplate">
        <div class="e-gantt-template-milestone" style="background-color:transparent;">
            <div class="e-gantt-milestone e-milestone-top" style="top: -2px; border-right-width: 27px; border-left-width: 27px; border-bottom-width: 27px; border-right-color: transparent; border-left-color: transparent; border-style: none solid solid; "></div>
            <div class="e-gantt-milestone e-milestone-bottom" style="top: 25px; border-right-width: 27px; border-left-width: 27px; border-top-width: 27px; border-right-color: transparent; border-left-color: transparent; border-style: solid solid none;"></div>
        </div>
    </script>
</asp:Content>

