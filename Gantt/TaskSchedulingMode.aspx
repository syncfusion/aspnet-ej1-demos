<%@ Page Title="Gantt-Task Schedule Modes-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates the automatic and manual task scheduling modes in the Syncfusion Gantt chart control." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="TaskSchedulingMode.aspx.cs" Inherits="WebSampleBrowser.Gantt.TaskSchedulingMode" %>


<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / Task Schedule Modes</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Gantt ID="GanttControlTaskMode" ClientIDMode="Static" runat="server" AllowSelection="true" AllowColumnResize="true"
            TaskIdMapping="Id" TaskNameMapping="Name" ScheduleStartDate="02/23/2017" ScheduleEndDate="03/30/2017"
            StartDateMapping="StartDate" EndDateMapping="EndDate" ProgressMapping="PercentDone" IsResponsive="true"
            TaskSchedulingMode="Custom" TaskSchedulingModeMapping="IsManual" splitterPosition = "20%" IncludeWeekend="false" load="load"
            ChildMapping="Children" TreeColumnIndex="0" AllowGanttChartEditing="true" PredecessorMapping="Predecessor" EnableContextMenu="true">

            <EditSettings AllowEditing="true" AllowAdding="true" AllowDeleting="true"  EditMode="cellEditing" />          

            <SizeSettings Width="100%" Height="450px" />
        </ej:Gantt>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        function load(args) {
            var columns = this.getColumns();
            for (var i = 1; i <= 5; i++)
                columns[i].visible = false;
            columns[0].width = 100;
        }
 </script>
    </asp:Content>



