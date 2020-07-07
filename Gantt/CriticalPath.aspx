<%@ Page Title="Gantt-Critical Path-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates how to identify the critical tasks and critical path in a project using the Syncfusion Gantt chart control." AutoEventWireup="true" CodeBehind="CriticalPath.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Gantt.CriticalPath" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / CriticalPath</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">

    <div style="width: 100%; height: 100%; overflow: visible;">
        <ej:Gantt ID="GanttCriticalPathControl" ClientIDMode="Static" runat="server" AllowColumnResize="true" 
            TaskIdMapping="CriticalTaskID" TaskNameMapping="CriticalTaskName" StartDateMapping="CriticalStartDate"
            ProgressMapping="CriticalProgress" DurationMapping="CriticalDuration" EndDateMapping="CriticalEndDate"
            ChildMapping="CriticalSubTasks" EnableVirtualization="false"
            ScheduleStartDate="02/01/2017" ScheduleEndDate="03/14/2017"
            PredecessorMapping="CriticalPredecessors" ShowGridCellTooltip="true" TreeColumnIndex="1"
            IncludeWeekend="false" IsResponsive="true" AllowGanttChartEditing="true" Create="create" load="load" >
            <EditSettings AllowEditing="true" AllowAdding="true" AllowDeleting="true" AllowIndent="true" EditMode="cellEditing" />
            <ToolbarSettings ShowToolbar="true" ToolbarItems="criticalPath" />
            <SizeSettings Width="100%" Height="450px" />
        </ej:Gantt>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
    function create() {
        this.showCriticalPath(true);
    }
    function load(args) {
        var columns = { field: "isCritical", headerText: "Critical", allowEditing: false };
        var column = this.getColumns();
        column.splice(2, 0, columns);
        this.getColumns()[0].width = 60;
    }
 </script>
    </asp:Content>

