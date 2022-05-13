<%@ Page Title="Gantt-Work Breakdown Structure-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates how to define a unique numbering system for the tasks based on hiearchy in the Syncfusion Gantt chart control." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="GanttWBS.aspx.cs" Inherits="WebSampleBrowser.Gantt.GanttWBS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / WBS</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Gantt ID="GanttControlWBS" runat="server" AllowSelection="true" AllowColumnResize="true"
            TaskIdMapping="Id" TaskNameMapping="Name" ScheduleStartDate="02/23/2017" ScheduleEndDate="03/30/2017"
            StartDateMapping="StartDate" EndDateMapping="EndDate" ProgressMapping="PercentDone" IsResponsive="true"
            ChildMapping="Children" TreeColumnIndex="6" AllowGanttChartEditing="true" Load="Load"
            PredecessorMapping="Predecessor" EnableWBS="true" EnableWBSPredecessor="true" EnableContextMenu="true">
            <EditSettings AllowEditing="true" AllowAdding="true" AllowDeleting="true" AllowIndent="true" EditMode="cellEditing" />
            <ToolbarSettings ShowToolbar="true" ToolbarItems="add,edit,delete,update,cancel,indent,outdent,expandAll,collapseAll" />
            <SizeSettings Width="100%" Height="450px" />
        </ej:Gantt>
    </div>
    <script type="text/javascript">
        function Load() {
            var columns = this.getColumns();
            //Hide all(first 5) the columns except WBS and WBS predecessor
            for (var i = 0; i <= 5; i++)
                columns[i].visible = false;
        }
    </script>
</asp:Content>

