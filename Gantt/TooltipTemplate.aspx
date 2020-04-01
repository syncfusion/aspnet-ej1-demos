<%@ Page Title="Gantt-Tooltip Template-ASP.NET-SYNCFUSION" MetaDescription="This example illustrates how to display custom tooltips for the tasks in the Syncfusion Gantt chart control." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="TooltipTemplate.aspx.cs" Inherits="WebSampleBrowser.Gantt.GanttTooltipTemplate" %>
<asp:Content ID="Column" runat="server" ContentPlaceHolderID="ControlsSection">
    <div style="width: 100%; height: 100%; overflow: visible;">
        <ej:Gantt ID="GanttControl" ClientIDMode="Static" runat="server" AllowColumnResize="true" 
            TaskIdMapping="TaskID" TaskNameMapping="TaskName" StartDateMapping="StartDate"
            ProgressMapping="Progress" DurationMapping="Duration" EndDateMapping="EndDate"
            ChildMapping="SubTasks" EnableVirtualization="false" HighlightWeekends="true"
            ScheduleStartDate="02/01/2017" ScheduleEndDate="03/14/2017"
            ResourceInfoMapping="ResourceID" ResourceNameMapping="ResourceName" ResourceIdMapping="ResourceID"
            PredecessorMapping="Predecessors" ShowResourceNames="true" ShowGridCellTooltip="true" TreeColumnIndex="1"
            IncludeWeekend="false" IsResponsive="true" AllowGanttChartEditing="false" TaskbarTooltipTemplateId="tooltipTemplate" Load="load">
            <SizeSettings Width="100%" Height="450px" />
        </ej:Gantt>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptSection">
    <script>
        function load(args) {
            this.getColumns()[0].width = 60;
        }
        function _dateFormating(key) {
            var date = this.data[key];
            return date ? ej.format(date, "dddd, dd MMM") : "";
        }
        var helpers = {};
        helpers["_ganttDateFormatter"] = _dateFormating;
        $.views.helpers(helpers);
    </script>
    <script type="text/x-jsrender" id="tooltipTemplate">
        <table>
            {{if #data['resourceNames']}}
            <tr>
                <td rowspan="3" style="padding: 3px">
                    <img src="images/{{:#data['resourceNames']}}.png" height="40px" /></td>
                <td style="padding: 3px"><b>Task done By:</b></td>
                <td style="padding: 3px">{{:#data['resourceNames']}}</td>
            </tr>
            {{/if}}
            <tr>
                <td style="padding: 3px"><b>Starts On:</b></td>
                <td style="padding: 3px">{{:~_ganttDateFormatter("startDate")}}</td>
            </tr>
            <tr>
                <td style="padding: 3px"><b>Ends On:</b></td>
                <td style="padding: 3px">{{:~_ganttDateFormatter("endDate")}}</td>
            </tr>
        </table>
    </script>
</asp:Content>

