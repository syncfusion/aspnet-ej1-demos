<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="GanttDurationUnits.aspx.cs" Inherits="WebSampleBrowser.Gantt.GanttDurationUnits" %>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / Duration Units</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Gantt ClientIDMode="Static" ID="GanttDurationUnitsControl" runat="server" TaskIdMapping="TaskID" TaskNameMapping="TaskName" StartDateMapping="StartDate"
            DurationMapping="Duration" ProgressMapping="Progress" ChildMapping="Children" DateFormat="MM/dd/yyyy" DurationUnitMapping="DurationUnit"
            TreeColumnIndex="1" ScheduleStartDate="02/23/2017" ScheduleEndDate="03/25/2017" IsResponsive="true" Load="onLoad">
            <EditSettings AllowEditing="true" EditMode="cellEditing" />
            <SizeSettings Height="450px" Width="100%" />
        </ej:Gantt>
    </div>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        function onLoad() {
            var columns = this.getColumns();
            columns[2].visible = false;
            columns[4].visible = false;
            columns[0].visible = false;
        }
    </script>
</asp:Content>