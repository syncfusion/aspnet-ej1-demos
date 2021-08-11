<%@ Page Title="Gantt-Task Label Template-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates how to display templates for task labels in the Syncfusion Gantt chart control." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master"  CodeBehind="TasklabelTemplate.aspx.cs" Inherits="WebSampleBrowser.Gantt.TasklabelTemplate" %>

<asp:Content ID="Column" runat="server" ContentPlaceHolderID="ControlsSection">
    <div style="width: 100%; height: 100%; overflow: visible;">
        <ej:Gantt ID="GanttTaskLabelControl" ClientIDMode="Static" runat="server" AllowColumnResize="true" 
            TaskIdMapping="TaskID" TaskNameMapping="TaskName" StartDateMapping="StartDate"
            ProgressMapping="Progress" DurationMapping="Duration" EndDateMapping="EndDate"
            ChildMapping="SubTasks" EnableVirtualization="false" HighlightWeekends="true"
            ScheduleStartDate="02/01/2017" ScheduleEndDate="03/14/2017" ShowProgressStatus="false"
            ResourceInfoMapping="ResourceID" ResourceNameMapping="ResourceName" ResourceIdMapping="ResourceID"
            PredecessorMapping="Predecessors" ShowResourceNames="true" ShowGridCellTooltip="true" TreeColumnIndex="1" rightTaskLabelTemplate= "#rightlableTemplate"
            leftTaskLabelTemplate= "#leftlableTemplate" IncludeWeekend="false" IsResponsive="true" AllowGanttChartEditing="false" rowHeight="40" TaskbarHeight="30" Load="load" >
            <SizeSettings Width="100%" Height="450px" />
        </ej:Gantt>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptSection">
    <script>
        function load(args) {
            this.getColumns()[0].width = 60;
        }
        function _getSeparator(length, idx) {
            if (idx < length - 1) {
                return ","
            }
        }
        var helpers = {};
        helpers["_getSeparator"] = _getSeparator;
        $.views.helpers(helpers);
</script>
        <script id="rightlableTemplate" type="text/x-jsrender">
        {{if #data['resourceNames']}}
        <div>
            {{for resourceInfo}}
            <img src="images/{{:ResourceName}}.png" height="30px" />
            <span style="margin-left:5px;">{{:ResourceName}}</span>
            {{:~_getSeparator(#get("array").data.length,#index)}}
            {{/for}}
        </div>
        {{/if}}
    </script>

    <script id="leftlableTemplate" type="text/x-jsrender">
        <div style="padding-top:5px;">
            <span>{{:#data['taskName']}}  [{{:status}}%]</span>
        </div>

    </script>
</asp:Content>

