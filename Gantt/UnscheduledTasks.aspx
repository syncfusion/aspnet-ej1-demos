<%@ Page Title="Gantt-Unscheduled Tasks-ASP.NET-SYNCFUSION" MetaDescription="This example illustrates binding unscheduled tasks or the tasks with undefined dates in the Syncfusion Gantt chart control." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="UnscheduledTasks.aspx.cs" Inherits="WebSampleBrowser.Gantt.UnscheduledTasks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / Unscheduled Tasks</span>
</asp:Content>

<asp:Content ID="Column" runat="server" ContentPlaceHolderID="ControlsSection">
    <div style="width: 100%; height: 100%; overflow: visible;">
        <ej:Gantt ID="GanttUnscheduledTasks" ClientIDMode="Static" runat="server" AllowColumnResize="true" 
            TaskIdMapping="TaskID" TaskNameMapping="TaskName" StartDateMapping="StartDate"
            ProgressMapping="Progress" DurationMapping="Duration" EndDateMapping="EndDate"
            ChildMapping="SubTasks" EnableVirtualization="false" HighlightWeekends="true"
            ScheduleStartDate="02/01/2017" ScheduleEndDate="03/14/2017" AllowUnscheduledTask="true"
            PredecessorMapping="Predecessors" ShowResourceNames="true" ShowGridCellTooltip="false" TreeColumnIndex="0"
            IncludeWeekend="false" IsResponsive="true"  Load="load">
			<EditSettings AllowEditing="true" AllowAdding="true" AllowDeleting="true"  AllowIndent="true" EditMode="cellEditing" />
			<ToolbarSettings ShowToolbar="true" ToolbarItems="add,edit,delete,update,cancel,indent,outdent,expandAll,collapseAll" />			
            <SizeSettings Width="100%" Height="450px" />
        </ej:Gantt>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
    function load(args) {
        var columns = this.getColumns();
        var taskName = columns.splice(1, 1);
        columns.splice(4, 0, taskName[0]);
        columns[0].width = "65px";
    }
 </script>
    </asp:Content>

