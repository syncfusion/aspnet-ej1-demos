<%@ Page Title="Gantt-Column Template-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This example illustrates how to display custom columns and column templates in the Syncfusion Gantt chart control."  MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="ColumnTemplate.aspx.cs" Inherits="WebSampleBrowser.Gantt.GanttColumnTemplate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / Column Template</span>
</asp:Content>

<asp:Content ID="Column" runat="server" ContentPlaceHolderID="ControlsSection">
    <div style="width: 100%; height: 100%; overflow: visible;">
        <ej:Gantt ID="ColumnTemplate" ClientIDMode="Static" runat="server" AllowColumnResize="true" 
            TaskIdMapping="TaskID" TaskNameMapping="TaskName" StartDateMapping="StartDate"
            ProgressMapping="Progress" DurationMapping="Duration" EndDateMapping="EndDate"
            ChildMapping="SubTasks" EnableVirtualization="false" HighlightWeekends="true"
            ScheduleStartDate="02/01/2017" ScheduleEndDate="03/14/2017"
            ResourceInfoMapping="ResourceID" ResourceNameMapping="ResourceName" ResourceIdMapping="ResourceID"
            PredecessorMapping="Predecessors" ShowResourceNames="true" ShowGridCellTooltip="false" TreeColumnIndex="1"
            IncludeWeekend="false" IsResponsive="true" AllowGanttChartEditing="false" RowHeight="42" TaskbarHeight="32" Load="load">
            <SizeSettings Width="100%" Height="450px" />
            <SplitterSettings Position="50%" />
        </ej:Gantt>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/x-jsrender" id="columnTemplate">
    {{if #data['resourceNames']}}
        <div style="display:inline-block;position:relative;left:10px;top:1px">
            <img src="images/{{:#data['resourceNames']}}.png" height="40px" />
        </div>
        <div style='display:inline-block;width:100%;position:relative;left:10px;top:2px'>{{:#data['resourceNames']}}</div>
    {{/if}}
    </script>
    <script type="text/javascript">
        function load(args) {
            var gantt = $("#ColumnTemplate").ejGantt("instance");
            var columns = gantt.getColumns();
            columns[2].visible = columns[3].visible = false;
            columns[4].isTemplateColumn = true;
            columns[4].templateID = "columnTemplate";
            columns[4].width = "172";
            columns[0].width = "60";
        }
    </script>
</asp:Content>

