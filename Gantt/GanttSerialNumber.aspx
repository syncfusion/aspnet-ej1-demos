<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="GanttSerialNumber.aspx.cs" Inherits="WebSampleBrowser.Gantt.GanttSerialNumber" %>


<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / Serial Number</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div style="width: 100%; height: 100%; overflow: visible;">
        <ej:Gantt ID="GanttControlSerialNumber" runat="server" AllowSelection="true" AllowColumnResize="true" EnableSerialNumber="true"
            TaskIdMapping="TaskID" TaskNameMapping="TaskName" ScheduleStartDate="02/03/2017" ScheduleEndDate="03/07/2017"
            StartDateMapping="StartDate" EndDateMapping="EndDate" ProgressMapping="Progress" PredecessorMapping="Predecessors"
            ChildMapping="SubTasks" AllowGanttChartEditing="false" AllowDragAndDrop="true" EnableContextMenu="true"
            TreeColumnIndex="2" IsResponsive="true">
            <EditSettings AllowEditing="true" AllowAdding="true" AllowDeleting="true" AllowIndent="true" EditMode="cellEditing" />
            <ToolbarSettings ShowToolbar="true" ToolbarItems="add,edit,delete,update,cancel,indent,outdent,expandAll,collapseAll" />
            <SizeSettings Width="100%" Height="450px" />
        </ej:Gantt>
    </div>
</asp:Content>


